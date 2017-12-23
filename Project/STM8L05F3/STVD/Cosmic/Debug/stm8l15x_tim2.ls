   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 168 void TIM2_DeInit(void)
  33                     ; 169 {
  34                     .text:	section	.text,new
  35  0000               f_TIM2_DeInit:
  39                     ; 170   TIM2->CR1 = TIM_CR1_RESET_VALUE;
  41  0000 725f5250      	clr	21072
  42                     ; 171   TIM2->CR2 = TIM_CR2_RESET_VALUE;
  44  0004 725f5251      	clr	21073
  45                     ; 172   TIM2->SMCR = TIM_SMCR_RESET_VALUE;
  47  0008 725f5252      	clr	21074
  48                     ; 173   TIM2->ETR = TIM_ETR_RESET_VALUE;
  50  000c 725f5253      	clr	21075
  51                     ; 174   TIM2->IER = TIM_IER_RESET_VALUE;
  53  0010 725f5255      	clr	21077
  54                     ; 175   TIM2->SR2 = TIM_SR2_RESET_VALUE;
  56  0014 725f5257      	clr	21079
  57                     ; 178   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  59  0018 725f525b      	clr	21083
  60                     ; 180   TIM2->CCMR1 = 0x01;/*TIM2_ICxSource_TIxFPx */
  62  001c 35015259      	mov	21081,#1
  63                     ; 181   TIM2->CCMR2 = 0x01;/*TIM2_ICxSource_TIxFPx */
  65  0020 3501525a      	mov	21082,#1
  66                     ; 184   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  68  0024 725f525b      	clr	21083
  69                     ; 185   TIM2->CCMR1 = TIM_CCMR1_RESET_VALUE;
  71  0028 725f5259      	clr	21081
  72                     ; 186   TIM2->CCMR2 = TIM_CCMR2_RESET_VALUE;
  74  002c 725f525a      	clr	21082
  75                     ; 188   TIM2->CNTRH = TIM_CNTRH_RESET_VALUE;
  77  0030 725f525c      	clr	21084
  78                     ; 189   TIM2->CNTRL = TIM_CNTRL_RESET_VALUE;
  80  0034 725f525d      	clr	21085
  81                     ; 191   TIM2->PSCR = TIM_PSCR_RESET_VALUE;
  83  0038 725f525e      	clr	21086
  84                     ; 193   TIM2->ARRH = TIM_ARRH_RESET_VALUE;
  86  003c 35ff525f      	mov	21087,#255
  87                     ; 194   TIM2->ARRL = TIM_ARRL_RESET_VALUE;
  89  0040 35ff5260      	mov	21088,#255
  90                     ; 196   TIM2->CCR1H = TIM_CCR1H_RESET_VALUE;
  92  0044 725f5261      	clr	21089
  93                     ; 197   TIM2->CCR1L = TIM_CCR1L_RESET_VALUE;
  95  0048 725f5262      	clr	21090
  96                     ; 198   TIM2->CCR2H = TIM_CCR2H_RESET_VALUE;
  98  004c 725f5263      	clr	21091
  99                     ; 199   TIM2->CCR2L = TIM_CCR2L_RESET_VALUE;
 101  0050 725f5264      	clr	21092
 102                     ; 202   TIM2->OISR = TIM_OISR_RESET_VALUE;
 104  0054 725f5266      	clr	21094
 105                     ; 203   TIM2->EGR = 0x01;/* TIM_EGR_UG */
 107  0058 35015258      	mov	21080,#1
 108                     ; 204   TIM2->BKR = TIM_BKR_RESET_VALUE;
 110  005c 725f5265      	clr	21093
 111                     ; 205   TIM2->SR1 = TIM_SR1_RESET_VALUE;
 113  0060 725f5256      	clr	21078
 114                     ; 206 }
 117  0064 87            	retf	
 276                     ; 231 void TIM2_TimeBaseInit(TIM2_Prescaler_TypeDef TIM2_Prescaler,
 276                     ; 232                        TIM2_CounterMode_TypeDef TIM2_CounterMode,
 276                     ; 233                        uint16_t TIM2_Period)
 276                     ; 234 {
 277                     .text:	section	.text,new
 278  0000               f_TIM2_TimeBaseInit:
 280  0000 89            	pushw	x
 281       00000000      OFST:	set	0
 284                     ; 236   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
 286                     ; 237   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 288                     ; 242   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8) ;
 290  0001 7b06          	ld	a,(OFST+6,sp)
 291  0003 c7525f        	ld	21087,a
 292                     ; 243   TIM2->ARRL = (uint8_t)(TIM2_Period);
 294  0006 7b07          	ld	a,(OFST+7,sp)
 295  0008 c75260        	ld	21088,a
 296                     ; 246   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 298  000b 9e            	ld	a,xh
 299  000c c7525e        	ld	21086,a
 300                     ; 249   TIM2->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 302  000f c65250        	ld	a,21072
 303  0012 a48f          	and	a,#143
 304  0014 c75250        	ld	21072,a
 305                     ; 250   TIM2->CR1 |= (uint8_t)(TIM2_CounterMode);
 307  0017 9f            	ld	a,xl
 308  0018 ca5250        	or	a,21072
 309  001b c75250        	ld	21072,a
 310                     ; 253   TIM2->EGR = TIM2_EventSource_Update;
 312  001e 35015258      	mov	21080,#1
 313                     ; 254 }
 316  0022 85            	popw	x
 317  0023 87            	retf	
 384                     ; 274 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
 384                     ; 275                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
 384                     ; 276 {
 385                     .text:	section	.text,new
 386  0000               f_TIM2_PrescalerConfig:
 390                     ; 278   assert_param(IS_TIM2_PRESCALER(Prescaler));
 392                     ; 279   assert_param(IS_TIM2_PRESCALER_RELOAD(TIM2_PSCReloadMode));
 394                     ; 282   TIM2->PSCR = (uint8_t)(Prescaler);
 396  0000 9e            	ld	a,xh
 397  0001 c7525e        	ld	21086,a
 398                     ; 285   if (TIM2_PSCReloadMode == TIM2_PSCReloadMode_Immediate)
 400  0004 9f            	ld	a,xl
 401  0005 4a            	dec	a
 402  0006 2605          	jrne	L541
 403                     ; 287     TIM2->EGR |= TIM_EGR_UG ;
 405  0008 72105258      	bset	21080,#0
 408  000c 87            	retf	
 409  000d               L541:
 410                     ; 291     TIM2->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 412  000d 72115258      	bres	21080,#0
 413                     ; 293 }
 416  0011 87            	retf	
 458                     ; 306 void TIM2_CounterModeConfig(TIM2_CounterMode_TypeDef TIM2_CounterMode)
 458                     ; 307 {
 459                     .text:	section	.text,new
 460  0000               f_TIM2_CounterModeConfig:
 462  0000 88            	push	a
 463  0001 88            	push	a
 464       00000001      OFST:	set	1
 467                     ; 308   uint8_t tmpcr1 = 0;
 469  0002 0f01          	clr	(OFST+0,sp)
 470                     ; 311   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 472                     ; 313   tmpcr1 = TIM2->CR1;
 474  0004 c65250        	ld	a,21072
 475                     ; 316   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 477  0007 a48f          	and	a,#143
 478                     ; 319   tmpcr1 |= (uint8_t)TIM2_CounterMode;
 480  0009 1a02          	or	a,(OFST+1,sp)
 481                     ; 321   TIM2->CR1 = tmpcr1;
 483  000b c75250        	ld	21072,a
 484                     ; 322 }
 487  000e 85            	popw	x
 488  000f 87            	retf	
 519                     ; 330 void TIM2_SetCounter(uint16_t Counter)
 519                     ; 331 {
 520                     .text:	section	.text,new
 521  0000               f_TIM2_SetCounter:
 525                     ; 334   TIM2->CNTRH = (uint8_t)(Counter >> 8);
 527  0000 9e            	ld	a,xh
 528  0001 c7525c        	ld	21084,a
 529                     ; 335   TIM2->CNTRL = (uint8_t)(Counter);
 531  0004 9f            	ld	a,xl
 532  0005 c7525d        	ld	21085,a
 533                     ; 336 }
 536  0008 87            	retf	
 567                     ; 344 void TIM2_SetAutoreload(uint16_t Autoreload)
 567                     ; 345 {
 568                     .text:	section	.text,new
 569  0000               f_TIM2_SetAutoreload:
 573                     ; 347   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
 575  0000 9e            	ld	a,xh
 576  0001 c7525f        	ld	21087,a
 577                     ; 348   TIM2->ARRL = (uint8_t)(Autoreload);
 579  0004 9f            	ld	a,xl
 580  0005 c75260        	ld	21088,a
 581                     ; 349 }
 584  0008 87            	retf	
 629                     ; 356 uint16_t TIM2_GetCounter(void)
 629                     ; 357 {
 630                     .text:	section	.text,new
 631  0000               f_TIM2_GetCounter:
 633  0000 5204          	subw	sp,#4
 634       00000004      OFST:	set	4
 637                     ; 358   uint16_t tmpcnt = 0;
 639                     ; 361   tmpcntrh = TIM2->CNTRH;
 641  0002 c6525c        	ld	a,21084
 642  0005 6b02          	ld	(OFST-2,sp),a
 643                     ; 362   tmpcntrl = TIM2->CNTRL;
 645  0007 c6525d        	ld	a,21085
 646  000a 6b01          	ld	(OFST-3,sp),a
 647                     ; 364   tmpcnt = (uint16_t)(tmpcntrl);
 649  000c 5f            	clrw	x
 650  000d 97            	ld	xl,a
 651  000e 1f03          	ldw	(OFST-1,sp),x
 652                     ; 365   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 654  0010 7b02          	ld	a,(OFST-2,sp)
 655  0012 97            	ld	xl,a
 656  0013 7b04          	ld	a,(OFST+0,sp)
 657  0015 01            	rrwa	x,a
 658  0016 1a03          	or	a,(OFST-1,sp)
 659  0018 01            	rrwa	x,a
 660                     ; 367   return ((uint16_t)tmpcnt);
 664  0019 5b04          	addw	sp,#4
 665  001b 87            	retf	
 688                     ; 383 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
 688                     ; 384 {
 689                     .text:	section	.text,new
 690  0000               f_TIM2_GetPrescaler:
 694                     ; 386   return ((TIM2_Prescaler_TypeDef)TIM2->PSCR);
 696  0000 c6525e        	ld	a,21086
 699  0003 87            	retf	
 754                     ; 396 void TIM2_UpdateDisableConfig(FunctionalState NewState)
 754                     ; 397 {
 755                     .text:	section	.text,new
 756  0000               f_TIM2_UpdateDisableConfig:
 760                     ; 399   assert_param(IS_FUNCTIONAL_STATE(NewState));
 762                     ; 402   if (NewState != DISABLE)
 764  0000 4d            	tnz	a
 765  0001 2705          	jreq	L772
 766                     ; 404     TIM2->CR1 |= TIM_CR1_UDIS;
 768  0003 72125250      	bset	21072,#1
 771  0007 87            	retf	
 772  0008               L772:
 773                     ; 408     TIM2->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 775  0008 72135250      	bres	21072,#1
 776                     ; 410 }
 779  000c 87            	retf	
 836                     ; 420 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
 836                     ; 421 {
 837                     .text:	section	.text,new
 838  0000               f_TIM2_UpdateRequestConfig:
 842                     ; 423   assert_param(IS_TIM2_UPDATE_SOURCE(TIM2_UpdateSource));
 844                     ; 426   if (TIM2_UpdateSource == TIM2_UpdateSource_Regular)
 846  0000 4a            	dec	a
 847  0001 2605          	jrne	L133
 848                     ; 428     TIM2->CR1 |= TIM_CR1_URS ;
 850  0003 72145250      	bset	21072,#2
 853  0007 87            	retf	
 854  0008               L133:
 855                     ; 432     TIM2->CR1 &= (uint8_t)(~TIM_CR1_URS);
 857  0008 72155250      	bres	21072,#2
 858                     ; 434 }
 861  000c 87            	retf	
 896                     ; 442 void TIM2_ARRPreloadConfig(FunctionalState NewState)
 896                     ; 443 {
 897                     .text:	section	.text,new
 898  0000               f_TIM2_ARRPreloadConfig:
 902                     ; 445   assert_param(IS_FUNCTIONAL_STATE(NewState));
 904                     ; 448   if (NewState != DISABLE)
 906  0000 4d            	tnz	a
 907  0001 2705          	jreq	L353
 908                     ; 450     TIM2->CR1 |= TIM_CR1_ARPE;
 910  0003 721e5250      	bset	21072,#7
 913  0007 87            	retf	
 914  0008               L353:
 915                     ; 454     TIM2->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 917  0008 721f5250      	bres	21072,#7
 918                     ; 456 }
 921  000c 87            	retf	
 977                     ; 466 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
 977                     ; 467 {
 978                     .text:	section	.text,new
 979  0000               f_TIM2_SelectOnePulseMode:
 983                     ; 469   assert_param(IS_TIM2_OPM_MODE(TIM2_OPMode));
 985                     ; 472   if (TIM2_OPMode == TIM2_OPMode_Single)
 987  0000 4a            	dec	a
 988  0001 2605          	jrne	L504
 989                     ; 474     TIM2->CR1 |= TIM_CR1_OPM ;
 991  0003 72165250      	bset	21072,#3
 994  0007 87            	retf	
 995  0008               L504:
 996                     ; 478     TIM2->CR1 &= (uint8_t)(~TIM_CR1_OPM);
 998  0008 72175250      	bres	21072,#3
 999                     ; 480 }
1002  000c 87            	retf	
1036                     ; 488 void TIM2_Cmd(FunctionalState NewState)
1036                     ; 489 {
1037                     .text:	section	.text,new
1038  0000               f_TIM2_Cmd:
1042                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
1044                     ; 494   if (NewState != DISABLE)
1046  0000 4d            	tnz	a
1047  0001 2705          	jreq	L724
1048                     ; 496     TIM2->CR1 |= TIM_CR1_CEN;
1050  0003 72105250      	bset	21072,#0
1053  0007 87            	retf	
1054  0008               L724:
1055                     ; 500     TIM2->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1057  0008 72115250      	bres	21072,#0
1058                     ; 502 }
1061  000c 87            	retf	
1254                     ; 578 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
1254                     ; 579                   TIM2_OutputState_TypeDef TIM2_OutputState,
1254                     ; 580                   uint16_t TIM2_Pulse,
1254                     ; 581                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
1254                     ; 582                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
1254                     ; 583 {
1255                     .text:	section	.text,new
1256  0000               f_TIM2_OC1Init:
1258  0000 89            	pushw	x
1259  0001 88            	push	a
1260       00000001      OFST:	set	1
1263                     ; 584   uint8_t tmpccmr1 = 0;
1265  0002 0f01          	clr	(OFST+0,sp)
1266                     ; 587   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
1268                     ; 588   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
1270                     ; 589   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
1272                     ; 590   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
1274                     ; 592   tmpccmr1 = TIM2->CCMR1;
1276  0004 c65259        	ld	a,21081
1277  0007 6b01          	ld	(OFST+0,sp),a
1278                     ; 595   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1280  0009 7211525b      	bres	21083,#0
1281                     ; 597   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1283  000d a48f          	and	a,#143
1284  000f 6b01          	ld	(OFST+0,sp),a
1285                     ; 600   tmpccmr1 |= (uint8_t)TIM2_OCMode;
1287  0011 9e            	ld	a,xh
1288  0012 1a01          	or	a,(OFST+0,sp)
1289  0014 6b01          	ld	(OFST+0,sp),a
1290                     ; 602   TIM2->CCMR1 = tmpccmr1;
1292  0016 c75259        	ld	21081,a
1293                     ; 605   if (TIM2_OutputState == TIM2_OutputState_Enable)
1295  0019 9f            	ld	a,xl
1296  001a 4a            	dec	a
1297  001b 2606          	jrne	L145
1298                     ; 607     TIM2->CCER1 |= TIM_CCER1_CC1E;
1300  001d 7210525b      	bset	21083,#0
1302  0021 2004          	jra	L345
1303  0023               L145:
1304                     ; 611     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1306  0023 7211525b      	bres	21083,#0
1307  0027               L345:
1308                     ; 615   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
1310  0027 7b09          	ld	a,(OFST+8,sp)
1311  0029 4a            	dec	a
1312  002a 2606          	jrne	L545
1313                     ; 617     TIM2->CCER1 |= TIM_CCER1_CC1P;
1315  002c 7212525b      	bset	21083,#1
1317  0030 2004          	jra	L745
1318  0032               L545:
1319                     ; 621     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1321  0032 7213525b      	bres	21083,#1
1322  0036               L745:
1323                     ; 625   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
1325  0036 7b0a          	ld	a,(OFST+9,sp)
1326  0038 4a            	dec	a
1327  0039 2606          	jrne	L155
1328                     ; 627     TIM2->OISR |= TIM_OISR_OIS1;
1330  003b 72105266      	bset	21094,#0
1332  003f 2004          	jra	L355
1333  0041               L155:
1334                     ; 631     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1336  0041 72115266      	bres	21094,#0
1337  0045               L355:
1338                     ; 635   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
1340  0045 7b07          	ld	a,(OFST+6,sp)
1341  0047 c75261        	ld	21089,a
1342                     ; 636   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
1344  004a 7b08          	ld	a,(OFST+7,sp)
1345  004c c75262        	ld	21090,a
1346                     ; 637 }
1349  004f 5b03          	addw	sp,#3
1350  0051 87            	retf	
1428                     ; 664 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
1428                     ; 665                   TIM2_OutputState_TypeDef TIM2_OutputState,
1428                     ; 666                   uint16_t TIM2_Pulse,
1428                     ; 667                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
1428                     ; 668                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
1428                     ; 669 {
1429                     .text:	section	.text,new
1430  0000               f_TIM2_OC2Init:
1432  0000 89            	pushw	x
1433  0001 88            	push	a
1434       00000001      OFST:	set	1
1437                     ; 670   uint8_t tmpccmr2 = 0;
1439  0002 0f01          	clr	(OFST+0,sp)
1440                     ; 673   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
1442                     ; 674   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
1444                     ; 675   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
1446                     ; 676   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
1448                     ; 678   tmpccmr2 = TIM2->CCMR2;
1450  0004 c6525a        	ld	a,21082
1451  0007 6b01          	ld	(OFST+0,sp),a
1452                     ; 681   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1454  0009 7219525b      	bres	21083,#4
1455                     ; 684   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1457  000d a48f          	and	a,#143
1458  000f 6b01          	ld	(OFST+0,sp),a
1459                     ; 687   tmpccmr2 |= (uint8_t)TIM2_OCMode;
1461  0011 9e            	ld	a,xh
1462  0012 1a01          	or	a,(OFST+0,sp)
1463  0014 6b01          	ld	(OFST+0,sp),a
1464                     ; 689   TIM2->CCMR2 = tmpccmr2;
1466  0016 c7525a        	ld	21082,a
1467                     ; 692   if (TIM2_OutputState == TIM2_OutputState_Enable)
1469  0019 9f            	ld	a,xl
1470  001a 4a            	dec	a
1471  001b 2606          	jrne	L316
1472                     ; 694     TIM2->CCER1 |= TIM_CCER1_CC2E;
1474  001d 7218525b      	bset	21083,#4
1476  0021 2004          	jra	L516
1477  0023               L316:
1478                     ; 698     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1480  0023 7219525b      	bres	21083,#4
1481  0027               L516:
1482                     ; 702   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
1484  0027 7b09          	ld	a,(OFST+8,sp)
1485  0029 4a            	dec	a
1486  002a 2606          	jrne	L716
1487                     ; 704     TIM2->CCER1 |= TIM_CCER1_CC2P;
1489  002c 721a525b      	bset	21083,#5
1491  0030 2004          	jra	L126
1492  0032               L716:
1493                     ; 708     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1495  0032 721b525b      	bres	21083,#5
1496  0036               L126:
1497                     ; 713   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
1499  0036 7b0a          	ld	a,(OFST+9,sp)
1500  0038 4a            	dec	a
1501  0039 2606          	jrne	L326
1502                     ; 715     TIM2->OISR |= TIM_OISR_OIS2;
1504  003b 72145266      	bset	21094,#2
1506  003f 2004          	jra	L526
1507  0041               L326:
1508                     ; 719     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1510  0041 72155266      	bres	21094,#2
1511  0045               L526:
1512                     ; 723   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
1514  0045 7b07          	ld	a,(OFST+6,sp)
1515  0047 c75263        	ld	21091,a
1516                     ; 724   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
1518  004a 7b08          	ld	a,(OFST+7,sp)
1519  004c c75264        	ld	21092,a
1520                     ; 725 }
1523  004f 5b03          	addw	sp,#3
1524  0051 87            	retf	
1721                     ; 754 void TIM2_BKRConfig(TIM2_OSSIState_TypeDef TIM2_OSSIState,
1721                     ; 755                     TIM2_LockLevel_TypeDef TIM2_LockLevel,
1721                     ; 756                     TIM2_BreakState_TypeDef TIM2_BreakState,
1721                     ; 757                     TIM2_BreakPolarity_TypeDef TIM2_BreakPolarity,
1721                     ; 758                     TIM2_AutomaticOutput_TypeDef TIM2_AutomaticOutput)
1721                     ; 759 
1721                     ; 760 {
1722                     .text:	section	.text,new
1723  0000               f_TIM2_BKRConfig:
1725  0000 89            	pushw	x
1726  0001 88            	push	a
1727       00000001      OFST:	set	1
1730                     ; 762   assert_param(IS_TIM2_OSSI_STATE(TIM2_OSSIState));
1732                     ; 763   assert_param(IS_TIM2_LOCK_LEVEL(TIM2_LockLevel));
1734                     ; 764   assert_param(IS_TIM2_BREAK_STATE(TIM2_BreakState));
1736                     ; 765   assert_param(IS_TIM2_BREAK_POLARITY(TIM2_BreakPolarity));
1738                     ; 766   assert_param(IS_TIM2_AUTOMATIC_OUTPUT_STATE(TIM2_AutomaticOutput));
1740                     ; 772   TIM2->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM2_OSSIState | (uint8_t)TIM2_LockLevel) | \
1740                     ; 773                                   (uint8_t)((uint8_t)TIM2_BreakState | (uint8_t)TIM2_BreakPolarity)) | \
1740                     ; 774                                   TIM2_AutomaticOutput));
1742  0002 7b07          	ld	a,(OFST+6,sp)
1743  0004 1a08          	or	a,(OFST+7,sp)
1744  0006 6b01          	ld	(OFST+0,sp),a
1745  0008 9f            	ld	a,xl
1746  0009 1a02          	or	a,(OFST+1,sp)
1747  000b 1a01          	or	a,(OFST+0,sp)
1748  000d 1a09          	or	a,(OFST+8,sp)
1749  000f c75265        	ld	21093,a
1750                     ; 775 }
1753  0012 5b03          	addw	sp,#3
1754  0014 87            	retf	
1789                     ; 783 void TIM2_CtrlPWMOutputs(FunctionalState NewState)
1789                     ; 784 {
1790                     .text:	section	.text,new
1791  0000               f_TIM2_CtrlPWMOutputs:
1795                     ; 786   assert_param(IS_FUNCTIONAL_STATE(NewState));
1797                     ; 790   if (NewState != DISABLE)
1799  0000 4d            	tnz	a
1800  0001 2705          	jreq	L757
1801                     ; 792     TIM2->BKR |= TIM_BKR_MOE ;
1803  0003 721e5265      	bset	21093,#7
1806  0007 87            	retf	
1807  0008               L757:
1808                     ; 796     TIM2->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1810  0008 721f5265      	bres	21093,#7
1811                     ; 798 }
1814  000c 87            	retf	
1878                     ; 818 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel,
1878                     ; 819                      TIM2_OCMode_TypeDef TIM2_OCMode)
1878                     ; 820 {
1879                     .text:	section	.text,new
1880  0000               f_TIM2_SelectOCxM:
1882  0000 89            	pushw	x
1883       00000000      OFST:	set	0
1886                     ; 822   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1888                     ; 823   assert_param(IS_TIM2_OCM(TIM2_OCMode));
1890                     ; 825   if (TIM2_Channel == TIM2_Channel_1)
1892  0001 9e            	ld	a,xh
1893  0002 4d            	tnz	a
1894  0003 2615          	jrne	L5101
1895                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1897  0005 7211525b      	bres	21083,#0
1898                     ; 831     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1900  0009 c65259        	ld	a,21081
1901  000c a48f          	and	a,#143
1902  000e c75259        	ld	21081,a
1903                     ; 834     TIM2->CCMR1 |= (uint8_t)TIM2_OCMode;
1905  0011 9f            	ld	a,xl
1906  0012 ca5259        	or	a,21081
1907  0015 c75259        	ld	21081,a
1909  0018 2014          	jra	L7101
1910  001a               L5101:
1911                     ; 839     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1913  001a 7219525b      	bres	21083,#4
1914                     ; 842     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1916  001e c6525a        	ld	a,21082
1917  0021 a48f          	and	a,#143
1918  0023 c7525a        	ld	21082,a
1919                     ; 845     TIM2->CCMR2 |= (uint8_t)TIM2_OCMode;
1921  0026 c6525a        	ld	a,21082
1922  0029 1a02          	or	a,(OFST+2,sp)
1923  002b c7525a        	ld	21082,a
1924  002e               L7101:
1925                     ; 847 }
1928  002e 85            	popw	x
1929  002f 87            	retf	
1960                     ; 855 void TIM2_SetCompare1(uint16_t Compare)
1960                     ; 856 {
1961                     .text:	section	.text,new
1962  0000               f_TIM2_SetCompare1:
1966                     ; 858   TIM2->CCR1H = (uint8_t)(Compare >> 8);
1968  0000 9e            	ld	a,xh
1969  0001 c75261        	ld	21089,a
1970                     ; 859   TIM2->CCR1L = (uint8_t)(Compare);
1972  0004 9f            	ld	a,xl
1973  0005 c75262        	ld	21090,a
1974                     ; 860 }
1977  0008 87            	retf	
2008                     ; 868 void TIM2_SetCompare2(uint16_t Compare)
2008                     ; 869 {
2009                     .text:	section	.text,new
2010  0000               f_TIM2_SetCompare2:
2014                     ; 871   TIM2->CCR2H = (uint8_t)(Compare >> 8);
2016  0000 9e            	ld	a,xh
2017  0001 c75263        	ld	21091,a
2018                     ; 872   TIM2->CCR2L = (uint8_t)(Compare);
2020  0004 9f            	ld	a,xl
2021  0005 c75264        	ld	21092,a
2022                     ; 873 }
2025  0008 87            	retf	
2089                     ; 883 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2089                     ; 884 {
2090                     .text:	section	.text,new
2091  0000               f_TIM2_ForcedOC1Config:
2093  0000 88            	push	a
2094  0001 88            	push	a
2095       00000001      OFST:	set	1
2098                     ; 885   uint8_t tmpccmr1 = 0;
2100  0002 0f01          	clr	(OFST+0,sp)
2101                     ; 888   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
2103                     ; 890   tmpccmr1 = TIM2->CCMR1;
2105  0004 c65259        	ld	a,21081
2106                     ; 893   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2108  0007 a48f          	and	a,#143
2109                     ; 896   tmpccmr1 |= (uint8_t)TIM2_ForcedAction;
2111  0009 1a02          	or	a,(OFST+1,sp)
2112                     ; 898   TIM2->CCMR1 = tmpccmr1;
2114  000b c75259        	ld	21081,a
2115                     ; 899 }
2118  000e 85            	popw	x
2119  000f 87            	retf	
2161                     ; 909 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2161                     ; 910 {
2162                     .text:	section	.text,new
2163  0000               f_TIM2_ForcedOC2Config:
2165  0000 88            	push	a
2166  0001 88            	push	a
2167       00000001      OFST:	set	1
2170                     ; 911   uint8_t tmpccmr2 = 0;
2172  0002 0f01          	clr	(OFST+0,sp)
2173                     ; 914   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
2175                     ; 916   tmpccmr2 = TIM2->CCMR2;
2177  0004 c6525a        	ld	a,21082
2178                     ; 919   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2180  0007 a48f          	and	a,#143
2181                     ; 922   tmpccmr2 |= (uint8_t)TIM2_ForcedAction;
2183  0009 1a02          	or	a,(OFST+1,sp)
2184                     ; 924   TIM2->CCMR2 = tmpccmr2;
2186  000b c7525a        	ld	21082,a
2187                     ; 925 }
2190  000e 85            	popw	x
2191  000f 87            	retf	
2226                     ; 933 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2226                     ; 934 {
2227                     .text:	section	.text,new
2228  0000               f_TIM2_OC1PreloadConfig:
2232                     ; 936   assert_param(IS_FUNCTIONAL_STATE(NewState));
2234                     ; 939   if (NewState != DISABLE)
2236  0000 4d            	tnz	a
2237  0001 2705          	jreq	L7311
2238                     ; 941     TIM2->CCMR1 |= TIM_CCMR_OCxPE ;
2240  0003 72165259      	bset	21081,#3
2243  0007 87            	retf	
2244  0008               L7311:
2245                     ; 945     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2247  0008 72175259      	bres	21081,#3
2248                     ; 947 }
2251  000c 87            	retf	
2286                     ; 955 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2286                     ; 956 {
2287                     .text:	section	.text,new
2288  0000               f_TIM2_OC2PreloadConfig:
2292                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2294                     ; 961   if (NewState != DISABLE)
2296  0000 4d            	tnz	a
2297  0001 2705          	jreq	L1611
2298                     ; 963     TIM2->CCMR2 |= TIM_CCMR_OCxPE ;
2300  0003 7216525a      	bset	21082,#3
2303  0007 87            	retf	
2304  0008               L1611:
2305                     ; 967     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2307  0008 7217525a      	bres	21082,#3
2308                     ; 969 }
2311  000c 87            	retf	
2345                     ; 977 void TIM2_OC1FastConfig(FunctionalState NewState)
2345                     ; 978 {
2346                     .text:	section	.text,new
2347  0000               f_TIM2_OC1FastConfig:
2351                     ; 980   assert_param(IS_FUNCTIONAL_STATE(NewState));
2353                     ; 983   if (NewState != DISABLE)
2355  0000 4d            	tnz	a
2356  0001 2705          	jreq	L3021
2357                     ; 985     TIM2->CCMR1 |= TIM_CCMR_OCxFE ;
2359  0003 72145259      	bset	21081,#2
2362  0007 87            	retf	
2363  0008               L3021:
2364                     ; 989     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2366  0008 72155259      	bres	21081,#2
2367                     ; 991 }
2370  000c 87            	retf	
2404                     ; 1000 void TIM2_OC2FastConfig(FunctionalState NewState)
2404                     ; 1001 {
2405                     .text:	section	.text,new
2406  0000               f_TIM2_OC2FastConfig:
2410                     ; 1003   assert_param(IS_FUNCTIONAL_STATE(NewState));
2412                     ; 1006   if (NewState != DISABLE)
2414  0000 4d            	tnz	a
2415  0001 2705          	jreq	L5221
2416                     ; 1008     TIM2->CCMR2 |= TIM_CCMR_OCxFE ;
2418  0003 7214525a      	bset	21082,#2
2421  0007 87            	retf	
2422  0008               L5221:
2423                     ; 1012     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2425  0008 7215525a      	bres	21082,#2
2426                     ; 1014 }
2429  000c 87            	retf	
2464                     ; 1024 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2464                     ; 1025 {
2465                     .text:	section	.text,new
2466  0000               f_TIM2_OC1PolarityConfig:
2470                     ; 1027   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
2472                     ; 1030   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
2474  0000 4a            	dec	a
2475  0001 2605          	jrne	L7421
2476                     ; 1032     TIM2->CCER1 |= TIM_CCER1_CC1P ;
2478  0003 7212525b      	bset	21083,#1
2481  0007 87            	retf	
2482  0008               L7421:
2483                     ; 1036     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2485  0008 7213525b      	bres	21083,#1
2486                     ; 1038 }
2489  000c 87            	retf	
2524                     ; 1048 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2524                     ; 1049 {
2525                     .text:	section	.text,new
2526  0000               f_TIM2_OC2PolarityConfig:
2530                     ; 1051   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
2532                     ; 1054   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
2534  0000 4a            	dec	a
2535  0001 2605          	jrne	L1721
2536                     ; 1056     TIM2->CCER1 |= TIM_CCER1_CC2P ;
2538  0003 721a525b      	bset	21083,#5
2541  0007 87            	retf	
2542  0008               L1721:
2543                     ; 1060     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2545  0008 721b525b      	bres	21083,#5
2546                     ; 1062 }
2549  000c 87            	retf	
2593                     ; 1074 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel,
2593                     ; 1075                  FunctionalState NewState)
2593                     ; 1076 {
2594                     .text:	section	.text,new
2595  0000               f_TIM2_CCxCmd:
2597  0000 89            	pushw	x
2598       00000000      OFST:	set	0
2601                     ; 1078   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
2603                     ; 1079   assert_param(IS_FUNCTIONAL_STATE(NewState));
2605                     ; 1081   if (TIM2_Channel == TIM2_Channel_1)
2607  0001 9e            	ld	a,xh
2608  0002 4d            	tnz	a
2609  0003 2610          	jrne	L7131
2610                     ; 1084     if (NewState != DISABLE)
2612  0005 9f            	ld	a,xl
2613  0006 4d            	tnz	a
2614  0007 2706          	jreq	L1231
2615                     ; 1086       TIM2->CCER1 |= TIM_CCER1_CC1E ;
2617  0009 7210525b      	bset	21083,#0
2619  000d 2014          	jra	L5231
2620  000f               L1231:
2621                     ; 1090       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2623  000f 7211525b      	bres	21083,#0
2624  0013 200e          	jra	L5231
2625  0015               L7131:
2626                     ; 1097     if (NewState != DISABLE)
2628  0015 7b02          	ld	a,(OFST+2,sp)
2629  0017 2706          	jreq	L7231
2630                     ; 1099       TIM2->CCER1 |= TIM_CCER1_CC2E;
2632  0019 7218525b      	bset	21083,#4
2634  001d 2004          	jra	L5231
2635  001f               L7231:
2636                     ; 1103       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2638  001f 7219525b      	bres	21083,#4
2639  0023               L5231:
2640                     ; 1106 }
2643  0023 85            	popw	x
2644  0024 87            	retf	
2805                     ; 1184 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
2805                     ; 1185                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2805                     ; 1186                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
2805                     ; 1187                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
2805                     ; 1188                  uint8_t TIM2_ICFilter)
2805                     ; 1189 {
2806                     .text:	section	.text,new
2807  0000               f_TIM2_ICInit:
2809  0000 89            	pushw	x
2810       00000000      OFST:	set	0
2813                     ; 1191   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
2815                     ; 1193   if (TIM2_Channel == TIM2_Channel_1)
2817  0001 9e            	ld	a,xh
2818  0002 4d            	tnz	a
2819  0003 2616          	jrne	L5241
2820                     ; 1196     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection, TIM2_ICFilter);
2822  0005 7b08          	ld	a,(OFST+8,sp)
2823  0007 88            	push	a
2824  0008 7b07          	ld	a,(OFST+7,sp)
2825  000a 97            	ld	xl,a
2826  000b 7b03          	ld	a,(OFST+3,sp)
2827  000d 95            	ld	xh,a
2828  000e 8d000000      	callf	L3f_TI1_Config
2830  0012 84            	pop	a
2831                     ; 1199     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
2833  0013 7b07          	ld	a,(OFST+7,sp)
2834  0015 8d000000      	callf	f_TIM2_SetIC1Prescaler
2837  0019 2014          	jra	L7241
2838  001b               L5241:
2839                     ; 1204     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection, TIM2_ICFilter);
2841  001b 7b08          	ld	a,(OFST+8,sp)
2842  001d 88            	push	a
2843  001e 7b07          	ld	a,(OFST+7,sp)
2844  0020 97            	ld	xl,a
2845  0021 7b03          	ld	a,(OFST+3,sp)
2846  0023 95            	ld	xh,a
2847  0024 8d000000      	callf	L5f_TI2_Config
2849  0028 84            	pop	a
2850                     ; 1207     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
2852  0029 7b07          	ld	a,(OFST+7,sp)
2853  002b 8d000000      	callf	f_TIM2_SetIC2Prescaler
2855  002f               L7241:
2856                     ; 1209 }
2859  002f 85            	popw	x
2860  0030 87            	retf	
2949                     ; 1235 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
2949                     ; 1236                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2949                     ; 1237                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
2949                     ; 1238                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
2949                     ; 1239                      uint8_t TIM2_ICFilter)
2949                     ; 1240 {
2950                     .text:	section	.text,new
2951  0000               f_TIM2_PWMIConfig:
2953  0000 89            	pushw	x
2954  0001 89            	pushw	x
2955       00000002      OFST:	set	2
2958                     ; 1241   uint8_t icpolarity = TIM2_ICPolarity_Rising;
2960                     ; 1242   uint8_t icselection = TIM2_ICSelection_DirectTI;
2962                     ; 1245   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
2964                     ; 1248   if (TIM2_ICPolarity == TIM2_ICPolarity_Rising)
2966  0002 7b04          	ld	a,(OFST+2,sp)
2967  0004 2605          	jrne	L1741
2968                     ; 1250     icpolarity = TIM2_ICPolarity_Falling;
2970  0006 4c            	inc	a
2971  0007 6b01          	ld	(OFST-1,sp),a
2973  0009 2002          	jra	L3741
2974  000b               L1741:
2975                     ; 1254     icpolarity = TIM2_ICPolarity_Rising;
2977  000b 0f01          	clr	(OFST-1,sp)
2978  000d               L3741:
2979                     ; 1258   if (TIM2_ICSelection == TIM2_ICSelection_DirectTI)
2981  000d 7b08          	ld	a,(OFST+6,sp)
2982  000f 4a            	dec	a
2983  0010 2604          	jrne	L5741
2984                     ; 1260     icselection = TIM2_ICSelection_IndirectTI;
2986  0012 a602          	ld	a,#2
2988  0014 2002          	jra	L7741
2989  0016               L5741:
2990                     ; 1264     icselection = TIM2_ICSelection_DirectTI;
2992  0016 a601          	ld	a,#1
2993  0018               L7741:
2994  0018 6b02          	ld	(OFST+0,sp),a
2995                     ; 1267   if (TIM2_Channel == TIM2_Channel_1)
2997  001a 7b03          	ld	a,(OFST+1,sp)
2998  001c 262a          	jrne	L1051
2999                     ; 1270     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
2999                     ; 1271                TIM2_ICFilter);
3001  001e 7b0a          	ld	a,(OFST+8,sp)
3002  0020 88            	push	a
3003  0021 7b09          	ld	a,(OFST+7,sp)
3004  0023 97            	ld	xl,a
3005  0024 7b05          	ld	a,(OFST+3,sp)
3006  0026 95            	ld	xh,a
3007  0027 8d000000      	callf	L3f_TI1_Config
3009  002b 84            	pop	a
3010                     ; 1274     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
3012  002c 7b09          	ld	a,(OFST+7,sp)
3013  002e 8d000000      	callf	f_TIM2_SetIC1Prescaler
3015                     ; 1277     TI2_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
3017  0032 7b0a          	ld	a,(OFST+8,sp)
3018  0034 88            	push	a
3019  0035 7b03          	ld	a,(OFST+1,sp)
3020  0037 97            	ld	xl,a
3021  0038 7b02          	ld	a,(OFST+0,sp)
3022  003a 95            	ld	xh,a
3023  003b 8d000000      	callf	L5f_TI2_Config
3025  003f 84            	pop	a
3026                     ; 1280     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
3028  0040 7b09          	ld	a,(OFST+7,sp)
3029  0042 8d000000      	callf	f_TIM2_SetIC2Prescaler
3032  0046 2028          	jra	L3051
3033  0048               L1051:
3034                     ; 1285     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
3034                     ; 1286                TIM2_ICFilter);
3036  0048 7b0a          	ld	a,(OFST+8,sp)
3037  004a 88            	push	a
3038  004b 7b09          	ld	a,(OFST+7,sp)
3039  004d 97            	ld	xl,a
3040  004e 7b05          	ld	a,(OFST+3,sp)
3041  0050 95            	ld	xh,a
3042  0051 8d000000      	callf	L5f_TI2_Config
3044  0055 84            	pop	a
3045                     ; 1289     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
3047  0056 7b09          	ld	a,(OFST+7,sp)
3048  0058 8d000000      	callf	f_TIM2_SetIC2Prescaler
3050                     ; 1292     TI1_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
3052  005c 7b0a          	ld	a,(OFST+8,sp)
3053  005e 88            	push	a
3054  005f 7b03          	ld	a,(OFST+1,sp)
3055  0061 97            	ld	xl,a
3056  0062 7b02          	ld	a,(OFST+0,sp)
3057  0064 95            	ld	xh,a
3058  0065 8d000000      	callf	L3f_TI1_Config
3060  0069 84            	pop	a
3061                     ; 1295     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
3063  006a 7b09          	ld	a,(OFST+7,sp)
3064  006c 8d000000      	callf	f_TIM2_SetIC1Prescaler
3066  0070               L3051:
3067                     ; 1297 }
3070  0070 5b04          	addw	sp,#4
3071  0072 87            	retf	
3116                     ; 1304 uint16_t TIM2_GetCapture1(void)
3116                     ; 1305 {
3117                     .text:	section	.text,new
3118  0000               f_TIM2_GetCapture1:
3120  0000 5204          	subw	sp,#4
3121       00000004      OFST:	set	4
3124                     ; 1306   uint16_t tmpccr1 = 0;
3126                     ; 1309   tmpccr1h = TIM2->CCR1H;
3128  0002 c65261        	ld	a,21089
3129  0005 6b02          	ld	(OFST-2,sp),a
3130                     ; 1310   tmpccr1l = TIM2->CCR1L;
3132  0007 c65262        	ld	a,21090
3133  000a 6b01          	ld	(OFST-3,sp),a
3134                     ; 1312   tmpccr1 = (uint16_t)(tmpccr1l);
3136  000c 5f            	clrw	x
3137  000d 97            	ld	xl,a
3138  000e 1f03          	ldw	(OFST-1,sp),x
3139                     ; 1313   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3141  0010 7b02          	ld	a,(OFST-2,sp)
3142  0012 97            	ld	xl,a
3143  0013 7b04          	ld	a,(OFST+0,sp)
3144  0015 01            	rrwa	x,a
3145  0016 1a03          	or	a,(OFST-1,sp)
3146  0018 01            	rrwa	x,a
3147                     ; 1315   return ((uint16_t)tmpccr1);
3151  0019 5b04          	addw	sp,#4
3152  001b 87            	retf	
3197                     ; 1323 uint16_t TIM2_GetCapture2(void)
3197                     ; 1324 {
3198                     .text:	section	.text,new
3199  0000               f_TIM2_GetCapture2:
3201  0000 5204          	subw	sp,#4
3202       00000004      OFST:	set	4
3205                     ; 1325   uint16_t tmpccr2 = 0;
3207                     ; 1328   tmpccr2h = TIM2->CCR2H;
3209  0002 c65263        	ld	a,21091
3210  0005 6b02          	ld	(OFST-2,sp),a
3211                     ; 1329   tmpccr2l = TIM2->CCR2L;
3213  0007 c65264        	ld	a,21092
3214  000a 6b01          	ld	(OFST-3,sp),a
3215                     ; 1331   tmpccr2 = (uint16_t)(tmpccr2l);
3217  000c 5f            	clrw	x
3218  000d 97            	ld	xl,a
3219  000e 1f03          	ldw	(OFST-1,sp),x
3220                     ; 1332   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3222  0010 7b02          	ld	a,(OFST-2,sp)
3223  0012 97            	ld	xl,a
3224  0013 7b04          	ld	a,(OFST+0,sp)
3225  0015 01            	rrwa	x,a
3226  0016 1a03          	or	a,(OFST-1,sp)
3227  0018 01            	rrwa	x,a
3228                     ; 1334   return ((uint16_t)tmpccr2);
3232  0019 5b04          	addw	sp,#4
3233  001b 87            	retf	
3275                     ; 1347 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3275                     ; 1348 {
3276                     .text:	section	.text,new
3277  0000               f_TIM2_SetIC1Prescaler:
3279  0000 88            	push	a
3280  0001 88            	push	a
3281       00000001      OFST:	set	1
3284                     ; 1349   uint8_t tmpccmr1 = 0;
3286  0002 0f01          	clr	(OFST+0,sp)
3287                     ; 1352   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC1Prescaler));
3289                     ; 1354   tmpccmr1 = TIM2->CCMR1;
3291  0004 c65259        	ld	a,21081
3292                     ; 1357   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3294  0007 a4f3          	and	a,#243
3295                     ; 1360   tmpccmr1 |= (uint8_t)TIM2_IC1Prescaler;
3297  0009 1a02          	or	a,(OFST+1,sp)
3298                     ; 1362   TIM2->CCMR1 = tmpccmr1;
3300  000b c75259        	ld	21081,a
3301                     ; 1363 }
3304  000e 85            	popw	x
3305  000f 87            	retf	
3347                     ; 1375 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3347                     ; 1376 {
3348                     .text:	section	.text,new
3349  0000               f_TIM2_SetIC2Prescaler:
3351  0000 88            	push	a
3352  0001 88            	push	a
3353       00000001      OFST:	set	1
3356                     ; 1377   uint8_t tmpccmr2 = 0;
3358  0002 0f01          	clr	(OFST+0,sp)
3359                     ; 1380   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC2Prescaler));
3361                     ; 1382   tmpccmr2 = TIM2->CCMR2;
3363  0004 c6525a        	ld	a,21082
3364                     ; 1385   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3366  0007 a4f3          	and	a,#243
3367                     ; 1388   tmpccmr2 |= (uint8_t)TIM2_IC2Prescaler;
3369  0009 1a02          	or	a,(OFST+1,sp)
3370                     ; 1390   TIM2->CCMR2 = tmpccmr2;
3372  000b c7525a        	ld	21082,a
3373                     ; 1391 }
3376  000e 85            	popw	x
3377  000f 87            	retf	
3462                     ; 1422 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
3462                     ; 1423 {
3463                     .text:	section	.text,new
3464  0000               f_TIM2_ITConfig:
3466  0000 89            	pushw	x
3467       00000000      OFST:	set	0
3470                     ; 1425   assert_param(IS_TIM2_IT(TIM2_IT));
3472                     ; 1426   assert_param(IS_FUNCTIONAL_STATE(NewState));
3474                     ; 1428   if (NewState != DISABLE)
3476  0001 9f            	ld	a,xl
3477  0002 4d            	tnz	a
3478  0003 2706          	jreq	L5461
3479                     ; 1431     TIM2->IER |= (uint8_t)TIM2_IT;
3481  0005 9e            	ld	a,xh
3482  0006 ca5255        	or	a,21077
3484  0009 2006          	jra	L7461
3485  000b               L5461:
3486                     ; 1436     TIM2->IER &= (uint8_t)(~(uint8_t)TIM2_IT);
3488  000b 7b01          	ld	a,(OFST+1,sp)
3489  000d 43            	cpl	a
3490  000e c45255        	and	a,21077
3491  0011               L7461:
3492  0011 c75255        	ld	21077,a
3493                     ; 1438 }
3496  0014 85            	popw	x
3497  0015 87            	retf	
3577                     ; 1451 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
3577                     ; 1452 {
3578                     .text:	section	.text,new
3579  0000               f_TIM2_GenerateEvent:
3583                     ; 1454   assert_param(IS_TIM2_EVENT_SOURCE((uint8_t)TIM2_EventSource));
3585                     ; 1457   TIM2->EGR |= (uint8_t)TIM2_EventSource;
3587  0000 ca5258        	or	a,21080
3588  0003 c75258        	ld	21080,a
3589                     ; 1458 }
3592  0006 87            	retf	
3726                     ; 1473 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3726                     ; 1474 {
3727                     .text:	section	.text,new
3728  0000               f_TIM2_GetFlagStatus:
3730  0000 89            	pushw	x
3731  0001 89            	pushw	x
3732       00000002      OFST:	set	2
3735                     ; 1475   FlagStatus bitstatus = RESET;
3737                     ; 1476   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3741  0002 7b02          	ld	a,(OFST+0,sp)
3742  0004 97            	ld	xl,a
3743                     ; 1479   assert_param(IS_TIM2_GET_FLAG(TIM2_FLAG));
3745                     ; 1481   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)(TIM2_FLAG));
3747  0005 c65256        	ld	a,21078
3748  0008 1404          	and	a,(OFST+2,sp)
3749  000a 6b01          	ld	(OFST-1,sp),a
3750                     ; 1482   tim2_flag_h = (uint8_t)(TIM2->SR2 & (uint8_t)((uint16_t)TIM2_FLAG >> 8));
3752  000c c65257        	ld	a,21079
3753  000f 1403          	and	a,(OFST+1,sp)
3754  0011 6b02          	ld	(OFST+0,sp),a
3755                     ; 1484   if ((uint8_t)(tim2_flag_l | tim2_flag_h) != 0)
3757  0013 1a01          	or	a,(OFST-1,sp)
3758  0015 2702          	jreq	L5671
3759                     ; 1486     bitstatus = SET;
3761  0017 a601          	ld	a,#1
3763  0019               L5671:
3764                     ; 1490     bitstatus = RESET;
3766                     ; 1492   return ((FlagStatus)bitstatus);
3770  0019 5b04          	addw	sp,#4
3771  001b 87            	retf	
3805                     ; 1506 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3805                     ; 1507 {
3806                     .text:	section	.text,new
3807  0000               f_TIM2_ClearFlag:
3809  0000 89            	pushw	x
3810       00000000      OFST:	set	0
3813                     ; 1509   assert_param(IS_TIM2_CLEAR_FLAG((uint16_t)TIM2_FLAG));
3815                     ; 1511   TIM2->SR1 = (uint8_t)(~(uint8_t)(TIM2_FLAG));
3817  0001 9f            	ld	a,xl
3818  0002 43            	cpl	a
3819  0003 c75256        	ld	21078,a
3820                     ; 1512   TIM2->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM2_FLAG >> 8));
3822  0006 7b01          	ld	a,(OFST+1,sp)
3823  0008 43            	cpl	a
3824  0009 c75257        	ld	21079,a
3825                     ; 1513 }
3828  000c 85            	popw	x
3829  000d 87            	retf	
3888                     ; 1526 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3888                     ; 1527 {
3889                     .text:	section	.text,new
3890  0000               f_TIM2_GetITStatus:
3892  0000 88            	push	a
3893  0001 89            	pushw	x
3894       00000002      OFST:	set	2
3897                     ; 1528   ITStatus bitstatus = RESET;
3899                     ; 1530   uint8_t TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
3903  0002 7b02          	ld	a,(OFST+0,sp)
3904  0004 97            	ld	xl,a
3905                     ; 1533   assert_param(IS_TIM2_GET_IT(TIM2_IT));
3907                     ; 1535   TIM2_itStatus = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_IT);
3909  0005 c65256        	ld	a,21078
3910  0008 1403          	and	a,(OFST+1,sp)
3911  000a 6b01          	ld	(OFST-1,sp),a
3912                     ; 1537   TIM2_itEnable = (uint8_t)(TIM2->IER & (uint8_t)TIM2_IT);
3914  000c c65255        	ld	a,21077
3915  000f 1403          	and	a,(OFST+1,sp)
3916  0011 6b02          	ld	(OFST+0,sp),a
3917                     ; 1539   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET))
3919  0013 7b01          	ld	a,(OFST-1,sp)
3920  0015 2708          	jreq	L5302
3922  0017 7b02          	ld	a,(OFST+0,sp)
3923  0019 2704          	jreq	L5302
3924                     ; 1541     bitstatus = (ITStatus)SET;
3926  001b a601          	ld	a,#1
3928  001d 2001          	jra	L7302
3929  001f               L5302:
3930                     ; 1545     bitstatus = (ITStatus)RESET;
3932  001f 4f            	clr	a
3933  0020               L7302:
3934                     ; 1547   return ((ITStatus)bitstatus);
3938  0020 5b03          	addw	sp,#3
3939  0022 87            	retf	
3974                     ; 1561 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3974                     ; 1562 {
3975                     .text:	section	.text,new
3976  0000               f_TIM2_ClearITPendingBit:
3980                     ; 1564   assert_param(IS_TIM2_IT(TIM2_IT));
3982                     ; 1567   TIM2->SR1 = (uint8_t)(~(uint8_t)TIM2_IT);
3984  0000 43            	cpl	a
3985  0001 c75256        	ld	21078,a
3986                     ; 1568 }
3989  0004 87            	retf	
4061                     ; 1581 void TIM2_DMACmd( TIM2_DMASource_TypeDef TIM2_DMASource, FunctionalState NewState)
4061                     ; 1582 {
4062                     .text:	section	.text,new
4063  0000               f_TIM2_DMACmd:
4065  0000 89            	pushw	x
4066       00000000      OFST:	set	0
4069                     ; 1584   assert_param(IS_FUNCTIONAL_STATE(NewState));
4071                     ; 1585   assert_param(IS_TIM2_DMA_SOURCE(TIM2_DMASource));
4073                     ; 1587   if (NewState != DISABLE)
4075  0001 9f            	ld	a,xl
4076  0002 4d            	tnz	a
4077  0003 2706          	jreq	L3112
4078                     ; 1590     TIM2->DER |= TIM2_DMASource;
4080  0005 9e            	ld	a,xh
4081  0006 ca5254        	or	a,21076
4083  0009 2006          	jra	L5112
4084  000b               L3112:
4085                     ; 1595     TIM2->DER &= (uint8_t)(~TIM2_DMASource);
4087  000b 7b01          	ld	a,(OFST+1,sp)
4088  000d 43            	cpl	a
4089  000e c45254        	and	a,21076
4090  0011               L5112:
4091  0011 c75254        	ld	21076,a
4092                     ; 1597 }
4095  0014 85            	popw	x
4096  0015 87            	retf	
4130                     ; 1605 void TIM2_SelectCCDMA(FunctionalState NewState)
4130                     ; 1606 {
4131                     .text:	section	.text,new
4132  0000               f_TIM2_SelectCCDMA:
4136                     ; 1608   assert_param(IS_FUNCTIONAL_STATE(NewState));
4138                     ; 1610   if (NewState != DISABLE)
4140  0000 4d            	tnz	a
4141  0001 2705          	jreq	L5312
4142                     ; 1613     TIM2->CR2 |= TIM_CR2_CCDS;
4144  0003 72165251      	bset	21073,#3
4147  0007 87            	retf	
4148  0008               L5312:
4149                     ; 1618     TIM2->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4151  0008 72175251      	bres	21073,#3
4152                     ; 1620 }
4155  000c 87            	retf	
4178                     ; 1644 void TIM2_InternalClockConfig(void)
4178                     ; 1645 {
4179                     .text:	section	.text,new
4180  0000               f_TIM2_InternalClockConfig:
4184                     ; 1647   TIM2->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4186  0000 c65252        	ld	a,21074
4187  0003 a4f8          	and	a,#248
4188  0005 c75252        	ld	21074,a
4189                     ; 1648 }
4192  0008 87            	retf	
4278                     ; 1665 void TIM2_TIxExternalClockConfig(TIM2_TIxExternalCLK1Source_TypeDef TIM2_TIxExternalCLKSource,
4278                     ; 1666                                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
4278                     ; 1667                                  uint8_t ICFilter)
4278                     ; 1668 {
4279                     .text:	section	.text,new
4280  0000               f_TIM2_TIxExternalClockConfig:
4282  0000 89            	pushw	x
4283       00000000      OFST:	set	0
4286                     ; 1670   assert_param(IS_TIM2_TIXCLK_SOURCE(TIM2_TIxExternalCLKSource));
4288                     ; 1671   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
4290                     ; 1672   assert_param(IS_TIM2_IC_FILTER(ICFilter));
4292                     ; 1675   if (TIM2_TIxExternalCLKSource == TIM2_TIxExternalCLK1Source_TI2)
4294  0001 9e            	ld	a,xh
4295  0002 a160          	cp	a,#96
4296  0004 260f          	jrne	L7022
4297                     ; 1677     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, ICFilter);
4299  0006 7b06          	ld	a,(OFST+6,sp)
4300  0008 88            	push	a
4301  0009 ae0001        	ldw	x,#1
4302  000c 7b03          	ld	a,(OFST+3,sp)
4303  000e 95            	ld	xh,a
4304  000f 8d000000      	callf	L5f_TI2_Config
4307  0013 200d          	jra	L1122
4308  0015               L7022:
4309                     ; 1681     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, ICFilter);
4311  0015 7b06          	ld	a,(OFST+6,sp)
4312  0017 88            	push	a
4313  0018 ae0001        	ldw	x,#1
4314  001b 7b03          	ld	a,(OFST+3,sp)
4315  001d 95            	ld	xh,a
4316  001e 8d000000      	callf	L3f_TI1_Config
4318  0022               L1122:
4319  0022 84            	pop	a
4320                     ; 1685   TIM2_SelectInputTrigger((TIM2_TRGSelection_TypeDef)TIM2_TIxExternalCLKSource);
4322  0023 7b01          	ld	a,(OFST+1,sp)
4323  0025 8d000000      	callf	f_TIM2_SelectInputTrigger
4325                     ; 1688   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
4327  0029 c65252        	ld	a,21074
4328  002c aa07          	or	a,#7
4329  002e c75252        	ld	21074,a
4330                     ; 1689 }
4333  0031 85            	popw	x
4334  0032 87            	retf	
4448                     ; 1707 void TIM2_ETRClockMode1Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
4448                     ; 1708                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
4448                     ; 1709                               uint8_t ExtTRGFilter)
4448                     ; 1710 {
4449                     .text:	section	.text,new
4450  0000               f_TIM2_ETRClockMode1Config:
4452  0000 89            	pushw	x
4453       00000000      OFST:	set	0
4456                     ; 1712   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, ExtTRGFilter);
4458  0001 7b06          	ld	a,(OFST+6,sp)
4459  0003 88            	push	a
4460  0004 7b02          	ld	a,(OFST+2,sp)
4461  0006 95            	ld	xh,a
4462  0007 8d000000      	callf	f_TIM2_ETRConfig
4464  000b 84            	pop	a
4465                     ; 1715   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4467  000c c65252        	ld	a,21074
4468  000f a4f8          	and	a,#248
4469  0011 c75252        	ld	21074,a
4470                     ; 1716   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
4472  0014 c65252        	ld	a,21074
4473  0017 aa07          	or	a,#7
4474  0019 c75252        	ld	21074,a
4475                     ; 1719   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4477  001c c65252        	ld	a,21074
4478  001f a48f          	and	a,#143
4479  0021 c75252        	ld	21074,a
4480                     ; 1720   TIM2->SMCR |= (uint8_t)((TIM2_TRGSelection_TypeDef)TIM2_TRGSelection_ETRF);
4482  0024 c65252        	ld	a,21074
4483  0027 aa70          	or	a,#112
4484  0029 c75252        	ld	21074,a
4485                     ; 1721 }
4488  002c 85            	popw	x
4489  002d 87            	retf	
4544                     ; 1739 void TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
4544                     ; 1740                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
4544                     ; 1741                               uint8_t ExtTRGFilter)
4544                     ; 1742 {
4545                     .text:	section	.text,new
4546  0000               f_TIM2_ETRClockMode2Config:
4548  0000 89            	pushw	x
4549       00000000      OFST:	set	0
4552                     ; 1744   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, ExtTRGFilter);
4554  0001 7b06          	ld	a,(OFST+6,sp)
4555  0003 88            	push	a
4556  0004 7b02          	ld	a,(OFST+2,sp)
4557  0006 95            	ld	xh,a
4558  0007 8d000000      	callf	f_TIM2_ETRConfig
4560  000b 721c5253      	bset	21075,#6
4561  000f 84            	pop	a
4562                     ; 1747   TIM2->ETR |= TIM_ETR_ECE ;
4564                     ; 1748 }
4567  0010 85            	popw	x
4568  0011 87            	retf	
4681                     ; 1799 void TIM2_SelectInputTrigger(TIM2_TRGSelection_TypeDef TIM2_InputTriggerSource)
4681                     ; 1800 {
4682                     .text:	section	.text,new
4683  0000               f_TIM2_SelectInputTrigger:
4685  0000 88            	push	a
4686  0001 88            	push	a
4687       00000001      OFST:	set	1
4690                     ; 1801   uint8_t tmpsmcr = 0;
4692  0002 0f01          	clr	(OFST+0,sp)
4693                     ; 1804   assert_param(IS_TIM2_TRIGGER_SELECTION(TIM2_InputTriggerSource));
4695                     ; 1806   tmpsmcr = TIM2->SMCR;
4697  0004 c65252        	ld	a,21074
4698                     ; 1809   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4700  0007 a48f          	and	a,#143
4701                     ; 1810   tmpsmcr |= (uint8_t)TIM2_InputTriggerSource;
4703  0009 1a02          	or	a,(OFST+1,sp)
4704                     ; 1812   TIM2->SMCR = (uint8_t)tmpsmcr;
4706  000b c75252        	ld	21074,a
4707                     ; 1813 }
4710  000e 85            	popw	x
4711  000f 87            	retf	
4807                     ; 1827 void TIM2_SelectOutputTrigger(TIM2_TRGOSource_TypeDef TIM2_TRGOSource)
4807                     ; 1828 {
4808                     .text:	section	.text,new
4809  0000               f_TIM2_SelectOutputTrigger:
4811  0000 88            	push	a
4812  0001 88            	push	a
4813       00000001      OFST:	set	1
4816                     ; 1829   uint8_t tmpcr2 = 0;
4818  0002 0f01          	clr	(OFST+0,sp)
4819                     ; 1832   assert_param(IS_TIM2_TRGO_SOURCE(TIM2_TRGOSource));
4821                     ; 1834   tmpcr2 = TIM2->CR2;
4823  0004 c65251        	ld	a,21073
4824                     ; 1837   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
4826  0007 a48f          	and	a,#143
4827                     ; 1840   tmpcr2 |=  (uint8_t)TIM2_TRGOSource;
4829  0009 1a02          	or	a,(OFST+1,sp)
4830                     ; 1842   TIM2->CR2 = tmpcr2;
4832  000b c75251        	ld	21073,a
4833                     ; 1843 }
4836  000e 85            	popw	x
4837  000f 87            	retf	
4917                     ; 1855 void TIM2_SelectSlaveMode(TIM2_SlaveMode_TypeDef TIM2_SlaveMode)
4917                     ; 1856 {
4918                     .text:	section	.text,new
4919  0000               f_TIM2_SelectSlaveMode:
4921  0000 88            	push	a
4922  0001 88            	push	a
4923       00000001      OFST:	set	1
4926                     ; 1857   uint8_t tmpsmcr = 0;
4928  0002 0f01          	clr	(OFST+0,sp)
4929                     ; 1860   assert_param(IS_TIM2_SLAVE_MODE(TIM2_SlaveMode));
4931                     ; 1862   tmpsmcr = TIM2->SMCR;
4933  0004 c65252        	ld	a,21074
4934                     ; 1865   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
4936  0007 a4f8          	and	a,#248
4937                     ; 1868   tmpsmcr |= (uint8_t)TIM2_SlaveMode;
4939  0009 1a02          	or	a,(OFST+1,sp)
4940                     ; 1870   TIM2->SMCR = tmpsmcr;
4942  000b c75252        	ld	21074,a
4943                     ; 1871 }
4946  000e 85            	popw	x
4947  000f 87            	retf	
4982                     ; 1879 void TIM2_SelectMasterSlaveMode(FunctionalState NewState)
4982                     ; 1880 {
4983                     .text:	section	.text,new
4984  0000               f_TIM2_SelectMasterSlaveMode:
4988                     ; 1882   assert_param(IS_FUNCTIONAL_STATE(NewState));
4990                     ; 1885   if (NewState != DISABLE)
4992  0000 4d            	tnz	a
4993  0001 2705          	jreq	L5642
4994                     ; 1887     TIM2->SMCR |= TIM_SMCR_MSM;
4996  0003 721e5252      	bset	21074,#7
4999  0007 87            	retf	
5000  0008               L5642:
5001                     ; 1891     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5003  0008 721f5252      	bres	21074,#7
5004                     ; 1893 }
5007  000c 87            	retf	
5060                     ; 1911 void TIM2_ETRConfig(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
5060                     ; 1912                     TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
5060                     ; 1913                     uint8_t ExtTRGFilter)
5060                     ; 1914 {
5061                     .text:	section	.text,new
5062  0000               f_TIM2_ETRConfig:
5064  0000 89            	pushw	x
5065       00000000      OFST:	set	0
5068                     ; 1916   assert_param(IS_TIM2_EXT_PRESCALER(TIM2_ExtTRGPrescaler));
5070                     ; 1917   assert_param(IS_TIM2_EXT_POLARITY(TIM2_ExtTRGPolarity));
5072                     ; 1918   assert_param(IS_TIM2_EXT_FILTER(ExtTRGFilter));
5074                     ; 1921   TIM2->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM2_ExtTRGPrescaler | (uint8_t)TIM2_ExtTRGPolarity)
5074                     ; 1922                          | (uint8_t)ExtTRGFilter);
5076  0001 9f            	ld	a,xl
5077  0002 1a01          	or	a,(OFST+1,sp)
5078  0004 1a06          	or	a,(OFST+6,sp)
5079  0006 ca5253        	or	a,21075
5080  0009 c75253        	ld	21075,a
5081                     ; 1923 }
5084  000c 85            	popw	x
5085  000d 87            	retf	
5191                     ; 1958 void TIM2_EncoderInterfaceConfig(TIM2_EncoderMode_TypeDef TIM2_EncoderMode,
5191                     ; 1959                                  TIM2_ICPolarity_TypeDef TIM2_IC1Polarity,
5191                     ; 1960                                  TIM2_ICPolarity_TypeDef TIM2_IC2Polarity)
5191                     ; 1961 {
5192                     .text:	section	.text,new
5193  0000               f_TIM2_EncoderInterfaceConfig:
5195  0000 89            	pushw	x
5196  0001 5203          	subw	sp,#3
5197       00000003      OFST:	set	3
5200                     ; 1962   uint8_t tmpsmcr = 0;
5202                     ; 1963   uint8_t tmpccmr1 = 0;
5204                     ; 1964   uint8_t tmpccmr2 = 0;
5206                     ; 1967   assert_param(IS_TIM2_ENCODER_MODE(TIM2_EncoderMode));
5208                     ; 1968   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC1Polarity));
5210                     ; 1969   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC2Polarity));
5212                     ; 1971   tmpsmcr = TIM2->SMCR;
5214  0003 c65252        	ld	a,21074
5215  0006 6b01          	ld	(OFST-2,sp),a
5216                     ; 1972   tmpccmr1 = TIM2->CCMR1;
5218  0008 c65259        	ld	a,21081
5219  000b 6b02          	ld	(OFST-1,sp),a
5220                     ; 1973   tmpccmr2 = TIM2->CCMR2;
5222  000d c6525a        	ld	a,21082
5223  0010 6b03          	ld	(OFST+0,sp),a
5224                     ; 1976   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5226  0012 7b01          	ld	a,(OFST-2,sp)
5227  0014 a4f0          	and	a,#240
5228                     ; 1977   tmpsmcr |= (uint8_t)TIM2_EncoderMode;
5230  0016 1a04          	or	a,(OFST+1,sp)
5231  0018 6b01          	ld	(OFST-2,sp),a
5232                     ; 1980   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5234  001a 7b02          	ld	a,(OFST-1,sp)
5235  001c a4fc          	and	a,#252
5236  001e 6b02          	ld	(OFST-1,sp),a
5237                     ; 1981   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5239  0020 7b03          	ld	a,(OFST+0,sp)
5240  0022 a4fc          	and	a,#252
5241  0024 6b03          	ld	(OFST+0,sp),a
5242                     ; 1982   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5244  0026 7b02          	ld	a,(OFST-1,sp)
5245  0028 aa01          	or	a,#1
5246  002a 6b02          	ld	(OFST-1,sp),a
5247                     ; 1983   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5249  002c 7b03          	ld	a,(OFST+0,sp)
5250  002e aa01          	or	a,#1
5251  0030 6b03          	ld	(OFST+0,sp),a
5252                     ; 1986   if (TIM2_IC1Polarity == TIM2_ICPolarity_Falling)
5254  0032 7b05          	ld	a,(OFST+2,sp)
5255  0034 4a            	dec	a
5256  0035 2606          	jrne	L3652
5257                     ; 1988     TIM2->CCER1 |= TIM_CCER1_CC1P ;
5259  0037 7212525b      	bset	21083,#1
5261  003b 2004          	jra	L5652
5262  003d               L3652:
5263                     ; 1992     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5265  003d 7213525b      	bres	21083,#1
5266  0041               L5652:
5267                     ; 1995   if (TIM2_IC2Polarity == TIM2_ICPolarity_Falling)
5269  0041 7b09          	ld	a,(OFST+6,sp)
5270  0043 4a            	dec	a
5271  0044 2606          	jrne	L7652
5272                     ; 1997     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5274  0046 721a525b      	bset	21083,#5
5276  004a 2004          	jra	L1752
5277  004c               L7652:
5278                     ; 2001     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5280  004c 721b525b      	bres	21083,#5
5281  0050               L1752:
5282                     ; 2004   TIM2->SMCR = tmpsmcr;
5284  0050 7b01          	ld	a,(OFST-2,sp)
5285  0052 c75252        	ld	21074,a
5286                     ; 2005   TIM2->CCMR1 = tmpccmr1;
5288  0055 7b02          	ld	a,(OFST-1,sp)
5289  0057 c75259        	ld	21081,a
5290                     ; 2006   TIM2->CCMR2 = tmpccmr2;
5292  005a 7b03          	ld	a,(OFST+0,sp)
5293  005c c7525a        	ld	21082,a
5294                     ; 2007 }
5297  005f 5b05          	addw	sp,#5
5298  0061 87            	retf	
5333                     ; 2015 void TIM2_SelectHallSensor(FunctionalState NewState)
5333                     ; 2016 {
5334                     .text:	section	.text,new
5335  0000               f_TIM2_SelectHallSensor:
5339                     ; 2018   assert_param(IS_FUNCTIONAL_STATE(NewState));
5341                     ; 2021   if (NewState != DISABLE)
5343  0000 4d            	tnz	a
5344  0001 2705          	jreq	L1162
5345                     ; 2023     TIM2->CR2 |= TIM_CR2_TI1S;
5347  0003 721e5251      	bset	21073,#7
5350  0007 87            	retf	
5351  0008               L1162:
5352                     ; 2027     TIM2->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5354  0008 721f5251      	bres	21073,#7
5355                     ; 2029 }
5358  000c 87            	retf	
5423                     ; 2050 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity, \
5423                     ; 2051                        TIM2_ICSelection_TypeDef TIM2_ICSelection, \
5423                     ; 2052                        uint8_t TIM2_ICFilter)
5423                     ; 2053 {
5424                     .text:	section	.text,new
5425  0000               L3f_TI1_Config:
5427  0000 89            	pushw	x
5428  0001 89            	pushw	x
5429       00000002      OFST:	set	2
5432                     ; 2054   uint8_t tmpccmr1 = 0;
5434                     ; 2055   uint8_t tmpicpolarity = TIM2_ICPolarity;
5436  0002 7b03          	ld	a,(OFST+1,sp)
5437  0004 6b01          	ld	(OFST-1,sp),a
5438                     ; 2056   tmpccmr1 = TIM2->CCMR1;
5440  0006 c65259        	ld	a,21081
5441  0009 6b02          	ld	(OFST+0,sp),a
5442                     ; 2059   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5444                     ; 2060   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5446                     ; 2061   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5448                     ; 2064   TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5450  000b 7211525b      	bres	21083,#0
5451                     ; 2067   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5453  000f a40c          	and	a,#12
5454  0011 6b02          	ld	(OFST+0,sp),a
5455                     ; 2068   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5457  0013 7b08          	ld	a,(OFST+6,sp)
5458  0015 97            	ld	xl,a
5459  0016 a610          	ld	a,#16
5460  0018 42            	mul	x,a
5461  0019 9f            	ld	a,xl
5462  001a 1a04          	or	a,(OFST+2,sp)
5463  001c 1a02          	or	a,(OFST+0,sp)
5464  001e 6b02          	ld	(OFST+0,sp),a
5465                     ; 2070   TIM2->CCMR1 = tmpccmr1;
5467  0020 c75259        	ld	21081,a
5468                     ; 2073   if (tmpicpolarity == (uint8_t)(TIM2_ICPolarity_Falling))
5470  0023 7b01          	ld	a,(OFST-1,sp)
5471  0025 4a            	dec	a
5472  0026 2606          	jrne	L5462
5473                     ; 2075     TIM2->CCER1 |= TIM_CCER1_CC1P;
5475  0028 7212525b      	bset	21083,#1
5477  002c 2004          	jra	L7462
5478  002e               L5462:
5479                     ; 2079     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5481  002e 7213525b      	bres	21083,#1
5482  0032               L7462:
5483                     ; 2083   TIM2->CCER1 |=  TIM_CCER1_CC1E;
5485  0032 7210525b      	bset	21083,#0
5486                     ; 2084 }
5489  0036 5b04          	addw	sp,#4
5490  0038 87            	retf	
5555                     ; 2101 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
5555                     ; 2102                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
5555                     ; 2103                        uint8_t TIM2_ICFilter)
5555                     ; 2104 {
5556                     .text:	section	.text,new
5557  0000               L5f_TI2_Config:
5559  0000 89            	pushw	x
5560  0001 89            	pushw	x
5561       00000002      OFST:	set	2
5564                     ; 2105   uint8_t tmpccmr2 = 0;
5566                     ; 2106   uint8_t tmpicpolarity = TIM2_ICPolarity;
5568  0002 7b03          	ld	a,(OFST+1,sp)
5569  0004 6b01          	ld	(OFST-1,sp),a
5570                     ; 2109   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5572                     ; 2110   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5574                     ; 2111   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5576                     ; 2113   tmpccmr2 = TIM2->CCMR2;
5578  0006 c6525a        	ld	a,21082
5579  0009 6b02          	ld	(OFST+0,sp),a
5580                     ; 2116   TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5582  000b 7219525b      	bres	21083,#4
5583                     ; 2119   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5585  000f a40c          	and	a,#12
5586  0011 6b02          	ld	(OFST+0,sp),a
5587                     ; 2120   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5589  0013 7b08          	ld	a,(OFST+6,sp)
5590  0015 97            	ld	xl,a
5591  0016 a610          	ld	a,#16
5592  0018 42            	mul	x,a
5593  0019 9f            	ld	a,xl
5594  001a 1a04          	or	a,(OFST+2,sp)
5595  001c 1a02          	or	a,(OFST+0,sp)
5596  001e 6b02          	ld	(OFST+0,sp),a
5597                     ; 2122   TIM2->CCMR2 = tmpccmr2;
5599  0020 c7525a        	ld	21082,a
5600                     ; 2125   if (tmpicpolarity == TIM2_ICPolarity_Falling)
5602  0023 7b01          	ld	a,(OFST-1,sp)
5603  0025 4a            	dec	a
5604  0026 2606          	jrne	L1072
5605                     ; 2127     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5607  0028 721a525b      	bset	21083,#5
5609  002c 2004          	jra	L3072
5610  002e               L1072:
5611                     ; 2131     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5613  002e 721b525b      	bres	21083,#5
5614  0032               L3072:
5615                     ; 2135   TIM2->CCER1 |=  TIM_CCER1_CC2E;
5617  0032 7218525b      	bset	21083,#4
5618                     ; 2136 }
5621  0036 5b04          	addw	sp,#4
5622  0038 87            	retf	
5634                     	xdef	f_TIM2_SelectHallSensor
5635                     	xdef	f_TIM2_EncoderInterfaceConfig
5636                     	xdef	f_TIM2_ETRConfig
5637                     	xdef	f_TIM2_SelectMasterSlaveMode
5638                     	xdef	f_TIM2_SelectSlaveMode
5639                     	xdef	f_TIM2_SelectOutputTrigger
5640                     	xdef	f_TIM2_SelectInputTrigger
5641                     	xdef	f_TIM2_ETRClockMode2Config
5642                     	xdef	f_TIM2_ETRClockMode1Config
5643                     	xdef	f_TIM2_TIxExternalClockConfig
5644                     	xdef	f_TIM2_InternalClockConfig
5645                     	xdef	f_TIM2_SelectCCDMA
5646                     	xdef	f_TIM2_DMACmd
5647                     	xdef	f_TIM2_ClearITPendingBit
5648                     	xdef	f_TIM2_GetITStatus
5649                     	xdef	f_TIM2_ClearFlag
5650                     	xdef	f_TIM2_GetFlagStatus
5651                     	xdef	f_TIM2_GenerateEvent
5652                     	xdef	f_TIM2_ITConfig
5653                     	xdef	f_TIM2_SetIC2Prescaler
5654                     	xdef	f_TIM2_SetIC1Prescaler
5655                     	xdef	f_TIM2_GetCapture2
5656                     	xdef	f_TIM2_GetCapture1
5657                     	xdef	f_TIM2_PWMIConfig
5658                     	xdef	f_TIM2_ICInit
5659                     	xdef	f_TIM2_CCxCmd
5660                     	xdef	f_TIM2_OC2PolarityConfig
5661                     	xdef	f_TIM2_OC1PolarityConfig
5662                     	xdef	f_TIM2_OC2FastConfig
5663                     	xdef	f_TIM2_OC1FastConfig
5664                     	xdef	f_TIM2_OC2PreloadConfig
5665                     	xdef	f_TIM2_OC1PreloadConfig
5666                     	xdef	f_TIM2_ForcedOC2Config
5667                     	xdef	f_TIM2_ForcedOC1Config
5668                     	xdef	f_TIM2_SetCompare2
5669                     	xdef	f_TIM2_SetCompare1
5670                     	xdef	f_TIM2_SelectOCxM
5671                     	xdef	f_TIM2_CtrlPWMOutputs
5672                     	xdef	f_TIM2_BKRConfig
5673                     	xdef	f_TIM2_OC2Init
5674                     	xdef	f_TIM2_OC1Init
5675                     	xdef	f_TIM2_Cmd
5676                     	xdef	f_TIM2_SelectOnePulseMode
5677                     	xdef	f_TIM2_ARRPreloadConfig
5678                     	xdef	f_TIM2_UpdateRequestConfig
5679                     	xdef	f_TIM2_UpdateDisableConfig
5680                     	xdef	f_TIM2_GetPrescaler
5681                     	xdef	f_TIM2_GetCounter
5682                     	xdef	f_TIM2_SetAutoreload
5683                     	xdef	f_TIM2_SetCounter
5684                     	xdef	f_TIM2_CounterModeConfig
5685                     	xdef	f_TIM2_PrescalerConfig
5686                     	xdef	f_TIM2_TimeBaseInit
5687                     	xdef	f_TIM2_DeInit
5706                     	end
