   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 168 void TIM5_DeInit(void)
  33                     ; 169 {
  35                     .text:	section	.text,new
  36  0000               _TIM5_DeInit:
  40                     ; 170   TIM5->CR1 = TIM_CR1_RESET_VALUE;
  42  0000 725f5300      	clr	21248
  43                     ; 171   TIM5->CR2 = TIM_CR2_RESET_VALUE;
  45  0004 725f5301      	clr	21249
  46                     ; 172   TIM5->SMCR = TIM_SMCR_RESET_VALUE;
  48  0008 725f5302      	clr	21250
  49                     ; 173   TIM5->ETR = TIM_ETR_RESET_VALUE;
  51  000c 725f5303      	clr	21251
  52                     ; 174   TIM5->IER = TIM_IER_RESET_VALUE;
  54  0010 725f5305      	clr	21253
  55                     ; 175   TIM5->SR2 = TIM_SR2_RESET_VALUE;
  57  0014 725f5307      	clr	21255
  58                     ; 178   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  60  0018 725f530b      	clr	21259
  61                     ; 180   TIM5->CCMR1 = 0x01;/*TIM5_ICxSource_TIxFPx */
  63  001c 35015309      	mov	21257,#1
  64                     ; 181   TIM5->CCMR2 = 0x01;/*TIM5_ICxSource_TIxFPx */
  66  0020 3501530a      	mov	21258,#1
  67                     ; 184   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  69  0024 725f530b      	clr	21259
  70                     ; 185   TIM5->CCMR1 = TIM_CCMR1_RESET_VALUE;
  72  0028 725f5309      	clr	21257
  73                     ; 186   TIM5->CCMR2 = TIM_CCMR2_RESET_VALUE;
  75  002c 725f530a      	clr	21258
  76                     ; 188   TIM5->CNTRH = TIM_CNTRH_RESET_VALUE;
  78  0030 725f530c      	clr	21260
  79                     ; 189   TIM5->CNTRL = TIM_CNTRL_RESET_VALUE;
  81  0034 725f530d      	clr	21261
  82                     ; 191   TIM5->PSCR = TIM_PSCR_RESET_VALUE;
  84  0038 725f530e      	clr	21262
  85                     ; 193   TIM5->ARRH = TIM_ARRH_RESET_VALUE;
  87  003c 35ff530f      	mov	21263,#255
  88                     ; 194   TIM5->ARRL = TIM_ARRL_RESET_VALUE;
  90  0040 35ff5310      	mov	21264,#255
  91                     ; 196   TIM5->CCR1H = TIM_CCR1H_RESET_VALUE;
  93  0044 725f5311      	clr	21265
  94                     ; 197   TIM5->CCR1L = TIM_CCR1L_RESET_VALUE;
  96  0048 725f5312      	clr	21266
  97                     ; 198   TIM5->CCR2H = TIM_CCR2H_RESET_VALUE;
  99  004c 725f5313      	clr	21267
 100                     ; 199   TIM5->CCR2L = TIM_CCR2L_RESET_VALUE;
 102  0050 725f5314      	clr	21268
 103                     ; 202   TIM5->OISR = TIM_OISR_RESET_VALUE;
 105  0054 725f5316      	clr	21270
 106                     ; 203   TIM5->EGR = 0x01;/* TIM_EGR_UG */
 108  0058 35015308      	mov	21256,#1
 109                     ; 204   TIM5->BKR = TIM_BKR_RESET_VALUE;
 111  005c 725f5315      	clr	21269
 112                     ; 205   TIM5->SR1 = TIM_SR1_RESET_VALUE;
 114  0060 725f5306      	clr	21254
 115                     ; 206 }
 118  0064 81            	ret	
 280                     ; 231 void TIM5_TimeBaseInit(TIM5_Prescaler_TypeDef TIM5_Prescaler,
 280                     ; 232                        TIM5_CounterMode_TypeDef TIM5_CounterMode,
 280                     ; 233                        uint16_t TIM5_Period)
 280                     ; 234 {
 281                     .text:	section	.text,new
 282  0000               _TIM5_TimeBaseInit:
 284  0000 89            	pushw	x
 285       00000000      OFST:	set	0
 288                     ; 236   assert_param(IS_TIM5_PRESCALER(TIM5_Prescaler));
 290                     ; 237   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 292                     ; 242   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
 294  0001 7b05          	ld	a,(OFST+5,sp)
 295  0003 c7530f        	ld	21263,a
 296                     ; 243   TIM5->ARRL = (uint8_t)(TIM5_Period);
 298  0006 7b06          	ld	a,(OFST+6,sp)
 299  0008 c75310        	ld	21264,a
 300                     ; 246   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
 302  000b 9e            	ld	a,xh
 303  000c c7530e        	ld	21262,a
 304                     ; 249   TIM5->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 306  000f c65300        	ld	a,21248
 307  0012 a48f          	and	a,#143
 308  0014 c75300        	ld	21248,a
 309                     ; 250   TIM5->CR1 |= (uint8_t)(TIM5_CounterMode);
 311  0017 9f            	ld	a,xl
 312  0018 ca5300        	or	a,21248
 313  001b c75300        	ld	21248,a
 314                     ; 253   TIM5->EGR = TIM5_EventSource_Update;
 316  001e 35015308      	mov	21256,#1
 317                     ; 254 }
 320  0022 85            	popw	x
 321  0023 81            	ret	
 389                     ; 274 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
 389                     ; 275                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
 389                     ; 276 {
 390                     .text:	section	.text,new
 391  0000               _TIM5_PrescalerConfig:
 395                     ; 278   assert_param(IS_TIM5_PRESCALER(Prescaler));
 397                     ; 279   assert_param(IS_TIM5_PRESCALER_RELOAD(TIM5_PSCReloadMode));
 399                     ; 282   TIM5->PSCR = (uint8_t)(Prescaler);
 401  0000 9e            	ld	a,xh
 402  0001 c7530e        	ld	21262,a
 403                     ; 285   if (TIM5_PSCReloadMode == TIM5_PSCReloadMode_Immediate)
 405  0004 9f            	ld	a,xl
 406  0005 4a            	dec	a
 407  0006 2605          	jrne	L741
 408                     ; 287     TIM5->EGR |= TIM_EGR_UG ;
 410  0008 72105308      	bset	21256,#0
 413  000c 81            	ret	
 414  000d               L741:
 415                     ; 291     TIM5->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 417  000d 72115308      	bres	21256,#0
 418                     ; 293 }
 421  0011 81            	ret	
 466                     ; 306 void TIM5_CounterModeConfig(TIM5_CounterMode_TypeDef TIM5_CounterMode)
 466                     ; 307 {
 467                     .text:	section	.text,new
 468  0000               _TIM5_CounterModeConfig:
 470  0000 88            	push	a
 471  0001 88            	push	a
 472       00000001      OFST:	set	1
 475                     ; 308   uint8_t tmpcr1 = 0;
 477  0002 0f01          	clr	(OFST+0,sp)
 478                     ; 311   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 480                     ; 313   tmpcr1 = TIM5->CR1;
 482  0004 c65300        	ld	a,21248
 483                     ; 316   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 485  0007 a48f          	and	a,#143
 486                     ; 319   tmpcr1 |= (uint8_t)TIM5_CounterMode;
 488  0009 1a02          	or	a,(OFST+1,sp)
 489                     ; 321   TIM5->CR1 = tmpcr1;
 491  000b c75300        	ld	21248,a
 492                     ; 322 }
 495  000e 85            	popw	x
 496  000f 81            	ret	
 530                     ; 330 void TIM5_SetCounter(uint16_t Counter)
 530                     ; 331 {
 531                     .text:	section	.text,new
 532  0000               _TIM5_SetCounter:
 536                     ; 334   TIM5->CNTRH = (uint8_t)(Counter >> 8);
 538  0000 9e            	ld	a,xh
 539  0001 c7530c        	ld	21260,a
 540                     ; 335   TIM5->CNTRL = (uint8_t)(Counter);
 542  0004 9f            	ld	a,xl
 543  0005 c7530d        	ld	21261,a
 544                     ; 336 }
 547  0008 81            	ret	
 581                     ; 344 void TIM5_SetAutoreload(uint16_t Autoreload)
 581                     ; 345 {
 582                     .text:	section	.text,new
 583  0000               _TIM5_SetAutoreload:
 587                     ; 347   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
 589  0000 9e            	ld	a,xh
 590  0001 c7530f        	ld	21263,a
 591                     ; 348   TIM5->ARRL = (uint8_t)(Autoreload);
 593  0004 9f            	ld	a,xl
 594  0005 c75310        	ld	21264,a
 595                     ; 349 }
 598  0008 81            	ret	
 650                     ; 356 uint16_t TIM5_GetCounter(void)
 650                     ; 357 {
 651                     .text:	section	.text,new
 652  0000               _TIM5_GetCounter:
 654  0000 5204          	subw	sp,#4
 655       00000004      OFST:	set	4
 658                     ; 358   uint16_t tmpcnt = 0;
 660                     ; 361   tmpcntrh = TIM5->CNTRH;
 662  0002 c6530c        	ld	a,21260
 663  0005 6b02          	ld	(OFST-2,sp),a
 664                     ; 362   tmpcntrl = TIM5->CNTRL;
 666  0007 c6530d        	ld	a,21261
 667  000a 6b01          	ld	(OFST-3,sp),a
 668                     ; 364   tmpcnt = (uint16_t)(tmpcntrl);
 670  000c 5f            	clrw	x
 671  000d 97            	ld	xl,a
 672  000e 1f03          	ldw	(OFST-1,sp),x
 673                     ; 365   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 675  0010 7b02          	ld	a,(OFST-2,sp)
 676  0012 97            	ld	xl,a
 677  0013 7b04          	ld	a,(OFST+0,sp)
 678  0015 01            	rrwa	x,a
 679  0016 1a03          	or	a,(OFST-1,sp)
 680  0018 01            	rrwa	x,a
 681                     ; 367   return ((uint16_t)tmpcnt);
 685  0019 5b04          	addw	sp,#4
 686  001b 81            	ret	
 710                     ; 383 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
 710                     ; 384 {
 711                     .text:	section	.text,new
 712  0000               _TIM5_GetPrescaler:
 716                     ; 386   return ((TIM5_Prescaler_TypeDef)TIM5->PSCR);
 718  0000 c6530e        	ld	a,21262
 721  0003 81            	ret	
 777                     ; 396 void TIM5_UpdateDisableConfig(FunctionalState NewState)
 777                     ; 397 {
 778                     .text:	section	.text,new
 779  0000               _TIM5_UpdateDisableConfig:
 783                     ; 399   assert_param(IS_FUNCTIONAL_STATE(NewState));
 785                     ; 402   if (NewState != DISABLE)
 787  0000 4d            	tnz	a
 788  0001 2705          	jreq	L513
 789                     ; 404     TIM5->CR1 |= TIM_CR1_UDIS;
 791  0003 72125300      	bset	21248,#1
 794  0007 81            	ret	
 795  0008               L513:
 796                     ; 408     TIM5->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 798  0008 72135300      	bres	21248,#1
 799                     ; 410 }
 802  000c 81            	ret	
 860                     ; 420 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
 860                     ; 421 {
 861                     .text:	section	.text,new
 862  0000               _TIM5_UpdateRequestConfig:
 866                     ; 423   assert_param(IS_TIM5_UPDATE_SOURCE(TIM5_UpdateSource));
 868                     ; 426   if (TIM5_UpdateSource == TIM5_UpdateSource_Regular)
 870  0000 4a            	dec	a
 871  0001 2605          	jrne	L743
 872                     ; 428     TIM5->CR1 |= TIM_CR1_URS ;
 874  0003 72145300      	bset	21248,#2
 877  0007 81            	ret	
 878  0008               L743:
 879                     ; 432     TIM5->CR1 &= (uint8_t)(~TIM_CR1_URS);
 881  0008 72155300      	bres	21248,#2
 882                     ; 434 }
 885  000c 81            	ret	
 921                     ; 442 void TIM5_ARRPreloadConfig(FunctionalState NewState)
 921                     ; 443 {
 922                     .text:	section	.text,new
 923  0000               _TIM5_ARRPreloadConfig:
 927                     ; 445   assert_param(IS_FUNCTIONAL_STATE(NewState));
 929                     ; 448   if (NewState != DISABLE)
 931  0000 4d            	tnz	a
 932  0001 2705          	jreq	L173
 933                     ; 450     TIM5->CR1 |= TIM_CR1_ARPE;
 935  0003 721e5300      	bset	21248,#7
 938  0007 81            	ret	
 939  0008               L173:
 940                     ; 454     TIM5->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 942  0008 721f5300      	bres	21248,#7
 943                     ; 456 }
 946  000c 81            	ret	
1003                     ; 466 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
1003                     ; 467 {
1004                     .text:	section	.text,new
1005  0000               _TIM5_SelectOnePulseMode:
1009                     ; 469   assert_param(IS_TIM5_OPM_MODE(TIM5_OPMode));
1011                     ; 472   if (TIM5_OPMode == TIM5_OPMode_Single)
1013  0000 4a            	dec	a
1014  0001 2605          	jrne	L324
1015                     ; 474     TIM5->CR1 |= TIM_CR1_OPM ;
1017  0003 72165300      	bset	21248,#3
1020  0007 81            	ret	
1021  0008               L324:
1022                     ; 478     TIM5->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1024  0008 72175300      	bres	21248,#3
1025                     ; 480 }
1028  000c 81            	ret	
1063                     ; 488 void TIM5_Cmd(FunctionalState NewState)
1063                     ; 489 {
1064                     .text:	section	.text,new
1065  0000               _TIM5_Cmd:
1069                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
1071                     ; 494   if (NewState != DISABLE)
1073  0000 4d            	tnz	a
1074  0001 2705          	jreq	L544
1075                     ; 496     TIM5->CR1 |= TIM_CR1_CEN;
1077  0003 72105300      	bset	21248,#0
1080  0007 81            	ret	
1081  0008               L544:
1082                     ; 500     TIM5->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1084  0008 72115300      	bres	21248,#0
1085                     ; 502 }
1088  000c 81            	ret	
1286                     ; 578 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1286                     ; 579                   TIM5_OutputState_TypeDef TIM5_OutputState,
1286                     ; 580                   uint16_t TIM5_Pulse,
1286                     ; 581                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1286                     ; 582                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1286                     ; 583 {
1287                     .text:	section	.text,new
1288  0000               _TIM5_OC1Init:
1290  0000 89            	pushw	x
1291  0001 88            	push	a
1292       00000001      OFST:	set	1
1295                     ; 584   uint8_t tmpccmr1 = 0;
1297  0002 0f01          	clr	(OFST+0,sp)
1298                     ; 587   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1300                     ; 588   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1302                     ; 589   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1304                     ; 590   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1306                     ; 592   tmpccmr1 = TIM5->CCMR1;
1308  0004 c65309        	ld	a,21257
1309  0007 6b01          	ld	(OFST+0,sp),a
1310                     ; 595   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1312  0009 7211530b      	bres	21259,#0
1313                     ; 597   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1315  000d a48f          	and	a,#143
1316  000f 6b01          	ld	(OFST+0,sp),a
1317                     ; 600   tmpccmr1 |= (uint8_t)TIM5_OCMode;
1319  0011 9e            	ld	a,xh
1320  0012 1a01          	or	a,(OFST+0,sp)
1321  0014 6b01          	ld	(OFST+0,sp),a
1322                     ; 602   TIM5->CCMR1 = tmpccmr1;
1324  0016 c75309        	ld	21257,a
1325                     ; 605   if (TIM5_OutputState == TIM5_OutputState_Enable)
1327  0019 9f            	ld	a,xl
1328  001a 4a            	dec	a
1329  001b 2606          	jrne	L365
1330                     ; 607     TIM5->CCER1 |= TIM_CCER1_CC1E;
1332  001d 7210530b      	bset	21259,#0
1334  0021 2004          	jra	L565
1335  0023               L365:
1336                     ; 611     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1338  0023 7211530b      	bres	21259,#0
1339  0027               L565:
1340                     ; 615   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1342  0027 7b08          	ld	a,(OFST+7,sp)
1343  0029 4a            	dec	a
1344  002a 2606          	jrne	L765
1345                     ; 617     TIM5->CCER1 |= TIM_CCER1_CC1P;
1347  002c 7212530b      	bset	21259,#1
1349  0030 2004          	jra	L175
1350  0032               L765:
1351                     ; 621     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1353  0032 7213530b      	bres	21259,#1
1354  0036               L175:
1355                     ; 625   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1357  0036 7b09          	ld	a,(OFST+8,sp)
1358  0038 4a            	dec	a
1359  0039 2606          	jrne	L375
1360                     ; 627     TIM5->OISR |= TIM_OISR_OIS1;
1362  003b 72105316      	bset	21270,#0
1364  003f 2004          	jra	L575
1365  0041               L375:
1366                     ; 631     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1368  0041 72115316      	bres	21270,#0
1369  0045               L575:
1370                     ; 635   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
1372  0045 7b06          	ld	a,(OFST+5,sp)
1373  0047 c75311        	ld	21265,a
1374                     ; 636   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
1376  004a 7b07          	ld	a,(OFST+6,sp)
1377  004c c75312        	ld	21266,a
1378                     ; 637 }
1381  004f 5b03          	addw	sp,#3
1382  0051 81            	ret	
1465                     ; 664 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1465                     ; 665                   TIM5_OutputState_TypeDef TIM5_OutputState,
1465                     ; 666                   uint16_t TIM5_Pulse,
1465                     ; 667                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1465                     ; 668                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1465                     ; 669 {
1466                     .text:	section	.text,new
1467  0000               _TIM5_OC2Init:
1469  0000 89            	pushw	x
1470  0001 88            	push	a
1471       00000001      OFST:	set	1
1474                     ; 670   uint8_t tmpccmr2 = 0;
1476  0002 0f01          	clr	(OFST+0,sp)
1477                     ; 673   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1479                     ; 674   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1481                     ; 675   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1483                     ; 676   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1485                     ; 678   tmpccmr2 = TIM5->CCMR2;
1487  0004 c6530a        	ld	a,21258
1488  0007 6b01          	ld	(OFST+0,sp),a
1489                     ; 681   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1491  0009 7219530b      	bres	21259,#4
1492                     ; 684   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1494  000d a48f          	and	a,#143
1495  000f 6b01          	ld	(OFST+0,sp),a
1496                     ; 687   tmpccmr2 |= (uint8_t)TIM5_OCMode;
1498  0011 9e            	ld	a,xh
1499  0012 1a01          	or	a,(OFST+0,sp)
1500  0014 6b01          	ld	(OFST+0,sp),a
1501                     ; 689   TIM5->CCMR2 = tmpccmr2;
1503  0016 c7530a        	ld	21258,a
1504                     ; 692   if (TIM5_OutputState == TIM5_OutputState_Enable)
1506  0019 9f            	ld	a,xl
1507  001a 4a            	dec	a
1508  001b 2606          	jrne	L146
1509                     ; 694     TIM5->CCER1 |= TIM_CCER1_CC2E;
1511  001d 7218530b      	bset	21259,#4
1513  0021 2004          	jra	L346
1514  0023               L146:
1515                     ; 698     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1517  0023 7219530b      	bres	21259,#4
1518  0027               L346:
1519                     ; 702   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1521  0027 7b08          	ld	a,(OFST+7,sp)
1522  0029 4a            	dec	a
1523  002a 2606          	jrne	L546
1524                     ; 704     TIM5->CCER1 |= TIM_CCER1_CC2P;
1526  002c 721a530b      	bset	21259,#5
1528  0030 2004          	jra	L746
1529  0032               L546:
1530                     ; 708     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1532  0032 721b530b      	bres	21259,#5
1533  0036               L746:
1534                     ; 713   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1536  0036 7b09          	ld	a,(OFST+8,sp)
1537  0038 4a            	dec	a
1538  0039 2606          	jrne	L156
1539                     ; 715     TIM5->OISR |= TIM_OISR_OIS2;
1541  003b 72145316      	bset	21270,#2
1543  003f 2004          	jra	L356
1544  0041               L156:
1545                     ; 719     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1547  0041 72155316      	bres	21270,#2
1548  0045               L356:
1549                     ; 723   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
1551  0045 7b06          	ld	a,(OFST+5,sp)
1552  0047 c75313        	ld	21267,a
1553                     ; 724   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
1555  004a 7b07          	ld	a,(OFST+6,sp)
1556  004c c75314        	ld	21268,a
1557                     ; 725 }
1560  004f 5b03          	addw	sp,#3
1561  0051 81            	ret	
1759                     ; 754 void TIM5_BKRConfig(TIM5_OSSIState_TypeDef TIM5_OSSIState,
1759                     ; 755                     TIM5_LockLevel_TypeDef TIM5_LockLevel,
1759                     ; 756                     TIM5_BreakState_TypeDef TIM5_BreakState,
1759                     ; 757                     TIM5_BreakPolarity_TypeDef TIM5_BreakPolarity,
1759                     ; 758                     TIM5_AutomaticOutput_TypeDef TIM5_AutomaticOutput)
1759                     ; 759 
1759                     ; 760 {
1760                     .text:	section	.text,new
1761  0000               _TIM5_BKRConfig:
1763  0000 89            	pushw	x
1764  0001 88            	push	a
1765       00000001      OFST:	set	1
1768                     ; 762   assert_param(IS_TIM5_OSSI_STATE(TIM5_OSSIState));
1770                     ; 763   assert_param(IS_TIM5_LOCK_LEVEL(TIM5_LockLevel));
1772                     ; 764   assert_param(IS_TIM5_BREAK_STATE(TIM5_BreakState));
1774                     ; 765   assert_param(IS_TIM5_BREAK_POLARITY(TIM5_BreakPolarity));
1776                     ; 766   assert_param(IS_TIM5_AUTOMATIC_OUTPUT_STATE(TIM5_AutomaticOutput));
1778                     ; 772   TIM5->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM5_OSSIState | (uint8_t)TIM5_LockLevel) | \
1778                     ; 773                                   (uint8_t)((uint8_t)TIM5_BreakState | (uint8_t)TIM5_BreakPolarity)) | \
1778                     ; 774                                   TIM5_AutomaticOutput));
1780  0002 7b06          	ld	a,(OFST+5,sp)
1781  0004 1a07          	or	a,(OFST+6,sp)
1782  0006 6b01          	ld	(OFST+0,sp),a
1783  0008 9f            	ld	a,xl
1784  0009 1a02          	or	a,(OFST+1,sp)
1785  000b 1a01          	or	a,(OFST+0,sp)
1786  000d 1a08          	or	a,(OFST+7,sp)
1787  000f c75315        	ld	21269,a
1788                     ; 775 }
1791  0012 5b03          	addw	sp,#3
1792  0014 81            	ret	
1828                     ; 783 void TIM5_CtrlPWMOutputs(FunctionalState NewState)
1828                     ; 784 {
1829                     .text:	section	.text,new
1830  0000               _TIM5_CtrlPWMOutputs:
1834                     ; 786   assert_param(IS_FUNCTIONAL_STATE(NewState));
1836                     ; 790   if (NewState != DISABLE)
1838  0000 4d            	tnz	a
1839  0001 2705          	jreq	L5001
1840                     ; 792     TIM5->BKR |= TIM_BKR_MOE ;
1842  0003 721e5315      	bset	21269,#7
1845  0007 81            	ret	
1846  0008               L5001:
1847                     ; 796     TIM5->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1849  0008 721f5315      	bres	21269,#7
1850                     ; 798 }
1853  000c 81            	ret	
1918                     ; 818 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel,
1918                     ; 819                      TIM5_OCMode_TypeDef TIM5_OCMode)
1918                     ; 820 {
1919                     .text:	section	.text,new
1920  0000               _TIM5_SelectOCxM:
1922  0000 89            	pushw	x
1923       00000000      OFST:	set	0
1926                     ; 822   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
1928                     ; 823   assert_param(IS_TIM5_OCM(TIM5_OCMode));
1930                     ; 825   if (TIM5_Channel == TIM5_Channel_1)
1932  0001 9e            	ld	a,xh
1933  0002 4d            	tnz	a
1934  0003 2615          	jrne	L3401
1935                     ; 828     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1937  0005 7211530b      	bres	21259,#0
1938                     ; 831     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1940  0009 c65309        	ld	a,21257
1941  000c a48f          	and	a,#143
1942  000e c75309        	ld	21257,a
1943                     ; 834     TIM5->CCMR1 |= (uint8_t)TIM5_OCMode;
1945  0011 9f            	ld	a,xl
1946  0012 ca5309        	or	a,21257
1947  0015 c75309        	ld	21257,a
1949  0018 2014          	jra	L5401
1950  001a               L3401:
1951                     ; 839     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1953  001a 7219530b      	bres	21259,#4
1954                     ; 842     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1956  001e c6530a        	ld	a,21258
1957  0021 a48f          	and	a,#143
1958  0023 c7530a        	ld	21258,a
1959                     ; 845     TIM5->CCMR2 |= (uint8_t)TIM5_OCMode;
1961  0026 c6530a        	ld	a,21258
1962  0029 1a02          	or	a,(OFST+2,sp)
1963  002b c7530a        	ld	21258,a
1964  002e               L5401:
1965                     ; 847 }
1968  002e 85            	popw	x
1969  002f 81            	ret	
2003                     ; 855 void TIM5_SetCompare1(uint16_t Compare)
2003                     ; 856 {
2004                     .text:	section	.text,new
2005  0000               _TIM5_SetCompare1:
2009                     ; 858   TIM5->CCR1H = (uint8_t)(Compare >> 8);
2011  0000 9e            	ld	a,xh
2012  0001 c75311        	ld	21265,a
2013                     ; 859   TIM5->CCR1L = (uint8_t)(Compare);
2015  0004 9f            	ld	a,xl
2016  0005 c75312        	ld	21266,a
2017                     ; 860 }
2020  0008 81            	ret	
2054                     ; 868 void TIM5_SetCompare2(uint16_t Compare)
2054                     ; 869 {
2055                     .text:	section	.text,new
2056  0000               _TIM5_SetCompare2:
2060                     ; 871   TIM5->CCR2H = (uint8_t)(Compare >> 8);
2062  0000 9e            	ld	a,xh
2063  0001 c75313        	ld	21267,a
2064                     ; 872   TIM5->CCR2L = (uint8_t)(Compare);
2066  0004 9f            	ld	a,xl
2067  0005 c75314        	ld	21268,a
2068                     ; 873 }
2071  0008 81            	ret	
2138                     ; 883 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2138                     ; 884 {
2139                     .text:	section	.text,new
2140  0000               _TIM5_ForcedOC1Config:
2142  0000 88            	push	a
2143  0001 88            	push	a
2144       00000001      OFST:	set	1
2147                     ; 885   uint8_t tmpccmr1 = 0;
2149  0002 0f01          	clr	(OFST+0,sp)
2150                     ; 888   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2152                     ; 890   tmpccmr1 = TIM5->CCMR1;
2154  0004 c65309        	ld	a,21257
2155                     ; 893   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2157  0007 a48f          	and	a,#143
2158                     ; 896   tmpccmr1 |= (uint8_t)TIM5_ForcedAction;
2160  0009 1a02          	or	a,(OFST+1,sp)
2161                     ; 898   TIM5->CCMR1 = tmpccmr1;
2163  000b c75309        	ld	21257,a
2164                     ; 899 }
2167  000e 85            	popw	x
2168  000f 81            	ret	
2213                     ; 909 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2213                     ; 910 {
2214                     .text:	section	.text,new
2215  0000               _TIM5_ForcedOC2Config:
2217  0000 88            	push	a
2218  0001 88            	push	a
2219       00000001      OFST:	set	1
2222                     ; 911   uint8_t tmpccmr2 = 0;
2224  0002 0f01          	clr	(OFST+0,sp)
2225                     ; 914   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2227                     ; 916   tmpccmr2 = TIM5->CCMR2;
2229  0004 c6530a        	ld	a,21258
2230                     ; 919   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2232  0007 a48f          	and	a,#143
2233                     ; 922   tmpccmr2 |= (uint8_t)TIM5_ForcedAction;
2235  0009 1a02          	or	a,(OFST+1,sp)
2236                     ; 924   TIM5->CCMR2 = tmpccmr2;
2238  000b c7530a        	ld	21258,a
2239                     ; 925 }
2242  000e 85            	popw	x
2243  000f 81            	ret	
2279                     ; 933 void TIM5_OC1PreloadConfig(FunctionalState NewState)
2279                     ; 934 {
2280                     .text:	section	.text,new
2281  0000               _TIM5_OC1PreloadConfig:
2285                     ; 936   assert_param(IS_FUNCTIONAL_STATE(NewState));
2287                     ; 939   if (NewState != DISABLE)
2289  0000 4d            	tnz	a
2290  0001 2705          	jreq	L5711
2291                     ; 941     TIM5->CCMR1 |= TIM_CCMR_OCxPE ;
2293  0003 72165309      	bset	21257,#3
2296  0007 81            	ret	
2297  0008               L5711:
2298                     ; 945     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2300  0008 72175309      	bres	21257,#3
2301                     ; 947 }
2304  000c 81            	ret	
2340                     ; 955 void TIM5_OC2PreloadConfig(FunctionalState NewState)
2340                     ; 956 {
2341                     .text:	section	.text,new
2342  0000               _TIM5_OC2PreloadConfig:
2346                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2348                     ; 961   if (NewState != DISABLE)
2350  0000 4d            	tnz	a
2351  0001 2705          	jreq	L7121
2352                     ; 963     TIM5->CCMR2 |= TIM_CCMR_OCxPE ;
2354  0003 7216530a      	bset	21258,#3
2357  0007 81            	ret	
2358  0008               L7121:
2359                     ; 967     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2361  0008 7217530a      	bres	21258,#3
2362                     ; 969 }
2365  000c 81            	ret	
2400                     ; 977 void TIM5_OC1FastConfig(FunctionalState NewState)
2400                     ; 978 {
2401                     .text:	section	.text,new
2402  0000               _TIM5_OC1FastConfig:
2406                     ; 980   assert_param(IS_FUNCTIONAL_STATE(NewState));
2408                     ; 983   if (NewState != DISABLE)
2410  0000 4d            	tnz	a
2411  0001 2705          	jreq	L1421
2412                     ; 985     TIM5->CCMR1 |= TIM_CCMR_OCxFE ;
2414  0003 72145309      	bset	21257,#2
2417  0007 81            	ret	
2418  0008               L1421:
2419                     ; 989     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2421  0008 72155309      	bres	21257,#2
2422                     ; 991 }
2425  000c 81            	ret	
2460                     ; 1000 void TIM5_OC2FastConfig(FunctionalState NewState)
2460                     ; 1001 {
2461                     .text:	section	.text,new
2462  0000               _TIM5_OC2FastConfig:
2466                     ; 1003   assert_param(IS_FUNCTIONAL_STATE(NewState));
2468                     ; 1006   if (NewState != DISABLE)
2470  0000 4d            	tnz	a
2471  0001 2705          	jreq	L3621
2472                     ; 1008     TIM5->CCMR2 |= TIM_CCMR_OCxFE ;
2474  0003 7214530a      	bset	21258,#2
2477  0007 81            	ret	
2478  0008               L3621:
2479                     ; 1012     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2481  0008 7215530a      	bres	21258,#2
2482                     ; 1014 }
2485  000c 81            	ret	
2521                     ; 1024 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2521                     ; 1025 {
2522                     .text:	section	.text,new
2523  0000               _TIM5_OC1PolarityConfig:
2527                     ; 1027   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2529                     ; 1030   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2531  0000 4a            	dec	a
2532  0001 2605          	jrne	L5031
2533                     ; 1032     TIM5->CCER1 |= TIM_CCER1_CC1P ;
2535  0003 7212530b      	bset	21259,#1
2538  0007 81            	ret	
2539  0008               L5031:
2540                     ; 1036     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2542  0008 7213530b      	bres	21259,#1
2543                     ; 1038 }
2546  000c 81            	ret	
2582                     ; 1048 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2582                     ; 1049 {
2583                     .text:	section	.text,new
2584  0000               _TIM5_OC2PolarityConfig:
2588                     ; 1051   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2590                     ; 1054   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2592  0000 4a            	dec	a
2593  0001 2605          	jrne	L7231
2594                     ; 1056     TIM5->CCER1 |= TIM_CCER1_CC2P ;
2596  0003 721a530b      	bset	21259,#5
2599  0007 81            	ret	
2600  0008               L7231:
2601                     ; 1060     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2603  0008 721b530b      	bres	21259,#5
2604                     ; 1062 }
2607  000c 81            	ret	
2652                     ; 1074 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel,
2652                     ; 1075                  FunctionalState NewState)
2652                     ; 1076 {
2653                     .text:	section	.text,new
2654  0000               _TIM5_CCxCmd:
2656  0000 89            	pushw	x
2657       00000000      OFST:	set	0
2660                     ; 1078   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2662                     ; 1079   assert_param(IS_FUNCTIONAL_STATE(NewState));
2664                     ; 1081   if (TIM5_Channel == TIM5_Channel_1)
2666  0001 9e            	ld	a,xh
2667  0002 4d            	tnz	a
2668  0003 2610          	jrne	L5531
2669                     ; 1084     if (NewState != DISABLE)
2671  0005 9f            	ld	a,xl
2672  0006 4d            	tnz	a
2673  0007 2706          	jreq	L7531
2674                     ; 1086       TIM5->CCER1 |= TIM_CCER1_CC1E ;
2676  0009 7210530b      	bset	21259,#0
2678  000d 2014          	jra	L3631
2679  000f               L7531:
2680                     ; 1090       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2682  000f 7211530b      	bres	21259,#0
2683  0013 200e          	jra	L3631
2684  0015               L5531:
2685                     ; 1097     if (NewState != DISABLE)
2687  0015 7b02          	ld	a,(OFST+2,sp)
2688  0017 2706          	jreq	L5631
2689                     ; 1099       TIM5->CCER1 |= TIM_CCER1_CC2E;
2691  0019 7218530b      	bset	21259,#4
2693  001d 2004          	jra	L3631
2694  001f               L5631:
2695                     ; 1103       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2697  001f 7219530b      	bres	21259,#4
2698  0023               L3631:
2699                     ; 1106 }
2702  0023 85            	popw	x
2703  0024 81            	ret	
2867                     ; 1184 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
2867                     ; 1185                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
2867                     ; 1186                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
2867                     ; 1187                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
2867                     ; 1188                  uint8_t TIM5_ICFilter)
2867                     ; 1189 {
2868                     .text:	section	.text,new
2869  0000               _TIM5_ICInit:
2871  0000 89            	pushw	x
2872       00000000      OFST:	set	0
2875                     ; 1191   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2877                     ; 1193   if (TIM5_Channel == TIM5_Channel_1)
2879  0001 9e            	ld	a,xh
2880  0002 4d            	tnz	a
2881  0003 2614          	jrne	L5641
2882                     ; 1196     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2884  0005 7b07          	ld	a,(OFST+7,sp)
2885  0007 88            	push	a
2886  0008 7b06          	ld	a,(OFST+6,sp)
2887  000a 97            	ld	xl,a
2888  000b 7b03          	ld	a,(OFST+3,sp)
2889  000d 95            	ld	xh,a
2890  000e cd0000        	call	L3_TI1_Config
2892  0011 84            	pop	a
2893                     ; 1199     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
2895  0012 7b06          	ld	a,(OFST+6,sp)
2896  0014 cd0000        	call	_TIM5_SetIC1Prescaler
2899  0017 2012          	jra	L7641
2900  0019               L5641:
2901                     ; 1204     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2903  0019 7b07          	ld	a,(OFST+7,sp)
2904  001b 88            	push	a
2905  001c 7b06          	ld	a,(OFST+6,sp)
2906  001e 97            	ld	xl,a
2907  001f 7b03          	ld	a,(OFST+3,sp)
2908  0021 95            	ld	xh,a
2909  0022 cd0000        	call	L5_TI2_Config
2911  0025 84            	pop	a
2912                     ; 1207     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
2914  0026 7b06          	ld	a,(OFST+6,sp)
2915  0028 cd0000        	call	_TIM5_SetIC2Prescaler
2917  002b               L7641:
2918                     ; 1209 }
2921  002b 85            	popw	x
2922  002c 81            	ret	
3018                     ; 1235 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
3018                     ; 1236                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
3018                     ; 1237                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
3018                     ; 1238                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
3018                     ; 1239                      uint8_t TIM5_ICFilter)
3018                     ; 1240 {
3019                     .text:	section	.text,new
3020  0000               _TIM5_PWMIConfig:
3022  0000 89            	pushw	x
3023  0001 89            	pushw	x
3024       00000002      OFST:	set	2
3027                     ; 1241   uint8_t icpolarity = TIM5_ICPolarity_Rising;
3029                     ; 1242   uint8_t icselection = TIM5_ICSelection_DirectTI;
3031                     ; 1245   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
3033                     ; 1248   if (TIM5_ICPolarity == TIM5_ICPolarity_Rising)
3035  0002 7b04          	ld	a,(OFST+2,sp)
3036  0004 2605          	jrne	L7351
3037                     ; 1250     icpolarity = TIM5_ICPolarity_Falling;
3039  0006 4c            	inc	a
3040  0007 6b01          	ld	(OFST-1,sp),a
3042  0009 2002          	jra	L1451
3043  000b               L7351:
3044                     ; 1254     icpolarity = TIM5_ICPolarity_Rising;
3046  000b 0f01          	clr	(OFST-1,sp)
3047  000d               L1451:
3048                     ; 1258   if (TIM5_ICSelection == TIM5_ICSelection_DirectTI)
3050  000d 7b07          	ld	a,(OFST+5,sp)
3051  000f 4a            	dec	a
3052  0010 2604          	jrne	L3451
3053                     ; 1260     icselection = TIM5_ICSelection_IndirectTI;
3055  0012 a602          	ld	a,#2
3057  0014 2002          	jra	L5451
3058  0016               L3451:
3059                     ; 1264     icselection = TIM5_ICSelection_DirectTI;
3061  0016 a601          	ld	a,#1
3062  0018               L5451:
3063  0018 6b02          	ld	(OFST+0,sp),a
3064                     ; 1267   if (TIM5_Channel == TIM5_Channel_1)
3066  001a 7b03          	ld	a,(OFST+1,sp)
3067  001c 2626          	jrne	L7451
3068                     ; 1270     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection,
3068                     ; 1271                TIM5_ICFilter);
3070  001e 7b09          	ld	a,(OFST+7,sp)
3071  0020 88            	push	a
3072  0021 7b08          	ld	a,(OFST+6,sp)
3073  0023 97            	ld	xl,a
3074  0024 7b05          	ld	a,(OFST+3,sp)
3075  0026 95            	ld	xh,a
3076  0027 cd0000        	call	L3_TI1_Config
3078  002a 84            	pop	a
3079                     ; 1274     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3081  002b 7b08          	ld	a,(OFST+6,sp)
3082  002d cd0000        	call	_TIM5_SetIC1Prescaler
3084                     ; 1277     TI2_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3086  0030 7b09          	ld	a,(OFST+7,sp)
3087  0032 88            	push	a
3088  0033 7b03          	ld	a,(OFST+1,sp)
3089  0035 97            	ld	xl,a
3090  0036 7b02          	ld	a,(OFST+0,sp)
3091  0038 95            	ld	xh,a
3092  0039 cd0000        	call	L5_TI2_Config
3094  003c 84            	pop	a
3095                     ; 1280     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3097  003d 7b08          	ld	a,(OFST+6,sp)
3098  003f cd0000        	call	_TIM5_SetIC2Prescaler
3101  0042 2024          	jra	L1551
3102  0044               L7451:
3103                     ; 1285     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection,
3103                     ; 1286                TIM5_ICFilter);
3105  0044 7b09          	ld	a,(OFST+7,sp)
3106  0046 88            	push	a
3107  0047 7b08          	ld	a,(OFST+6,sp)
3108  0049 97            	ld	xl,a
3109  004a 7b05          	ld	a,(OFST+3,sp)
3110  004c 95            	ld	xh,a
3111  004d cd0000        	call	L5_TI2_Config
3113  0050 84            	pop	a
3114                     ; 1289     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3116  0051 7b08          	ld	a,(OFST+6,sp)
3117  0053 cd0000        	call	_TIM5_SetIC2Prescaler
3119                     ; 1292     TI1_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3121  0056 7b09          	ld	a,(OFST+7,sp)
3122  0058 88            	push	a
3123  0059 7b03          	ld	a,(OFST+1,sp)
3124  005b 97            	ld	xl,a
3125  005c 7b02          	ld	a,(OFST+0,sp)
3126  005e 95            	ld	xh,a
3127  005f cd0000        	call	L3_TI1_Config
3129  0062 84            	pop	a
3130                     ; 1295     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3132  0063 7b08          	ld	a,(OFST+6,sp)
3133  0065 cd0000        	call	_TIM5_SetIC1Prescaler
3135  0068               L1551:
3136                     ; 1297 }
3139  0068 5b04          	addw	sp,#4
3140  006a 81            	ret	
3192                     ; 1304 uint16_t TIM5_GetCapture1(void)
3192                     ; 1305 {
3193                     .text:	section	.text,new
3194  0000               _TIM5_GetCapture1:
3196  0000 5204          	subw	sp,#4
3197       00000004      OFST:	set	4
3200                     ; 1306   uint16_t tmpccr1 = 0;
3202                     ; 1309   tmpccr1h = TIM5->CCR1H;
3204  0002 c65311        	ld	a,21265
3205  0005 6b02          	ld	(OFST-2,sp),a
3206                     ; 1310   tmpccr1l = TIM5->CCR1L;
3208  0007 c65312        	ld	a,21266
3209  000a 6b01          	ld	(OFST-3,sp),a
3210                     ; 1312   tmpccr1 = (uint16_t)(tmpccr1l);
3212  000c 5f            	clrw	x
3213  000d 97            	ld	xl,a
3214  000e 1f03          	ldw	(OFST-1,sp),x
3215                     ; 1313   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3217  0010 7b02          	ld	a,(OFST-2,sp)
3218  0012 97            	ld	xl,a
3219  0013 7b04          	ld	a,(OFST+0,sp)
3220  0015 01            	rrwa	x,a
3221  0016 1a03          	or	a,(OFST-1,sp)
3222  0018 01            	rrwa	x,a
3223                     ; 1315   return ((uint16_t)tmpccr1);
3227  0019 5b04          	addw	sp,#4
3228  001b 81            	ret	
3280                     ; 1323 uint16_t TIM5_GetCapture2(void)
3280                     ; 1324 {
3281                     .text:	section	.text,new
3282  0000               _TIM5_GetCapture2:
3284  0000 5204          	subw	sp,#4
3285       00000004      OFST:	set	4
3288                     ; 1325   uint16_t tmpccr2 = 0;
3290                     ; 1328   tmpccr2h = TIM5->CCR2H;
3292  0002 c65313        	ld	a,21267
3293  0005 6b02          	ld	(OFST-2,sp),a
3294                     ; 1329   tmpccr2l = TIM5->CCR2L;
3296  0007 c65314        	ld	a,21268
3297  000a 6b01          	ld	(OFST-3,sp),a
3298                     ; 1331   tmpccr2 = (uint16_t)(tmpccr2l);
3300  000c 5f            	clrw	x
3301  000d 97            	ld	xl,a
3302  000e 1f03          	ldw	(OFST-1,sp),x
3303                     ; 1332   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3305  0010 7b02          	ld	a,(OFST-2,sp)
3306  0012 97            	ld	xl,a
3307  0013 7b04          	ld	a,(OFST+0,sp)
3308  0015 01            	rrwa	x,a
3309  0016 1a03          	or	a,(OFST-1,sp)
3310  0018 01            	rrwa	x,a
3311                     ; 1334   return ((uint16_t)tmpccr2);
3315  0019 5b04          	addw	sp,#4
3316  001b 81            	ret	
3361                     ; 1347 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
3361                     ; 1348 {
3362                     .text:	section	.text,new
3363  0000               _TIM5_SetIC1Prescaler:
3365  0000 88            	push	a
3366  0001 88            	push	a
3367       00000001      OFST:	set	1
3370                     ; 1349   uint8_t tmpccmr1 = 0;
3372  0002 0f01          	clr	(OFST+0,sp)
3373                     ; 1352   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC1Prescaler));
3375                     ; 1354   tmpccmr1 = TIM5->CCMR1;
3377  0004 c65309        	ld	a,21257
3378                     ; 1357   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3380  0007 a4f3          	and	a,#243
3381                     ; 1360   tmpccmr1 |= (uint8_t)TIM5_IC1Prescaler;
3383  0009 1a02          	or	a,(OFST+1,sp)
3384                     ; 1362   TIM5->CCMR1 = tmpccmr1;
3386  000b c75309        	ld	21257,a
3387                     ; 1363 }
3390  000e 85            	popw	x
3391  000f 81            	ret	
3436                     ; 1375 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
3436                     ; 1376 {
3437                     .text:	section	.text,new
3438  0000               _TIM5_SetIC2Prescaler:
3440  0000 88            	push	a
3441  0001 88            	push	a
3442       00000001      OFST:	set	1
3445                     ; 1377   uint8_t tmpccmr2 = 0;
3447  0002 0f01          	clr	(OFST+0,sp)
3448                     ; 1380   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC2Prescaler));
3450                     ; 1382   tmpccmr2 = TIM5->CCMR2;
3452  0004 c6530a        	ld	a,21258
3453                     ; 1385   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3455  0007 a4f3          	and	a,#243
3456                     ; 1388   tmpccmr2 |= (uint8_t)TIM5_IC2Prescaler;
3458  0009 1a02          	or	a,(OFST+1,sp)
3459                     ; 1390   TIM5->CCMR2 = tmpccmr2;
3461  000b c7530a        	ld	21258,a
3462                     ; 1391 }
3465  000e 85            	popw	x
3466  000f 81            	ret	
3552                     ; 1422 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
3552                     ; 1423 {
3553                     .text:	section	.text,new
3554  0000               _TIM5_ITConfig:
3556  0000 89            	pushw	x
3557       00000000      OFST:	set	0
3560                     ; 1425   assert_param(IS_TIM5_IT(TIM5_IT));
3562                     ; 1426   assert_param(IS_FUNCTIONAL_STATE(NewState));
3564                     ; 1428   if (NewState != DISABLE)
3566  0001 9f            	ld	a,xl
3567  0002 4d            	tnz	a
3568  0003 2706          	jreq	L3371
3569                     ; 1431     TIM5->IER |= (uint8_t)TIM5_IT;
3571  0005 9e            	ld	a,xh
3572  0006 ca5305        	or	a,21253
3574  0009 2006          	jra	L5371
3575  000b               L3371:
3576                     ; 1436     TIM5->IER &= (uint8_t)(~(uint8_t)TIM5_IT);
3578  000b 7b01          	ld	a,(OFST+1,sp)
3579  000d 43            	cpl	a
3580  000e c45305        	and	a,21253
3581  0011               L5371:
3582  0011 c75305        	ld	21253,a
3583                     ; 1438 }
3586  0014 85            	popw	x
3587  0015 81            	ret	
3668                     ; 1451 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
3668                     ; 1452 {
3669                     .text:	section	.text,new
3670  0000               _TIM5_GenerateEvent:
3674                     ; 1454   assert_param(IS_TIM5_EVENT_SOURCE((uint8_t)TIM5_EventSource));
3676                     ; 1457   TIM5->EGR |= (uint8_t)TIM5_EventSource;
3678  0000 ca5308        	or	a,21256
3679  0003 c75308        	ld	21256,a
3680                     ; 1458 }
3683  0006 81            	ret	
3822                     ; 1473 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
3822                     ; 1474 {
3823                     .text:	section	.text,new
3824  0000               _TIM5_GetFlagStatus:
3826  0000 89            	pushw	x
3827  0001 89            	pushw	x
3828       00000002      OFST:	set	2
3831                     ; 1475   FlagStatus bitstatus = RESET;
3833                     ; 1476   uint8_t tim5_flag_l = 0, tim5_flag_h = 0;
3837  0002 7b02          	ld	a,(OFST+0,sp)
3838  0004 97            	ld	xl,a
3839                     ; 1479   assert_param(IS_TIM5_GET_FLAG(TIM5_FLAG));
3841                     ; 1481   tim5_flag_l = (uint8_t)(TIM5->SR1 & (uint8_t)(TIM5_FLAG));
3843  0005 c65306        	ld	a,21254
3844  0008 1404          	and	a,(OFST+2,sp)
3845  000a 6b01          	ld	(OFST-1,sp),a
3846                     ; 1482   tim5_flag_h = (uint8_t)(TIM5->SR2 & (uint8_t)((uint16_t)TIM5_FLAG >> 8));
3848  000c c65307        	ld	a,21255
3849  000f 1403          	and	a,(OFST+1,sp)
3850  0011 6b02          	ld	(OFST+0,sp),a
3851                     ; 1484   if ((uint8_t)(tim5_flag_l | tim5_flag_h) != 0)
3853  0013 1a01          	or	a,(OFST-1,sp)
3854  0015 2702          	jreq	L7502
3855                     ; 1486     bitstatus = SET;
3857  0017 a601          	ld	a,#1
3859  0019               L7502:
3860                     ; 1490     bitstatus = RESET;
3862                     ; 1492   return ((FlagStatus)bitstatus);
3866  0019 5b04          	addw	sp,#4
3867  001b 81            	ret	
3902                     ; 1506 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
3902                     ; 1507 {
3903                     .text:	section	.text,new
3904  0000               _TIM5_ClearFlag:
3906  0000 89            	pushw	x
3907       00000000      OFST:	set	0
3910                     ; 1509   assert_param(IS_TIM5_CLEAR_FLAG((uint16_t)TIM5_FLAG));
3912                     ; 1511   TIM5->SR1 = (uint8_t)(~(uint8_t)(TIM5_FLAG));
3914  0001 9f            	ld	a,xl
3915  0002 43            	cpl	a
3916  0003 c75306        	ld	21254,a
3917                     ; 1512   TIM5->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM5_FLAG >> 8));
3919  0006 7b01          	ld	a,(OFST+1,sp)
3920  0008 43            	cpl	a
3921  0009 c75307        	ld	21255,a
3922                     ; 1513 }
3925  000c 85            	popw	x
3926  000d 81            	ret	
3990                     ; 1526 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
3990                     ; 1527 {
3991                     .text:	section	.text,new
3992  0000               _TIM5_GetITStatus:
3994  0000 88            	push	a
3995  0001 89            	pushw	x
3996       00000002      OFST:	set	2
3999                     ; 1528   ITStatus bitstatus = RESET;
4001                     ; 1530   uint8_t TIM5_itStatus = 0x0, TIM5_itEnable = 0x0;
4005  0002 7b02          	ld	a,(OFST+0,sp)
4006  0004 97            	ld	xl,a
4007                     ; 1533   assert_param(IS_TIM5_GET_IT(TIM5_IT));
4009                     ; 1535   TIM5_itStatus = (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_IT);
4011  0005 c65306        	ld	a,21254
4012  0008 1403          	and	a,(OFST+1,sp)
4013  000a 6b01          	ld	(OFST-1,sp),a
4014                     ; 1537   TIM5_itEnable = (uint8_t)(TIM5->IER & (uint8_t)TIM5_IT);
4016  000c c65305        	ld	a,21253
4017  000f 1403          	and	a,(OFST+1,sp)
4018  0011 6b02          	ld	(OFST+0,sp),a
4019                     ; 1539   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET))
4021  0013 7b01          	ld	a,(OFST-1,sp)
4022  0015 2708          	jreq	L3312
4024  0017 7b02          	ld	a,(OFST+0,sp)
4025  0019 2704          	jreq	L3312
4026                     ; 1541     bitstatus = (ITStatus)SET;
4028  001b a601          	ld	a,#1
4030  001d 2001          	jra	L5312
4031  001f               L3312:
4032                     ; 1545     bitstatus = (ITStatus)RESET;
4034  001f 4f            	clr	a
4035  0020               L5312:
4036                     ; 1547   return ((ITStatus)bitstatus);
4040  0020 5b03          	addw	sp,#3
4041  0022 81            	ret	
4077                     ; 1561 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
4077                     ; 1562 {
4078                     .text:	section	.text,new
4079  0000               _TIM5_ClearITPendingBit:
4083                     ; 1564   assert_param(IS_TIM5_IT(TIM5_IT));
4085                     ; 1567   TIM5->SR1 = (uint8_t)(~(uint8_t)TIM5_IT);
4087  0000 43            	cpl	a
4088  0001 c75306        	ld	21254,a
4089                     ; 1568 }
4092  0004 81            	ret	
4165                     ; 1581 void TIM5_DMACmd( TIM5_DMASource_TypeDef TIM5_DMASource, FunctionalState NewState)
4165                     ; 1582 {
4166                     .text:	section	.text,new
4167  0000               _TIM5_DMACmd:
4169  0000 89            	pushw	x
4170       00000000      OFST:	set	0
4173                     ; 1584   assert_param(IS_FUNCTIONAL_STATE(NewState));
4175                     ; 1585   assert_param(IS_TIM5_DMA_SOURCE(TIM5_DMASource));
4177                     ; 1587   if (NewState != DISABLE)
4179  0001 9f            	ld	a,xl
4180  0002 4d            	tnz	a
4181  0003 2706          	jreq	L1122
4182                     ; 1590     TIM5->DER |= TIM5_DMASource;
4184  0005 9e            	ld	a,xh
4185  0006 ca5304        	or	a,21252
4187  0009 2006          	jra	L3122
4188  000b               L1122:
4189                     ; 1595     TIM5->DER &= (uint8_t)(~TIM5_DMASource);
4191  000b 7b01          	ld	a,(OFST+1,sp)
4192  000d 43            	cpl	a
4193  000e c45304        	and	a,21252
4194  0011               L3122:
4195  0011 c75304        	ld	21252,a
4196                     ; 1597 }
4199  0014 85            	popw	x
4200  0015 81            	ret	
4235                     ; 1605 void TIM5_SelectCCDMA(FunctionalState NewState)
4235                     ; 1606 {
4236                     .text:	section	.text,new
4237  0000               _TIM5_SelectCCDMA:
4241                     ; 1608   assert_param(IS_FUNCTIONAL_STATE(NewState));
4243                     ; 1610   if (NewState != DISABLE)
4245  0000 4d            	tnz	a
4246  0001 2705          	jreq	L3322
4247                     ; 1613     TIM5->CR2 |= TIM_CR2_CCDS;
4249  0003 72165301      	bset	21249,#3
4252  0007 81            	ret	
4253  0008               L3322:
4254                     ; 1618     TIM5->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4256  0008 72175301      	bres	21249,#3
4257                     ; 1620 }
4260  000c 81            	ret	
4284                     ; 1644 void TIM5_InternalClockConfig(void)
4284                     ; 1645 {
4285                     .text:	section	.text,new
4286  0000               _TIM5_InternalClockConfig:
4290                     ; 1647   TIM5->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4292  0000 c65302        	ld	a,21250
4293  0003 a4f8          	and	a,#248
4294  0005 c75302        	ld	21250,a
4295                     ; 1648 }
4298  0008 81            	ret	
4387                     ; 1665 void TIM5_TIxExternalClockConfig(TIM5_TIxExternalCLK1Source_TypeDef TIM5_TIxExternalCLKSource,
4387                     ; 1666                                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
4387                     ; 1667                                  uint8_t ICFilter)
4387                     ; 1668 {
4388                     .text:	section	.text,new
4389  0000               _TIM5_TIxExternalClockConfig:
4391  0000 89            	pushw	x
4392       00000000      OFST:	set	0
4395                     ; 1670   assert_param(IS_TIM5_TIXCLK_SOURCE(TIM5_TIxExternalCLKSource));
4397                     ; 1671   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
4399                     ; 1672   assert_param(IS_TIM5_IC_FILTER(ICFilter));
4401                     ; 1675   if (TIM5_TIxExternalCLKSource == TIM5_TIxExternalCLK1Source_TI2)
4403  0001 9e            	ld	a,xh
4404  0002 a160          	cp	a,#96
4405  0004 260e          	jrne	L7032
4406                     ; 1677     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4408  0006 7b05          	ld	a,(OFST+5,sp)
4409  0008 88            	push	a
4410  0009 ae0001        	ldw	x,#1
4411  000c 7b03          	ld	a,(OFST+3,sp)
4412  000e 95            	ld	xh,a
4413  000f cd0000        	call	L5_TI2_Config
4416  0012 200c          	jra	L1132
4417  0014               L7032:
4418                     ; 1681     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4420  0014 7b05          	ld	a,(OFST+5,sp)
4421  0016 88            	push	a
4422  0017 ae0001        	ldw	x,#1
4423  001a 7b03          	ld	a,(OFST+3,sp)
4424  001c 95            	ld	xh,a
4425  001d cd0000        	call	L3_TI1_Config
4427  0020               L1132:
4428  0020 84            	pop	a
4429                     ; 1685   TIM5_SelectInputTrigger((TIM5_TRGSelection_TypeDef)TIM5_TIxExternalCLKSource);
4431  0021 7b01          	ld	a,(OFST+1,sp)
4432  0023 cd0000        	call	_TIM5_SelectInputTrigger
4434                     ; 1688   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4436  0026 c65302        	ld	a,21250
4437  0029 aa07          	or	a,#7
4438  002b c75302        	ld	21250,a
4439                     ; 1689 }
4442  002e 85            	popw	x
4443  002f 81            	ret	
4560                     ; 1707 void TIM5_ETRClockMode1Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4560                     ; 1708                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4560                     ; 1709                               uint8_t ExtTRGFilter)
4560                     ; 1710 {
4561                     .text:	section	.text,new
4562  0000               _TIM5_ETRClockMode1Config:
4564  0000 89            	pushw	x
4565       00000000      OFST:	set	0
4568                     ; 1712   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4570  0001 7b05          	ld	a,(OFST+5,sp)
4571  0003 88            	push	a
4572  0004 7b02          	ld	a,(OFST+2,sp)
4573  0006 95            	ld	xh,a
4574  0007 cd0000        	call	_TIM5_ETRConfig
4576  000a 84            	pop	a
4577                     ; 1715   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4579  000b c65302        	ld	a,21250
4580  000e a4f8          	and	a,#248
4581  0010 c75302        	ld	21250,a
4582                     ; 1716   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4584  0013 c65302        	ld	a,21250
4585  0016 aa07          	or	a,#7
4586  0018 c75302        	ld	21250,a
4587                     ; 1719   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4589  001b c65302        	ld	a,21250
4590  001e a48f          	and	a,#143
4591  0020 c75302        	ld	21250,a
4592                     ; 1720   TIM5->SMCR |= (uint8_t)((TIM5_TRGSelection_TypeDef)TIM5_TRGSelection_ETRF);
4594  0023 c65302        	ld	a,21250
4595  0026 aa70          	or	a,#112
4596  0028 c75302        	ld	21250,a
4597                     ; 1721 }
4600  002b 85            	popw	x
4601  002c 81            	ret	
4659                     ; 1739 void TIM5_ETRClockMode2Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4659                     ; 1740                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4659                     ; 1741                               uint8_t ExtTRGFilter)
4659                     ; 1742 {
4660                     .text:	section	.text,new
4661  0000               _TIM5_ETRClockMode2Config:
4663  0000 89            	pushw	x
4664       00000000      OFST:	set	0
4667                     ; 1744   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4669  0001 7b05          	ld	a,(OFST+5,sp)
4670  0003 88            	push	a
4671  0004 7b02          	ld	a,(OFST+2,sp)
4672  0006 95            	ld	xh,a
4673  0007 cd0000        	call	_TIM5_ETRConfig
4675  000a 721c5303      	bset	21251,#6
4676  000e 84            	pop	a
4677                     ; 1747   TIM5->ETR |= TIM_ETR_ECE ;
4679                     ; 1748 }
4682  000f 85            	popw	x
4683  0010 81            	ret	
4799                     ; 1799 void TIM5_SelectInputTrigger(TIM5_TRGSelection_TypeDef TIM5_InputTriggerSource)
4799                     ; 1800 {
4800                     .text:	section	.text,new
4801  0000               _TIM5_SelectInputTrigger:
4803  0000 88            	push	a
4804  0001 88            	push	a
4805       00000001      OFST:	set	1
4808                     ; 1801   uint8_t tmpsmcr = 0;
4810  0002 0f01          	clr	(OFST+0,sp)
4811                     ; 1804   assert_param(IS_TIM5_TRIGGER_SELECTION(TIM5_InputTriggerSource));
4813                     ; 1806   tmpsmcr = TIM5->SMCR;
4815  0004 c65302        	ld	a,21250
4816                     ; 1809   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4818  0007 a48f          	and	a,#143
4819                     ; 1810   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
4821  0009 1a02          	or	a,(OFST+1,sp)
4822                     ; 1812   TIM5->SMCR = (uint8_t)tmpsmcr;
4824  000b c75302        	ld	21250,a
4825                     ; 1813 }
4828  000e 85            	popw	x
4829  000f 81            	ret	
4928                     ; 1827 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
4928                     ; 1828 {
4929                     .text:	section	.text,new
4930  0000               _TIM5_SelectOutputTrigger:
4932  0000 88            	push	a
4933  0001 88            	push	a
4934       00000001      OFST:	set	1
4937                     ; 1829   uint8_t tmpcr2 = 0;
4939  0002 0f01          	clr	(OFST+0,sp)
4940                     ; 1832   assert_param(IS_TIM5_TRGO_SOURCE(TIM5_TRGOSource));
4942                     ; 1834   tmpcr2 = TIM5->CR2;
4944  0004 c65301        	ld	a,21249
4945                     ; 1837   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
4947  0007 a48f          	and	a,#143
4948                     ; 1840   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
4950  0009 1a02          	or	a,(OFST+1,sp)
4951                     ; 1842   TIM5->CR2 = tmpcr2;
4953  000b c75301        	ld	21249,a
4954                     ; 1843 }
4957  000e 85            	popw	x
4958  000f 81            	ret	
5041                     ; 1855 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
5041                     ; 1856 {
5042                     .text:	section	.text,new
5043  0000               _TIM5_SelectSlaveMode:
5045  0000 88            	push	a
5046  0001 88            	push	a
5047       00000001      OFST:	set	1
5050                     ; 1857   uint8_t tmpsmcr = 0;
5052  0002 0f01          	clr	(OFST+0,sp)
5053                     ; 1860   assert_param(IS_TIM5_SLAVE_MODE(TIM5_SlaveMode));
5055                     ; 1862   tmpsmcr = TIM5->SMCR;
5057  0004 c65302        	ld	a,21250
5058                     ; 1865   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
5060  0007 a4f8          	and	a,#248
5061                     ; 1868   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
5063  0009 1a02          	or	a,(OFST+1,sp)
5064                     ; 1870   TIM5->SMCR = tmpsmcr;
5066  000b c75302        	ld	21250,a
5067                     ; 1871 }
5070  000e 85            	popw	x
5071  000f 81            	ret	
5107                     ; 1879 void TIM5_SelectMasterSlaveMode(FunctionalState NewState)
5107                     ; 1880 {
5108                     .text:	section	.text,new
5109  0000               _TIM5_SelectMasterSlaveMode:
5113                     ; 1882   assert_param(IS_FUNCTIONAL_STATE(NewState));
5115                     ; 1885   if (NewState != DISABLE)
5117  0000 4d            	tnz	a
5118  0001 2705          	jreq	L7752
5119                     ; 1887     TIM5->SMCR |= TIM_SMCR_MSM;
5121  0003 721e5302      	bset	21250,#7
5124  0007 81            	ret	
5125  0008               L7752:
5126                     ; 1891     TIM5->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5128  0008 721f5302      	bres	21250,#7
5129                     ; 1893 }
5132  000c 81            	ret	
5188                     ; 1911 void TIM5_ETRConfig(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
5188                     ; 1912                     TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
5188                     ; 1913                     uint8_t ExtTRGFilter)
5188                     ; 1914 {
5189                     .text:	section	.text,new
5190  0000               _TIM5_ETRConfig:
5192  0000 89            	pushw	x
5193       00000000      OFST:	set	0
5196                     ; 1916   assert_param(IS_TIM5_EXT_PRESCALER(TIM5_ExtTRGPrescaler));
5198                     ; 1917   assert_param(IS_TIM5_EXT_POLARITY(TIM5_ExtTRGPolarity));
5200                     ; 1918   assert_param(IS_TIM5_EXT_FILTER(ExtTRGFilter));
5202                     ; 1921   TIM5->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM5_ExtTRGPrescaler | (uint8_t)TIM5_ExtTRGPolarity)
5202                     ; 1922                          | (uint8_t)ExtTRGFilter);
5204  0001 9f            	ld	a,xl
5205  0002 1a01          	or	a,(OFST+1,sp)
5206  0004 1a05          	or	a,(OFST+5,sp)
5207  0006 ca5303        	or	a,21251
5208  0009 c75303        	ld	21251,a
5209                     ; 1923 }
5212  000c 85            	popw	x
5213  000d 81            	ret	
5326                     ; 1958 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
5326                     ; 1959                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
5326                     ; 1960                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
5326                     ; 1961 {
5327                     .text:	section	.text,new
5328  0000               _TIM5_EncoderInterfaceConfig:
5330  0000 89            	pushw	x
5331  0001 5203          	subw	sp,#3
5332       00000003      OFST:	set	3
5335                     ; 1962   uint8_t tmpsmcr = 0;
5337                     ; 1963   uint8_t tmpccmr1 = 0;
5339                     ; 1964   uint8_t tmpccmr2 = 0;
5341                     ; 1967   assert_param(IS_TIM5_ENCODER_MODE(TIM5_EncoderMode));
5343                     ; 1968   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC1Polarity));
5345                     ; 1969   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC2Polarity));
5347                     ; 1971   tmpsmcr = TIM5->SMCR;
5349  0003 c65302        	ld	a,21250
5350  0006 6b01          	ld	(OFST-2,sp),a
5351                     ; 1972   tmpccmr1 = TIM5->CCMR1;
5353  0008 c65309        	ld	a,21257
5354  000b 6b02          	ld	(OFST-1,sp),a
5355                     ; 1973   tmpccmr2 = TIM5->CCMR2;
5357  000d c6530a        	ld	a,21258
5358  0010 6b03          	ld	(OFST+0,sp),a
5359                     ; 1976   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5361  0012 7b01          	ld	a,(OFST-2,sp)
5362  0014 a4f0          	and	a,#240
5363                     ; 1977   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
5365  0016 1a04          	or	a,(OFST+1,sp)
5366  0018 6b01          	ld	(OFST-2,sp),a
5367                     ; 1980   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5369  001a 7b02          	ld	a,(OFST-1,sp)
5370  001c a4fc          	and	a,#252
5371  001e 6b02          	ld	(OFST-1,sp),a
5372                     ; 1981   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5374  0020 7b03          	ld	a,(OFST+0,sp)
5375  0022 a4fc          	and	a,#252
5376  0024 6b03          	ld	(OFST+0,sp),a
5377                     ; 1982   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5379  0026 7b02          	ld	a,(OFST-1,sp)
5380  0028 aa01          	or	a,#1
5381  002a 6b02          	ld	(OFST-1,sp),a
5382                     ; 1983   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5384  002c 7b03          	ld	a,(OFST+0,sp)
5385  002e aa01          	or	a,#1
5386  0030 6b03          	ld	(OFST+0,sp),a
5387                     ; 1986   if (TIM5_IC1Polarity == TIM5_ICPolarity_Falling)
5389  0032 7b05          	ld	a,(OFST+2,sp)
5390  0034 4a            	dec	a
5391  0035 2606          	jrne	L5072
5392                     ; 1988     TIM5->CCER1 |= TIM_CCER1_CC1P ;
5394  0037 7212530b      	bset	21259,#1
5396  003b 2004          	jra	L7072
5397  003d               L5072:
5398                     ; 1992     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5400  003d 7213530b      	bres	21259,#1
5401  0041               L7072:
5402                     ; 1995   if (TIM5_IC2Polarity == TIM5_ICPolarity_Falling)
5404  0041 7b08          	ld	a,(OFST+5,sp)
5405  0043 4a            	dec	a
5406  0044 2606          	jrne	L1172
5407                     ; 1997     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5409  0046 721a530b      	bset	21259,#5
5411  004a 2004          	jra	L3172
5412  004c               L1172:
5413                     ; 2001     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5415  004c 721b530b      	bres	21259,#5
5416  0050               L3172:
5417                     ; 2004   TIM5->SMCR = tmpsmcr;
5419  0050 7b01          	ld	a,(OFST-2,sp)
5420  0052 c75302        	ld	21250,a
5421                     ; 2005   TIM5->CCMR1 = tmpccmr1;
5423  0055 7b02          	ld	a,(OFST-1,sp)
5424  0057 c75309        	ld	21257,a
5425                     ; 2006   TIM5->CCMR2 = tmpccmr2;
5427  005a 7b03          	ld	a,(OFST+0,sp)
5428  005c c7530a        	ld	21258,a
5429                     ; 2007 }
5432  005f 5b05          	addw	sp,#5
5433  0061 81            	ret	
5469                     ; 2015 void TIM5_SelectHallSensor(FunctionalState NewState)
5469                     ; 2016 {
5470                     .text:	section	.text,new
5471  0000               _TIM5_SelectHallSensor:
5475                     ; 2018   assert_param(IS_FUNCTIONAL_STATE(NewState));
5477                     ; 2021   if (NewState != DISABLE)
5479  0000 4d            	tnz	a
5480  0001 2705          	jreq	L3372
5481                     ; 2023     TIM5->CR2 |= TIM_CR2_TI1S;
5483  0003 721e5301      	bset	21249,#7
5486  0007 81            	ret	
5487  0008               L3372:
5488                     ; 2027     TIM5->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5490  0008 721f5301      	bres	21249,#7
5491                     ; 2029 }
5494  000c 81            	ret	
5566                     ; 2050 static void TI1_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity, \
5566                     ; 2051                        TIM5_ICSelection_TypeDef TIM5_ICSelection, \
5566                     ; 2052                        uint8_t TIM5_ICFilter)
5566                     ; 2053 {
5567                     .text:	section	.text,new
5568  0000               L3_TI1_Config:
5570  0000 89            	pushw	x
5571  0001 89            	pushw	x
5572       00000002      OFST:	set	2
5575                     ; 2054   uint8_t tmpccmr1 = 0;
5577                     ; 2055   uint8_t tmpicpolarity = TIM5_ICPolarity;
5579  0002 7b03          	ld	a,(OFST+1,sp)
5580  0004 6b01          	ld	(OFST-1,sp),a
5581                     ; 2056   tmpccmr1 = TIM5->CCMR1;
5583  0006 c65309        	ld	a,21257
5584  0009 6b02          	ld	(OFST+0,sp),a
5585                     ; 2059   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5587                     ; 2060   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5589                     ; 2061   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5591                     ; 2064   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5593  000b 7211530b      	bres	21259,#0
5594                     ; 2067   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5596  000f a40c          	and	a,#12
5597  0011 6b02          	ld	(OFST+0,sp),a
5598                     ; 2068   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5600  0013 7b07          	ld	a,(OFST+5,sp)
5601  0015 97            	ld	xl,a
5602  0016 a610          	ld	a,#16
5603  0018 42            	mul	x,a
5604  0019 9f            	ld	a,xl
5605  001a 1a04          	or	a,(OFST+2,sp)
5606  001c 1a02          	or	a,(OFST+0,sp)
5607  001e 6b02          	ld	(OFST+0,sp),a
5608                     ; 2070   TIM5->CCMR1 = tmpccmr1;
5610  0020 c75309        	ld	21257,a
5611                     ; 2073   if (tmpicpolarity == (uint8_t)(TIM5_ICPolarity_Falling))
5613  0023 7b01          	ld	a,(OFST-1,sp)
5614  0025 4a            	dec	a
5615  0026 2606          	jrne	L5772
5616                     ; 2075     TIM5->CCER1 |= TIM_CCER1_CC1P;
5618  0028 7212530b      	bset	21259,#1
5620  002c 2004          	jra	L7772
5621  002e               L5772:
5622                     ; 2079     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5624  002e 7213530b      	bres	21259,#1
5625  0032               L7772:
5626                     ; 2083   TIM5->CCER1 |=  TIM_CCER1_CC1E;
5628  0032 7210530b      	bset	21259,#0
5629                     ; 2084 }
5632  0036 5b04          	addw	sp,#4
5633  0038 81            	ret	
5705                     ; 2101 static void TI2_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
5705                     ; 2102                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
5705                     ; 2103                        uint8_t TIM5_ICFilter)
5705                     ; 2104 {
5706                     .text:	section	.text,new
5707  0000               L5_TI2_Config:
5709  0000 89            	pushw	x
5710  0001 89            	pushw	x
5711       00000002      OFST:	set	2
5714                     ; 2105   uint8_t tmpccmr2 = 0;
5716                     ; 2106   uint8_t tmpicpolarity = TIM5_ICPolarity;
5718  0002 7b03          	ld	a,(OFST+1,sp)
5719  0004 6b01          	ld	(OFST-1,sp),a
5720                     ; 2109   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5722                     ; 2110   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5724                     ; 2111   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5726                     ; 2113   tmpccmr2 = TIM5->CCMR2;
5728  0006 c6530a        	ld	a,21258
5729  0009 6b02          	ld	(OFST+0,sp),a
5730                     ; 2116   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5732  000b 7219530b      	bres	21259,#4
5733                     ; 2119   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5735  000f a40c          	and	a,#12
5736  0011 6b02          	ld	(OFST+0,sp),a
5737                     ; 2120   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5739  0013 7b07          	ld	a,(OFST+5,sp)
5740  0015 97            	ld	xl,a
5741  0016 a610          	ld	a,#16
5742  0018 42            	mul	x,a
5743  0019 9f            	ld	a,xl
5744  001a 1a04          	or	a,(OFST+2,sp)
5745  001c 1a02          	or	a,(OFST+0,sp)
5746  001e 6b02          	ld	(OFST+0,sp),a
5747                     ; 2122   TIM5->CCMR2 = tmpccmr2;
5749  0020 c7530a        	ld	21258,a
5750                     ; 2125   if (tmpicpolarity == TIM5_ICPolarity_Falling)
5752  0023 7b01          	ld	a,(OFST-1,sp)
5753  0025 4a            	dec	a
5754  0026 2606          	jrne	L7303
5755                     ; 2127     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5757  0028 721a530b      	bset	21259,#5
5759  002c 2004          	jra	L1403
5760  002e               L7303:
5761                     ; 2131     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5763  002e 721b530b      	bres	21259,#5
5764  0032               L1403:
5765                     ; 2135   TIM5->CCER1 |=  TIM_CCER1_CC2E;
5767  0032 7218530b      	bset	21259,#4
5768                     ; 2136 }
5771  0036 5b04          	addw	sp,#4
5772  0038 81            	ret	
5785                     	xdef	_TIM5_SelectHallSensor
5786                     	xdef	_TIM5_EncoderInterfaceConfig
5787                     	xdef	_TIM5_ETRConfig
5788                     	xdef	_TIM5_SelectMasterSlaveMode
5789                     	xdef	_TIM5_SelectSlaveMode
5790                     	xdef	_TIM5_SelectOutputTrigger
5791                     	xdef	_TIM5_SelectInputTrigger
5792                     	xdef	_TIM5_ETRClockMode2Config
5793                     	xdef	_TIM5_ETRClockMode1Config
5794                     	xdef	_TIM5_TIxExternalClockConfig
5795                     	xdef	_TIM5_InternalClockConfig
5796                     	xdef	_TIM5_SelectCCDMA
5797                     	xdef	_TIM5_DMACmd
5798                     	xdef	_TIM5_ClearITPendingBit
5799                     	xdef	_TIM5_GetITStatus
5800                     	xdef	_TIM5_ClearFlag
5801                     	xdef	_TIM5_GetFlagStatus
5802                     	xdef	_TIM5_GenerateEvent
5803                     	xdef	_TIM5_ITConfig
5804                     	xdef	_TIM5_SetIC2Prescaler
5805                     	xdef	_TIM5_SetIC1Prescaler
5806                     	xdef	_TIM5_GetCapture2
5807                     	xdef	_TIM5_GetCapture1
5808                     	xdef	_TIM5_PWMIConfig
5809                     	xdef	_TIM5_ICInit
5810                     	xdef	_TIM5_CCxCmd
5811                     	xdef	_TIM5_OC2PolarityConfig
5812                     	xdef	_TIM5_OC1PolarityConfig
5813                     	xdef	_TIM5_OC2FastConfig
5814                     	xdef	_TIM5_OC1FastConfig
5815                     	xdef	_TIM5_OC2PreloadConfig
5816                     	xdef	_TIM5_OC1PreloadConfig
5817                     	xdef	_TIM5_ForcedOC2Config
5818                     	xdef	_TIM5_ForcedOC1Config
5819                     	xdef	_TIM5_SetCompare2
5820                     	xdef	_TIM5_SetCompare1
5821                     	xdef	_TIM5_SelectOCxM
5822                     	xdef	_TIM5_CtrlPWMOutputs
5823                     	xdef	_TIM5_BKRConfig
5824                     	xdef	_TIM5_OC2Init
5825                     	xdef	_TIM5_OC1Init
5826                     	xdef	_TIM5_Cmd
5827                     	xdef	_TIM5_SelectOnePulseMode
5828                     	xdef	_TIM5_ARRPreloadConfig
5829                     	xdef	_TIM5_UpdateRequestConfig
5830                     	xdef	_TIM5_UpdateDisableConfig
5831                     	xdef	_TIM5_GetPrescaler
5832                     	xdef	_TIM5_GetCounter
5833                     	xdef	_TIM5_SetAutoreload
5834                     	xdef	_TIM5_SetCounter
5835                     	xdef	_TIM5_CounterModeConfig
5836                     	xdef	_TIM5_PrescalerConfig
5837                     	xdef	_TIM5_TimeBaseInit
5838                     	xdef	_TIM5_DeInit
5857                     	end