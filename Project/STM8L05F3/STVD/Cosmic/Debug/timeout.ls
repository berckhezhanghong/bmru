   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  34                     ; 26 static uint32 GetTimerCount(void)
  34                     ; 27 {
  36                     .text:	section	.text,new
  37  0000               L5_GetTimerCount:
  41                     ; 28     return u32TimerCount;
  43  0000 ae0000        	ldw	x,#L3_u32TimerCount
  47  0003 cc0000        	jp	c_ltor
  72                     ; 32 INTERRUPT void TIM4_OVF_RQHandler(void)
  72                     ; 33 {
  74                     .text:	section	.text,new
  75  0000               f_TIM4_OVF_RQHandler:
  78  0000 3b0002        	push	c_x+2
  79  0003 be00          	ldw	x,c_x
  80  0005 89            	pushw	x
  81  0006 3b0002        	push	c_y+2
  82  0009 be00          	ldw	x,c_y
  83  000b 89            	pushw	x
  86                     ; 34 	TIM4_ClearITPendingBit((TIM4_IT_Update | TIM4_IT_Trigger));
  88  000c a641          	ld	a,#65
  89  000e cd0000        	call	_TIM4_ClearITPendingBit
  91                     ; 35 	u32TimerCount ++;
  93  0011 ae0000        	ldw	x,#L3_u32TimerCount
  94  0014 a601          	ld	a,#1
  95  0016 cd0000        	call	c_lgadc
  97                     ; 36 }
 100  0019 85            	popw	x
 101  001a bf00          	ldw	c_y,x
 102  001c 320002        	pop	c_y+2
 103  001f 85            	popw	x
 104  0020 bf00          	ldw	c_x,x
 105  0022 320002        	pop	c_x+2
 106  0025 80            	iret	
 135                     ; 41 static void ConfigureTc(void)
 135                     ; 42 {
 137                     .text:	section	.text,new
 138  0000               L53_ConfigureTc:
 142                     ; 43 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
 144  0000 ae0001        	ldw	x,#1
 145  0003 a602          	ld	a,#2
 146  0005 95            	ld	xh,a
 147  0006 cd0000        	call	_CLK_PeripheralClockConfig
 149                     ; 44     TIM4_DeInit();
 151  0009 cd0000        	call	_TIM4_DeInit
 153                     ; 45     TIM4_TimeBaseInit(TIM4_Prescaler_16384, TIMEOUT_TIMER_PERIOD);
 155  000c ae00c8        	ldw	x,#200
 156  000f a60e          	ld	a,#14
 157  0011 95            	ld	xh,a
 158  0012 cd0000        	call	_TIM4_TimeBaseInit
 160                     ; 46     TIM4_ARRPreloadConfig(ENABLE);
 162  0015 a601          	ld	a,#1
 163  0017 cd0000        	call	_TIM4_ARRPreloadConfig
 165                     ; 47     TIM4_ITConfig(TIM1_IT_Update, ENABLE);
 167  001a ae0001        	ldw	x,#1
 168  001d a601          	ld	a,#1
 169  001f 95            	ld	xh,a
 170  0020 cd0000        	call	_TIM4_ITConfig
 172                     ; 48     TIM4_Cmd(ENABLE);
 174  0023 a601          	ld	a,#1
 175  0025 cd0000        	call	_TIM4_Cmd
 177                     ; 49     enableInterrupts();
 180  0028 9a            	rim	
 182                     ; 50 }
 186  0029 81            	ret	
 211                     ; 67 sint32 TimeoutInit(void)
 211                     ; 68 {
 212                     .text:	section	.text,new
 213  0000               _TimeoutInit:
 217                     ; 69 	u32TimerCount = 0;
 219  0000 5f            	clrw	x
 220  0001 bf02          	ldw	L3_u32TimerCount+2,x
 221  0003 bf00          	ldw	L3_u32TimerCount,x
 222                     ; 71 	ConfigureTc();
 224  0005 cd0000        	call	L53_ConfigureTc
 226                     ; 73 	return 0;
 228  0008 5f            	clrw	x
 229  0009 bf02          	ldw	c_lreg+2,x
 230  000b bf00          	ldw	c_lreg,x
 233  000d 81            	ret	
 311                     .const:	section	.text
 312  0000               L24:
 313  0000 00000005      	dc.l	5
 314                     ; 91 sint32 GetPowerOnTimer(tMsTimeDef *ptMsTime)
 314                     ; 92 {
 315                     .text:	section	.text,new
 316  0000               _GetPowerOnTimer:
 318  0000 89            	pushw	x
 319  0001 5205          	subw	sp,#5
 320       00000005      OFST:	set	5
 323                     ; 96     u16TimerValue = TIM4_GetCounter();
 325  0003 cd0000        	call	_TIM4_GetCounter
 327  0006 6b01          	ld	(OFST-4,sp),a
 328                     ; 97     u32CountValue = GetTimerCount();
 330  0008 cd0000        	call	L5_GetTimerCount
 332  000b 96            	ldw	x,sp
 333  000c 1c0002        	addw	x,#OFST-3
 334  000f cd0000        	call	c_rtol
 336                     ; 99 	ptMsTime->u32Second = u32CountValue / (1000 / TIMEOUT_TIMER_PERIOD);
 338  0012 96            	ldw	x,sp
 339  0013 ad2b          	call	LC001
 340  0015 cd0000        	call	c_ludv
 342  0018 1e06          	ldw	x,(OFST+1,sp)
 343  001a cd0000        	call	c_rtol
 345                     ; 100 	ptMsTime->u16Msecond = (u32CountValue % (1000 / TIMEOUT_TIMER_PERIOD)) * TIMEOUT_TIMER_PERIOD + u16TimerValue;
 347  001d 96            	ldw	x,sp
 348  001e ad20          	call	LC001
 349  0020 cd0000        	call	c_lumd
 351  0023 be02          	ldw	x,c_lreg+2
 352  0025 90ae00c8      	ldw	y,#200
 353  0029 cd0000        	call	c_imul
 355  002c 01            	rrwa	x,a
 356  002d 1b01          	add	a,(OFST-4,sp)
 357  002f 2401          	jrnc	L44
 358  0031 5c            	incw	x
 359  0032               L44:
 360  0032 1606          	ldw	y,(OFST+1,sp)
 361  0034 02            	rlwa	x,a
 362  0035 90ef04        	ldw	(4,y),x
 363                     ; 102 	return 0;
 365  0038 5f            	clrw	x
 366  0039 bf02          	ldw	c_lreg+2,x
 367  003b bf00          	ldw	c_lreg,x
 370  003d 5b07          	addw	sp,#7
 371  003f 81            	ret	
 373  0040               LC001:
 374  0040 1c0002        	addw	x,#OFST-3
 375  0043 cd0000        	call	c_ltor
 377  0046 ae0000        	ldw	x,#L24
 378  0049 81            	ret	
 458                     	switch	.const
 459  0004               L25:
 460  0004 000003e8      	dc.l	1000
 461                     ; 122 sint32 InitMsTimeout(tMsTimeoutDef *ptMsTimeout, uint32 u32MSecLen)
 461                     ; 123 {
 462                     .text:	section	.text,new
 463  0000               _InitMsTimeout:
 465  0000 89            	pushw	x
 466       00000000      OFST:	set	0
 469                     ; 125 	if(NULL == ptMsTimeout)
 471  0001 5d            	tnzw	x
 472  0002 2608          	jrne	L161
 473                     ; 127 		return -1;
 475  0004 5a            	decw	x
 476  0005 bf02          	ldw	c_lreg+2,x
 477  0007 aeffff        	ldw	x,#-1
 479  000a 2029          	jra	L45
 480  000c               L161:
 481                     ; 130 	GetPowerOnTimer(&ptMsTimeout->tTimeStart);
 483  000c 1e01          	ldw	x,(OFST+1,sp)
 484  000e 5c            	incw	x
 485  000f cd0000        	call	_GetPowerOnTimer
 487                     ; 131 	ptMsTimeout->tTimeLen.u32Second= u32MSecLen / 1000;
 489  0012 96            	ldw	x,sp
 490  0013 ad25          	call	LC002
 491  0015 cd0000        	call	c_ludv
 493  0018 1e01          	ldw	x,(OFST+1,sp)
 494  001a 1c0007        	addw	x,#7
 495  001d cd0000        	call	c_rtol
 497                     ; 132 	ptMsTimeout->tTimeLen.u16Msecond= u32MSecLen % 1000;
 499  0020 96            	ldw	x,sp
 500  0021 ad17          	call	LC002
 501  0023 cd0000        	call	c_lumd
 503  0026 be02          	ldw	x,c_lreg+2
 504  0028 1601          	ldw	y,(OFST+1,sp)
 505  002a 90ef0b        	ldw	(11,y),x
 506                     ; 133 	ptMsTimeout->u8TimerSwitch = SWITCH_ON;
 508  002d 1e01          	ldw	x,(OFST+1,sp)
 509  002f a601          	ld	a,#1
 510  0031 f7            	ld	(x),a
 511                     ; 135 	return 0;
 513  0032 5f            	clrw	x
 514  0033 bf02          	ldw	c_lreg+2,x
 516  0035               L45:
 517  0035 bf00          	ldw	c_lreg,x
 519  0037 5b02          	addw	sp,#2
 520  0039 81            	ret	
 522  003a               LC002:
 523  003a 1c0005        	addw	x,#OFST+5
 524  003d cd0000        	call	c_ltor
 526  0040 ae0004        	ldw	x,#L25
 527  0043 81            	ret	
 574                     ; 154 sint32 InitLongMsTimeout(tMsTimeoutDef *ptMsTimeout, tMsTimeDef tMsTime)
 574                     ; 155 {
 575                     .text:	section	.text,new
 576  0000               _InitLongMsTimeout:
 578  0000 89            	pushw	x
 579       00000000      OFST:	set	0
 582                     ; 157 	if(NULL == ptMsTimeout)
 584  0001 5d            	tnzw	x
 585  0002 2608          	jrne	L702
 586                     ; 159 		return -1;
 588  0004 5a            	decw	x
 589  0005 bf02          	ldw	c_lreg+2,x
 590  0007 aeffff        	ldw	x,#-1
 592  000a 2022          	jra	L26
 593  000c               L702:
 594                     ; 162 	GetPowerOnTimer(&ptMsTimeout->tTimeStart);
 596  000c 1e01          	ldw	x,(OFST+1,sp)
 597  000e 5c            	incw	x
 598  000f cd0000        	call	_GetPowerOnTimer
 600                     ; 163 	ptMsTimeout->tTimeLen.u32Second = tMsTime.u32Second;
 602  0012 1e01          	ldw	x,(OFST+1,sp)
 603  0014 7b08          	ld	a,(OFST+8,sp)
 604  0016 e70a          	ld	(10,x),a
 605  0018 7b07          	ld	a,(OFST+7,sp)
 606  001a e709          	ld	(9,x),a
 607  001c 7b06          	ld	a,(OFST+6,sp)
 608  001e e708          	ld	(8,x),a
 609  0020 7b05          	ld	a,(OFST+5,sp)
 610  0022 e707          	ld	(7,x),a
 611                     ; 164 	ptMsTimeout->tTimeLen.u16Msecond = tMsTime.u16Msecond;
 613  0024 1609          	ldw	y,(OFST+9,sp)
 614  0026 ef0b          	ldw	(11,x),y
 615                     ; 165 	ptMsTimeout->u8TimerSwitch = SWITCH_ON;
 617  0028 a601          	ld	a,#1
 618  002a f7            	ld	(x),a
 619                     ; 167 	return 0;
 621  002b 5f            	clrw	x
 622  002c bf02          	ldw	c_lreg+2,x
 624  002e               L26:
 625  002e bf00          	ldw	c_lreg,x
 627  0030 5b02          	addw	sp,#2
 628  0032 81            	ret	
 666                     ; 185 sint32 ReadMsTimeOutSwitch(tMsTimeoutDef *ptMsTimeout)
 666                     ; 186 {
 667                     .text:	section	.text,new
 668  0000               _ReadMsTimeOutSwitch:
 670  0000 89            	pushw	x
 671       00000000      OFST:	set	0
 674                     ; 187 	if(NULL == ptMsTimeout)
 676  0001 5d            	tnzw	x
 677  0002 2608          	jrne	L132
 678                     ; 189 		return -1;
 680  0004 5a            	decw	x
 681  0005 bf02          	ldw	c_lreg+2,x
 682  0007 aeffff        	ldw	x,#-1
 684  000a 200c          	jra	L66
 685  000c               L132:
 686                     ; 191 	if(SWITCH_ON == ptMsTimeout->u8TimerSwitch)
 688  000c 1e01          	ldw	x,(OFST+1,sp)
 689  000e f6            	ld	a,(x)
 690  000f 4a            	dec	a
 691  0010 260b          	jrne	L332
 692                     ; 193 		return 1;
 694  0012 ae0001        	ldw	x,#1
 695  0015 bf02          	ldw	c_lreg+2,x
 696  0017 5f            	clrw	x
 698  0018               L66:
 699  0018 bf00          	ldw	c_lreg,x
 701  001a 5b02          	addw	sp,#2
 702  001c 81            	ret	
 703  001d               L332:
 704                     ; 197 		return 0;
 706  001d 5f            	clrw	x
 707  001e bf02          	ldw	c_lreg+2,x
 709  0020 20f6          	jra	L66
 755                     ; 217 sint32 SetMsTimeOutSwitch(tMsTimeoutDef *ptMsTimeout, uint8 u8Switch)
 755                     ; 218 {
 756                     .text:	section	.text,new
 757  0000               _SetMsTimeOutSwitch:
 759  0000 89            	pushw	x
 760       00000000      OFST:	set	0
 763                     ; 219 	if((NULL == ptMsTimeout) || ((SWITCH_ON != u8Switch) && (SWITCH_OFF != u8Switch)))
 765  0001 5d            	tnzw	x
 766  0002 270a          	jreq	L562
 768  0004 7b05          	ld	a,(OFST+5,sp)
 769  0006 a101          	cp	a,#1
 770  0008 2709          	jreq	L362
 772  000a 7b05          	ld	a,(OFST+5,sp)
 773  000c 2705          	jreq	L362
 774  000e               L562:
 775                     ; 221 		return -1;
 777  000e aeffff        	ldw	x,#65535
 779  0011 2004          	jra	L27
 780  0013               L362:
 781                     ; 223 	ptMsTimeout->u8TimerSwitch = u8Switch;
 783  0013 1e01          	ldw	x,(OFST+1,sp)
 784  0015 f7            	ld	(x),a
 785                     ; 224 	return 0;
 787  0016 5f            	clrw	x
 789  0017               L27:
 790  0017 bf02          	ldw	c_lreg+2,x
 791  0019 bf00          	ldw	c_lreg,x
 793  001b 5b02          	addw	sp,#2
 794  001d 81            	ret	
 861                     ; 242 uint32 IsMsTimeout(tMsTimeoutDef *ptMsTimeout)
 861                     ; 243 {
 862                     .text:	section	.text,new
 863  0000               _IsMsTimeout:
 865  0000 89            	pushw	x
 866  0001 5214          	subw	sp,#20
 867       00000014      OFST:	set	20
 870                     ; 248 	if((NULL == ptMsTimeout))
 872  0003 5d            	tnzw	x
 873                     ; 250 		return 0;
 875  0004 2705          	jreq	LC003
 876                     ; 253 	if(SWITCH_OFF == ptMsTimeout->u8TimerSwitch)//开关必须打开才能判断超时
 878  0006 1e15          	ldw	x,(OFST+1,sp)
 879  0008 f6            	ld	a,(x)
 880  0009 2608          	jrne	L523
 881                     ; 255 		return 0;
 883  000b               LC003:
 887  000b 5f            	clrw	x
 888  000c bf02          	ldw	c_lreg+2,x
 890  000e               L001:
 891  000e bf00          	ldw	c_lreg,x
 893  0010 5b16          	addw	sp,#22
 894  0012 81            	ret	
 895  0013               L523:
 896                     ; 259 	u32Tmp =  (uint32)ptMsTimeout->tTimeLen.u16Msecond + (uint32)ptMsTimeout->tTimeStart.u16Msecond;
 898  0013 ee05          	ldw	x,(5,x)
 899  0015 cd0000        	call	c_uitolx
 901  0018 96            	ldw	x,sp
 902  0019 5c            	incw	x
 903  001a cd0000        	call	c_rtol
 905  001d 1e15          	ldw	x,(OFST+1,sp)
 906  001f ee0b          	ldw	x,(11,x)
 907  0021 cd0000        	call	c_uitolx
 909  0024 96            	ldw	x,sp
 910  0025 5c            	incw	x
 911  0026 cd0000        	call	c_ladd
 913  0029 96            	ldw	x,sp
 914  002a 1c0005        	addw	x,#OFST-15
 915  002d cd0000        	call	c_rtol
 917                     ; 260 	if(999 < u32Tmp) // 毫秒有进位
 919  0030 96            	ldw	x,sp
 920  0031 1c0005        	addw	x,#OFST-15
 921  0034 cd0000        	call	c_ltor
 923  0037 ae0004        	ldw	x,#L25
 924  003a cd0000        	call	c_lcmp
 926  003d 1e15          	ldw	x,(OFST+1,sp)
 927  003f 2513          	jrult	L723
 928                     ; 262 		tMsTimeTmp1.u32Second = ptMsTimeout->tTimeStart.u32Second + ptMsTimeout->tTimeLen.u32Second + 1;
 930  0041 1c0007        	addw	x,#7
 931  0044 cd0000        	call	c_ltor
 933  0047 1e15          	ldw	x,(OFST+1,sp)
 934  0049 5c            	incw	x
 935  004a cd0000        	call	c_ladd
 937  004d a601          	ld	a,#1
 938  004f cd0000        	call	c_ladc
 942  0052 200c          	jra	L133
 943  0054               L723:
 944                     ; 266 		tMsTimeTmp1.u32Second = ptMsTimeout->tTimeStart.u32Second + ptMsTimeout->tTimeLen.u32Second;
 946  0054 1c0007        	addw	x,#7
 947  0057 cd0000        	call	c_ltor
 949  005a 1e15          	ldw	x,(OFST+1,sp)
 950  005c 5c            	incw	x
 951  005d cd0000        	call	c_ladd
 954  0060               L133:
 955  0060 96            	ldw	x,sp
 956  0061 1c000f        	addw	x,#OFST-5
 957  0064 cd0000        	call	c_rtol
 958                     ; 268 	tMsTimeTmp1.u16Msecond = (ptMsTimeout->tTimeStart.u16Msecond + ptMsTimeout->tTimeLen.u16Msecond) % 1000;
 960  0067 1e15          	ldw	x,(OFST+1,sp)
 961  0069 ee0b          	ldw	x,(11,x)
 962  006b 1615          	ldw	y,(OFST+1,sp)
 963  006d 90ee05        	ldw	y,(5,y)
 964  0070 90bf00        	ldw	c_x,y
 965  0073 72bb0000      	addw	x,c_x
 966  0077 90ae03e8      	ldw	y,#1000
 967  007b 65            	divw	x,y
 968  007c 93            	ldw	x,y
 969  007d 1f13          	ldw	(OFST-1,sp),x
 970                     ; 271 	GetPowerOnTimer(&tMsTimeTmp2);
 972  007f 96            	ldw	x,sp
 973  0080 1c0009        	addw	x,#OFST-11
 974  0083 cd0000        	call	_GetPowerOnTimer
 976                     ; 272 	if(tMsTimeTmp1.u32Second < tMsTimeTmp2.u32Second)
 978  0086 96            	ldw	x,sp
 979  0087 1c000f        	addw	x,#OFST-5
 980  008a cd0000        	call	c_ltor
 982  008d 96            	ldw	x,sp
 983  008e 1c0009        	addw	x,#OFST-11
 984  0091 cd0000        	call	c_lcmp
 986  0094 240c          	jruge	L333
 987                     ; 274 		ptMsTimeout->u8TimerSwitch = SWITCH_OFF;
 989                     ; 275 		return 1;
 991  0096               LC004:
 993  0096 1e15          	ldw	x,(OFST+1,sp)
 994  0098 7f            	clr	(x)
 996  0099 ae0001        	ldw	x,#1
 997  009c bf02          	ldw	c_lreg+2,x
 998  009e 5f            	clrw	x
1000  009f cc000e        	jra	L001
1001  00a2               L333:
1002                     ; 277 	else if(tMsTimeTmp1.u32Second == tMsTimeTmp2.u32Second)
1004  00a2 96            	ldw	x,sp
1005  00a3 1c000f        	addw	x,#OFST-5
1006  00a6 cd0000        	call	c_ltor
1008  00a9 96            	ldw	x,sp
1009  00aa 1c0009        	addw	x,#OFST-11
1010  00ad cd0000        	call	c_lcmp
1012  00b0 2703cc000b    	jrne	LC003
1013                     ; 279 		if(tMsTimeTmp1.u16Msecond <= tMsTimeTmp2.u16Msecond)
1015  00b5 1e13          	ldw	x,(OFST-1,sp)
1016  00b7 130d          	cpw	x,(OFST-7,sp)
1017  00b9 22f7          	jrugt	LC003
1018                     ; 281 			ptMsTimeout->u8TimerSwitch = SWITCH_OFF;
1019                     ; 282 			return 1;
1021  00bb 20d9          	jp	LC004
1022                     ; 287 		return 0;
1024                     ; 290     return 0;
1071                     	switch	.const
1072  0008               L011:
1073  0008 00000001      	dc.l	1
1074                     ; 308 sint32 TimeoutMsDelay(uint32 u32Ms)
1074                     ; 309 {
1075                     .text:	section	.text,new
1076  0000               _TimeoutMsDelay:
1078  0000 520d          	subw	sp,#13
1079       0000000d      OFST:	set	13
1082                     ; 312 	InitMsTimeout(&tMsTimeout, u32Ms);
1084  0002 1e12          	ldw	x,(OFST+5,sp)
1085  0004 89            	pushw	x
1086  0005 1e12          	ldw	x,(OFST+5,sp)
1087  0007 89            	pushw	x
1088  0008 96            	ldw	x,sp
1089  0009 1c0005        	addw	x,#OFST-8
1090  000c cd0000        	call	_InitMsTimeout
1092  000f 5b04          	addw	sp,#4
1093  0011               L763:
1094                     ; 316 		if(1 == IsMsTimeout(&tMsTimeout))
1096  0011 96            	ldw	x,sp
1097  0012 5c            	incw	x
1098  0013 cd0000        	call	_IsMsTimeout
1100  0016 ae0008        	ldw	x,#L011
1101  0019 cd0000        	call	c_lcmp
1103  001c 26f3          	jrne	L763
1104                     ; 318 			return 0;
1106  001e 5f            	clrw	x
1107  001f bf02          	ldw	c_lreg+2,x
1108  0021 bf00          	ldw	c_lreg,x
1111  0023 5b0d          	addw	sp,#13
1112  0025 81            	ret	
1136                     	xdef	f_TIM4_OVF_RQHandler
1137                     	switch	.ubsct
1138  0000               L3_u32TimerCount:
1139  0000 00000000      	ds.b	4
1140                     	xdef	_TimeoutMsDelay
1141                     	xdef	_SetMsTimeOutSwitch
1142                     	xdef	_ReadMsTimeOutSwitch
1143                     	xdef	_IsMsTimeout
1144                     	xdef	_InitLongMsTimeout
1145                     	xdef	_InitMsTimeout
1146                     	xdef	_GetPowerOnTimer
1147                     	xdef	_TimeoutInit
1148                     	xref	_TIM4_ClearITPendingBit
1149                     	xref	_TIM4_ITConfig
1150                     	xref	_TIM4_Cmd
1151                     	xref	_TIM4_ARRPreloadConfig
1152                     	xref	_TIM4_GetCounter
1153                     	xref	_TIM4_TimeBaseInit
1154                     	xref	_TIM4_DeInit
1155                     	xref	_CLK_PeripheralClockConfig
1156                     	xref.b	c_lreg
1157                     	xref.b	c_x
1158                     	xref.b	c_y
1178                     	xref	c_ladc
1179                     	xref	c_lcmp
1180                     	xref	c_ladd
1181                     	xref	c_uitolx
1182                     	xref	c_imul
1183                     	xref	c_lumd
1184                     	xref	c_ludv
1185                     	xref	c_rtol
1186                     	xref	c_lgadc
1187                     	xref	c_ltor
1188                     	end
