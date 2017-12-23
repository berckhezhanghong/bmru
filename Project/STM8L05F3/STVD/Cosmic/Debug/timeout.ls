   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  34                     ; 26 static uint32 GetTimerCount(void)
  34                     ; 27 {
  35                     .text:	section	.text,new
  36  0000               L5f_GetTimerCount:
  40                     ; 28     return u32TimerCount;
  42  0000 ae0000        	ldw	x,#L3_u32TimerCount
  46  0003 ac000000      	jpf	d_ltor
  70                     ; 32 INTERRUPT void TIM4_OVF_RQHandler(void)
  70                     ; 33 {
  71                     .text:	section	.text,new
  72  0000               f_TIM4_OVF_RQHandler:
  75  0000 3b0002        	push	c_x+2
  76  0003 be00          	ldw	x,c_x
  77  0005 89            	pushw	x
  78  0006 3b0002        	push	c_y+2
  79  0009 be00          	ldw	x,c_y
  80  000b 89            	pushw	x
  83                     ; 34 	TIM4_ClearITPendingBit((TIM4_IT_Update | TIM4_IT_Trigger));
  85  000c a641          	ld	a,#65
  86  000e 8d000000      	callf	f_TIM4_ClearITPendingBit
  88                     ; 35 	u32TimerCount ++;
  90  0012 ae0000        	ldw	x,#L3_u32TimerCount
  91  0015 a601          	ld	a,#1
  92  0017 8d000000      	callf	d_lgadc
  94                     ; 36 }
  97  001b 85            	popw	x
  98  001c bf00          	ldw	c_y,x
  99  001e 320002        	pop	c_y+2
 100  0021 85            	popw	x
 101  0022 bf00          	ldw	c_x,x
 102  0024 320002        	pop	c_x+2
 103  0027 80            	iret	
 132                     ; 41 static void ConfigureTc(void)
 132                     ; 42 {
 133                     .text:	section	.text,new
 134  0000               L53f_ConfigureTc:
 138                     ; 43 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 140  0000 ae0001        	ldw	x,#1
 141  0003 a602          	ld	a,#2
 142  0005 95            	ld	xh,a
 143  0006 8d000000      	callf	f_CLK_PeripheralClockConfig
 145                     ; 44     TIM4_DeInit();
 147  000a 8d000000      	callf	f_TIM4_DeInit
 149                     ; 45     TIM4_TimeBaseInit(TIM4_Prescaler_16384, TIMEOUT_TIMER_PERIOD);
 151  000e ae00c8        	ldw	x,#200
 152  0011 a60e          	ld	a,#14
 153  0013 95            	ld	xh,a
 154  0014 8d000000      	callf	f_TIM4_TimeBaseInit
 156                     ; 46     TIM4_ARRPreloadConfig(ENABLE);
 158  0018 a601          	ld	a,#1
 159  001a 8d000000      	callf	f_TIM4_ARRPreloadConfig
 161                     ; 47     TIM4_ITConfig(TIM1_IT_Update, ENABLE);
 163  001e ae0001        	ldw	x,#1
 164  0021 a601          	ld	a,#1
 165  0023 95            	ld	xh,a
 166  0024 8d000000      	callf	f_TIM4_ITConfig
 168                     ; 48     TIM4_Cmd(ENABLE);
 170  0028 a601          	ld	a,#1
 171  002a 8d000000      	callf	f_TIM4_Cmd
 173                     ; 49     enableInterrupts();
 176  002e 9a            	rim	
 178                     ; 50 }
 182  002f 87            	retf	
 206                     ; 67 sint32 TimeoutInit(void)
 206                     ; 68 {
 207                     .text:	section	.text,new
 208  0000               f_TimeoutInit:
 212                     ; 69 	u32TimerCount = 0;
 214  0000 5f            	clrw	x
 215  0001 cf0002        	ldw	L3_u32TimerCount+2,x
 216  0004 cf0000        	ldw	L3_u32TimerCount,x
 217                     ; 71 	ConfigureTc();
 219  0007 8d000000      	callf	L53f_ConfigureTc
 221                     ; 73 	return 0;
 223  000b 5f            	clrw	x
 224  000c bf02          	ldw	c_lreg+2,x
 225  000e bf00          	ldw	c_lreg,x
 228  0010 87            	retf	
 301                     .const:	section	.text
 302  0000               L24:
 303  0000 00000005      	dc.l	5
 304                     ; 91 sint32 GetPowerOnTimer(tMsTimeDef *ptMsTime)
 304                     ; 92 {
 305                     .text:	section	.text,new
 306  0000               f_GetPowerOnTimer:
 308  0000 89            	pushw	x
 309  0001 5205          	subw	sp,#5
 310       00000005      OFST:	set	5
 313                     ; 96     u16TimerValue = TIM4_GetCounter();
 315  0003 8d000000      	callf	f_TIM4_GetCounter
 317  0007 6b01          	ld	(OFST-4,sp),a
 318                     ; 97     u32CountValue = GetTimerCount();
 320  0009 8d000000      	callf	L5f_GetTimerCount
 322  000d 96            	ldw	x,sp
 323  000e 1c0002        	addw	x,#OFST-3
 324  0011 8d000000      	callf	d_rtol
 326                     ; 99 	ptMsTime->u32Second = u32CountValue / (1000 / TIMEOUT_TIMER_PERIOD);
 328  0015 96            	ldw	x,sp
 329  0016 1c0002        	addw	x,#OFST-3
 330  0019 8d000000      	callf	d_ltor
 332  001d ae0000        	ldw	x,#L24
 333  0020 8d000000      	callf	d_ludv
 335  0024 1e06          	ldw	x,(OFST+1,sp)
 336  0026 8d000000      	callf	d_rtol
 338                     ; 100 	ptMsTime->u16Msecond = (u32CountValue % (1000 / TIMEOUT_TIMER_PERIOD)) * TIMEOUT_TIMER_PERIOD + u16TimerValue;
 340  002a 96            	ldw	x,sp
 341  002b 1c0002        	addw	x,#OFST-3
 342  002e 8d000000      	callf	d_ltor
 344  0032 ae0000        	ldw	x,#L24
 345  0035 8d000000      	callf	d_lumd
 347  0039 be02          	ldw	x,c_lreg+2
 348  003b 90ae00c8      	ldw	y,#200
 349  003f 8d000000      	callf	d_imul
 351  0043 01            	rrwa	x,a
 352  0044 1b01          	add	a,(OFST-4,sp)
 353  0046 2401          	jrnc	L44
 354  0048 5c            	incw	x
 355  0049               L44:
 356  0049 1606          	ldw	y,(OFST+1,sp)
 357  004b 02            	rlwa	x,a
 358  004c 90ef04        	ldw	(4,y),x
 359                     ; 102 	return 0;
 361  004f 5f            	clrw	x
 362  0050 bf02          	ldw	c_lreg+2,x
 363  0052 bf00          	ldw	c_lreg,x
 366  0054 5b07          	addw	sp,#7
 367  0056 87            	retf	
 445                     	switch	.const
 446  0004               L25:
 447  0004 000003e8      	dc.l	1000
 448                     ; 122 sint32 InitMsTimeout(tMsTimeoutDef *ptMsTimeout, uint32 u32MSecLen)
 448                     ; 123 {
 449                     .text:	section	.text,new
 450  0000               f_InitMsTimeout:
 452  0000 89            	pushw	x
 453       00000000      OFST:	set	0
 456                     ; 125 	if(NULL == ptMsTimeout)
 458  0001 5d            	tnzw	x
 459  0002 2608          	jrne	L351
 460                     ; 127 		return -1;
 462  0004 5a            	decw	x
 463  0005 bf02          	ldw	c_lreg+2,x
 464  0007 aeffff        	ldw	x,#-1
 466  000a 203d          	jra	L45
 467  000c               L351:
 468                     ; 130 	GetPowerOnTimer(&ptMsTimeout->tTimeStart);
 470  000c 1e01          	ldw	x,(OFST+1,sp)
 471  000e 5c            	incw	x
 472  000f 8d000000      	callf	f_GetPowerOnTimer
 474                     ; 131 	ptMsTimeout->tTimeLen.u32Second= u32MSecLen / 1000;
 476  0013 96            	ldw	x,sp
 477  0014 1c0006        	addw	x,#OFST+6
 478  0017 8d000000      	callf	d_ltor
 480  001b ae0004        	ldw	x,#L25
 481  001e 8d000000      	callf	d_ludv
 483  0022 1e01          	ldw	x,(OFST+1,sp)
 484  0024 1c0007        	addw	x,#7
 485  0027 8d000000      	callf	d_rtol
 487                     ; 132 	ptMsTimeout->tTimeLen.u16Msecond= u32MSecLen % 1000;
 489  002b 96            	ldw	x,sp
 490  002c 1c0006        	addw	x,#OFST+6
 491  002f 8d000000      	callf	d_ltor
 493  0033 ae0004        	ldw	x,#L25
 494  0036 8d000000      	callf	d_lumd
 496  003a be02          	ldw	x,c_lreg+2
 497  003c 1601          	ldw	y,(OFST+1,sp)
 498  003e 90ef0b        	ldw	(11,y),x
 499                     ; 133 	ptMsTimeout->u8TimerSwitch = SWITCH_ON;
 501  0041 1e01          	ldw	x,(OFST+1,sp)
 502  0043 a601          	ld	a,#1
 503  0045 f7            	ld	(x),a
 504                     ; 135 	return 0;
 506  0046 5f            	clrw	x
 507  0047 bf02          	ldw	c_lreg+2,x
 509  0049               L45:
 510  0049 bf00          	ldw	c_lreg,x
 512  004b 5b02          	addw	sp,#2
 513  004d 87            	retf	
 560                     ; 154 sint32 InitLongMsTimeout(tMsTimeoutDef *ptMsTimeout, tMsTimeDef tMsTime)
 560                     ; 155 {
 561                     .text:	section	.text,new
 562  0000               f_InitLongMsTimeout:
 564  0000 89            	pushw	x
 565       00000000      OFST:	set	0
 568                     ; 157 	if(NULL == ptMsTimeout)
 570  0001 5d            	tnzw	x
 571  0002 2608          	jrne	L102
 572                     ; 159 		return -1;
 574  0004 5a            	decw	x
 575  0005 bf02          	ldw	c_lreg+2,x
 576  0007 aeffff        	ldw	x,#-1
 578  000a 2023          	jra	L26
 579  000c               L102:
 580                     ; 162 	GetPowerOnTimer(&ptMsTimeout->tTimeStart);
 582  000c 1e01          	ldw	x,(OFST+1,sp)
 583  000e 5c            	incw	x
 584  000f 8d000000      	callf	f_GetPowerOnTimer
 586                     ; 163 	ptMsTimeout->tTimeLen.u32Second = tMsTime.u32Second;
 588  0013 1e01          	ldw	x,(OFST+1,sp)
 589  0015 7b09          	ld	a,(OFST+9,sp)
 590  0017 e70a          	ld	(10,x),a
 591  0019 7b08          	ld	a,(OFST+8,sp)
 592  001b e709          	ld	(9,x),a
 593  001d 7b07          	ld	a,(OFST+7,sp)
 594  001f e708          	ld	(8,x),a
 595  0021 7b06          	ld	a,(OFST+6,sp)
 596  0023 e707          	ld	(7,x),a
 597                     ; 164 	ptMsTimeout->tTimeLen.u16Msecond = tMsTime.u16Msecond;
 599  0025 160a          	ldw	y,(OFST+10,sp)
 600  0027 ef0b          	ldw	(11,x),y
 601                     ; 165 	ptMsTimeout->u8TimerSwitch = SWITCH_ON;
 603  0029 a601          	ld	a,#1
 604  002b f7            	ld	(x),a
 605                     ; 167 	return 0;
 607  002c 5f            	clrw	x
 608  002d bf02          	ldw	c_lreg+2,x
 610  002f               L26:
 611  002f bf00          	ldw	c_lreg,x
 613  0031 5b02          	addw	sp,#2
 614  0033 87            	retf	
 651                     ; 185 sint32 ReadMsTimeOutSwitch(tMsTimeoutDef *ptMsTimeout)
 651                     ; 186 {
 652                     .text:	section	.text,new
 653  0000               f_ReadMsTimeOutSwitch:
 655  0000 89            	pushw	x
 656       00000000      OFST:	set	0
 659                     ; 187 	if(NULL == ptMsTimeout)
 661  0001 5d            	tnzw	x
 662  0002 2608          	jrne	L322
 663                     ; 189 		return -1;
 665  0004 5a            	decw	x
 666  0005 bf02          	ldw	c_lreg+2,x
 667  0007 aeffff        	ldw	x,#-1
 669  000a 200c          	jra	L66
 670  000c               L322:
 671                     ; 191 	if(SWITCH_ON == ptMsTimeout->u8TimerSwitch)
 673  000c 1e01          	ldw	x,(OFST+1,sp)
 674  000e f6            	ld	a,(x)
 675  000f 4a            	dec	a
 676  0010 260b          	jrne	L522
 677                     ; 193 		return 1;
 679  0012 ae0001        	ldw	x,#1
 680  0015 bf02          	ldw	c_lreg+2,x
 681  0017 5f            	clrw	x
 683  0018               L66:
 684  0018 bf00          	ldw	c_lreg,x
 686  001a 5b02          	addw	sp,#2
 687  001c 87            	retf	
 688  001d               L522:
 689                     ; 197 		return 0;
 691  001d 5f            	clrw	x
 692  001e bf02          	ldw	c_lreg+2,x
 694  0020 20f6          	jra	L66
 737                     ; 217 sint32 SetMsTimeOutSwitch(tMsTimeoutDef *ptMsTimeout, uint8 u8Switch)
 737                     ; 218 {
 738                     .text:	section	.text,new
 739  0000               f_SetMsTimeOutSwitch:
 741  0000 89            	pushw	x
 742       00000000      OFST:	set	0
 745                     ; 219 	if((NULL == ptMsTimeout) || ((SWITCH_ON != u8Switch) && (SWITCH_OFF != u8Switch)))
 747  0001 5d            	tnzw	x
 748  0002 270a          	jreq	L552
 750  0004 7b06          	ld	a,(OFST+6,sp)
 751  0006 a101          	cp	a,#1
 752  0008 2709          	jreq	L352
 754  000a 7b06          	ld	a,(OFST+6,sp)
 755  000c 2705          	jreq	L352
 756  000e               L552:
 757                     ; 221 		return -1;
 759  000e aeffff        	ldw	x,#65535
 761  0011 2004          	jra	L27
 762  0013               L352:
 763                     ; 223 	ptMsTimeout->u8TimerSwitch = u8Switch;
 765  0013 1e01          	ldw	x,(OFST+1,sp)
 766  0015 f7            	ld	(x),a
 767                     ; 224 	return 0;
 769  0016 5f            	clrw	x
 771  0017               L27:
 772  0017 bf02          	ldw	c_lreg+2,x
 773  0019 bf00          	ldw	c_lreg,x
 775  001b 5b02          	addw	sp,#2
 776  001d 87            	retf	
 840                     ; 242 uint32 IsMsTimeout(tMsTimeoutDef *ptMsTimeout)
 840                     ; 243 {
 841                     .text:	section	.text,new
 842  0000               f_IsMsTimeout:
 844  0000 89            	pushw	x
 845  0001 5214          	subw	sp,#20
 846       00000014      OFST:	set	20
 849                     ; 248 	if((NULL == ptMsTimeout))
 851  0003 5d            	tnzw	x
 852                     ; 250 		return 0;
 854  0004 2705          	jreq	LC001
 855                     ; 253 	if(SWITCH_OFF == ptMsTimeout->u8TimerSwitch)//开关必须打开才能判断超时
 857  0006 1e15          	ldw	x,(OFST+1,sp)
 858  0008 f6            	ld	a,(x)
 859  0009 2608          	jrne	L313
 860                     ; 255 		return 0;
 862  000b               LC001:
 866  000b 5f            	clrw	x
 867  000c bf02          	ldw	c_lreg+2,x
 869  000e               L001:
 870  000e bf00          	ldw	c_lreg,x
 872  0010 5b16          	addw	sp,#22
 873  0012 87            	retf	
 874  0013               L313:
 875                     ; 259 	u32Tmp =  (uint32)ptMsTimeout->tTimeLen.u16Msecond + (uint32)ptMsTimeout->tTimeStart.u16Msecond;
 877  0013 ee05          	ldw	x,(5,x)
 878  0015 8d000000      	callf	d_uitolx
 880  0019 96            	ldw	x,sp
 881  001a 5c            	incw	x
 882  001b 8d000000      	callf	d_rtol
 884  001f 1e15          	ldw	x,(OFST+1,sp)
 885  0021 ee0b          	ldw	x,(11,x)
 886  0023 8d000000      	callf	d_uitolx
 888  0027 96            	ldw	x,sp
 889  0028 5c            	incw	x
 890  0029 8d000000      	callf	d_ladd
 892  002d 96            	ldw	x,sp
 893  002e 1c0005        	addw	x,#OFST-15
 894  0031 8d000000      	callf	d_rtol
 896                     ; 260 	if(999 < u32Tmp) // 毫秒有进位
 898  0035 96            	ldw	x,sp
 899  0036 1c0005        	addw	x,#OFST-15
 900  0039 8d000000      	callf	d_ltor
 902  003d ae0004        	ldw	x,#L25
 903  0040 8d000000      	callf	d_lcmp
 905  0044 1e15          	ldw	x,(OFST+1,sp)
 906  0046 2516          	jrult	L513
 907                     ; 262 		tMsTimeTmp1.u32Second = ptMsTimeout->tTimeStart.u32Second + ptMsTimeout->tTimeLen.u32Second + 1;
 909  0048 1c0007        	addw	x,#7
 910  004b 8d000000      	callf	d_ltor
 912  004f 1e15          	ldw	x,(OFST+1,sp)
 913  0051 5c            	incw	x
 914  0052 8d000000      	callf	d_ladd
 916  0056 a601          	ld	a,#1
 917  0058 8d000000      	callf	d_ladc
 921  005c 200e          	jra	L713
 922  005e               L513:
 923                     ; 266 		tMsTimeTmp1.u32Second = ptMsTimeout->tTimeStart.u32Second + ptMsTimeout->tTimeLen.u32Second;
 925  005e 1c0007        	addw	x,#7
 926  0061 8d000000      	callf	d_ltor
 928  0065 1e15          	ldw	x,(OFST+1,sp)
 929  0067 5c            	incw	x
 930  0068 8d000000      	callf	d_ladd
 933  006c               L713:
 934  006c 96            	ldw	x,sp
 935  006d 1c000f        	addw	x,#OFST-5
 936  0070 8d000000      	callf	d_rtol
 937                     ; 268 	tMsTimeTmp1.u16Msecond = (ptMsTimeout->tTimeStart.u16Msecond + ptMsTimeout->tTimeLen.u16Msecond) % 1000;
 939  0074 1e15          	ldw	x,(OFST+1,sp)
 940  0076 ee0b          	ldw	x,(11,x)
 941  0078 1615          	ldw	y,(OFST+1,sp)
 942  007a 90ee05        	ldw	y,(5,y)
 943  007d 90bf00        	ldw	c_x,y
 944  0080 72bb0000      	addw	x,c_x
 945  0084 90ae03e8      	ldw	y,#1000
 946  0088 65            	divw	x,y
 947  0089 93            	ldw	x,y
 948  008a 1f13          	ldw	(OFST-1,sp),x
 949                     ; 271 	GetPowerOnTimer(&tMsTimeTmp2);
 951  008c 96            	ldw	x,sp
 952  008d 1c0009        	addw	x,#OFST-11
 953  0090 8d000000      	callf	f_GetPowerOnTimer
 955                     ; 272 	if(tMsTimeTmp1.u32Second < tMsTimeTmp2.u32Second)
 957  0094 96            	ldw	x,sp
 958  0095 1c000f        	addw	x,#OFST-5
 959  0098 8d000000      	callf	d_ltor
 961  009c 96            	ldw	x,sp
 962  009d 1c0009        	addw	x,#OFST-11
 963  00a0 8d000000      	callf	d_lcmp
 965  00a4 240d          	jruge	L123
 966                     ; 274 		ptMsTimeout->u8TimerSwitch = SWITCH_OFF;
 968                     ; 275 		return 1;
 970  00a6               LC002:
 972  00a6 1e15          	ldw	x,(OFST+1,sp)
 973  00a8 7f            	clr	(x)
 975  00a9 ae0001        	ldw	x,#1
 976  00ac bf02          	ldw	c_lreg+2,x
 977  00ae 5f            	clrw	x
 979  00af ac0e000e      	jra	L001
 980  00b3               L123:
 981                     ; 277 	else if(tMsTimeTmp1.u32Second == tMsTimeTmp2.u32Second)
 983  00b3 96            	ldw	x,sp
 984  00b4 1c000f        	addw	x,#OFST-5
 985  00b7 8d000000      	callf	d_ltor
 987  00bb 96            	ldw	x,sp
 988  00bc 1c0009        	addw	x,#OFST-11
 989  00bf 8d000000      	callf	d_lcmp
 991  00c3 2704ac0b000b  	jrne	LC001
 992                     ; 279 		if(tMsTimeTmp1.u16Msecond <= tMsTimeTmp2.u16Msecond)
 994  00c9 1e13          	ldw	x,(OFST-1,sp)
 995  00cb 130d          	cpw	x,(OFST-7,sp)
 996  00cd 22f6          	jrugt	LC001
 997                     ; 281 			ptMsTimeout->u8TimerSwitch = SWITCH_OFF;
 998                     ; 282 			return 1;
1000  00cf 20d5          	jpf	LC002
1001                     ; 287 		return 0;
1003                     ; 290     return 0;
1047                     	switch	.const
1048  0008               L011:
1049  0008 00000001      	dc.l	1
1050                     ; 308 sint32 TimeoutMsDelay(uint32 u32Ms)
1050                     ; 309 {
1051                     .text:	section	.text,new
1052  0000               f_TimeoutMsDelay:
1054  0000 520d          	subw	sp,#13
1055       0000000d      OFST:	set	13
1058                     ; 312 	InitMsTimeout(&tMsTimeout, u32Ms);
1060  0002 1e13          	ldw	x,(OFST+6,sp)
1061  0004 89            	pushw	x
1062  0005 1e13          	ldw	x,(OFST+6,sp)
1063  0007 89            	pushw	x
1064  0008 96            	ldw	x,sp
1065  0009 1c0005        	addw	x,#OFST-8
1066  000c 8d000000      	callf	f_InitMsTimeout
1068  0010 5b04          	addw	sp,#4
1069  0012               L353:
1070                     ; 316 		if(1 == IsMsTimeout(&tMsTimeout))
1072  0012 96            	ldw	x,sp
1073  0013 5c            	incw	x
1074  0014 8d000000      	callf	f_IsMsTimeout
1076  0018 ae0008        	ldw	x,#L011
1077  001b 8d000000      	callf	d_lcmp
1079  001f 26f1          	jrne	L353
1080                     ; 318 			return 0;
1082  0021 5f            	clrw	x
1083  0022 bf02          	ldw	c_lreg+2,x
1084  0024 bf00          	ldw	c_lreg,x
1087  0026 5b0d          	addw	sp,#13
1088  0028 87            	retf	
1109                     	xdef	f_TIM4_OVF_RQHandler
1110                     	switch	.bss
1111  0000               L3_u32TimerCount:
1112  0000 00000000      	ds.b	4
1113                     	xdef	f_TimeoutMsDelay
1114                     	xdef	f_SetMsTimeOutSwitch
1115                     	xdef	f_ReadMsTimeOutSwitch
1116                     	xdef	f_IsMsTimeout
1117                     	xdef	f_InitLongMsTimeout
1118                     	xdef	f_InitMsTimeout
1119                     	xdef	f_GetPowerOnTimer
1120                     	xdef	f_TimeoutInit
1121                     	xref	f_TIM4_ClearITPendingBit
1122                     	xref	f_TIM4_ITConfig
1123                     	xref	f_TIM4_Cmd
1124                     	xref	f_TIM4_ARRPreloadConfig
1125                     	xref	f_TIM4_GetCounter
1126                     	xref	f_TIM4_TimeBaseInit
1127                     	xref	f_TIM4_DeInit
1128                     	xref	f_CLK_PeripheralClockConfig
1129                     	xref.b	c_lreg
1130                     	xref.b	c_x
1131                     	xref.b	c_y
1151                     	xref	d_ladc
1152                     	xref	d_lcmp
1153                     	xref	d_ladd
1154                     	xref	d_uitolx
1155                     	xref	d_imul
1156                     	xref	d_lumd
1157                     	xref	d_ludv
1158                     	xref	d_rtol
1159                     	xref	d_lgadc
1160                     	xref	d_ltor
1161                     	end
