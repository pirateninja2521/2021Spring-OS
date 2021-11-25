
user/_test1:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <thrdstop_test1>:
int main_id = 0;
int flag = 0;
int thrdstop_test_time = 0;
int tmpTime;
void thrdstop_test1()
{
       0:	1141                	addi	sp,sp,-16
       2:	e406                	sd	ra,8(sp)
       4:	e022                	sd	s0,0(sp)
       6:	0800                	addi	s0,sp,16
    thrdstop_test_time = uptime();
       8:	00001097          	auipc	ra,0x1
       c:	938080e7          	jalr	-1736(ra) # 940 <uptime>
      10:	00001797          	auipc	a5,0x1
      14:	52a7aa23          	sw	a0,1332(a5) # 1544 <thrdstop_test_time>
    printf("thrdstop test1 at %d\n", thrdstop_test_time-startTime);
      18:	00001597          	auipc	a1,0x1
      1c:	5385a583          	lw	a1,1336(a1) # 1550 <startTime>
      20:	40b505bb          	subw	a1,a0,a1
      24:	00001517          	auipc	a0,0x1
      28:	28c50513          	addi	a0,a0,652 # 12b0 <thread_start_threading+0x76>
      2c:	00001097          	auipc	ra,0x1
      30:	c0c080e7          	jalr	-1012(ra) # c38 <printf>
    flag += 1;
      34:	00001717          	auipc	a4,0x1
      38:	51470713          	addi	a4,a4,1300 # 1548 <flag>
      3c:	431c                	lw	a5,0(a4)
      3e:	2785                	addiw	a5,a5,1
      40:	c31c                	sw	a5,0(a4)
    thrdresume(main_id, 0);
      42:	4581                	li	a1,0
      44:	00001517          	auipc	a0,0x1
      48:	50852503          	lw	a0,1288(a0) # 154c <main_id>
      4c:	00001097          	auipc	ra,0x1
      50:	904080e7          	jalr	-1788(ra) # 950 <thrdresume>
}
      54:	60a2                	ld	ra,8(sp)
      56:	6402                	ld	s0,0(sp)
      58:	0141                	addi	sp,sp,16
      5a:	8082                	ret

000000000000005c <thrdstop_test2>:

void thrdstop_test2()
{
      5c:	7139                	addi	sp,sp,-64
      5e:	fc06                	sd	ra,56(sp)
      60:	f822                	sd	s0,48(sp)
      62:	f426                	sd	s1,40(sp)
      64:	f04a                	sd	s2,32(sp)
      66:	ec4e                	sd	s3,24(sp)
      68:	e852                	sd	s4,16(sp)
      6a:	e456                	sd	s5,8(sp)
      6c:	e05a                	sd	s6,0(sp)
      6e:	0080                	addi	s0,sp,64
    tmpTime = uptime();
      70:	00001097          	auipc	ra,0x1
      74:	8d0080e7          	jalr	-1840(ra) # 940 <uptime>
      78:	00001797          	auipc	a5,0x1
      7c:	4ca7a423          	sw	a0,1224(a5) # 1540 <tmpTime>
    thrdstop_test_time = tmpTime;
      80:	00001797          	auipc	a5,0x1
      84:	4ca7a223          	sw	a0,1220(a5) # 1544 <thrdstop_test_time>
    nowTime = 0;
      88:	00001797          	auipc	a5,0x1
      8c:	4a07a423          	sw	zero,1192(a5) # 1530 <nowTime>
    while( thrdstop_test_time - tmpTime < 6 )
      90:	4781                	li	a5,0
    {
        if( thrdstop_test_time - tmpTime >= nowTime )
      92:	00001497          	auipc	s1,0x1
      96:	49e48493          	addi	s1,s1,1182 # 1530 <nowTime>
        {
            printf("thrdstop test2 at %d\n", thrdstop_test_time-startTime);
      9a:	00001b17          	auipc	s6,0x1
      9e:	4b6b0b13          	addi	s6,s6,1206 # 1550 <startTime>
      a2:	00001a97          	auipc	s5,0x1
      a6:	226a8a93          	addi	s5,s5,550 # 12c8 <thread_start_threading+0x8e>
            nowTime++;
        }
        thrdstop_test_time = uptime();
      aa:	00001a17          	auipc	s4,0x1
      ae:	49aa0a13          	addi	s4,s4,1178 # 1544 <thrdstop_test_time>
    while( thrdstop_test_time - tmpTime < 6 )
      b2:	00001997          	auipc	s3,0x1
      b6:	48e98993          	addi	s3,s3,1166 # 1540 <tmpTime>
      ba:	4915                	li	s2,5
      bc:	a829                	j	d6 <thrdstop_test2+0x7a>
        thrdstop_test_time = uptime();
      be:	00001097          	auipc	ra,0x1
      c2:	882080e7          	jalr	-1918(ra) # 940 <uptime>
      c6:	00aa2023          	sw	a0,0(s4)
    while( thrdstop_test_time - tmpTime < 6 )
      ca:	0009a783          	lw	a5,0(s3)
      ce:	40f507bb          	subw	a5,a0,a5
      d2:	02f94263          	blt	s2,a5,f6 <thrdstop_test2+0x9a>
        if( thrdstop_test_time - tmpTime >= nowTime )
      d6:	4098                	lw	a4,0(s1)
      d8:	fee7c3e3          	blt	a5,a4,be <thrdstop_test2+0x62>
            printf("thrdstop test2 at %d\n", thrdstop_test_time-startTime);
      dc:	000b2583          	lw	a1,0(s6)
      e0:	40b505bb          	subw	a1,a0,a1
      e4:	8556                	mv	a0,s5
      e6:	00001097          	auipc	ra,0x1
      ea:	b52080e7          	jalr	-1198(ra) # c38 <printf>
            nowTime++;
      ee:	409c                	lw	a5,0(s1)
      f0:	2785                	addiw	a5,a5,1
      f2:	c09c                	sw	a5,0(s1)
      f4:	b7e9                	j	be <thrdstop_test2+0x62>
    }
    
    flag += 1;
      f6:	00001717          	auipc	a4,0x1
      fa:	45270713          	addi	a4,a4,1106 # 1548 <flag>
      fe:	431c                	lw	a5,0(a4)
     100:	2785                	addiw	a5,a5,1
     102:	c31c                	sw	a5,0(a4)
    printf("thrdstop test2 at %d\n", thrdstop_test_time-startTime);
     104:	00001597          	auipc	a1,0x1
     108:	44c5a583          	lw	a1,1100(a1) # 1550 <startTime>
     10c:	40b505bb          	subw	a1,a0,a1
     110:	00001517          	auipc	a0,0x1
     114:	1b850513          	addi	a0,a0,440 # 12c8 <thread_start_threading+0x8e>
     118:	00001097          	auipc	ra,0x1
     11c:	b20080e7          	jalr	-1248(ra) # c38 <printf>
    thrdresume(main_id, 0);
     120:	4581                	li	a1,0
     122:	00001517          	auipc	a0,0x1
     126:	42a52503          	lw	a0,1066(a0) # 154c <main_id>
     12a:	00001097          	auipc	ra,0x1
     12e:	826080e7          	jalr	-2010(ra) # 950 <thrdresume>
}
     132:	70e2                	ld	ra,56(sp)
     134:	7442                	ld	s0,48(sp)
     136:	74a2                	ld	s1,40(sp)
     138:	7902                	ld	s2,32(sp)
     13a:	69e2                	ld	s3,24(sp)
     13c:	6a42                	ld	s4,16(sp)
     13e:	6aa2                	ld	s5,8(sp)
     140:	6b02                	ld	s6,0(sp)
     142:	6121                	addi	sp,sp,64
     144:	8082                	ret

0000000000000146 <f1>:
    }
}


void f1( void *k )
{
     146:	1141                	addi	sp,sp,-16
     148:	e406                	sd	ra,8(sp)
     14a:	e022                	sd	s0,0(sp)
     14c:	0800                	addi	s0,sp,16
    int *kk = (int *)k;
    *kk = *(int *)k + 1;
     14e:	411c                	lw	a5,0(a0)
     150:	2785                	addiw	a5,a5,1
     152:	0007871b          	sext.w	a4,a5
     156:	c11c                	sw	a5,0(a0)
    if( *kk <= 100 )
     158:	06400793          	li	a5,100
     15c:	00e7da63          	bge	a5,a4,170 <f1+0x2a>
    {
        struct thread *t1 = thread_create(f1, k, 3);
        thread_add_runqueue(t1);
    }    
    thread_exit();
     160:	00001097          	auipc	ra,0x1
     164:	eae080e7          	jalr	-338(ra) # 100e <thread_exit>
}
     168:	60a2                	ld	ra,8(sp)
     16a:	6402                	ld	s0,0(sp)
     16c:	0141                	addi	sp,sp,16
     16e:	8082                	ret
        struct thread *t1 = thread_create(f1, k, 3);
     170:	460d                	li	a2,3
     172:	85aa                	mv	a1,a0
     174:	00000517          	auipc	a0,0x0
     178:	fd250513          	addi	a0,a0,-46 # 146 <f1>
     17c:	00001097          	auipc	ra,0x1
     180:	cd4080e7          	jalr	-812(ra) # e50 <thread_create>
        thread_add_runqueue(t1);
     184:	00001097          	auipc	ra,0x1
     188:	d50080e7          	jalr	-688(ra) # ed4 <thread_add_runqueue>
     18c:	bfd1                	j	160 <f1+0x1a>

000000000000018e <gg>:
{
     18e:	1141                	addi	sp,sp,-16
     190:	e422                	sd	s0,8(sp)
     192:	0800                	addi	s0,sp,16
    *k = *k + 1;
     194:	411c                	lw	a5,0(a0)
     196:	2785                	addiw	a5,a5,1
     198:	c11c                	sw	a5,0(a0)
}
     19a:	6422                	ld	s0,8(sp)
     19c:	0141                	addi	sp,sp,16
     19e:	8082                	ret

00000000000001a0 <test1>:
{
     1a0:	711d                	addi	sp,sp,-96
     1a2:	ec86                	sd	ra,88(sp)
     1a4:	e8a2                	sd	s0,80(sp)
     1a6:	e4a6                	sd	s1,72(sp)
     1a8:	e0ca                	sd	s2,64(sp)
     1aa:	fc4e                	sd	s3,56(sp)
     1ac:	f852                	sd	s4,48(sp)
     1ae:	f456                	sd	s5,40(sp)
     1b0:	f05a                	sd	s6,32(sp)
     1b2:	ec5e                	sd	s7,24(sp)
     1b4:	e862                	sd	s8,16(sp)
     1b6:	e466                	sd	s9,8(sp)
     1b8:	1080                	addi	s0,sp,96
    startTime = uptime();
     1ba:	00000097          	auipc	ra,0x0
     1be:	786080e7          	jalr	1926(ra) # 940 <uptime>
     1c2:	00001797          	auipc	a5,0x1
     1c6:	38a7a723          	sw	a0,910(a5) # 1550 <startTime>
    main_id = thrdstop( 5, -1, thrdstop_test1);
     1ca:	00000617          	auipc	a2,0x0
     1ce:	e3660613          	addi	a2,a2,-458 # 0 <thrdstop_test1>
     1d2:	55fd                	li	a1,-1
     1d4:	4515                	li	a0,5
     1d6:	00000097          	auipc	ra,0x0
     1da:	772080e7          	jalr	1906(ra) # 948 <thrdstop>
     1de:	00001797          	auipc	a5,0x1
     1e2:	36a7a723          	sw	a0,878(a5) # 154c <main_id>
    int tmp_time = 0;
     1e6:	4c81                	li	s9,0
        if(flag == 1)
     1e8:	00001497          	auipc	s1,0x1
     1ec:	36048493          	addi	s1,s1,864 # 1548 <flag>
     1f0:	4985                	li	s3,1
        else if( flag == 2 && uptime() - tmp_time >= 2 )
     1f2:	4909                	li	s2,2
            tmpTime = uptime();
     1f4:	00001c17          	auipc	s8,0x1
     1f8:	34cc0c13          	addi	s8,s8,844 # 1540 <tmpTime>
            if( tmpTime != nowTime && flag == 5 )
     1fc:	00001b97          	auipc	s7,0x1
     200:	334b8b93          	addi	s7,s7,820 # 1530 <nowTime>
                printf("ttt %d\n", tmpTime-startTime);
     204:	00001a97          	auipc	s5,0x1
     208:	34ca8a93          	addi	s5,s5,844 # 1550 <startTime>
            if( thrdstop_test_time-startTime > 9 || thrdstop_test_time-startTime < 7 )
     20c:	00001b17          	auipc	s6,0x1
     210:	338b0b13          	addi	s6,s6,824 # 1544 <thrdstop_test_time>
            thrdstop( 10, main_id, thrdstop_test1);
     214:	00001a17          	auipc	s4,0x1
     218:	338a0a13          	addi	s4,s4,824 # 154c <main_id>
     21c:	a0a9                	j	266 <test1+0xc6>
            if( thrdstop_test_time-startTime > 6 || thrdstop_test_time-startTime < 4 )
     21e:	000b2783          	lw	a5,0(s6)
     222:	000aa703          	lw	a4,0(s5)
     226:	9f99                	subw	a5,a5,a4
     228:	37f1                	addiw	a5,a5,-4
     22a:	08f96f63          	bltu	s2,a5,2c8 <test1+0x128>
            thrdstop( 10, main_id, thrdstop_test1);
     22e:	00000617          	auipc	a2,0x0
     232:	dd260613          	addi	a2,a2,-558 # 0 <thrdstop_test1>
     236:	000a2583          	lw	a1,0(s4)
     23a:	4529                	li	a0,10
     23c:	00000097          	auipc	ra,0x0
     240:	70c080e7          	jalr	1804(ra) # 948 <thrdstop>
            tmp_time = uptime();
     244:	00000097          	auipc	ra,0x0
     248:	6fc080e7          	jalr	1788(ra) # 940 <uptime>
     24c:	8caa                	mv	s9,a0
            printf("tmp_time=%d\n", tmp_time);
     24e:	85aa                	mv	a1,a0
     250:	00001517          	auipc	a0,0x1
     254:	0c050513          	addi	a0,a0,192 # 1310 <thread_start_threading+0xd6>
     258:	00001097          	auipc	ra,0x1
     25c:	9e0080e7          	jalr	-1568(ra) # c38 <printf>
            flag += 1;
     260:	409c                	lw	a5,0(s1)
     262:	2785                	addiw	a5,a5,1
     264:	c09c                	sw	a5,0(s1)
        if(flag == 1)
     266:	409c                	lw	a5,0(s1)
     268:	fb378be3          	beq	a5,s3,21e <test1+0x7e>
        else if( flag == 2 && uptime() - tmp_time >= 2 )
     26c:	07278b63          	beq	a5,s2,2e2 <test1+0x142>
        else if( flag == 4 )
     270:	409c                	lw	a5,0(s1)
     272:	4711                	li	a4,4
     274:	0ae78c63          	beq	a5,a4,32c <test1+0x18c>
        else if( flag == 5 )
     278:	4715                	li	a4,5
     27a:	0ee78d63          	beq	a5,a4,374 <test1+0x1d4>
        else if( flag == 6 )
     27e:	4719                	li	a4,6
     280:	fee793e3          	bne	a5,a4,266 <test1+0xc6>
            if( thrdstop_test_time-startTime > 19 || thrdstop_test_time-startTime < 17 )
     284:	00001797          	auipc	a5,0x1
     288:	2c07a783          	lw	a5,704(a5) # 1544 <thrdstop_test_time>
     28c:	00001717          	auipc	a4,0x1
     290:	2c472703          	lw	a4,708(a4) # 1550 <startTime>
     294:	9f99                	subw	a5,a5,a4
     296:	37bd                	addiw	a5,a5,-17
     298:	4709                	li	a4,2
     29a:	10f76c63          	bltu	a4,a5,3b2 <test1+0x212>
            else printf("04012a13b860de3fafec2f5afb2a587b5c31b1d06c47fbf3fe2463762828bbf3 1\n");
     29e:	00001517          	auipc	a0,0x1
     2a2:	0b250513          	addi	a0,a0,178 # 1350 <thread_start_threading+0x116>
     2a6:	00001097          	auipc	ra,0x1
     2aa:	992080e7          	jalr	-1646(ra) # c38 <printf>
}
     2ae:	60e6                	ld	ra,88(sp)
     2b0:	6446                	ld	s0,80(sp)
     2b2:	64a6                	ld	s1,72(sp)
     2b4:	6906                	ld	s2,64(sp)
     2b6:	79e2                	ld	s3,56(sp)
     2b8:	7a42                	ld	s4,48(sp)
     2ba:	7aa2                	ld	s5,40(sp)
     2bc:	7b02                	ld	s6,32(sp)
     2be:	6be2                	ld	s7,24(sp)
     2c0:	6c42                	ld	s8,16(sp)
     2c2:	6ca2                	ld	s9,8(sp)
     2c4:	6125                	addi	sp,sp,96
     2c6:	8082                	ret
                printf("FAILED, thrdstop counts down incorrectly\n");
     2c8:	00001517          	auipc	a0,0x1
     2cc:	01850513          	addi	a0,a0,24 # 12e0 <thread_start_threading+0xa6>
     2d0:	00001097          	auipc	ra,0x1
     2d4:	968080e7          	jalr	-1688(ra) # c38 <printf>
                exit(0);
     2d8:	4501                	li	a0,0
     2da:	00000097          	auipc	ra,0x0
     2de:	5ce080e7          	jalr	1486(ra) # 8a8 <exit>
        else if( flag == 2 && uptime() - tmp_time >= 2 )
     2e2:	00000097          	auipc	ra,0x0
     2e6:	65e080e7          	jalr	1630(ra) # 940 <uptime>
     2ea:	4195053b          	subw	a0,a0,s9
     2ee:	f8a9d1e3          	bge	s3,a0,270 <test1+0xd0>
            int time_consumed = cancelthrdstop( -1 );
     2f2:	557d                	li	a0,-1
     2f4:	00000097          	auipc	ra,0x0
     2f8:	664080e7          	jalr	1636(ra) # 958 <cancelthrdstop>
     2fc:	85aa                	mv	a1,a0
            printf("time_consumed = %d, it should be 2\n", time_consumed);
     2fe:	00001517          	auipc	a0,0x1
     302:	02250513          	addi	a0,a0,34 # 1320 <thread_start_threading+0xe6>
     306:	00001097          	auipc	ra,0x1
     30a:	932080e7          	jalr	-1742(ra) # c38 <printf>
            thrdstop( 1, main_id, thrdstop_test1);
     30e:	00000617          	auipc	a2,0x0
     312:	cf260613          	addi	a2,a2,-782 # 0 <thrdstop_test1>
     316:	000a2583          	lw	a1,0(s4)
     31a:	854e                	mv	a0,s3
     31c:	00000097          	auipc	ra,0x0
     320:	62c080e7          	jalr	1580(ra) # 948 <thrdstop>
            flag += 1;
     324:	409c                	lw	a5,0(s1)
     326:	2785                	addiw	a5,a5,1
     328:	c09c                	sw	a5,0(s1)
        {
     32a:	bf35                	j	266 <test1+0xc6>
            if( thrdstop_test_time-startTime > 9 || thrdstop_test_time-startTime < 7 )
     32c:	000b2783          	lw	a5,0(s6)
     330:	000aa703          	lw	a4,0(s5)
     334:	9f99                	subw	a5,a5,a4
     336:	37e5                	addiw	a5,a5,-7
     338:	02f96163          	bltu	s2,a5,35a <test1+0x1ba>
            thrdstop( 10, main_id, thrdstop_test1);
     33c:	00000617          	auipc	a2,0x0
     340:	cc460613          	addi	a2,a2,-828 # 0 <thrdstop_test1>
     344:	000a2583          	lw	a1,0(s4)
     348:	4529                	li	a0,10
     34a:	00000097          	auipc	ra,0x0
     34e:	5fe080e7          	jalr	1534(ra) # 948 <thrdstop>
            flag += 1;
     352:	409c                	lw	a5,0(s1)
     354:	2785                	addiw	a5,a5,1
     356:	c09c                	sw	a5,0(s1)
     358:	b739                	j	266 <test1+0xc6>
                printf("FAILED, thrdstop counts down incorrectly\n");
     35a:	00001517          	auipc	a0,0x1
     35e:	f8650513          	addi	a0,a0,-122 # 12e0 <thread_start_threading+0xa6>
     362:	00001097          	auipc	ra,0x1
     366:	8d6080e7          	jalr	-1834(ra) # c38 <printf>
                exit(0);
     36a:	4501                	li	a0,0
     36c:	00000097          	auipc	ra,0x0
     370:	53c080e7          	jalr	1340(ra) # 8a8 <exit>
            tmpTime = uptime();
     374:	00000097          	auipc	ra,0x0
     378:	5cc080e7          	jalr	1484(ra) # 940 <uptime>
     37c:	00ac2023          	sw	a0,0(s8)
            if( tmpTime != nowTime && flag == 5 )
     380:	000ba783          	lw	a5,0(s7)
     384:	eea781e3          	beq	a5,a0,266 <test1+0xc6>
     388:	4098                	lw	a4,0(s1)
     38a:	4795                	li	a5,5
     38c:	ecf71de3          	bne	a4,a5,266 <test1+0xc6>
                printf("ttt %d\n", tmpTime-startTime);
     390:	000aa583          	lw	a1,0(s5)
     394:	40b505bb          	subw	a1,a0,a1
     398:	00001517          	auipc	a0,0x1
     39c:	fb050513          	addi	a0,a0,-80 # 1348 <thread_start_threading+0x10e>
     3a0:	00001097          	auipc	ra,0x1
     3a4:	898080e7          	jalr	-1896(ra) # c38 <printf>
                nowTime = tmpTime;
     3a8:	000c2783          	lw	a5,0(s8)
     3ac:	00fba023          	sw	a5,0(s7)
     3b0:	bd5d                	j	266 <test1+0xc6>
                printf("FAILED, thrdstop counts down incorrectly\n");
     3b2:	00001517          	auipc	a0,0x1
     3b6:	f2e50513          	addi	a0,a0,-210 # 12e0 <thread_start_threading+0xa6>
     3ba:	00001097          	auipc	ra,0x1
     3be:	87e080e7          	jalr	-1922(ra) # c38 <printf>
                exit(0);
     3c2:	4501                	li	a0,0
     3c4:	00000097          	auipc	ra,0x0
     3c8:	4e4080e7          	jalr	1252(ra) # 8a8 <exit>

00000000000003cc <test2>:

void test2()
{
     3cc:	1101                	addi	sp,sp,-32
     3ce:	ec06                	sd	ra,24(sp)
     3d0:	e822                	sd	s0,16(sp)
     3d2:	1000                	addi	s0,sp,32
    int test2k = 0;
     3d4:	fe042623          	sw	zero,-20(s0)
    struct thread *t1 = thread_create(f1, &test2k, 3);
     3d8:	460d                	li	a2,3
     3da:	fec40593          	addi	a1,s0,-20
     3de:	00000517          	auipc	a0,0x0
     3e2:	d6850513          	addi	a0,a0,-664 # 146 <f1>
     3e6:	00001097          	auipc	ra,0x1
     3ea:	a6a080e7          	jalr	-1430(ra) # e50 <thread_create>
    thread_add_runqueue(t1);
     3ee:	00001097          	auipc	ra,0x1
     3f2:	ae6080e7          	jalr	-1306(ra) # ed4 <thread_add_runqueue>
    thread_start_threading(5);
     3f6:	4515                	li	a0,5
     3f8:	00001097          	auipc	ra,0x1
     3fc:	e42080e7          	jalr	-446(ra) # 123a <thread_start_threading>
    printf("test2k=%d\n", test2k);
     400:	fec42583          	lw	a1,-20(s0)
     404:	00001517          	auipc	a0,0x1
     408:	f9450513          	addi	a0,a0,-108 # 1398 <thread_start_threading+0x15e>
     40c:	00001097          	auipc	ra,0x1
     410:	82c080e7          	jalr	-2004(ra) # c38 <printf>
    printf("04012a13b860de3fafec2f5afb2a587b5c31b1d06c47fbf3fe2463762828bbf3 2\n", test2k);
     414:	fec42583          	lw	a1,-20(s0)
     418:	00001517          	auipc	a0,0x1
     41c:	f9050513          	addi	a0,a0,-112 # 13a8 <thread_start_threading+0x16e>
     420:	00001097          	auipc	ra,0x1
     424:	818080e7          	jalr	-2024(ra) # c38 <printf>
}
     428:	60e2                	ld	ra,24(sp)
     42a:	6442                	ld	s0,16(sp)
     42c:	6105                	addi	sp,sp,32
     42e:	8082                	ret

0000000000000430 <test3>:


void test3()
{
     430:	711d                	addi	sp,sp,-96
     432:	ec86                	sd	ra,88(sp)
     434:	e8a2                	sd	s0,80(sp)
     436:	e4a6                	sd	s1,72(sp)
     438:	e0ca                	sd	s2,64(sp)
     43a:	fc4e                	sd	s3,56(sp)
     43c:	f852                	sd	s4,48(sp)
     43e:	f456                	sd	s5,40(sp)
     440:	f05a                	sd	s6,32(sp)
     442:	ec5e                	sd	s7,24(sp)
     444:	e862                	sd	s8,16(sp)
     446:	e466                	sd	s9,8(sp)
     448:	1080                	addi	s0,sp,96
    startTime = uptime();
     44a:	00000097          	auipc	ra,0x0
     44e:	4f6080e7          	jalr	1270(ra) # 940 <uptime>
     452:	00001797          	auipc	a5,0x1
     456:	0ea7af23          	sw	a0,254(a5) # 1550 <startTime>
    main_id = thrdstop( 5, -1, thrdstop_test1);
     45a:	00000617          	auipc	a2,0x0
     45e:	ba660613          	addi	a2,a2,-1114 # 0 <thrdstop_test1>
     462:	55fd                	li	a1,-1
     464:	4515                	li	a0,5
     466:	00000097          	auipc	ra,0x0
     46a:	4e2080e7          	jalr	1250(ra) # 948 <thrdstop>
     46e:	00001797          	auipc	a5,0x1
     472:	0ca7af23          	sw	a0,222(a5) # 154c <main_id>
    int i = 0, j = 0;
    int tmp_time = 0;
    flag=0;
     476:	00001797          	auipc	a5,0x1
     47a:	0c07a923          	sw	zero,210(a5) # 1548 <flag>
    int tmp_time = 0;
     47e:	4c81                	li	s9,0
    while (1)
    {   
        gg(&j);
        i ++;
        if(flag == 1)
     480:	00001497          	auipc	s1,0x1
     484:	0c848493          	addi	s1,s1,200 # 1548 <flag>
     488:	4905                	li	s2,1
            thrdstop( 10, main_id, thrdstop_test1);
            tmp_time = uptime();
            printf("tmp_time=%d\n", tmp_time);
            flag += 1;
        }
        else if( flag == 2 && uptime() - tmp_time >= 2 )
     48a:	4989                	li	s3,2
            int time_consumed = cancelthrdstop( -1 );
            printf("time_consumed = %d, it should be 2\n", time_consumed);
            thrdstop( 3, main_id, thrdstop_test1);
            flag += 1;
        }
        else if( flag == 4 )
     48c:	4a11                	li	s4,4
                exit(0);
            }            
            thrdstop( 1, main_id, thrdstop_test2);
            flag += 1;
        }
        else if( flag == 6 )
     48e:	4c19                	li	s8,6
            if( thrdstop_test_time-startTime > 11 || thrdstop_test_time-startTime < 9 )
     490:	00001b97          	auipc	s7,0x1
     494:	0b4b8b93          	addi	s7,s7,180 # 1544 <thrdstop_test_time>
     498:	00001b17          	auipc	s6,0x1
     49c:	0b8b0b13          	addi	s6,s6,184 # 1550 <startTime>
            thrdstop( 1, main_id, thrdstop_test2);
     4a0:	00001a97          	auipc	s5,0x1
     4a4:	0aca8a93          	addi	s5,s5,172 # 154c <main_id>
     4a8:	a0a9                	j	4f2 <test3+0xc2>
            if( thrdstop_test_time-startTime > 6 || thrdstop_test_time-startTime < 4 )
     4aa:	000ba783          	lw	a5,0(s7)
     4ae:	000b2703          	lw	a4,0(s6)
     4b2:	9f99                	subw	a5,a5,a4
     4b4:	37f1                	addiw	a5,a5,-4
     4b6:	08f9ea63          	bltu	s3,a5,54a <test3+0x11a>
            thrdstop( 10, main_id, thrdstop_test1);
     4ba:	00000617          	auipc	a2,0x0
     4be:	b4660613          	addi	a2,a2,-1210 # 0 <thrdstop_test1>
     4c2:	000aa583          	lw	a1,0(s5)
     4c6:	4529                	li	a0,10
     4c8:	00000097          	auipc	ra,0x0
     4cc:	480080e7          	jalr	1152(ra) # 948 <thrdstop>
            tmp_time = uptime();
     4d0:	00000097          	auipc	ra,0x0
     4d4:	470080e7          	jalr	1136(ra) # 940 <uptime>
     4d8:	8caa                	mv	s9,a0
            printf("tmp_time=%d\n", tmp_time);
     4da:	85aa                	mv	a1,a0
     4dc:	00001517          	auipc	a0,0x1
     4e0:	e3450513          	addi	a0,a0,-460 # 1310 <thread_start_threading+0xd6>
     4e4:	00000097          	auipc	ra,0x0
     4e8:	754080e7          	jalr	1876(ra) # c38 <printf>
            flag += 1;
     4ec:	409c                	lw	a5,0(s1)
     4ee:	2785                	addiw	a5,a5,1
     4f0:	c09c                	sw	a5,0(s1)
        if(flag == 1)
     4f2:	409c                	lw	a5,0(s1)
     4f4:	fb278be3          	beq	a5,s2,4aa <test3+0x7a>
        else if( flag == 2 && uptime() - tmp_time >= 2 )
     4f8:	07378663          	beq	a5,s3,564 <test3+0x134>
        else if( flag == 4 )
     4fc:	409c                	lw	a5,0(s1)
     4fe:	0b478863          	beq	a5,s4,5ae <test3+0x17e>
        else if( flag == 6 )
     502:	ff8798e3          	bne	a5,s8,4f2 <test3+0xc2>
        {
            if( thrdstop_test_time-startTime > 18 || thrdstop_test_time-startTime < 16 )
     506:	00001797          	auipc	a5,0x1
     50a:	03e7a783          	lw	a5,62(a5) # 1544 <thrdstop_test_time>
     50e:	00001717          	auipc	a4,0x1
     512:	04272703          	lw	a4,66(a4) # 1550 <startTime>
     516:	9f99                	subw	a5,a5,a4
     518:	37c1                	addiw	a5,a5,-16
     51a:	4709                	li	a4,2
     51c:	0cf76d63          	bltu	a4,a5,5f6 <test3+0x1c6>
            {
                printf("FAILED3, thrdstop counts down incorrectly\n");
                exit(0);
            }           
            else if( i != j) printf("FAILED, i should equal to j\n");
            else printf("04012a13b860de3fafec2f5afb2a587b5c31b1d06c47fbf3fe2463762828bbf3 3\n");
     520:	00001517          	auipc	a0,0x1
     524:	f6050513          	addi	a0,a0,-160 # 1480 <thread_start_threading+0x246>
     528:	00000097          	auipc	ra,0x0
     52c:	710080e7          	jalr	1808(ra) # c38 <printf>
            return;
        }
    }
}
     530:	60e6                	ld	ra,88(sp)
     532:	6446                	ld	s0,80(sp)
     534:	64a6                	ld	s1,72(sp)
     536:	6906                	ld	s2,64(sp)
     538:	79e2                	ld	s3,56(sp)
     53a:	7a42                	ld	s4,48(sp)
     53c:	7aa2                	ld	s5,40(sp)
     53e:	7b02                	ld	s6,32(sp)
     540:	6be2                	ld	s7,24(sp)
     542:	6c42                	ld	s8,16(sp)
     544:	6ca2                	ld	s9,8(sp)
     546:	6125                	addi	sp,sp,96
     548:	8082                	ret
                printf("FAILED1, thrdstop counts down incorrectly\n");
     54a:	00001517          	auipc	a0,0x1
     54e:	ea650513          	addi	a0,a0,-346 # 13f0 <thread_start_threading+0x1b6>
     552:	00000097          	auipc	ra,0x0
     556:	6e6080e7          	jalr	1766(ra) # c38 <printf>
                exit(0);
     55a:	4501                	li	a0,0
     55c:	00000097          	auipc	ra,0x0
     560:	34c080e7          	jalr	844(ra) # 8a8 <exit>
        else if( flag == 2 && uptime() - tmp_time >= 2 )
     564:	00000097          	auipc	ra,0x0
     568:	3dc080e7          	jalr	988(ra) # 940 <uptime>
     56c:	4195053b          	subw	a0,a0,s9
     570:	f8a956e3          	bge	s2,a0,4fc <test3+0xcc>
            int time_consumed = cancelthrdstop( -1 );
     574:	557d                	li	a0,-1
     576:	00000097          	auipc	ra,0x0
     57a:	3e2080e7          	jalr	994(ra) # 958 <cancelthrdstop>
     57e:	85aa                	mv	a1,a0
            printf("time_consumed = %d, it should be 2\n", time_consumed);
     580:	00001517          	auipc	a0,0x1
     584:	da050513          	addi	a0,a0,-608 # 1320 <thread_start_threading+0xe6>
     588:	00000097          	auipc	ra,0x0
     58c:	6b0080e7          	jalr	1712(ra) # c38 <printf>
            thrdstop( 3, main_id, thrdstop_test1);
     590:	00000617          	auipc	a2,0x0
     594:	a7060613          	addi	a2,a2,-1424 # 0 <thrdstop_test1>
     598:	000aa583          	lw	a1,0(s5)
     59c:	450d                	li	a0,3
     59e:	00000097          	auipc	ra,0x0
     5a2:	3aa080e7          	jalr	938(ra) # 948 <thrdstop>
            flag += 1;
     5a6:	409c                	lw	a5,0(s1)
     5a8:	2785                	addiw	a5,a5,1
     5aa:	c09c                	sw	a5,0(s1)
        {
     5ac:	b799                	j	4f2 <test3+0xc2>
            if( thrdstop_test_time-startTime > 11 || thrdstop_test_time-startTime < 9 )
     5ae:	000ba783          	lw	a5,0(s7)
     5b2:	000b2703          	lw	a4,0(s6)
     5b6:	9f99                	subw	a5,a5,a4
     5b8:	37dd                	addiw	a5,a5,-9
     5ba:	02f9e163          	bltu	s3,a5,5dc <test3+0x1ac>
            thrdstop( 1, main_id, thrdstop_test2);
     5be:	00000617          	auipc	a2,0x0
     5c2:	a9e60613          	addi	a2,a2,-1378 # 5c <thrdstop_test2>
     5c6:	000aa583          	lw	a1,0(s5)
     5ca:	854a                	mv	a0,s2
     5cc:	00000097          	auipc	ra,0x0
     5d0:	37c080e7          	jalr	892(ra) # 948 <thrdstop>
            flag += 1;
     5d4:	409c                	lw	a5,0(s1)
     5d6:	2785                	addiw	a5,a5,1
     5d8:	c09c                	sw	a5,0(s1)
     5da:	bf21                	j	4f2 <test3+0xc2>
                printf("FAILED2, thrdstop counts down incorrectly\n");
     5dc:	00001517          	auipc	a0,0x1
     5e0:	e4450513          	addi	a0,a0,-444 # 1420 <thread_start_threading+0x1e6>
     5e4:	00000097          	auipc	ra,0x0
     5e8:	654080e7          	jalr	1620(ra) # c38 <printf>
                exit(0);
     5ec:	4501                	li	a0,0
     5ee:	00000097          	auipc	ra,0x0
     5f2:	2ba080e7          	jalr	698(ra) # 8a8 <exit>
                printf("FAILED3, thrdstop counts down incorrectly\n");
     5f6:	00001517          	auipc	a0,0x1
     5fa:	e5a50513          	addi	a0,a0,-422 # 1450 <thread_start_threading+0x216>
     5fe:	00000097          	auipc	ra,0x0
     602:	63a080e7          	jalr	1594(ra) # c38 <printf>
                exit(0);
     606:	4501                	li	a0,0
     608:	00000097          	auipc	ra,0x0
     60c:	2a0080e7          	jalr	672(ra) # 8a8 <exit>

0000000000000610 <main>:


int main(int argc, char **argv)
{
     610:	1141                	addi	sp,sp,-16
     612:	e406                	sd	ra,8(sp)
     614:	e022                	sd	s0,0(sp)
     616:	0800                	addi	s0,sp,16
   
    test1();
     618:	00000097          	auipc	ra,0x0
     61c:	b88080e7          	jalr	-1144(ra) # 1a0 <test1>
    test2();
     620:	00000097          	auipc	ra,0x0
     624:	dac080e7          	jalr	-596(ra) # 3cc <test2>
    test3();
     628:	00000097          	auipc	ra,0x0
     62c:	e08080e7          	jalr	-504(ra) # 430 <test3>
    exit(0);
     630:	4501                	li	a0,0
     632:	00000097          	auipc	ra,0x0
     636:	276080e7          	jalr	630(ra) # 8a8 <exit>

000000000000063a <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
     63a:	1141                	addi	sp,sp,-16
     63c:	e422                	sd	s0,8(sp)
     63e:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     640:	87aa                	mv	a5,a0
     642:	0585                	addi	a1,a1,1
     644:	0785                	addi	a5,a5,1
     646:	fff5c703          	lbu	a4,-1(a1)
     64a:	fee78fa3          	sb	a4,-1(a5)
     64e:	fb75                	bnez	a4,642 <strcpy+0x8>
    ;
  return os;
}
     650:	6422                	ld	s0,8(sp)
     652:	0141                	addi	sp,sp,16
     654:	8082                	ret

0000000000000656 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     656:	1141                	addi	sp,sp,-16
     658:	e422                	sd	s0,8(sp)
     65a:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
     65c:	00054783          	lbu	a5,0(a0)
     660:	cb91                	beqz	a5,674 <strcmp+0x1e>
     662:	0005c703          	lbu	a4,0(a1)
     666:	00f71763          	bne	a4,a5,674 <strcmp+0x1e>
    p++, q++;
     66a:	0505                	addi	a0,a0,1
     66c:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
     66e:	00054783          	lbu	a5,0(a0)
     672:	fbe5                	bnez	a5,662 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
     674:	0005c503          	lbu	a0,0(a1)
}
     678:	40a7853b          	subw	a0,a5,a0
     67c:	6422                	ld	s0,8(sp)
     67e:	0141                	addi	sp,sp,16
     680:	8082                	ret

0000000000000682 <strlen>:

uint
strlen(const char *s)
{
     682:	1141                	addi	sp,sp,-16
     684:	e422                	sd	s0,8(sp)
     686:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
     688:	00054783          	lbu	a5,0(a0)
     68c:	cf91                	beqz	a5,6a8 <strlen+0x26>
     68e:	0505                	addi	a0,a0,1
     690:	87aa                	mv	a5,a0
     692:	4685                	li	a3,1
     694:	9e89                	subw	a3,a3,a0
     696:	00f6853b          	addw	a0,a3,a5
     69a:	0785                	addi	a5,a5,1
     69c:	fff7c703          	lbu	a4,-1(a5)
     6a0:	fb7d                	bnez	a4,696 <strlen+0x14>
    ;
  return n;
}
     6a2:	6422                	ld	s0,8(sp)
     6a4:	0141                	addi	sp,sp,16
     6a6:	8082                	ret
  for(n = 0; s[n]; n++)
     6a8:	4501                	li	a0,0
     6aa:	bfe5                	j	6a2 <strlen+0x20>

00000000000006ac <memset>:

void*
memset(void *dst, int c, uint n)
{
     6ac:	1141                	addi	sp,sp,-16
     6ae:	e422                	sd	s0,8(sp)
     6b0:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
     6b2:	ca19                	beqz	a2,6c8 <memset+0x1c>
     6b4:	87aa                	mv	a5,a0
     6b6:	1602                	slli	a2,a2,0x20
     6b8:	9201                	srli	a2,a2,0x20
     6ba:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
     6be:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
     6c2:	0785                	addi	a5,a5,1
     6c4:	fee79de3          	bne	a5,a4,6be <memset+0x12>
  }
  return dst;
}
     6c8:	6422                	ld	s0,8(sp)
     6ca:	0141                	addi	sp,sp,16
     6cc:	8082                	ret

00000000000006ce <strchr>:

char*
strchr(const char *s, char c)
{
     6ce:	1141                	addi	sp,sp,-16
     6d0:	e422                	sd	s0,8(sp)
     6d2:	0800                	addi	s0,sp,16
  for(; *s; s++)
     6d4:	00054783          	lbu	a5,0(a0)
     6d8:	cb99                	beqz	a5,6ee <strchr+0x20>
    if(*s == c)
     6da:	00f58763          	beq	a1,a5,6e8 <strchr+0x1a>
  for(; *s; s++)
     6de:	0505                	addi	a0,a0,1
     6e0:	00054783          	lbu	a5,0(a0)
     6e4:	fbfd                	bnez	a5,6da <strchr+0xc>
      return (char*)s;
  return 0;
     6e6:	4501                	li	a0,0
}
     6e8:	6422                	ld	s0,8(sp)
     6ea:	0141                	addi	sp,sp,16
     6ec:	8082                	ret
  return 0;
     6ee:	4501                	li	a0,0
     6f0:	bfe5                	j	6e8 <strchr+0x1a>

00000000000006f2 <gets>:

char*
gets(char *buf, int max)
{
     6f2:	711d                	addi	sp,sp,-96
     6f4:	ec86                	sd	ra,88(sp)
     6f6:	e8a2                	sd	s0,80(sp)
     6f8:	e4a6                	sd	s1,72(sp)
     6fa:	e0ca                	sd	s2,64(sp)
     6fc:	fc4e                	sd	s3,56(sp)
     6fe:	f852                	sd	s4,48(sp)
     700:	f456                	sd	s5,40(sp)
     702:	f05a                	sd	s6,32(sp)
     704:	ec5e                	sd	s7,24(sp)
     706:	1080                	addi	s0,sp,96
     708:	8baa                	mv	s7,a0
     70a:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     70c:	892a                	mv	s2,a0
     70e:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
     710:	4aa9                	li	s5,10
     712:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
     714:	89a6                	mv	s3,s1
     716:	2485                	addiw	s1,s1,1
     718:	0344d863          	bge	s1,s4,748 <gets+0x56>
    cc = read(0, &c, 1);
     71c:	4605                	li	a2,1
     71e:	faf40593          	addi	a1,s0,-81
     722:	4501                	li	a0,0
     724:	00000097          	auipc	ra,0x0
     728:	19c080e7          	jalr	412(ra) # 8c0 <read>
    if(cc < 1)
     72c:	00a05e63          	blez	a0,748 <gets+0x56>
    buf[i++] = c;
     730:	faf44783          	lbu	a5,-81(s0)
     734:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
     738:	01578763          	beq	a5,s5,746 <gets+0x54>
     73c:	0905                	addi	s2,s2,1
     73e:	fd679be3          	bne	a5,s6,714 <gets+0x22>
  for(i=0; i+1 < max; ){
     742:	89a6                	mv	s3,s1
     744:	a011                	j	748 <gets+0x56>
     746:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
     748:	99de                	add	s3,s3,s7
     74a:	00098023          	sb	zero,0(s3)
  return buf;
}
     74e:	855e                	mv	a0,s7
     750:	60e6                	ld	ra,88(sp)
     752:	6446                	ld	s0,80(sp)
     754:	64a6                	ld	s1,72(sp)
     756:	6906                	ld	s2,64(sp)
     758:	79e2                	ld	s3,56(sp)
     75a:	7a42                	ld	s4,48(sp)
     75c:	7aa2                	ld	s5,40(sp)
     75e:	7b02                	ld	s6,32(sp)
     760:	6be2                	ld	s7,24(sp)
     762:	6125                	addi	sp,sp,96
     764:	8082                	ret

0000000000000766 <stat>:

int
stat(const char *n, struct stat *st)
{
     766:	1101                	addi	sp,sp,-32
     768:	ec06                	sd	ra,24(sp)
     76a:	e822                	sd	s0,16(sp)
     76c:	e426                	sd	s1,8(sp)
     76e:	e04a                	sd	s2,0(sp)
     770:	1000                	addi	s0,sp,32
     772:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     774:	4581                	li	a1,0
     776:	00000097          	auipc	ra,0x0
     77a:	172080e7          	jalr	370(ra) # 8e8 <open>
  if(fd < 0)
     77e:	02054563          	bltz	a0,7a8 <stat+0x42>
     782:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
     784:	85ca                	mv	a1,s2
     786:	00000097          	auipc	ra,0x0
     78a:	17a080e7          	jalr	378(ra) # 900 <fstat>
     78e:	892a                	mv	s2,a0
  close(fd);
     790:	8526                	mv	a0,s1
     792:	00000097          	auipc	ra,0x0
     796:	13e080e7          	jalr	318(ra) # 8d0 <close>
  return r;
}
     79a:	854a                	mv	a0,s2
     79c:	60e2                	ld	ra,24(sp)
     79e:	6442                	ld	s0,16(sp)
     7a0:	64a2                	ld	s1,8(sp)
     7a2:	6902                	ld	s2,0(sp)
     7a4:	6105                	addi	sp,sp,32
     7a6:	8082                	ret
    return -1;
     7a8:	597d                	li	s2,-1
     7aa:	bfc5                	j	79a <stat+0x34>

00000000000007ac <atoi>:

int
atoi(const char *s)
{
     7ac:	1141                	addi	sp,sp,-16
     7ae:	e422                	sd	s0,8(sp)
     7b0:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     7b2:	00054603          	lbu	a2,0(a0)
     7b6:	fd06079b          	addiw	a5,a2,-48
     7ba:	0ff7f793          	andi	a5,a5,255
     7be:	4725                	li	a4,9
     7c0:	02f76963          	bltu	a4,a5,7f2 <atoi+0x46>
     7c4:	86aa                	mv	a3,a0
  n = 0;
     7c6:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
     7c8:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
     7ca:	0685                	addi	a3,a3,1
     7cc:	0025179b          	slliw	a5,a0,0x2
     7d0:	9fa9                	addw	a5,a5,a0
     7d2:	0017979b          	slliw	a5,a5,0x1
     7d6:	9fb1                	addw	a5,a5,a2
     7d8:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
     7dc:	0006c603          	lbu	a2,0(a3)
     7e0:	fd06071b          	addiw	a4,a2,-48
     7e4:	0ff77713          	andi	a4,a4,255
     7e8:	fee5f1e3          	bgeu	a1,a4,7ca <atoi+0x1e>
  return n;
}
     7ec:	6422                	ld	s0,8(sp)
     7ee:	0141                	addi	sp,sp,16
     7f0:	8082                	ret
  n = 0;
     7f2:	4501                	li	a0,0
     7f4:	bfe5                	j	7ec <atoi+0x40>

00000000000007f6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     7f6:	1141                	addi	sp,sp,-16
     7f8:	e422                	sd	s0,8(sp)
     7fa:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
     7fc:	02b57463          	bgeu	a0,a1,824 <memmove+0x2e>
    while(n-- > 0)
     800:	00c05f63          	blez	a2,81e <memmove+0x28>
     804:	1602                	slli	a2,a2,0x20
     806:	9201                	srli	a2,a2,0x20
     808:	00c507b3          	add	a5,a0,a2
  dst = vdst;
     80c:	872a                	mv	a4,a0
      *dst++ = *src++;
     80e:	0585                	addi	a1,a1,1
     810:	0705                	addi	a4,a4,1
     812:	fff5c683          	lbu	a3,-1(a1)
     816:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
     81a:	fee79ae3          	bne	a5,a4,80e <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
     81e:	6422                	ld	s0,8(sp)
     820:	0141                	addi	sp,sp,16
     822:	8082                	ret
    dst += n;
     824:	00c50733          	add	a4,a0,a2
    src += n;
     828:	95b2                	add	a1,a1,a2
    while(n-- > 0)
     82a:	fec05ae3          	blez	a2,81e <memmove+0x28>
     82e:	fff6079b          	addiw	a5,a2,-1
     832:	1782                	slli	a5,a5,0x20
     834:	9381                	srli	a5,a5,0x20
     836:	fff7c793          	not	a5,a5
     83a:	97ba                	add	a5,a5,a4
      *--dst = *--src;
     83c:	15fd                	addi	a1,a1,-1
     83e:	177d                	addi	a4,a4,-1
     840:	0005c683          	lbu	a3,0(a1)
     844:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
     848:	fee79ae3          	bne	a5,a4,83c <memmove+0x46>
     84c:	bfc9                	j	81e <memmove+0x28>

000000000000084e <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
     84e:	1141                	addi	sp,sp,-16
     850:	e422                	sd	s0,8(sp)
     852:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
     854:	ca05                	beqz	a2,884 <memcmp+0x36>
     856:	fff6069b          	addiw	a3,a2,-1
     85a:	1682                	slli	a3,a3,0x20
     85c:	9281                	srli	a3,a3,0x20
     85e:	0685                	addi	a3,a3,1
     860:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
     862:	00054783          	lbu	a5,0(a0)
     866:	0005c703          	lbu	a4,0(a1)
     86a:	00e79863          	bne	a5,a4,87a <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
     86e:	0505                	addi	a0,a0,1
    p2++;
     870:	0585                	addi	a1,a1,1
  while (n-- > 0) {
     872:	fed518e3          	bne	a0,a3,862 <memcmp+0x14>
  }
  return 0;
     876:	4501                	li	a0,0
     878:	a019                	j	87e <memcmp+0x30>
      return *p1 - *p2;
     87a:	40e7853b          	subw	a0,a5,a4
}
     87e:	6422                	ld	s0,8(sp)
     880:	0141                	addi	sp,sp,16
     882:	8082                	ret
  return 0;
     884:	4501                	li	a0,0
     886:	bfe5                	j	87e <memcmp+0x30>

0000000000000888 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
     888:	1141                	addi	sp,sp,-16
     88a:	e406                	sd	ra,8(sp)
     88c:	e022                	sd	s0,0(sp)
     88e:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
     890:	00000097          	auipc	ra,0x0
     894:	f66080e7          	jalr	-154(ra) # 7f6 <memmove>
}
     898:	60a2                	ld	ra,8(sp)
     89a:	6402                	ld	s0,0(sp)
     89c:	0141                	addi	sp,sp,16
     89e:	8082                	ret

00000000000008a0 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
     8a0:	4885                	li	a7,1
 ecall
     8a2:	00000073          	ecall
 ret
     8a6:	8082                	ret

00000000000008a8 <exit>:
.global exit
exit:
 li a7, SYS_exit
     8a8:	4889                	li	a7,2
 ecall
     8aa:	00000073          	ecall
 ret
     8ae:	8082                	ret

00000000000008b0 <wait>:
.global wait
wait:
 li a7, SYS_wait
     8b0:	488d                	li	a7,3
 ecall
     8b2:	00000073          	ecall
 ret
     8b6:	8082                	ret

00000000000008b8 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
     8b8:	4891                	li	a7,4
 ecall
     8ba:	00000073          	ecall
 ret
     8be:	8082                	ret

00000000000008c0 <read>:
.global read
read:
 li a7, SYS_read
     8c0:	4895                	li	a7,5
 ecall
     8c2:	00000073          	ecall
 ret
     8c6:	8082                	ret

00000000000008c8 <write>:
.global write
write:
 li a7, SYS_write
     8c8:	48c1                	li	a7,16
 ecall
     8ca:	00000073          	ecall
 ret
     8ce:	8082                	ret

00000000000008d0 <close>:
.global close
close:
 li a7, SYS_close
     8d0:	48d5                	li	a7,21
 ecall
     8d2:	00000073          	ecall
 ret
     8d6:	8082                	ret

00000000000008d8 <kill>:
.global kill
kill:
 li a7, SYS_kill
     8d8:	4899                	li	a7,6
 ecall
     8da:	00000073          	ecall
 ret
     8de:	8082                	ret

00000000000008e0 <exec>:
.global exec
exec:
 li a7, SYS_exec
     8e0:	489d                	li	a7,7
 ecall
     8e2:	00000073          	ecall
 ret
     8e6:	8082                	ret

00000000000008e8 <open>:
.global open
open:
 li a7, SYS_open
     8e8:	48bd                	li	a7,15
 ecall
     8ea:	00000073          	ecall
 ret
     8ee:	8082                	ret

00000000000008f0 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
     8f0:	48c5                	li	a7,17
 ecall
     8f2:	00000073          	ecall
 ret
     8f6:	8082                	ret

00000000000008f8 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
     8f8:	48c9                	li	a7,18
 ecall
     8fa:	00000073          	ecall
 ret
     8fe:	8082                	ret

0000000000000900 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
     900:	48a1                	li	a7,8
 ecall
     902:	00000073          	ecall
 ret
     906:	8082                	ret

0000000000000908 <link>:
.global link
link:
 li a7, SYS_link
     908:	48cd                	li	a7,19
 ecall
     90a:	00000073          	ecall
 ret
     90e:	8082                	ret

0000000000000910 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
     910:	48d1                	li	a7,20
 ecall
     912:	00000073          	ecall
 ret
     916:	8082                	ret

0000000000000918 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
     918:	48a5                	li	a7,9
 ecall
     91a:	00000073          	ecall
 ret
     91e:	8082                	ret

0000000000000920 <dup>:
.global dup
dup:
 li a7, SYS_dup
     920:	48a9                	li	a7,10
 ecall
     922:	00000073          	ecall
 ret
     926:	8082                	ret

0000000000000928 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
     928:	48ad                	li	a7,11
 ecall
     92a:	00000073          	ecall
 ret
     92e:	8082                	ret

0000000000000930 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
     930:	48b1                	li	a7,12
 ecall
     932:	00000073          	ecall
 ret
     936:	8082                	ret

0000000000000938 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
     938:	48b5                	li	a7,13
 ecall
     93a:	00000073          	ecall
 ret
     93e:	8082                	ret

0000000000000940 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
     940:	48b9                	li	a7,14
 ecall
     942:	00000073          	ecall
 ret
     946:	8082                	ret

0000000000000948 <thrdstop>:
.global thrdstop
thrdstop:
 li a7, SYS_thrdstop
     948:	48d9                	li	a7,22
 ecall
     94a:	00000073          	ecall
 ret
     94e:	8082                	ret

0000000000000950 <thrdresume>:
.global thrdresume
thrdresume:
 li a7, SYS_thrdresume
     950:	48dd                	li	a7,23
 ecall
     952:	00000073          	ecall
 ret
     956:	8082                	ret

0000000000000958 <cancelthrdstop>:
.global cancelthrdstop
cancelthrdstop:
 li a7, SYS_cancelthrdstop
     958:	48e1                	li	a7,24
 ecall
     95a:	00000073          	ecall
 ret
     95e:	8082                	ret

0000000000000960 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
     960:	1101                	addi	sp,sp,-32
     962:	ec06                	sd	ra,24(sp)
     964:	e822                	sd	s0,16(sp)
     966:	1000                	addi	s0,sp,32
     968:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
     96c:	4605                	li	a2,1
     96e:	fef40593          	addi	a1,s0,-17
     972:	00000097          	auipc	ra,0x0
     976:	f56080e7          	jalr	-170(ra) # 8c8 <write>
}
     97a:	60e2                	ld	ra,24(sp)
     97c:	6442                	ld	s0,16(sp)
     97e:	6105                	addi	sp,sp,32
     980:	8082                	ret

0000000000000982 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     982:	7139                	addi	sp,sp,-64
     984:	fc06                	sd	ra,56(sp)
     986:	f822                	sd	s0,48(sp)
     988:	f426                	sd	s1,40(sp)
     98a:	f04a                	sd	s2,32(sp)
     98c:	ec4e                	sd	s3,24(sp)
     98e:	0080                	addi	s0,sp,64
     990:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     992:	c299                	beqz	a3,998 <printint+0x16>
     994:	0805c863          	bltz	a1,a24 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     998:	2581                	sext.w	a1,a1
  neg = 0;
     99a:	4881                	li	a7,0
     99c:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
     9a0:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
     9a2:	2601                	sext.w	a2,a2
     9a4:	00001517          	auipc	a0,0x1
     9a8:	b2c50513          	addi	a0,a0,-1236 # 14d0 <digits>
     9ac:	883a                	mv	a6,a4
     9ae:	2705                	addiw	a4,a4,1
     9b0:	02c5f7bb          	remuw	a5,a1,a2
     9b4:	1782                	slli	a5,a5,0x20
     9b6:	9381                	srli	a5,a5,0x20
     9b8:	97aa                	add	a5,a5,a0
     9ba:	0007c783          	lbu	a5,0(a5)
     9be:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
     9c2:	0005879b          	sext.w	a5,a1
     9c6:	02c5d5bb          	divuw	a1,a1,a2
     9ca:	0685                	addi	a3,a3,1
     9cc:	fec7f0e3          	bgeu	a5,a2,9ac <printint+0x2a>
  if(neg)
     9d0:	00088b63          	beqz	a7,9e6 <printint+0x64>
    buf[i++] = '-';
     9d4:	fd040793          	addi	a5,s0,-48
     9d8:	973e                	add	a4,a4,a5
     9da:	02d00793          	li	a5,45
     9de:	fef70823          	sb	a5,-16(a4)
     9e2:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
     9e6:	02e05863          	blez	a4,a16 <printint+0x94>
     9ea:	fc040793          	addi	a5,s0,-64
     9ee:	00e78933          	add	s2,a5,a4
     9f2:	fff78993          	addi	s3,a5,-1
     9f6:	99ba                	add	s3,s3,a4
     9f8:	377d                	addiw	a4,a4,-1
     9fa:	1702                	slli	a4,a4,0x20
     9fc:	9301                	srli	a4,a4,0x20
     9fe:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
     a02:	fff94583          	lbu	a1,-1(s2)
     a06:	8526                	mv	a0,s1
     a08:	00000097          	auipc	ra,0x0
     a0c:	f58080e7          	jalr	-168(ra) # 960 <putc>
  while(--i >= 0)
     a10:	197d                	addi	s2,s2,-1
     a12:	ff3918e3          	bne	s2,s3,a02 <printint+0x80>
}
     a16:	70e2                	ld	ra,56(sp)
     a18:	7442                	ld	s0,48(sp)
     a1a:	74a2                	ld	s1,40(sp)
     a1c:	7902                	ld	s2,32(sp)
     a1e:	69e2                	ld	s3,24(sp)
     a20:	6121                	addi	sp,sp,64
     a22:	8082                	ret
    x = -xx;
     a24:	40b005bb          	negw	a1,a1
    neg = 1;
     a28:	4885                	li	a7,1
    x = -xx;
     a2a:	bf8d                	j	99c <printint+0x1a>

0000000000000a2c <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
     a2c:	7119                	addi	sp,sp,-128
     a2e:	fc86                	sd	ra,120(sp)
     a30:	f8a2                	sd	s0,112(sp)
     a32:	f4a6                	sd	s1,104(sp)
     a34:	f0ca                	sd	s2,96(sp)
     a36:	ecce                	sd	s3,88(sp)
     a38:	e8d2                	sd	s4,80(sp)
     a3a:	e4d6                	sd	s5,72(sp)
     a3c:	e0da                	sd	s6,64(sp)
     a3e:	fc5e                	sd	s7,56(sp)
     a40:	f862                	sd	s8,48(sp)
     a42:	f466                	sd	s9,40(sp)
     a44:	f06a                	sd	s10,32(sp)
     a46:	ec6e                	sd	s11,24(sp)
     a48:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
     a4a:	0005c903          	lbu	s2,0(a1)
     a4e:	18090f63          	beqz	s2,bec <vprintf+0x1c0>
     a52:	8aaa                	mv	s5,a0
     a54:	8b32                	mv	s6,a2
     a56:	00158493          	addi	s1,a1,1
  state = 0;
     a5a:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     a5c:	02500a13          	li	s4,37
      if(c == 'd'){
     a60:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
     a64:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
     a68:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
     a6c:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     a70:	00001b97          	auipc	s7,0x1
     a74:	a60b8b93          	addi	s7,s7,-1440 # 14d0 <digits>
     a78:	a839                	j	a96 <vprintf+0x6a>
        putc(fd, c);
     a7a:	85ca                	mv	a1,s2
     a7c:	8556                	mv	a0,s5
     a7e:	00000097          	auipc	ra,0x0
     a82:	ee2080e7          	jalr	-286(ra) # 960 <putc>
     a86:	a019                	j	a8c <vprintf+0x60>
    } else if(state == '%'){
     a88:	01498f63          	beq	s3,s4,aa6 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
     a8c:	0485                	addi	s1,s1,1
     a8e:	fff4c903          	lbu	s2,-1(s1)
     a92:	14090d63          	beqz	s2,bec <vprintf+0x1c0>
    c = fmt[i] & 0xff;
     a96:	0009079b          	sext.w	a5,s2
    if(state == 0){
     a9a:	fe0997e3          	bnez	s3,a88 <vprintf+0x5c>
      if(c == '%'){
     a9e:	fd479ee3          	bne	a5,s4,a7a <vprintf+0x4e>
        state = '%';
     aa2:	89be                	mv	s3,a5
     aa4:	b7e5                	j	a8c <vprintf+0x60>
      if(c == 'd'){
     aa6:	05878063          	beq	a5,s8,ae6 <vprintf+0xba>
      } else if(c == 'l') {
     aaa:	05978c63          	beq	a5,s9,b02 <vprintf+0xd6>
      } else if(c == 'x') {
     aae:	07a78863          	beq	a5,s10,b1e <vprintf+0xf2>
      } else if(c == 'p') {
     ab2:	09b78463          	beq	a5,s11,b3a <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
     ab6:	07300713          	li	a4,115
     aba:	0ce78663          	beq	a5,a4,b86 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     abe:	06300713          	li	a4,99
     ac2:	0ee78e63          	beq	a5,a4,bbe <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
     ac6:	11478863          	beq	a5,s4,bd6 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     aca:	85d2                	mv	a1,s4
     acc:	8556                	mv	a0,s5
     ace:	00000097          	auipc	ra,0x0
     ad2:	e92080e7          	jalr	-366(ra) # 960 <putc>
        putc(fd, c);
     ad6:	85ca                	mv	a1,s2
     ad8:	8556                	mv	a0,s5
     ada:	00000097          	auipc	ra,0x0
     ade:	e86080e7          	jalr	-378(ra) # 960 <putc>
      }
      state = 0;
     ae2:	4981                	li	s3,0
     ae4:	b765                	j	a8c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
     ae6:	008b0913          	addi	s2,s6,8
     aea:	4685                	li	a3,1
     aec:	4629                	li	a2,10
     aee:	000b2583          	lw	a1,0(s6)
     af2:	8556                	mv	a0,s5
     af4:	00000097          	auipc	ra,0x0
     af8:	e8e080e7          	jalr	-370(ra) # 982 <printint>
     afc:	8b4a                	mv	s6,s2
      state = 0;
     afe:	4981                	li	s3,0
     b00:	b771                	j	a8c <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
     b02:	008b0913          	addi	s2,s6,8
     b06:	4681                	li	a3,0
     b08:	4629                	li	a2,10
     b0a:	000b2583          	lw	a1,0(s6)
     b0e:	8556                	mv	a0,s5
     b10:	00000097          	auipc	ra,0x0
     b14:	e72080e7          	jalr	-398(ra) # 982 <printint>
     b18:	8b4a                	mv	s6,s2
      state = 0;
     b1a:	4981                	li	s3,0
     b1c:	bf85                	j	a8c <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
     b1e:	008b0913          	addi	s2,s6,8
     b22:	4681                	li	a3,0
     b24:	4641                	li	a2,16
     b26:	000b2583          	lw	a1,0(s6)
     b2a:	8556                	mv	a0,s5
     b2c:	00000097          	auipc	ra,0x0
     b30:	e56080e7          	jalr	-426(ra) # 982 <printint>
     b34:	8b4a                	mv	s6,s2
      state = 0;
     b36:	4981                	li	s3,0
     b38:	bf91                	j	a8c <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
     b3a:	008b0793          	addi	a5,s6,8
     b3e:	f8f43423          	sd	a5,-120(s0)
     b42:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
     b46:	03000593          	li	a1,48
     b4a:	8556                	mv	a0,s5
     b4c:	00000097          	auipc	ra,0x0
     b50:	e14080e7          	jalr	-492(ra) # 960 <putc>
  putc(fd, 'x');
     b54:	85ea                	mv	a1,s10
     b56:	8556                	mv	a0,s5
     b58:	00000097          	auipc	ra,0x0
     b5c:	e08080e7          	jalr	-504(ra) # 960 <putc>
     b60:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
     b62:	03c9d793          	srli	a5,s3,0x3c
     b66:	97de                	add	a5,a5,s7
     b68:	0007c583          	lbu	a1,0(a5)
     b6c:	8556                	mv	a0,s5
     b6e:	00000097          	auipc	ra,0x0
     b72:	df2080e7          	jalr	-526(ra) # 960 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
     b76:	0992                	slli	s3,s3,0x4
     b78:	397d                	addiw	s2,s2,-1
     b7a:	fe0914e3          	bnez	s2,b62 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
     b7e:	f8843b03          	ld	s6,-120(s0)
      state = 0;
     b82:	4981                	li	s3,0
     b84:	b721                	j	a8c <vprintf+0x60>
        s = va_arg(ap, char*);
     b86:	008b0993          	addi	s3,s6,8
     b8a:	000b3903          	ld	s2,0(s6)
        if(s == 0)
     b8e:	02090163          	beqz	s2,bb0 <vprintf+0x184>
        while(*s != 0){
     b92:	00094583          	lbu	a1,0(s2)
     b96:	c9a1                	beqz	a1,be6 <vprintf+0x1ba>
          putc(fd, *s);
     b98:	8556                	mv	a0,s5
     b9a:	00000097          	auipc	ra,0x0
     b9e:	dc6080e7          	jalr	-570(ra) # 960 <putc>
          s++;
     ba2:	0905                	addi	s2,s2,1
        while(*s != 0){
     ba4:	00094583          	lbu	a1,0(s2)
     ba8:	f9e5                	bnez	a1,b98 <vprintf+0x16c>
        s = va_arg(ap, char*);
     baa:	8b4e                	mv	s6,s3
      state = 0;
     bac:	4981                	li	s3,0
     bae:	bdf9                	j	a8c <vprintf+0x60>
          s = "(null)";
     bb0:	00001917          	auipc	s2,0x1
     bb4:	91890913          	addi	s2,s2,-1768 # 14c8 <thread_start_threading+0x28e>
        while(*s != 0){
     bb8:	02800593          	li	a1,40
     bbc:	bff1                	j	b98 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
     bbe:	008b0913          	addi	s2,s6,8
     bc2:	000b4583          	lbu	a1,0(s6)
     bc6:	8556                	mv	a0,s5
     bc8:	00000097          	auipc	ra,0x0
     bcc:	d98080e7          	jalr	-616(ra) # 960 <putc>
     bd0:	8b4a                	mv	s6,s2
      state = 0;
     bd2:	4981                	li	s3,0
     bd4:	bd65                	j	a8c <vprintf+0x60>
        putc(fd, c);
     bd6:	85d2                	mv	a1,s4
     bd8:	8556                	mv	a0,s5
     bda:	00000097          	auipc	ra,0x0
     bde:	d86080e7          	jalr	-634(ra) # 960 <putc>
      state = 0;
     be2:	4981                	li	s3,0
     be4:	b565                	j	a8c <vprintf+0x60>
        s = va_arg(ap, char*);
     be6:	8b4e                	mv	s6,s3
      state = 0;
     be8:	4981                	li	s3,0
     bea:	b54d                	j	a8c <vprintf+0x60>
    }
  }
}
     bec:	70e6                	ld	ra,120(sp)
     bee:	7446                	ld	s0,112(sp)
     bf0:	74a6                	ld	s1,104(sp)
     bf2:	7906                	ld	s2,96(sp)
     bf4:	69e6                	ld	s3,88(sp)
     bf6:	6a46                	ld	s4,80(sp)
     bf8:	6aa6                	ld	s5,72(sp)
     bfa:	6b06                	ld	s6,64(sp)
     bfc:	7be2                	ld	s7,56(sp)
     bfe:	7c42                	ld	s8,48(sp)
     c00:	7ca2                	ld	s9,40(sp)
     c02:	7d02                	ld	s10,32(sp)
     c04:	6de2                	ld	s11,24(sp)
     c06:	6109                	addi	sp,sp,128
     c08:	8082                	ret

0000000000000c0a <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
     c0a:	715d                	addi	sp,sp,-80
     c0c:	ec06                	sd	ra,24(sp)
     c0e:	e822                	sd	s0,16(sp)
     c10:	1000                	addi	s0,sp,32
     c12:	e010                	sd	a2,0(s0)
     c14:	e414                	sd	a3,8(s0)
     c16:	e818                	sd	a4,16(s0)
     c18:	ec1c                	sd	a5,24(s0)
     c1a:	03043023          	sd	a6,32(s0)
     c1e:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
     c22:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
     c26:	8622                	mv	a2,s0
     c28:	00000097          	auipc	ra,0x0
     c2c:	e04080e7          	jalr	-508(ra) # a2c <vprintf>
}
     c30:	60e2                	ld	ra,24(sp)
     c32:	6442                	ld	s0,16(sp)
     c34:	6161                	addi	sp,sp,80
     c36:	8082                	ret

0000000000000c38 <printf>:

void
printf(const char *fmt, ...)
{
     c38:	711d                	addi	sp,sp,-96
     c3a:	ec06                	sd	ra,24(sp)
     c3c:	e822                	sd	s0,16(sp)
     c3e:	1000                	addi	s0,sp,32
     c40:	e40c                	sd	a1,8(s0)
     c42:	e810                	sd	a2,16(s0)
     c44:	ec14                	sd	a3,24(s0)
     c46:	f018                	sd	a4,32(s0)
     c48:	f41c                	sd	a5,40(s0)
     c4a:	03043823          	sd	a6,48(s0)
     c4e:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
     c52:	00840613          	addi	a2,s0,8
     c56:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
     c5a:	85aa                	mv	a1,a0
     c5c:	4505                	li	a0,1
     c5e:	00000097          	auipc	ra,0x0
     c62:	dce080e7          	jalr	-562(ra) # a2c <vprintf>
}
     c66:	60e2                	ld	ra,24(sp)
     c68:	6442                	ld	s0,16(sp)
     c6a:	6125                	addi	sp,sp,96
     c6c:	8082                	ret

0000000000000c6e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     c6e:	1141                	addi	sp,sp,-16
     c70:	e422                	sd	s0,8(sp)
     c72:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
     c74:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c78:	00001797          	auipc	a5,0x1
     c7c:	8e07b783          	ld	a5,-1824(a5) # 1558 <freep>
     c80:	a805                	j	cb0 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     c82:	4618                	lw	a4,8(a2)
     c84:	9db9                	addw	a1,a1,a4
     c86:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
     c8a:	6398                	ld	a4,0(a5)
     c8c:	6318                	ld	a4,0(a4)
     c8e:	fee53823          	sd	a4,-16(a0)
     c92:	a091                	j	cd6 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     c94:	ff852703          	lw	a4,-8(a0)
     c98:	9e39                	addw	a2,a2,a4
     c9a:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
     c9c:	ff053703          	ld	a4,-16(a0)
     ca0:	e398                	sd	a4,0(a5)
     ca2:	a099                	j	ce8 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     ca4:	6398                	ld	a4,0(a5)
     ca6:	00e7e463          	bltu	a5,a4,cae <free+0x40>
     caa:	00e6ea63          	bltu	a3,a4,cbe <free+0x50>
{
     cae:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     cb0:	fed7fae3          	bgeu	a5,a3,ca4 <free+0x36>
     cb4:	6398                	ld	a4,0(a5)
     cb6:	00e6e463          	bltu	a3,a4,cbe <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     cba:	fee7eae3          	bltu	a5,a4,cae <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
     cbe:	ff852583          	lw	a1,-8(a0)
     cc2:	6390                	ld	a2,0(a5)
     cc4:	02059713          	slli	a4,a1,0x20
     cc8:	9301                	srli	a4,a4,0x20
     cca:	0712                	slli	a4,a4,0x4
     ccc:	9736                	add	a4,a4,a3
     cce:	fae60ae3          	beq	a2,a4,c82 <free+0x14>
    bp->s.ptr = p->s.ptr;
     cd2:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
     cd6:	4790                	lw	a2,8(a5)
     cd8:	02061713          	slli	a4,a2,0x20
     cdc:	9301                	srli	a4,a4,0x20
     cde:	0712                	slli	a4,a4,0x4
     ce0:	973e                	add	a4,a4,a5
     ce2:	fae689e3          	beq	a3,a4,c94 <free+0x26>
  } else
    p->s.ptr = bp;
     ce6:	e394                	sd	a3,0(a5)
  freep = p;
     ce8:	00001717          	auipc	a4,0x1
     cec:	86f73823          	sd	a5,-1936(a4) # 1558 <freep>
}
     cf0:	6422                	ld	s0,8(sp)
     cf2:	0141                	addi	sp,sp,16
     cf4:	8082                	ret

0000000000000cf6 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     cf6:	7139                	addi	sp,sp,-64
     cf8:	fc06                	sd	ra,56(sp)
     cfa:	f822                	sd	s0,48(sp)
     cfc:	f426                	sd	s1,40(sp)
     cfe:	f04a                	sd	s2,32(sp)
     d00:	ec4e                	sd	s3,24(sp)
     d02:	e852                	sd	s4,16(sp)
     d04:	e456                	sd	s5,8(sp)
     d06:	e05a                	sd	s6,0(sp)
     d08:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     d0a:	02051493          	slli	s1,a0,0x20
     d0e:	9081                	srli	s1,s1,0x20
     d10:	04bd                	addi	s1,s1,15
     d12:	8091                	srli	s1,s1,0x4
     d14:	0014899b          	addiw	s3,s1,1
     d18:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
     d1a:	00001517          	auipc	a0,0x1
     d1e:	83e53503          	ld	a0,-1986(a0) # 1558 <freep>
     d22:	c515                	beqz	a0,d4e <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     d24:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
     d26:	4798                	lw	a4,8(a5)
     d28:	02977f63          	bgeu	a4,s1,d66 <malloc+0x70>
     d2c:	8a4e                	mv	s4,s3
     d2e:	0009871b          	sext.w	a4,s3
     d32:	6685                	lui	a3,0x1
     d34:	00d77363          	bgeu	a4,a3,d3a <malloc+0x44>
     d38:	6a05                	lui	s4,0x1
     d3a:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
     d3e:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     d42:	00001917          	auipc	s2,0x1
     d46:	81690913          	addi	s2,s2,-2026 # 1558 <freep>
  if(p == (char*)-1)
     d4a:	5afd                	li	s5,-1
     d4c:	a88d                	j	dbe <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
     d4e:	00001797          	auipc	a5,0x1
     d52:	82278793          	addi	a5,a5,-2014 # 1570 <base>
     d56:	00001717          	auipc	a4,0x1
     d5a:	80f73123          	sd	a5,-2046(a4) # 1558 <freep>
     d5e:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
     d60:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
     d64:	b7e1                	j	d2c <malloc+0x36>
      if(p->s.size == nunits)
     d66:	02e48b63          	beq	s1,a4,d9c <malloc+0xa6>
        p->s.size -= nunits;
     d6a:	4137073b          	subw	a4,a4,s3
     d6e:	c798                	sw	a4,8(a5)
        p += p->s.size;
     d70:	1702                	slli	a4,a4,0x20
     d72:	9301                	srli	a4,a4,0x20
     d74:	0712                	slli	a4,a4,0x4
     d76:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
     d78:	0137a423          	sw	s3,8(a5)
      freep = prevp;
     d7c:	00000717          	auipc	a4,0x0
     d80:	7ca73e23          	sd	a0,2012(a4) # 1558 <freep>
      return (void*)(p + 1);
     d84:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
     d88:	70e2                	ld	ra,56(sp)
     d8a:	7442                	ld	s0,48(sp)
     d8c:	74a2                	ld	s1,40(sp)
     d8e:	7902                	ld	s2,32(sp)
     d90:	69e2                	ld	s3,24(sp)
     d92:	6a42                	ld	s4,16(sp)
     d94:	6aa2                	ld	s5,8(sp)
     d96:	6b02                	ld	s6,0(sp)
     d98:	6121                	addi	sp,sp,64
     d9a:	8082                	ret
        prevp->s.ptr = p->s.ptr;
     d9c:	6398                	ld	a4,0(a5)
     d9e:	e118                	sd	a4,0(a0)
     da0:	bff1                	j	d7c <malloc+0x86>
  hp->s.size = nu;
     da2:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
     da6:	0541                	addi	a0,a0,16
     da8:	00000097          	auipc	ra,0x0
     dac:	ec6080e7          	jalr	-314(ra) # c6e <free>
  return freep;
     db0:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
     db4:	d971                	beqz	a0,d88 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     db6:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
     db8:	4798                	lw	a4,8(a5)
     dba:	fa9776e3          	bgeu	a4,s1,d66 <malloc+0x70>
    if(p == freep)
     dbe:	00093703          	ld	a4,0(s2)
     dc2:	853e                	mv	a0,a5
     dc4:	fef719e3          	bne	a4,a5,db6 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
     dc8:	8552                	mv	a0,s4
     dca:	00000097          	auipc	ra,0x0
     dce:	b66080e7          	jalr	-1178(ra) # 930 <sbrk>
  if(p == (char*)-1)
     dd2:	fd5518e3          	bne	a0,s5,da2 <malloc+0xac>
        return 0;
     dd6:	4501                	li	a0,0
     dd8:	bf45                	j	d88 <malloc+0x92>

0000000000000dda <setjmp>:
     dda:	e100                	sd	s0,0(a0)
     ddc:	e504                	sd	s1,8(a0)
     dde:	01253823          	sd	s2,16(a0)
     de2:	01353c23          	sd	s3,24(a0)
     de6:	03453023          	sd	s4,32(a0)
     dea:	03553423          	sd	s5,40(a0)
     dee:	03653823          	sd	s6,48(a0)
     df2:	03753c23          	sd	s7,56(a0)
     df6:	05853023          	sd	s8,64(a0)
     dfa:	05953423          	sd	s9,72(a0)
     dfe:	05a53823          	sd	s10,80(a0)
     e02:	05b53c23          	sd	s11,88(a0)
     e06:	06153023          	sd	ra,96(a0)
     e0a:	06253423          	sd	sp,104(a0)
     e0e:	4501                	li	a0,0
     e10:	8082                	ret

0000000000000e12 <longjmp>:
     e12:	6100                	ld	s0,0(a0)
     e14:	6504                	ld	s1,8(a0)
     e16:	01053903          	ld	s2,16(a0)
     e1a:	01853983          	ld	s3,24(a0)
     e1e:	02053a03          	ld	s4,32(a0)
     e22:	02853a83          	ld	s5,40(a0)
     e26:	03053b03          	ld	s6,48(a0)
     e2a:	03853b83          	ld	s7,56(a0)
     e2e:	04053c03          	ld	s8,64(a0)
     e32:	04853c83          	ld	s9,72(a0)
     e36:	05053d03          	ld	s10,80(a0)
     e3a:	05853d83          	ld	s11,88(a0)
     e3e:	06053083          	ld	ra,96(a0)
     e42:	06853103          	ld	sp,104(a0)
     e46:	c199                	beqz	a1,e4c <longjmp_1>
     e48:	852e                	mv	a0,a1
     e4a:	8082                	ret

0000000000000e4c <longjmp_1>:
     e4c:	4505                	li	a0,1
     e4e:	8082                	ret

0000000000000e50 <thread_create>:
static int __time_slot_size = 10;
static int is_thread_start = 0;
static jmp_buf env_st;
// static jmp_buf env_tmp;

struct thread *thread_create(void (*f)(void *), void *arg, int execution_time_slot){
     e50:	7179                	addi	sp,sp,-48
     e52:	f406                	sd	ra,40(sp)
     e54:	f022                	sd	s0,32(sp)
     e56:	ec26                	sd	s1,24(sp)
     e58:	e84a                	sd	s2,16(sp)
     e5a:	e44e                	sd	s3,8(sp)
     e5c:	e052                	sd	s4,0(sp)
     e5e:	1800                	addi	s0,sp,48
     e60:	8a2a                	mv	s4,a0
     e62:	89ae                	mv	s3,a1
     e64:	8932                	mv	s2,a2
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
     e66:	0c800513          	li	a0,200
     e6a:	00000097          	auipc	ra,0x0
     e6e:	e8c080e7          	jalr	-372(ra) # cf6 <malloc>
     e72:	84aa                	mv	s1,a0
    //unsigned long stack_p = 0;
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
     e74:	6505                	lui	a0,0x1
     e76:	80050513          	addi	a0,a0,-2048 # 800 <memmove+0xa>
     e7a:	00000097          	auipc	ra,0x0
     e7e:	e7c080e7          	jalr	-388(ra) # cf6 <malloc>
    new_stack_p = new_stack +0x100*8-0x2*8;
    t->fp = f;
     e82:	0144b023          	sd	s4,0(s1)
    t->arg = arg;
     e86:	0134b423          	sd	s3,8(s1)
    t->ID  = -1;
     e8a:	57fd                	li	a5,-1
     e8c:	08f4a823          	sw	a5,144(s1)
    t->buf_set = 0;
     e90:	0804ae23          	sw	zero,156(s1)
    t->stack = (void*) new_stack;
     e94:	e888                	sd	a0,16(s1)
    new_stack_p = new_stack +0x100*8-0x2*8;
     e96:	7f050513          	addi	a0,a0,2032
    t->stack_p = (void*) new_stack_p;
     e9a:	ec88                	sd	a0,24(s1)

    if( is_thread_start == 0 )
     e9c:	00000797          	auipc	a5,0x0
     ea0:	6c47a783          	lw	a5,1732(a5) # 1560 <is_thread_start>
     ea4:	c799                	beqz	a5,eb2 <thread_create+0x62>
        t->remain_execution_time = execution_time_slot;
    else
        t->remain_execution_time = execution_time_slot * __time_slot_size;
     ea6:	00000797          	auipc	a5,0x0
     eaa:	68e7a783          	lw	a5,1678(a5) # 1534 <__time_slot_size>
     eae:	0327893b          	mulw	s2,a5,s2
     eb2:	0b24aa23          	sw	s2,180(s1)

    t->is_yield = 0;
     eb6:	0a04ae23          	sw	zero,188(s1)
    t->is_exited = 0;
     eba:	0c04a023          	sw	zero,192(s1)
    t->previous_execution_time = t->remain_execution_time;
     ebe:	0d24a223          	sw	s2,196(s1)
    return t;
}
     ec2:	8526                	mv	a0,s1
     ec4:	70a2                	ld	ra,40(sp)
     ec6:	7402                	ld	s0,32(sp)
     ec8:	64e2                	ld	s1,24(sp)
     eca:	6942                	ld	s2,16(sp)
     ecc:	69a2                	ld	s3,8(sp)
     ece:	6a02                	ld	s4,0(sp)
     ed0:	6145                	addi	sp,sp,48
     ed2:	8082                	ret

0000000000000ed4 <thread_add_runqueue>:
void thread_add_runqueue(struct thread *t){
     ed4:	1101                	addi	sp,sp,-32
     ed6:	ec06                	sd	ra,24(sp)
     ed8:	e822                	sd	s0,16(sp)
     eda:	e426                	sd	s1,8(sp)
     edc:	1000                	addi	s0,sp,32
     ede:	84aa                	mv	s1,a0
    t->start_time = uptime();
     ee0:	00000097          	auipc	ra,0x0
     ee4:	a60080e7          	jalr	-1440(ra) # 940 <uptime>
     ee8:	0aa4ac23          	sw	a0,184(s1)
    t->ID  = id;
     eec:	00000717          	auipc	a4,0x0
     ef0:	64c70713          	addi	a4,a4,1612 # 1538 <id>
     ef4:	431c                	lw	a5,0(a4)
     ef6:	08f4a823          	sw	a5,144(s1)
    id ++;
     efa:	2785                	addiw	a5,a5,1
     efc:	c31c                	sw	a5,0(a4)
    if(current_thread == NULL){
     efe:	00000797          	auipc	a5,0x0
     f02:	66a7b783          	ld	a5,1642(a5) # 1568 <current_thread>
     f06:	c395                	beqz	a5,f2a <thread_add_runqueue+0x56>
        current_thread->previous = t;
        current_thread->next = t;
        return;
    }
    else{
        if(current_thread->previous->ID == current_thread->ID){
     f08:	73d8                	ld	a4,160(a5)
     f0a:	09072603          	lw	a2,144(a4)
     f0e:	0907a683          	lw	a3,144(a5)
     f12:	02d60363          	beq	a2,a3,f38 <thread_add_runqueue+0x64>
            t->previous = current_thread;
            t->next = current_thread;
        }
        else{
            //Two or more threads in queue
            current_thread->previous->next = t;
     f16:	f744                	sd	s1,168(a4)
            t->previous = current_thread->previous;
     f18:	73d8                	ld	a4,160(a5)
     f1a:	f0d8                	sd	a4,160(s1)
            t->next = current_thread;
     f1c:	f4dc                	sd	a5,168(s1)
            current_thread->previous = t;
     f1e:	f3c4                	sd	s1,160(a5)
        }
    }
}
     f20:	60e2                	ld	ra,24(sp)
     f22:	6442                	ld	s0,16(sp)
     f24:	64a2                	ld	s1,8(sp)
     f26:	6105                	addi	sp,sp,32
     f28:	8082                	ret
        current_thread = t;
     f2a:	00000797          	auipc	a5,0x0
     f2e:	6297bf23          	sd	s1,1598(a5) # 1568 <current_thread>
        current_thread->previous = t;
     f32:	f0c4                	sd	s1,160(s1)
        current_thread->next = t;
     f34:	f4c4                	sd	s1,168(s1)
        return;
     f36:	b7ed                	j	f20 <thread_add_runqueue+0x4c>
            current_thread->previous = t;
     f38:	f3c4                	sd	s1,160(a5)
            current_thread->next = t;
     f3a:	f7c4                	sd	s1,168(a5)
            t->previous = current_thread;
     f3c:	f0dc                	sd	a5,160(s1)
            t->next = current_thread;
     f3e:	f4dc                	sd	a5,168(s1)
     f40:	b7c5                	j	f20 <thread_add_runqueue+0x4c>

0000000000000f42 <schedule>:
    }
    thread_exit();
}

// SJF
void schedule(void){
     f42:	1141                	addi	sp,sp,-16
     f44:	e422                	sd	s0,8(sp)
     f46:	0800                	addi	s0,sp,16
    if (current_thread->is_exited == 1){
     f48:	00000717          	auipc	a4,0x0
     f4c:	62073703          	ld	a4,1568(a4) # 1568 <current_thread>
     f50:	0c072683          	lw	a3,192(a4)
     f54:	4785                	li	a5,1
     f56:	02f68e63          	beq	a3,a5,f92 <schedule+0x50>
            else if (tmp_thread->remain_execution_time == shortest_thread->remain_execution_time && tmp_thread->ID < shortest_thread->ID)
                shortest_thread = tmp_thread;
        }
        current_thread = shortest_thread;
    }
    else if (is_thread_start == 0  || current_thread->is_yield == 1 || current_thread->previous_execution_time - current_thread->remain_execution_time >= __time_slot_size)
     f5a:	00000797          	auipc	a5,0x0
     f5e:	6067a783          	lw	a5,1542(a5) # 1560 <is_thread_start>
     f62:	c38d                	beqz	a5,f84 <schedule+0x42>
     f64:	0bc72683          	lw	a3,188(a4)
     f68:	4785                	li	a5,1
     f6a:	00f68d63          	beq	a3,a5,f84 <schedule+0x42>
     f6e:	0c472783          	lw	a5,196(a4)
     f72:	0b472683          	lw	a3,180(a4)
     f76:	9f95                	subw	a5,a5,a3
     f78:	00000697          	auipc	a3,0x0
     f7c:	5bc6a683          	lw	a3,1468(a3) # 1534 <__time_slot_size>
     f80:	08d7c463          	blt	a5,a3,1008 <schedule+0xc6>
    {
        current_thread->previous_execution_time = current_thread->remain_execution_time;
     f84:	0b472783          	lw	a5,180(a4)
     f88:	0cf72223          	sw	a5,196(a4)
        
        struct thread* tmp_thread = current_thread;
        struct thread* shortest_thread = tmp_thread;
     f8c:	85ba                	mv	a1,a4
        struct thread* tmp_thread = current_thread;
     f8e:	87ba                	mv	a5,a4
     f90:	a881                	j	fe0 <schedule+0x9e>
        current_thread->previous_execution_time = current_thread->remain_execution_time;
     f92:	0b472783          	lw	a5,180(a4)
     f96:	0cf72223          	sw	a5,196(a4)
        struct thread* tmp_thread = current_thread->next;
     f9a:	775c                	ld	a5,168(a4)
        for (; tmp_thread != current_thread; tmp_thread = tmp_thread->next){
     f9c:	02f70863          	beq	a4,a5,fcc <schedule+0x8a>
        struct thread* shortest_thread = tmp_thread;
     fa0:	85be                	mv	a1,a5
     fa2:	a029                	j	fac <schedule+0x6a>
     fa4:	85be                	mv	a1,a5
        for (; tmp_thread != current_thread; tmp_thread = tmp_thread->next){
     fa6:	77dc                	ld	a5,168(a5)
     fa8:	02f70363          	beq	a4,a5,fce <schedule+0x8c>
            if (tmp_thread->remain_execution_time < shortest_thread->remain_execution_time)
     fac:	0b47a603          	lw	a2,180(a5)
     fb0:	0b45a683          	lw	a3,180(a1)
     fb4:	fed648e3          	blt	a2,a3,fa4 <schedule+0x62>
            else if (tmp_thread->remain_execution_time == shortest_thread->remain_execution_time && tmp_thread->ID < shortest_thread->ID)
     fb8:	fed617e3          	bne	a2,a3,fa6 <schedule+0x64>
     fbc:	0907a603          	lw	a2,144(a5)
     fc0:	0905a683          	lw	a3,144(a1)
     fc4:	fed651e3          	bge	a2,a3,fa6 <schedule+0x64>
     fc8:	85be                	mv	a1,a5
     fca:	bff1                	j	fa6 <schedule+0x64>
        struct thread* shortest_thread = tmp_thread;
     fcc:	85be                	mv	a1,a5
        current_thread = shortest_thread;
     fce:	00000797          	auipc	a5,0x0
     fd2:	58b7bd23          	sd	a1,1434(a5) # 1568 <current_thread>
     fd6:	a80d                	j	1008 <schedule+0xc6>
        for (;; tmp_thread = tmp_thread->next){
            if (tmp_thread->remain_execution_time < shortest_thread->remain_execution_time)
                shortest_thread = tmp_thread;
     fd8:	85be                	mv	a1,a5
            else if (tmp_thread->remain_execution_time == shortest_thread->remain_execution_time && tmp_thread->ID < shortest_thread->ID)
                shortest_thread = tmp_thread;
            if (tmp_thread->next == current_thread) break;
     fda:	77dc                	ld	a5,168(a5)
     fdc:	02f70263          	beq	a4,a5,1000 <schedule+0xbe>
            if (tmp_thread->remain_execution_time < shortest_thread->remain_execution_time)
     fe0:	0b47a603          	lw	a2,180(a5)
     fe4:	0b45a683          	lw	a3,180(a1)
     fe8:	fed648e3          	blt	a2,a3,fd8 <schedule+0x96>
            else if (tmp_thread->remain_execution_time == shortest_thread->remain_execution_time && tmp_thread->ID < shortest_thread->ID)
     fec:	fed617e3          	bne	a2,a3,fda <schedule+0x98>
     ff0:	0907a603          	lw	a2,144(a5)
     ff4:	0905a683          	lw	a3,144(a1)
     ff8:	fed651e3          	bge	a2,a3,fda <schedule+0x98>
                shortest_thread = tmp_thread;
     ffc:	85be                	mv	a1,a5
     ffe:	bff1                	j	fda <schedule+0x98>
        }
        current_thread = shortest_thread;
    1000:	00000797          	auipc	a5,0x0
    1004:	56b7b423          	sd	a1,1384(a5) # 1568 <current_thread>
    }
    
}
    1008:	6422                	ld	s0,8(sp)
    100a:	0141                	addi	sp,sp,16
    100c:	8082                	ret

000000000000100e <thread_exit>:
void thread_exit(void){
    100e:	1101                	addi	sp,sp,-32
    1010:	ec06                	sd	ra,24(sp)
    1012:	e822                	sd	s0,16(sp)
    1014:	e426                	sd	s1,8(sp)
    1016:	e04a                	sd	s2,0(sp)
    1018:	1000                	addi	s0,sp,32
    // remove the thread immediately, and cancel previous thrdstop.
    thrdresume(current_thread->thrdstop_context_id, 1);
    101a:	00000497          	auipc	s1,0x0
    101e:	54e48493          	addi	s1,s1,1358 # 1568 <current_thread>
    1022:	609c                	ld	a5,0(s1)
    1024:	4585                	li	a1,1
    1026:	0b07a503          	lw	a0,176(a5)
    102a:	00000097          	auipc	ra,0x0
    102e:	926080e7          	jalr	-1754(ra) # 950 <thrdresume>
    struct thread* to_remove = current_thread;
    1032:	6084                	ld	s1,0(s1)
    printf("thread id %d exec %d ticks\n", to_remove->ID, uptime() - to_remove->start_time);
    1034:	0904a903          	lw	s2,144(s1)
    1038:	00000097          	auipc	ra,0x0
    103c:	908080e7          	jalr	-1784(ra) # 940 <uptime>
    1040:	0b84a603          	lw	a2,184(s1)
    1044:	40c5063b          	subw	a2,a0,a2
    1048:	85ca                	mv	a1,s2
    104a:	00000517          	auipc	a0,0x0
    104e:	49e50513          	addi	a0,a0,1182 # 14e8 <digits+0x18>
    1052:	00000097          	auipc	ra,0x0
    1056:	be6080e7          	jalr	-1050(ra) # c38 <printf>

    to_remove->is_exited = 1;
    105a:	4785                	li	a5,1
    105c:	0cf4a023          	sw	a5,192(s1)

    if(to_remove->next != to_remove){
    1060:	74dc                	ld	a5,168(s1)
    1062:	02978e63          	beq	a5,s1,109e <thread_exit+0x90>
        //Still more thread to execute
        schedule() ;
    1066:	00000097          	auipc	ra,0x0
    106a:	edc080e7          	jalr	-292(ra) # f42 <schedule>
        //Connect the remaining threads
        struct thread* to_remove_next = to_remove->next;
    106e:	74d8                	ld	a4,168(s1)
        to_remove_next->previous = to_remove->previous;
    1070:	70dc                	ld	a5,160(s1)
    1072:	f35c                	sd	a5,160(a4)
        to_remove->previous->next = to_remove_next;
    1074:	f7d8                	sd	a4,168(a5)


        //free pointers
        free(to_remove->stack);
    1076:	6888                	ld	a0,16(s1)
    1078:	00000097          	auipc	ra,0x0
    107c:	bf6080e7          	jalr	-1034(ra) # c6e <free>
        free(to_remove);
    1080:	8526                	mv	a0,s1
    1082:	00000097          	auipc	ra,0x0
    1086:	bec080e7          	jalr	-1044(ra) # c6e <free>
        dispatch();
    108a:	00000097          	auipc	ra,0x0
    108e:	028080e7          	jalr	40(ra) # 10b2 <dispatch>
    }
    else{
        //No more thread to execute
        longjmp(env_st, -1);
    }
}
    1092:	60e2                	ld	ra,24(sp)
    1094:	6442                	ld	s0,16(sp)
    1096:	64a2                	ld	s1,8(sp)
    1098:	6902                	ld	s2,0(sp)
    109a:	6105                	addi	sp,sp,32
    109c:	8082                	ret
        longjmp(env_st, -1);
    109e:	55fd                	li	a1,-1
    10a0:	00000517          	auipc	a0,0x0
    10a4:	4e050513          	addi	a0,a0,1248 # 1580 <env_st>
    10a8:	00000097          	auipc	ra,0x0
    10ac:	d6a080e7          	jalr	-662(ra) # e12 <longjmp>
}
    10b0:	b7cd                	j	1092 <thread_exit+0x84>

00000000000010b2 <dispatch>:
void dispatch(void){
    10b2:	1101                	addi	sp,sp,-32
    10b4:	ec06                	sd	ra,24(sp)
    10b6:	e822                	sd	s0,16(sp)
    10b8:	e426                	sd	s1,8(sp)
    10ba:	e04a                	sd	s2,0(sp)
    10bc:	1000                	addi	s0,sp,32
    if(current_thread->buf_set)
    10be:	00000497          	auipc	s1,0x0
    10c2:	4aa4b483          	ld	s1,1194(s1) # 1568 <current_thread>
    10c6:	09c4a783          	lw	a5,156(s1)
    10ca:	cfb1                	beqz	a5,1126 <dispatch+0x74>
        thrdstop( next_time, current_thread->thrdstop_context_id, my_thrdstop_handler); // after next_time ticks, my_thrdstop_handler will be called.
    10cc:	0b04a583          	lw	a1,176(s1)
        int next_time = (__time_slot_size >= current_thread->remain_execution_time )? current_thread->remain_execution_time: __time_slot_size;
    10d0:	00000797          	auipc	a5,0x0
    10d4:	4647a783          	lw	a5,1124(a5) # 1534 <__time_slot_size>
    10d8:	0b44a503          	lw	a0,180(s1)
    10dc:	0005069b          	sext.w	a3,a0
    10e0:	0007871b          	sext.w	a4,a5
    10e4:	00d75363          	bge	a4,a3,10ea <dispatch+0x38>
    10e8:	853e                	mv	a0,a5
        thrdstop( next_time, current_thread->thrdstop_context_id, my_thrdstop_handler); // after next_time ticks, my_thrdstop_handler will be called.
    10ea:	00000617          	auipc	a2,0x0
    10ee:	09860613          	addi	a2,a2,152 # 1182 <my_thrdstop_handler>
    10f2:	2501                	sext.w	a0,a0
    10f4:	00000097          	auipc	ra,0x0
    10f8:	854080e7          	jalr	-1964(ra) # 948 <thrdstop>
        thrdresume(current_thread->thrdstop_context_id, 0);
    10fc:	4581                	li	a1,0
    10fe:	00000797          	auipc	a5,0x0
    1102:	46a7b783          	ld	a5,1130(a5) # 1568 <current_thread>
    1106:	0b07a503          	lw	a0,176(a5)
    110a:	00000097          	auipc	ra,0x0
    110e:	846080e7          	jalr	-1978(ra) # 950 <thrdresume>
    thread_exit();
    1112:	00000097          	auipc	ra,0x0
    1116:	efc080e7          	jalr	-260(ra) # 100e <thread_exit>
}
    111a:	60e2                	ld	ra,24(sp)
    111c:	6442                	ld	s0,16(sp)
    111e:	64a2                	ld	s1,8(sp)
    1120:	6902                	ld	s2,0(sp)
    1122:	6105                	addi	sp,sp,32
    1124:	8082                	ret
        current_thread->buf_set = 1;
    1126:	4785                	li	a5,1
    1128:	08f4ae23          	sw	a5,156(s1)
        new_stack_p = (unsigned long) current_thread->stack_p;      
    112c:	0184b903          	ld	s2,24(s1)
        current_thread->thrdstop_context_id = thrdstop( __time_slot_size, -1, my_thrdstop_handler);
    1130:	00000617          	auipc	a2,0x0
    1134:	05260613          	addi	a2,a2,82 # 1182 <my_thrdstop_handler>
    1138:	55fd                	li	a1,-1
    113a:	00000517          	auipc	a0,0x0
    113e:	3fa52503          	lw	a0,1018(a0) # 1534 <__time_slot_size>
    1142:	00000097          	auipc	ra,0x0
    1146:	806080e7          	jalr	-2042(ra) # 948 <thrdstop>
    114a:	0aa4a823          	sw	a0,176(s1)
        if( current_thread->thrdstop_context_id < 0 )
    114e:	00000797          	auipc	a5,0x0
    1152:	41a7b783          	ld	a5,1050(a5) # 1568 <current_thread>
    1156:	0b07a703          	lw	a4,176(a5)
    115a:	00074763          	bltz	a4,1168 <dispatch+0xb6>
        asm volatile("mv sp, %0" : : "r" (new_stack_p));
    115e:	814a                	mv	sp,s2
        current_thread->fp(current_thread->arg);
    1160:	6398                	ld	a4,0(a5)
    1162:	6788                	ld	a0,8(a5)
    1164:	9702                	jalr	a4
    1166:	b775                	j	1112 <dispatch+0x60>
            printf("error: number of threads may exceed\n");
    1168:	00000517          	auipc	a0,0x0
    116c:	3a050513          	addi	a0,a0,928 # 1508 <digits+0x38>
    1170:	00000097          	auipc	ra,0x0
    1174:	ac8080e7          	jalr	-1336(ra) # c38 <printf>
            exit(1);
    1178:	4505                	li	a0,1
    117a:	fffff097          	auipc	ra,0xfffff
    117e:	72e080e7          	jalr	1838(ra) # 8a8 <exit>

0000000000001182 <my_thrdstop_handler>:
void my_thrdstop_handler(void){
    1182:	1141                	addi	sp,sp,-16
    1184:	e406                	sd	ra,8(sp)
    1186:	e022                	sd	s0,0(sp)
    1188:	0800                	addi	s0,sp,16
    current_thread->remain_execution_time -= __time_slot_size ;
    118a:	00000717          	auipc	a4,0x0
    118e:	3de73703          	ld	a4,990(a4) # 1568 <current_thread>
    1192:	0b472783          	lw	a5,180(a4)
    1196:	00000697          	auipc	a3,0x0
    119a:	39e6a683          	lw	a3,926(a3) # 1534 <__time_slot_size>
    119e:	9f95                	subw	a5,a5,a3
    11a0:	0007869b          	sext.w	a3,a5
    11a4:	0af72a23          	sw	a5,180(a4)
    if( current_thread->remain_execution_time <= 0 )
    11a8:	00d05e63          	blez	a3,11c4 <my_thrdstop_handler+0x42>
        schedule();
    11ac:	00000097          	auipc	ra,0x0
    11b0:	d96080e7          	jalr	-618(ra) # f42 <schedule>
        dispatch();
    11b4:	00000097          	auipc	ra,0x0
    11b8:	efe080e7          	jalr	-258(ra) # 10b2 <dispatch>
}
    11bc:	60a2                	ld	ra,8(sp)
    11be:	6402                	ld	s0,0(sp)
    11c0:	0141                	addi	sp,sp,16
    11c2:	8082                	ret
        thread_exit();
    11c4:	00000097          	auipc	ra,0x0
    11c8:	e4a080e7          	jalr	-438(ra) # 100e <thread_exit>
    11cc:	bfc5                	j	11bc <my_thrdstop_handler+0x3a>

00000000000011ce <thread_yield>:
void thread_yield(void){
    11ce:	1101                	addi	sp,sp,-32
    11d0:	ec06                	sd	ra,24(sp)
    11d2:	e822                	sd	s0,16(sp)
    11d4:	e426                	sd	s1,8(sp)
    11d6:	1000                	addi	s0,sp,32
    int consume_ticks = cancelthrdstop( current_thread->thrdstop_context_id ); // cancel previous thrdstop and save the current thread context
    11d8:	00000497          	auipc	s1,0x0
    11dc:	39048493          	addi	s1,s1,912 # 1568 <current_thread>
    11e0:	609c                	ld	a5,0(s1)
    11e2:	0b07a503          	lw	a0,176(a5)
    11e6:	fffff097          	auipc	ra,0xfffff
    11ea:	772080e7          	jalr	1906(ra) # 958 <cancelthrdstop>
    if( current_thread->is_yield == 0 )
    11ee:	609c                	ld	a5,0(s1)
    11f0:	0bc7a703          	lw	a4,188(a5)
    11f4:	ef05                	bnez	a4,122c <thread_yield+0x5e>
        current_thread->remain_execution_time -= consume_ticks ;
    11f6:	0b47a703          	lw	a4,180(a5)
    11fa:	40a7053b          	subw	a0,a4,a0
    11fe:	0005071b          	sext.w	a4,a0
    1202:	0aa7aa23          	sw	a0,180(a5)
        current_thread->is_yield = 1;
    1206:	4685                	li	a3,1
    1208:	0ad7ae23          	sw	a3,188(a5)
        if( current_thread->remain_execution_time <= 0 )
    120c:	00e05b63          	blez	a4,1222 <thread_yield+0x54>
            schedule();
    1210:	00000097          	auipc	ra,0x0
    1214:	d32080e7          	jalr	-718(ra) # f42 <schedule>
            dispatch();
    1218:	00000097          	auipc	ra,0x0
    121c:	e9a080e7          	jalr	-358(ra) # 10b2 <dispatch>
    1220:	a801                	j	1230 <thread_yield+0x62>
            thread_exit();
    1222:	00000097          	auipc	ra,0x0
    1226:	dec080e7          	jalr	-532(ra) # 100e <thread_exit>
    122a:	a019                	j	1230 <thread_yield+0x62>
        current_thread->is_yield = 0;
    122c:	0a07ae23          	sw	zero,188(a5)
}
    1230:	60e2                	ld	ra,24(sp)
    1232:	6442                	ld	s0,16(sp)
    1234:	64a2                	ld	s1,8(sp)
    1236:	6105                	addi	sp,sp,32
    1238:	8082                	ret

000000000000123a <thread_start_threading>:
void thread_start_threading(int time_slot_size){
    123a:	1141                	addi	sp,sp,-16
    123c:	e406                	sd	ra,8(sp)
    123e:	e022                	sd	s0,0(sp)
    1240:	0800                	addi	s0,sp,16
    __time_slot_size = time_slot_size;
    1242:	00000797          	auipc	a5,0x0
    1246:	2ea7a923          	sw	a0,754(a5) # 1534 <__time_slot_size>
    
    struct thread* tmp_thread = current_thread;
    124a:	00000697          	auipc	a3,0x0
    124e:	31e6b683          	ld	a3,798(a3) # 1568 <current_thread>
    1252:	87b6                	mv	a5,a3
    while (tmp_thread != NULL)
    1254:	cf81                	beqz	a5,126c <thread_start_threading+0x32>
    {
        tmp_thread->remain_execution_time *= time_slot_size;
    1256:	0b47a703          	lw	a4,180(a5)
    125a:	02a7073b          	mulw	a4,a4,a0
    125e:	0ae7aa23          	sw	a4,180(a5)
        tmp_thread->previous_execution_time = tmp_thread->remain_execution_time;
    1262:	0ce7a223          	sw	a4,196(a5)
        tmp_thread = tmp_thread->next;
    1266:	77dc                	ld	a5,168(a5)
        if( tmp_thread == current_thread )
    1268:	fef696e3          	bne	a3,a5,1254 <thread_start_threading+0x1a>
            break;
    }

    int r;
    r = setjmp(env_st);
    126c:	00000517          	auipc	a0,0x0
    1270:	31450513          	addi	a0,a0,788 # 1580 <env_st>
    1274:	00000097          	auipc	ra,0x0
    1278:	b66080e7          	jalr	-1178(ra) # dda <setjmp>
    
    if(current_thread != NULL && r==0){
    127c:	00000797          	auipc	a5,0x0
    1280:	2ec7b783          	ld	a5,748(a5) # 1568 <current_thread>
    1284:	c391                	beqz	a5,1288 <thread_start_threading+0x4e>
    1286:	c509                	beqz	a0,1290 <thread_start_threading+0x56>
        schedule() ;
        is_thread_start = 1;
        dispatch();
    }
}
    1288:	60a2                	ld	ra,8(sp)
    128a:	6402                	ld	s0,0(sp)
    128c:	0141                	addi	sp,sp,16
    128e:	8082                	ret
        schedule() ;
    1290:	00000097          	auipc	ra,0x0
    1294:	cb2080e7          	jalr	-846(ra) # f42 <schedule>
        is_thread_start = 1;
    1298:	4785                	li	a5,1
    129a:	00000717          	auipc	a4,0x0
    129e:	2cf72323          	sw	a5,710(a4) # 1560 <is_thread_start>
        dispatch();
    12a2:	00000097          	auipc	ra,0x0
    12a6:	e10080e7          	jalr	-496(ra) # 10b2 <dispatch>
}
    12aa:	bff9                	j	1288 <thread_start_threading+0x4e>
