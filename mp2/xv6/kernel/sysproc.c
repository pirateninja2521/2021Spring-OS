#include "types.h"
#include "riscv.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "spinlock.h"
#include "proc.h"

#include "fcntl.h"
#include "fs.h"
#include "sleeplock.h"
#include "file.h"

// Add system calls
uint64
sys_mmap(void)
{
  
  uint64 addr; // always 0 ( let kernel decide the virtual address to map the file )
  size_t length;
  int prot;
  int flags; // MAP_SHARED or MAP_PRIVATE
  int fd;
  off_t offset; // always 0
  if (argaddr( 0 , &addr) < 0 || argint( 1 , &length) < 0 || argint( 2 , &prot) < 0 || 
      argint( 3 , &flags) < 0 || argint( 4 , &fd) < 0 || argint( 5 , &offset) < 0 ){
    return - 1 ;
  }

  struct proc *p = myproc();
  struct file * f = p->ofile[fd];

  if ( (prot & PROT_WRITE) && !f->writable && (flags & MAP_SHARED) ) return -1;
  if ( (prot & PROT_READ) && !f->readable ) return -1;

  struct VMA *cur_vma = 0;
  for ( int i=0; i<16; i++){
    if ( !p->vma[i].vm_used ){
      cur_vma = &p->vma[i];
      cur_vma->vm_used = 1;
      if (p->vma_used_count == 0){ // first vma
        cur_vma->vm_next_index = cur_vma->vm_prev_index = -1;
        p->vma_head_index = p->vma_tail_index = i;
        cur_vma->vm_end = PGROUNDDOWN(MAXVA - 2 * PGSIZE);
      }
      else if ( p->vma[p->vma_head_index].vm_end <= PGROUNDDOWN(MAXVA - 2 * PGSIZE - length)){
        cur_vma->vm_next_index = p->vma_head_index;
        cur_vma->vm_prev_index = -1;
        cur_vma->vm_end = PGROUNDDOWN(MAXVA - 2 * PGSIZE);
        p->vma[p->vma_head_index].vm_prev_index = i;
        p->vma_head_index = i;
      }
      else{
        for(int j= p->vma_head_index; j!=-1; j = p->vma[j].vm_next_index){
          int nxt = p->vma[j].vm_next_index;          
          if (nxt !=-1){
            if (p->vma[nxt].vm_end <= PGROUNDDOWN(p->vma[j].vm_start - length)){
              cur_vma->vm_prev_index = j;
              cur_vma->vm_next_index = nxt;
              p->vma[j].vm_next_index = p->vma[nxt].vm_prev_index = i;
              cur_vma->vm_end = p->vma[j].vm_start;
              goto ready;
            }
          }
        }
        cur_vma->vm_next_index = -1;
        cur_vma->vm_prev_index = p->vma_tail_index;
        cur_vma->vm_end = p->vma[p->vma_tail_index].vm_start;
        // printf("start %p end %p\n", p->vma[p->vma_tail_index].vm_start, p->vma[p->vma_tail_index].vm_end);
        p->vma[p->vma_tail_index].vm_next_index = i;
        p->vma_tail_index = i;
      }
      ready:
      // printf("prev %d next %d\n", cur_vma->vm_prev_index, cur_vma->vm_next_index);
      cur_vma->vm_start = PGROUNDDOWN(cur_vma->vm_end - length);
      // printf("start %p end %p\n", cur_vma->vm_start, cur_vma->vm_end);
      p->vma_used_count ++;
      // vmprint(p->pagetable);

      cur_vma->vm_page_prot = prot; // PROT_READ, PROT_WRITE, etc 
      cur_vma->vm_flags = flags; // MAP_SHARED or MAP_PRIVATE

      cur_vma->vm_file = f;
      filedup(cur_vma->vm_file);
      
      cur_vma->vm_pgoff = offset; // zero 
      return cur_vma->vm_start;
    }
  }
  return -1;
  
}

uint64
sys_munmap(void)
{
  uint64 addr;
  size_t length;
  if (argaddr( 0 , &addr) < 0 || argint( 1 , &length) <0 ){
    return - 1 ;
  }
  if (PGROUNDDOWN(addr) != addr || PGROUNDDOWN(addr+length) != addr+length) // Assume that the unmapped area is composed by complete pages
    panic("munmap: beyond assumption ");

  struct proc *p = myproc();

  // printf("before munmap:\n");
  // vmprint(p->pagetable);

  struct VMA *cur_vma = 0;
  for ( int i=0; i<16; i++){
    if(p->vma[i].vm_used && p->vma[i].vm_start <= addr && addr+length <= p->vma[i].vm_end){
      // assuming the unmapped area is a subset of some vma address
      cur_vma = &p->vma[i];
      // printf("index %d prev %d next %d\n", i, cur_vma->vm_prev_index, cur_vma->vm_next_index);
      if( walkaddr(p->pagetable, addr) && (cur_vma->vm_flags & MAP_SHARED)){
        filewrite(cur_vma->vm_file, addr, length);
      }
      for (uint64 va = addr; va < addr+length; va += PGSIZE){
        if (walkaddr(p->pagetable, va)){
          uvmunmap(p->pagetable,va,1,0);
        }
      }
      // uvmunmap(p->pagetable, addr, length / PGSIZE, 1 ); // Assume that we always have PGROUNDDOWN(addr)=addr
      // printf("after munmap:\n");
      // vmprint(p->pagetable);
      // printf("%p %p\n", addr, cur_vma->vm_end);
      if (addr > cur_vma->vm_start && addr+length < cur_vma->vm_end)
        panic("munmap: beyond assumption ");

      if(addr == cur_vma->vm_start && addr+length == cur_vma->vm_end){// unmap whole region
        fileclose(cur_vma->vm_file);
        cur_vma->vm_used = 0;
        if (cur_vma->vm_next_index != -1)
          p->vma[cur_vma->vm_next_index].vm_prev_index = cur_vma->vm_prev_index;
        else
          p->vma_tail_index = cur_vma->vm_prev_index;
        if (cur_vma->vm_prev_index != -1)
          p->vma[cur_vma->vm_prev_index].vm_next_index = cur_vma->vm_next_index;
        else
          p->vma_head_index = cur_vma->vm_next_index;

        p->vma_used_count--;
      }
      else if ( addr == cur_vma->vm_start ){ // unmap from starting point to some middle point
        cur_vma->vm_start += length;
        cur_vma->vm_pgoff += length;
      }
      else if (addr+length == cur_vma->vm_end){ // unmap from some middle point to the end,
        cur_vma->vm_end -= length;
      }
      return 0;
    }
  }
  return -1;
}

uint64
sys_exit(void)
{
  int n;
  if(argint(0, &n) < 0)
    return -1;
  exit(n);
  return 0;  // not reached
}

uint64
sys_getpid(void)
{
  return myproc()->pid;
}

uint64
sys_fork(void)
{
  return fork();
}

uint64
sys_wait(void)
{
  uint64 p;
  if(argaddr(0, &p) < 0)
    return -1;
  return wait(p);
}

uint64
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  // vmprint(myproc()->pagetable);
  // Generate a Page Fault
  // myproc()->sz += n;  
  // Original
  if(growproc(n) < 0)
    return -1;

  return addr;
  
}

uint64
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

uint64
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}
