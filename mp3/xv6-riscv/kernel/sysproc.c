#include "types.h"
#include "riscv.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "spinlock.h"
#include "proc.h"

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


// for mp3
uint64
sys_thrdstop(void)
{
  int interval, thrdstop_context_id;
  uint64 handler;
  if (argint(0, &interval) < 0)
    return -1;
  if (argint(1, &thrdstop_context_id) < 0)
    return -1;
  if (argaddr(2, &handler) < 0)
    return -1;
  
  struct proc *p = myproc();
  p->thrdstop_ticks = 0;
  p->thrdstop_interval = interval;
  p->thrdstop_handler_pointer = handler;
  if (thrdstop_context_id >= 0){
    p->thrdstop_context_id = thrdstop_context_id;
    p->thrdstop_context_used[thrdstop_context_id] = 1;
    return thrdstop_context_id;
  }
  else{
    for (int i=0; i<MAX_THRD_NUM; i++){
      if (p->thrdstop_context_used[i] == 0){
        p->thrdstop_context_id = i;
        p->thrdstop_context_used[i] = 1;
        return i;
      }
    }
  }
  
  return -1;
}

// for mp3
uint64
sys_cancelthrdstop(void)
{
  int thrdstop_context_id;
  if (argint(0, &thrdstop_context_id) < 0)
    return -1;

  struct proc *p = myproc();

  p->thrdstop_interval = -1;
  if (thrdstop_context_id != -1){
      struct thrd_context_data *context = &p->thrdstop_context[thrdstop_context_id];
      context->epc = p->trapframe->epc;

      context->ra = p->trapframe->ra;
      context->sp = p->trapframe->sp;
      context->gp = p->trapframe->gp;
      context->tp = p->trapframe->tp;
      context->s_regs[0] = p->trapframe->s0;
      context->s_regs[1] = p->trapframe->s1;
      context->s_regs[2] = p->trapframe->s2;
      context->s_regs[3] = p->trapframe->s3;
      context->s_regs[4] = p->trapframe->s4;
      context->s_regs[5] = p->trapframe->s5;
      context->s_regs[6] = p->trapframe->s6;
      context->s_regs[7] = p->trapframe->s7;
      context->s_regs[8] = p->trapframe->s8;
      context->s_regs[9] = p->trapframe->s9;
      context->s_regs[10] = p->trapframe->s10;
      context->s_regs[11] = p->trapframe->s11;
      context->t_regs[0] = p->trapframe->t0;
      context->t_regs[1] = p->trapframe->t1;
      context->t_regs[2] = p->trapframe->t2;
      context->t_regs[3] = p->trapframe->t3;
      context->t_regs[4] = p->trapframe->t4;
      context->t_regs[5] = p->trapframe->t5;
      context->t_regs[6] = p->trapframe->t6;
      context->a_regs[0] = p->trapframe->a0;
      context->a_regs[1] = p->trapframe->a1;
      context->a_regs[2] = p->trapframe->a2;
      context->a_regs[3] = p->trapframe->a3;
      context->a_regs[4] = p->trapframe->a4;
      context->a_regs[5] = p->trapframe->a5;
      context->a_regs[6] = p->trapframe->a6;
      context->a_regs[7] = p->trapframe->a7;
  }
  
  return p->thrdstop_ticks;
}

// for mp3
uint64
sys_thrdresume(void)
{
  int  thrdstop_context_id, is_exit;
  if (argint(0, &thrdstop_context_id) < 0)
    return -1;
  if (argint(1, &is_exit) < 0)
    return -1;

  struct proc *p = myproc();
  if (is_exit==0){
    struct thrd_context_data *context = &p->thrdstop_context[thrdstop_context_id];
    p->trapframe->epc = context->epc;
    p->trapframe->ra = context->ra;
    p->trapframe->sp = context->sp;
    p->trapframe->gp = context->gp;
    p->trapframe->tp = context->tp;
    p->trapframe->s0 = context->s_regs[0];
    p->trapframe->s1 = context->s_regs[1];
    p->trapframe->s2 = context->s_regs[2];
    p->trapframe->s3 = context->s_regs[3];
    p->trapframe->s4 = context->s_regs[4];
    p->trapframe->s5 = context->s_regs[5];
    p->trapframe->s6 = context->s_regs[6];
    p->trapframe->s7 = context->s_regs[7];
    p->trapframe->s8 = context->s_regs[8];
    p->trapframe->s9 = context->s_regs[9];
    p->trapframe->s10 = context->s_regs[10];
    p->trapframe->s11 = context->s_regs[11];
    p->trapframe->t0 = context->t_regs[0];
    p->trapframe->t1 = context->t_regs[1];
    p->trapframe->t2 = context->t_regs[2];
    p->trapframe->t3 = context->t_regs[3];
    p->trapframe->t4 = context->t_regs[4];
    p->trapframe->t5 = context->t_regs[5];
    p->trapframe->t6 = context->t_regs[6];
    p->trapframe->a0 = context->a_regs[0];
    p->trapframe->a1 = context->a_regs[1];
    p->trapframe->a2 = context->a_regs[2];
    p->trapframe->a3 = context->a_regs[3];
    p->trapframe->a4 = context->a_regs[4];
    p->trapframe->a5 = context->a_regs[5];
    p->trapframe->a6 = context->a_regs[6];
    p->trapframe->a7 = context->a_regs[7];
  }
  else{ // is_exit
    p->thrdstop_context_used[thrdstop_context_id] = 0;
    p->thrdstop_interval = -1;
  }
  return 0;
}
