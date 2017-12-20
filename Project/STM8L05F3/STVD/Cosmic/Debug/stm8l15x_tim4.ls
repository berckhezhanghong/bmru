   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 130 void TIM4_DeInit(void)
  33                     ; 131 {
  35                     .text:	section	.text,new
  36  0000               _TIM4_DeInit:
  40                     ; 132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  42  0000 725f52e0      	clr	21216
  43                     ; 133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  45  0004 725f52e1      	clr	21217
  46                     ; 134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  48  0008 725f52e2      	clr	21218
  49                     ; 135   TIM4->IER   = TIM4_IER_RESET_VALUE;
  51  000c 725f52e4      	clr	21220
  52                     ; 136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  54  0010 725f52e7      	clr	21223
  55                     ; 137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  57  0014 725f52e8      	clr	21224
  58                     ; 138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  60  0018 35ff52e9      	mov	21225,#255
  61                     ; 139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  63  001c 725f52e5      	clr	21221
  64                     ; 140 }
  67  0020 81            	ret	
 235                     ; 165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 235                     ; 166                        uint8_t TIM4_Period)
 235                     ; 167 {
 236                     .text:	section	.text,new
 237  0000               _TIM4_TimeBaseInit:
 241                     ; 169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 243                     ; 171   TIM4->ARR = (uint8_t)(TIM4_Period);
 245  0000 9f            	ld	a,xl
 246  0001 c752e9        	ld	21225,a
 247                     ; 173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 249  0004 9e            	ld	a,xh
 250  0005 c752e8        	ld	21224,a
 251                     ; 176   TIM4->EGR = TIM4_EventSource_Update;
 253  0008 350152e6      	mov	21222,#1
 254                     ; 177 }
 257  000c 81            	ret	
 325                     ; 205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 325                     ; 206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 325                     ; 207 {
 326                     .text:	section	.text,new
 327  0000               _TIM4_PrescalerConfig:
 331                     ; 209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 333                     ; 210   assert_param(IS_TIM4_Prescaler(Prescaler));
 335                     ; 213   TIM4->PSCR = (uint8_t) Prescaler;
 337  0000 9e            	ld	a,xh
 338  0001 c752e8        	ld	21224,a
 339                     ; 216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 341  0004 9f            	ld	a,xl
 342  0005 4a            	dec	a
 343  0006 2605          	jrne	L141
 344                     ; 218     TIM4->EGR |= TIM4_EGR_UG ;
 346  0008 721052e6      	bset	21222,#0
 349  000c 81            	ret	
 350  000d               L141:
 351                     ; 222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 353  000d 721152e6      	bres	21222,#0
 354                     ; 224 }
 357  0011 81            	ret	
 391                     ; 232 void TIM4_SetCounter(uint8_t Counter)
 391                     ; 233 {
 392                     .text:	section	.text,new
 393  0000               _TIM4_SetCounter:
 397                     ; 235   TIM4->CNTR = (uint8_t)(Counter);
 399  0000 c752e7        	ld	21223,a
 400                     ; 236 }
 403  0003 81            	ret	
 437                     ; 244 void TIM4_SetAutoreload(uint8_t Autoreload)
 437                     ; 245 {
 438                     .text:	section	.text,new
 439  0000               _TIM4_SetAutoreload:
 443                     ; 247   TIM4->ARR = (uint8_t)(Autoreload);
 445  0000 c752e9        	ld	21225,a
 446                     ; 248 }
 449  0003 81            	ret	
 483                     ; 255 uint8_t TIM4_GetCounter(void)
 483                     ; 256 {
 484                     .text:	section	.text,new
 485  0000               _TIM4_GetCounter:
 487  0000 88            	push	a
 488       00000001      OFST:	set	1
 491                     ; 257   uint8_t tmpcntr = 0;
 493  0001 0f01          	clr	(OFST+0,sp)
 494                     ; 258   tmpcntr = TIM4->CNTR;
 496  0003 c652e7        	ld	a,21223
 497                     ; 260   return ((uint8_t)tmpcntr);
 501  0006 5b01          	addw	sp,#1
 502  0008 81            	ret	
 526                     ; 284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 526                     ; 285 {
 527                     .text:	section	.text,new
 528  0000               _TIM4_GetPrescaler:
 532                     ; 287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 534  0000 c652e8        	ld	a,21224
 537  0003 81            	ret	
 593                     ; 296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 593                     ; 297 {
 594                     .text:	section	.text,new
 595  0000               _TIM4_UpdateDisableConfig:
 599                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 601                     ; 302   if (NewState != DISABLE)
 603  0000 4d            	tnz	a
 604  0001 2705          	jreq	L552
 605                     ; 304     TIM4->CR1 |= TIM4_CR1_UDIS ;
 607  0003 721252e0      	bset	21216,#1
 610  0007 81            	ret	
 611  0008               L552:
 612                     ; 308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 614  0008 721352e0      	bres	21216,#1
 615                     ; 310 }
 618  000c 81            	ret	
 676                     ; 320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 676                     ; 321 {
 677                     .text:	section	.text,new
 678  0000               _TIM4_UpdateRequestConfig:
 682                     ; 323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 684                     ; 326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 686  0000 4a            	dec	a
 687  0001 2605          	jrne	L703
 688                     ; 328     TIM4->CR1 |= TIM4_CR1_URS ;
 690  0003 721452e0      	bset	21216,#2
 693  0007 81            	ret	
 694  0008               L703:
 695                     ; 332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 697  0008 721552e0      	bres	21216,#2
 698                     ; 334 }
 701  000c 81            	ret	
 737                     ; 342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 737                     ; 343 {
 738                     .text:	section	.text,new
 739  0000               _TIM4_ARRPreloadConfig:
 743                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 745                     ; 348   if (NewState != DISABLE)
 747  0000 4d            	tnz	a
 748  0001 2705          	jreq	L133
 749                     ; 350     TIM4->CR1 |= TIM4_CR1_ARPE ;
 751  0003 721e52e0      	bset	21216,#7
 754  0007 81            	ret	
 755  0008               L133:
 756                     ; 354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 758  0008 721f52e0      	bres	21216,#7
 759                     ; 356 }
 762  000c 81            	ret	
 819                     ; 366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 819                     ; 367 {
 820                     .text:	section	.text,new
 821  0000               _TIM4_SelectOnePulseMode:
 825                     ; 369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 827                     ; 372   if (TIM4_OPMode == TIM4_OPMode_Single)
 829  0000 4a            	dec	a
 830  0001 2605          	jrne	L363
 831                     ; 374     TIM4->CR1 |= TIM4_CR1_OPM ;
 833  0003 721652e0      	bset	21216,#3
 836  0007 81            	ret	
 837  0008               L363:
 838                     ; 378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 840  0008 721752e0      	bres	21216,#3
 841                     ; 380 }
 844  000c 81            	ret	
 879                     ; 388 void TIM4_Cmd(FunctionalState NewState)
 879                     ; 389 {
 880                     .text:	section	.text,new
 881  0000               _TIM4_Cmd:
 885                     ; 391   assert_param(IS_FUNCTIONAL_STATE(NewState));
 887                     ; 394   if (NewState != DISABLE)
 889  0000 4d            	tnz	a
 890  0001 2705          	jreq	L504
 891                     ; 396     TIM4->CR1 |= TIM4_CR1_CEN ;
 893  0003 721052e0      	bset	21216,#0
 896  0007 81            	ret	
 897  0008               L504:
 898                     ; 400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 900  0008 721152e0      	bres	21216,#0
 901                     ; 402 }
 904  000c 81            	ret	
 969                     ; 430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 969                     ; 431 {
 970                     .text:	section	.text,new
 971  0000               _TIM4_ITConfig:
 973  0000 89            	pushw	x
 974       00000000      OFST:	set	0
 977                     ; 433   assert_param(IS_TIM4_IT(TIM4_IT));
 979                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
 981                     ; 436   if (NewState != DISABLE)
 983  0001 9f            	ld	a,xl
 984  0002 4d            	tnz	a
 985  0003 2706          	jreq	L344
 986                     ; 439     TIM4->IER |= (uint8_t)TIM4_IT;
 988  0005 9e            	ld	a,xh
 989  0006 ca52e4        	or	a,21220
 991  0009 2006          	jra	L544
 992  000b               L344:
 993                     ; 444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 995  000b 7b01          	ld	a,(OFST+1,sp)
 996  000d 43            	cpl	a
 997  000e c452e4        	and	a,21220
 998  0011               L544:
 999  0011 c752e4        	ld	21220,a
1000                     ; 446 }
1003  0014 85            	popw	x
1004  0015 81            	ret	
1061                     ; 456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1061                     ; 457 {
1062                     .text:	section	.text,new
1063  0000               _TIM4_GenerateEvent:
1067                     ; 459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1069                     ; 462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1071  0000 ca52e6        	or	a,21222
1072  0003 c752e6        	ld	21222,a
1073                     ; 463 }
1076  0006 81            	ret	
1162                     ; 474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1162                     ; 475 {
1163                     .text:	section	.text,new
1164  0000               _TIM4_GetFlagStatus:
1166  0000 88            	push	a
1167       00000001      OFST:	set	1
1170                     ; 476   FlagStatus bitstatus = RESET;
1172  0001 0f01          	clr	(OFST+0,sp)
1173                     ; 479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1175                     ; 481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1177  0003 c452e5        	and	a,21221
1178  0006 2702          	jreq	L735
1179                     ; 483     bitstatus = SET;
1181  0008 a601          	ld	a,#1
1183  000a               L735:
1184                     ; 487     bitstatus = RESET;
1186                     ; 489   return ((FlagStatus)bitstatus);
1190  000a 5b01          	addw	sp,#1
1191  000c 81            	ret	
1226                     ; 500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1226                     ; 501 {
1227                     .text:	section	.text,new
1228  0000               _TIM4_ClearFlag:
1232                     ; 503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1234                     ; 505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1236  0000 43            	cpl	a
1237  0001 c752e5        	ld	21221,a
1238                     ; 506 }
1241  0004 81            	ret	
1305                     ; 518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1305                     ; 519 {
1306                     .text:	section	.text,new
1307  0000               _TIM4_GetITStatus:
1309  0000 88            	push	a
1310  0001 89            	pushw	x
1311       00000002      OFST:	set	2
1314                     ; 520   ITStatus bitstatus = RESET;
1316                     ; 522   uint8_t itStatus = 0x0, itEnable = 0x0;
1320  0002 7b02          	ld	a,(OFST+0,sp)
1321  0004 97            	ld	xl,a
1322                     ; 525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1324                     ; 527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1326  0005 c652e5        	ld	a,21221
1327  0008 1403          	and	a,(OFST+1,sp)
1328  000a 6b01          	ld	(OFST-1,sp),a
1329                     ; 529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1331  000c c652e4        	ld	a,21220
1332  000f 1403          	and	a,(OFST+1,sp)
1333  0011 6b02          	ld	(OFST+0,sp),a
1334                     ; 531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1336  0013 7b01          	ld	a,(OFST-1,sp)
1337  0015 2708          	jreq	L316
1339  0017 7b02          	ld	a,(OFST+0,sp)
1340  0019 2704          	jreq	L316
1341                     ; 533     bitstatus = (ITStatus)SET;
1343  001b a601          	ld	a,#1
1345  001d 2001          	jra	L516
1346  001f               L316:
1347                     ; 537     bitstatus = (ITStatus)RESET;
1349  001f 4f            	clr	a
1350  0020               L516:
1351                     ; 539   return ((ITStatus)bitstatus);
1355  0020 5b03          	addw	sp,#3
1356  0022 81            	ret	
1392                     ; 550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1392                     ; 551 {
1393                     .text:	section	.text,new
1394  0000               _TIM4_ClearITPendingBit:
1398                     ; 553   assert_param(IS_TIM4_IT(TIM4_IT));
1400                     ; 556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1402  0000 43            	cpl	a
1403  0001 c752e5        	ld	21221,a
1404                     ; 557 }
1407  0004 81            	ret	
1466                     ; 568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1466                     ; 569 {
1467                     .text:	section	.text,new
1468  0000               _TIM4_DMACmd:
1470  0000 89            	pushw	x
1471       00000000      OFST:	set	0
1474                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
1476                     ; 572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1478                     ; 574   if (NewState != DISABLE)
1480  0001 9f            	ld	a,xl
1481  0002 4d            	tnz	a
1482  0003 2706          	jreq	L566
1483                     ; 577     TIM4->DER |= (uint8_t)TIM4_DMASource;
1485  0005 9e            	ld	a,xh
1486  0006 ca52e3        	or	a,21219
1488  0009 2006          	jra	L766
1489  000b               L566:
1490                     ; 582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1492  000b 7b01          	ld	a,(OFST+1,sp)
1493  000d 43            	cpl	a
1494  000e c452e3        	and	a,21219
1495  0011               L766:
1496  0011 c752e3        	ld	21219,a
1497                     ; 584 }
1500  0014 85            	popw	x
1501  0015 81            	ret	
1525                     ; 607 void TIM4_InternalClockConfig(void)
1525                     ; 608 {
1526                     .text:	section	.text,new
1527  0000               _TIM4_InternalClockConfig:
1531                     ; 610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1533  0000 c652e2        	ld	a,21218
1534  0003 a4f8          	and	a,#248
1535  0005 c752e2        	ld	21218,a
1536                     ; 611 }
1539  0008 81            	ret	
1623                     ; 651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1623                     ; 652 {
1624                     .text:	section	.text,new
1625  0000               _TIM4_SelectInputTrigger:
1627  0000 88            	push	a
1628  0001 88            	push	a
1629       00000001      OFST:	set	1
1632                     ; 653   uint8_t tmpsmcr = 0;
1634  0002 0f01          	clr	(OFST+0,sp)
1635                     ; 656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1637                     ; 658   tmpsmcr = TIM4->SMCR;
1639  0004 c652e2        	ld	a,21218
1640                     ; 661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1642  0007 a48f          	and	a,#143
1643                     ; 662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1645  0009 1a02          	or	a,(OFST+1,sp)
1646                     ; 664   TIM4->SMCR = (uint8_t)tmpsmcr;
1648  000b c752e2        	ld	21218,a
1649                     ; 665 }
1652  000e 85            	popw	x
1653  000f 81            	ret	
1728                     ; 676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1728                     ; 677 {
1729                     .text:	section	.text,new
1730  0000               _TIM4_SelectOutputTrigger:
1732  0000 88            	push	a
1733  0001 88            	push	a
1734       00000001      OFST:	set	1
1737                     ; 678   uint8_t tmpcr2 = 0;
1739  0002 0f01          	clr	(OFST+0,sp)
1740                     ; 681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1742                     ; 683   tmpcr2 = TIM4->CR2;
1744  0004 c652e1        	ld	a,21217
1745                     ; 686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1747  0007 a48f          	and	a,#143
1748                     ; 689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1750  0009 1a02          	or	a,(OFST+1,sp)
1751                     ; 691   TIM4->CR2 = tmpcr2;
1753  000b c752e1        	ld	21217,a
1754                     ; 692 }
1757  000e 85            	popw	x
1758  000f 81            	ret	
1849                     ; 706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1849                     ; 707 {
1850                     .text:	section	.text,new
1851  0000               _TIM4_SelectSlaveMode:
1853  0000 88            	push	a
1854  0001 88            	push	a
1855       00000001      OFST:	set	1
1858                     ; 708   uint8_t tmpsmcr = 0;
1860  0002 0f01          	clr	(OFST+0,sp)
1861                     ; 711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1863                     ; 713   tmpsmcr = TIM4->SMCR;
1865  0004 c652e2        	ld	a,21218
1866                     ; 716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1868  0007 a4f8          	and	a,#248
1869                     ; 719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1871  0009 1a02          	or	a,(OFST+1,sp)
1872                     ; 721   TIM4->SMCR = tmpsmcr;
1874  000b c752e2        	ld	21218,a
1875                     ; 722 }
1878  000e 85            	popw	x
1879  000f 81            	ret	
1915                     ; 730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1915                     ; 731 {
1916                     .text:	section	.text,new
1917  0000               _TIM4_SelectMasterSlaveMode:
1921                     ; 733   assert_param(IS_FUNCTIONAL_STATE(NewState));
1923                     ; 736   if (NewState != DISABLE)
1925  0000 4d            	tnz	a
1926  0001 2705          	jreq	L1501
1927                     ; 738     TIM4->SMCR |= TIM4_SMCR_MSM;
1929  0003 721e52e2      	bset	21218,#7
1932  0007 81            	ret	
1933  0008               L1501:
1934                     ; 742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1936  0008 721f52e2      	bres	21218,#7
1937                     ; 744 }
1940  000c 81            	ret	
1953                     	xdef	_TIM4_SelectMasterSlaveMode
1954                     	xdef	_TIM4_SelectSlaveMode
1955                     	xdef	_TIM4_SelectOutputTrigger
1956                     	xdef	_TIM4_SelectInputTrigger
1957                     	xdef	_TIM4_InternalClockConfig
1958                     	xdef	_TIM4_DMACmd
1959                     	xdef	_TIM4_ClearITPendingBit
1960                     	xdef	_TIM4_GetITStatus
1961                     	xdef	_TIM4_ClearFlag
1962                     	xdef	_TIM4_GetFlagStatus
1963                     	xdef	_TIM4_GenerateEvent
1964                     	xdef	_TIM4_ITConfig
1965                     	xdef	_TIM4_Cmd
1966                     	xdef	_TIM4_SelectOnePulseMode
1967                     	xdef	_TIM4_ARRPreloadConfig
1968                     	xdef	_TIM4_UpdateRequestConfig
1969                     	xdef	_TIM4_UpdateDisableConfig
1970                     	xdef	_TIM4_GetPrescaler
1971                     	xdef	_TIM4_GetCounter
1972                     	xdef	_TIM4_SetAutoreload
1973                     	xdef	_TIM4_SetCounter
1974                     	xdef	_TIM4_PrescalerConfig
1975                     	xdef	_TIM4_TimeBaseInit
1976                     	xdef	_TIM4_DeInit
1995                     	end
