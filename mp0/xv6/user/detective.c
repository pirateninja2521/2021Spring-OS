#include "kernel/types.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fs.h"

void error_message(char *mes){
    fprintf(2, "%s", mes);
    exit(0);
}

char *fmtname(char *path){ // reference: ls.c
    static char buf[DIRSIZ+1];
    char *p;

    // Find first character after last slash.
    for(p=path+strlen(path); p >= path && *p != '/'; p--)
        ;
    p++;

    // Return blank-padded name.
    if(strlen(p) >= DIRSIZ)
        return p;
    memmove(buf, p, strlen(p));
    memset(buf+strlen(p), 0, DIRSIZ-strlen(p));
    return buf;
}

int find_evidence(char *commission, char *path){ // reference: ls.c
    char buf[512], *p; 
    int fd, flag=0;
    struct dirent de;
    struct stat st;
    if((fd = open(path, 0)) < 0){
        fprintf(2, "cannot open %s\n", path);
        return 0;
    }

    if(fstat(fd, &st) < 0){
        fprintf(2, "cannot stat %s\n", path);
        close(fd);
        return 0;
    }
    
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
        printf("ls: path too long\n");
        return 0;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';

    while(read(fd, &de, sizeof(de)) == sizeof(de)){ 
        if(de.inum == 0)
            continue;
        if (strcmp(de.name, ".")==0 || strcmp(de.name, "..")==0)
            continue;

        memmove(p, de.name, DIRSIZ);
        p[DIRSIZ] = 0;
        
        if(stat(buf, &st) < 0){
            printf("ls: cannot stat %s\n", buf);
            continue;
        }

        if (strcmp(de.name, commission)==0){
            printf("%d as Watson: %s\n", getpid(), buf);
            flag |= 1;
        }
        if (st.type==T_DIR)
            flag |= find_evidence(commission, buf);
    }
    close(fd);
    return flag;
}

int main(int argc,char *argv[]){
    if(argc != 2){
        error_message("usage: detective [commission]");
    }
    char *commission=argv[1];
    
    int fd[2];
    if (pipe(fd)<0)
        error_message("pipe failed");

    int Watson = fork();
    if (Watson<0){
        error_message("fork failed");
        exit(0);
    }
    else if (Watson==0){ // Child process
        close(fd[0]);
        if (find_evidence(commission, ".")) 
            write(fd[1], "y", 1);
        else 
            write(fd[1], "n", 1);

        exit(0);
    }
    else{ // Parent process
        close(fd[1]);
        wait(&Watson);
        
        char reply;
        read(fd[0], &reply, 1);
        if (reply=='y')
            printf("%d as Holmes: This is the evidence\n", getpid());
        else
           printf("%d as Holmes: This is the alibi\n", getpid());
    }
    exit(0);
}