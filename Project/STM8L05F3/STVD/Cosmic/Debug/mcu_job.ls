   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     	switch	.data
   6  0000               L3_McuRstFlag:
   7  0000 00            	dc.b	0
   8  0001               L5_McuBootloaderFlag:
   9  0001 00            	dc.b	0
  45                     ; 24 sint8 McuInit(void)
  45                     ; 25 {
  46                     .text:	section	.text,new
  47  0000               f_McuInit:
  51                     ; 26 	CLK_HSICmd(ENABLE);
  53  0000 a601          	ld	a,#1
  54  0002 8d000000      	callf	f_CLK_HSICmd
  56                     ; 27 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
  58  0006 a601          	ld	a,#1
  59  0008 8d000000      	callf	f_CLK_SYSCLKSourceConfig
  61                     ; 28 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
  63  000c 4f            	clr	a
  64  000d 8d000000      	callf	f_CLK_SYSCLKDivConfig
  67  0011               L72:
  68                     ; 29 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);    
  70  0011 a611          	ld	a,#17
  71  0013 8d000000      	callf	f_CLK_GetFlagStatus
  73  0017 4d            	tnz	a
  74  0018 27f7          	jreq	L72
  75                     ; 31 	GPIO_Init(LED_RUN_GPIO_PORT, LED_RUN_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
  77  001a 4be0          	push	#224
  78  001c 4b01          	push	#1
  79  001e ae500f        	ldw	x,#20495
  80  0021 8d000000      	callf	f_GPIO_Init
  82  0025 85            	popw	x
  83                     ; 32 	GPIO_Init(LED_ALARM_GPIO_PORT, LED_ALARM_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
  85  0026 4be0          	push	#224
  86  0028 4b08          	push	#8
  87  002a ae5000        	ldw	x,#20480
  88  002d 8d000000      	callf	f_GPIO_Init
  90  0031 85            	popw	x
  91                     ; 34 	InitMsTimeout(&tMcuCtrl.tLedTimeout, 500);
  93  0032 ae01f4        	ldw	x,#500
  94  0035 89            	pushw	x
  95  0036 5f            	clrw	x
  96  0037 89            	pushw	x
  97  0038 ae0001        	ldw	x,#_tMcuCtrl+1
  98  003b 8d000000      	callf	f_InitMsTimeout
 100  003f 5b04          	addw	sp,#4
 101                     ; 36 	return 0;
 103  0041 4f            	clr	a
 106  0042 87            	retf	
 189                     ; 46 sint8 SetMcuTime(tMcuTimeDef TMcuTime)
 189                     ; 47 {
 190                     .text:	section	.text,new
 191  0000               f_SetMcuTime:
 195                     ; 48 	return 0;
 197  0000 4f            	clr	a
 200  0001 87            	retf	
 236                     ; 58 sint8 GetMcuTime(tMcuTimeDef *pTMcuTime)
 236                     ; 59 {
 237                     .text:	section	.text,new
 238  0000               f_GetMcuTime:
 242                     ; 60 	if(NULL == pTMcuTime)
 244  0000 a30000        	cpw	x,#0
 245  0003 2603          	jrne	L111
 246                     ; 62 		return -1;
 248  0005 a6ff          	ld	a,#255
 251  0007 87            	retf	
 252  0008               L111:
 253                     ; 65 	return 0;
 255  0008 4f            	clr	a
 258  0009 87            	retf	
 289                     ; 70 sint8 SetRstFlag(uint8 u8Flag)
 289                     ; 71 {
 290                     .text:	section	.text,new
 291  0000               f_SetRstFlag:
 293  0000 88            	push	a
 294       00000000      OFST:	set	0
 297                     ; 72 	u8Flag = 1;
 299                     ; 74 	return 0;
 301  0001 4f            	clr	a
 304  0002 5b01          	addw	sp,#1
 305  0004 87            	retf	
 337                     ; 78 sint8 SetBootloaderFlag(uint8 u8Flag)
 337                     ; 79 {
 338                     .text:	section	.text,new
 339  0000               f_SetBootloaderFlag:
 343                     ; 80 	McuBootloaderFlag = 1;
 345  0000 35010001      	mov	L5_McuBootloaderFlag,#1
 346                     ; 82 	return 0;
 348  0004 4f            	clr	a
 351  0005 87            	retf	
 373                     ; 86 static void SaveBefRst(void)
 373                     ; 87 {
 374                     .text:	section	.text,new
 375  0000               L341f_SaveBefRst:
 379                     ; 88 	return ;
 382  0000 87            	retf	
 404                     ; 92 static void JumpToBootloader(void)
 404                     ; 93 {
 405                     .text:	section	.text,new
 406  0000               L551f_JumpToBootloader:
 410                     ; 94 	return ;
 413  0000 87            	retf	
 443                     ; 98 sint8 McuJob(void)
 443                     ; 99 {
 444                     .text:	section	.text,new
 445  0000               f_McuJob:
 449                     ; 100 	if(McuRstFlag)
 451  0000 c60000        	ld	a,L3_McuRstFlag
 452  0003 2706          	jreq	L771
 453                     ; 102 		SaveBefRst();
 455  0005 8d000000      	callf	L341f_SaveBefRst
 457  0009               L102:
 458                     ; 103 		while(1); // 等待看门狗重启
 460  0009 20fe          	jra	L102
 461  000b               L771:
 462                     ; 106 	if(McuBootloaderFlag)
 464  000b c60001        	ld	a,L5_McuBootloaderFlag
 465  000e 2708          	jreq	L502
 466                     ; 108 		SaveBefRst();
 468  0010 8d000000      	callf	L341f_SaveBefRst
 470                     ; 109 		JumpToBootloader();
 472  0014 8d000000      	callf	L551f_JumpToBootloader
 474  0018               L502:
 475                     ; 113 	if(IsMsTimeout(&tMcuCtrl.tLedTimeout))
 477  0018 ae0001        	ldw	x,#_tMcuCtrl+1
 478  001b 8d000000      	callf	f_IsMsTimeout
 480  001f 8d000000      	callf	d_lrzmp
 482  0023 2719          	jreq	L702
 483                     ; 115 		InitMsTimeout(&tMcuCtrl.tLedTimeout, 500);
 485  0025 ae01f4        	ldw	x,#500
 486  0028 89            	pushw	x
 487  0029 5f            	clrw	x
 488  002a 89            	pushw	x
 489  002b ae0001        	ldw	x,#_tMcuCtrl+1
 490  002e 8d000000      	callf	f_InitMsTimeout
 492  0032 5b04          	addw	sp,#4
 493                     ; 118 		GPIO_ToggleBits(LED_RUN_GPIO_PORT, LED_RUN_GPIO_PIN);
 495  0034 4b01          	push	#1
 496  0036 ae500f        	ldw	x,#20495
 497  0039 8d000000      	callf	f_GPIO_ToggleBits
 499  003d 84            	pop	a
 500  003e               L702:
 501                     ; 120 }
 504  003e 87            	retf	
 621                     	switch	.bss
 622  0000               _tMcuCtrl:
 623  0000 000000000000  	ds.b	14
 624                     	xdef	_tMcuCtrl
 625                     	xdef	f_McuJob
 626                     	xdef	f_SetBootloaderFlag
 627                     	xdef	f_SetRstFlag
 628                     	xdef	f_GetMcuTime
 629                     	xdef	f_SetMcuTime
 630                     	xdef	f_McuInit
 631                     	xref	f_IsMsTimeout
 632                     	xref	f_InitMsTimeout
 633                     	xref	f_GPIO_ToggleBits
 634                     	xref	f_GPIO_Init
 635                     	xref	f_CLK_GetFlagStatus
 636                     	xref	f_CLK_SYSCLKDivConfig
 637                     	xref	f_CLK_SYSCLKSourceConfig
 638                     	xref	f_CLK_HSICmd
 658                     	xref	d_lrzmp
 659                     	end
