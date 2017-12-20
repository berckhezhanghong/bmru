   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     	bsct
   6  0000               L3_McuRstFlag:
   7  0000 00            	dc.b	0
   8  0001               L5_McuBootloaderFlag:
   9  0001 00            	dc.b	0
  45                     ; 23 sint8 McuInit(void)
  45                     ; 24 {
  47                     .text:	section	.text,new
  48  0000               _McuInit:
  52                     ; 25 	CLK_HSICmd(ENABLE);
  54  0000 a601          	ld	a,#1
  55  0002 cd0000        	call	_CLK_HSICmd
  57                     ; 26 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
  59  0005 a601          	ld	a,#1
  60  0007 cd0000        	call	_CLK_SYSCLKSourceConfig
  62                     ; 27 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
  64  000a 4f            	clr	a
  65  000b cd0000        	call	_CLK_SYSCLKDivConfig
  68  000e               L72:
  69                     ; 28 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);    
  71  000e a611          	ld	a,#17
  72  0010 cd0000        	call	_CLK_GetFlagStatus
  74  0013 4d            	tnz	a
  75  0014 27f8          	jreq	L72
  76                     ; 30 	GPIO_Init(LED_GPIO_PORT, LED_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
  78  0016 4be0          	push	#224
  79  0018 4b01          	push	#1
  80  001a ae500f        	ldw	x,#20495
  81  001d cd0000        	call	_GPIO_Init
  83  0020 85            	popw	x
  84                     ; 31 	GPIO_Init(LED1_GPIO_PORT, LED1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
  86  0021 4be0          	push	#224
  87  0023 4b08          	push	#8
  88  0025 ae5000        	ldw	x,#20480
  89  0028 cd0000        	call	_GPIO_Init
  91  002b 85            	popw	x
  92                     ; 33 	InitMsTimeout(&tMcuCtrl.tLedTimeout, 500);
  94  002c ae01f4        	ldw	x,#500
  95  002f 89            	pushw	x
  96  0030 5f            	clrw	x
  97  0031 89            	pushw	x
  98  0032 ae0000        	ldw	x,#_tMcuCtrl
  99  0035 cd0000        	call	_InitMsTimeout
 101  0038 5b04          	addw	sp,#4
 102                     ; 35 	return 0;
 104  003a 4f            	clr	a
 107  003b 81            	ret	
 191                     ; 45 sint8 SetMcuTime(tMcuTimeDef TMcuTime)
 191                     ; 46 {
 192                     .text:	section	.text,new
 193  0000               _SetMcuTime:
 197                     ; 47 	return 0;
 199  0000 4f            	clr	a
 202  0001 81            	ret	
 239                     ; 57 sint8 GetMcuTime(tMcuTimeDef *pTMcuTime)
 239                     ; 58 {
 240                     .text:	section	.text,new
 241  0000               _GetMcuTime:
 245                     ; 59 	if(NULL == pTMcuTime)
 247  0000 a30000        	cpw	x,#0
 248  0003 2603          	jrne	L111
 249                     ; 61 		return -1;
 251  0005 a6ff          	ld	a,#255
 254  0007 81            	ret	
 255  0008               L111:
 256                     ; 64 	return 0;
 258  0008 4f            	clr	a
 261  0009 81            	ret	
 295                     ; 69 sint8 SetRstFlag(uint8 u8Flag)
 295                     ; 70 {
 296                     .text:	section	.text,new
 297  0000               _SetRstFlag:
 299  0000 88            	push	a
 300       00000000      OFST:	set	0
 303                     ; 71 	u8Flag = 1;
 305                     ; 73 	return 0;
 307  0001 4f            	clr	a
 310  0002 5b01          	addw	sp,#1
 311  0004 81            	ret	
 346                     ; 77 sint8 SetBootloaderFlag(uint8 u8Flag)
 346                     ; 78 {
 347                     .text:	section	.text,new
 348  0000               _SetBootloaderFlag:
 352                     ; 79 	McuBootloaderFlag = 1;
 354  0000 35010001      	mov	L5_McuBootloaderFlag,#1
 355                     ; 81 	return 0;
 357  0004 4f            	clr	a
 360  0005 81            	ret	
 383                     ; 85 static void SaveBefRst(void)
 383                     ; 86 {
 384                     .text:	section	.text,new
 385  0000               L741_SaveBefRst:
 389                     ; 87 	return ;
 392  0000 81            	ret	
 415                     ; 91 static void JumpToBootloader(void)
 415                     ; 92 {
 416                     .text:	section	.text,new
 417  0000               L161_JumpToBootloader:
 421                     ; 93 	return ;
 424  0000 81            	ret	
 451                     ; 97 sint8 McuJob(void)
 451                     ; 98 {
 452                     .text:	section	.text,new
 453  0000               _McuJob:
 457                     ; 99 	if(McuRstFlag)
 459  0000 b600          	ld	a,L3_McuRstFlag
 460  0002 2705          	jreq	L302
 461                     ; 101 		SaveBefRst();
 463  0004 cd0000        	call	L741_SaveBefRst
 465  0007               L502:
 466                     ; 102 		while(1); // 等待看门狗重启
 468  0007 20fe          	jra	L502
 469  0009               L302:
 470                     ; 105 	if(McuBootloaderFlag)
 472  0009 b601          	ld	a,L5_McuBootloaderFlag
 473  000b 2706          	jreq	L112
 474                     ; 107 		SaveBefRst();
 476  000d cd0000        	call	L741_SaveBefRst
 478                     ; 108 		JumpToBootloader();
 480  0010 cd0000        	call	L161_JumpToBootloader
 482  0013               L112:
 483                     ; 110 }
 486  0013 81            	ret	
 601                     	switch	.ubsct
 602  0000               _tMcuCtrl:
 603  0000 000000000000  	ds.b	13
 604                     	xdef	_tMcuCtrl
 605                     	xdef	_McuJob
 606                     	xdef	_SetBootloaderFlag
 607                     	xdef	_SetRstFlag
 608                     	xdef	_GetMcuTime
 609                     	xdef	_SetMcuTime
 610                     	xdef	_McuInit
 611                     	xref	_InitMsTimeout
 612                     	xref	_GPIO_Init
 613                     	xref	_CLK_GetFlagStatus
 614                     	xref	_CLK_SYSCLKDivConfig
 615                     	xref	_CLK_SYSCLKSourceConfig
 616                     	xref	_CLK_HSICmd
 636                     	end
