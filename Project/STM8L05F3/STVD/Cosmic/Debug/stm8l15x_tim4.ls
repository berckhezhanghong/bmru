   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 130 void TIM4_DeInit(void)
  33                     ; 131 {
  34                     .text:	section	.text,new
  35  0000               f_TIM4_DeInit:
  39                     ; 132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  41  0000 725f52e0      	clr	21216
  42                     ; 133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  44  0004 725f52e1      	clr	21217
  45                     ; 134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  47  0008 725f52e2      	clr	21218
  48                     ; 135   TIM4->IER   = TIM4_IER_RESET_VALUE;
  50  000c 725f52e4      	clr	21220
  51                     ; 136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  53  0010 725f52e7      	clr	21223
  54                     ; 137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  56  0014 725f52e8      	clr	21224
  57                     ; 138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  59  0018 35ff52e9      	mov	21225,#255
  60                     ; 139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  62  001c 725f52e5      	clr	21221
  63                     ; 140 }
  66  0020 87            	retf	
 231                     ; 165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 231                     ; 166                        uint8_t TIM4_Period)
 231                     ; 167 {
 232                     .text:	section	.text,new
 233  0000               f_TIM4_TimeBaseInit:
 237                     ; 169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 239                     ; 171   TIM4->ARR = (uint8_t)(TIM4_Period);
 241  0000 9f            	ld	a,xl
 242  0001 c752e9        	ld	21225,a
 243                     ; 173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 245  0004 9e            	ld	a,xh
 246  0005 c752e8        	ld	21224,a
 247                     ; 176   TIM4->EGR = TIM4_EventSource_Update;
 249  0008 350152e6      	mov	21222,#1
 250                     ; 177 }
 253  000c 87            	retf	
 320                     ; 205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 320                     ; 206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 320                     ; 207 {
 321                     .text:	section	.text,new
 322  0000               f_TIM4_PrescalerConfig:
 326                     ; 209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 328                     ; 210   assert_param(IS_TIM4_Prescaler(Prescaler));
 330                     ; 213   TIM4->PSCR = (uint8_t) Prescaler;
 332  0000 9e            	ld	a,xh
 333  0001 c752e8        	ld	21224,a
 334                     ; 216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 336  0004 9f            	ld	a,xl
 337  0005 4a            	dec	a
 338  0006 2605          	jrne	L731
 339                     ; 218     TIM4->EGR |= TIM4_EGR_UG ;
 341  0008 721052e6      	bset	21222,#0
 344  000c 87            	retf	
 345  000d               L731:
 346                     ; 222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 348  000d 721152e6      	bres	21222,#0
 349                     ; 224 }
 352  0011 87            	retf	
 383                     ; 232 void TIM4_SetCounter(uint8_t Counter)
 383                     ; 233 {
 384                     .text:	section	.text,new
 385  0000               f_TIM4_SetCounter:
 389                     ; 235   TIM4->CNTR = (uint8_t)(Counter);
 391  0000 c752e7        	ld	21223,a
 392                     ; 236 }
 395  0003 87            	retf	
 426                     ; 244 void TIM4_SetAutoreload(uint8_t Autoreload)
 426                     ; 245 {
 427                     .text:	section	.text,new
 428  0000               f_TIM4_SetAutoreload:
 432                     ; 247   TIM4->ARR = (uint8_t)(Autoreload);
 434  0000 c752e9        	ld	21225,a
 435                     ; 248 }
 438  0003 87            	retf	
 469                     ; 255 uint8_t TIM4_GetCounter(void)
 469                     ; 256 {
 470                     .text:	section	.text,new
 471  0000               f_TIM4_GetCounter:
 473  0000 88            	push	a
 474       00000001      OFST:	set	1
 477                     ; 257   uint8_t tmpcntr = 0;
 479  0001 0f01          	clr	(OFST+0,sp)
 480                     ; 258   tmpcntr = TIM4->CNTR;
 482  0003 c652e7        	ld	a,21223
 483                     ; 260   return ((uint8_t)tmpcntr);
 487  0006 5b01          	addw	sp,#1
 488  0008 87            	retf	
 511                     ; 284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 511                     ; 285 {
 512                     .text:	section	.text,new
 513  0000               f_TIM4_GetPrescaler:
 517                     ; 287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 519  0000 c652e8        	ld	a,21224
 522  0003 87            	retf	
 577                     ; 296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 577                     ; 297 {
 578                     .text:	section	.text,new
 579  0000               f_TIM4_UpdateDisableConfig:
 583                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 585                     ; 302   if (NewState != DISABLE)
 587  0000 4d            	tnz	a
 588  0001 2705          	jreq	L542
 589                     ; 304     TIM4->CR1 |= TIM4_CR1_UDIS ;
 591  0003 721252e0      	bset	21216,#1
 594  0007 87            	retf	
 595  0008               L542:
 596                     ; 308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 598  0008 721352e0      	bres	21216,#1
 599                     ; 310 }
 602  000c 87            	retf	
 659                     ; 320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 659                     ; 321 {
 660                     .text:	section	.text,new
 661  0000               f_TIM4_UpdateRequestConfig:
 665                     ; 323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 667                     ; 326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 669  0000 4a            	dec	a
 670  0001 2605          	jrne	L772
 671                     ; 328     TIM4->CR1 |= TIM4_CR1_URS ;
 673  0003 721452e0      	bset	21216,#2
 676  0007 87            	retf	
 677  0008               L772:
 678                     ; 332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 680  0008 721552e0      	bres	21216,#2
 681                     ; 334 }
 684  000c 87            	retf	
 719                     ; 342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 719                     ; 343 {
 720                     .text:	section	.text,new
 721  0000               f_TIM4_ARRPreloadConfig:
 725                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 727                     ; 348   if (NewState != DISABLE)
 729  0000 4d            	tnz	a
 730  0001 2705          	jreq	L123
 731                     ; 350     TIM4->CR1 |= TIM4_CR1_ARPE ;
 733  0003 721e52e0      	bset	21216,#7
 736  0007 87            	retf	
 737  0008               L123:
 738                     ; 354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 740  0008 721f52e0      	bres	21216,#7
 741                     ; 356 }
 744  000c 87            	retf	
 800                     ; 366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 800                     ; 367 {
 801                     .text:	section	.text,new
 802  0000               f_TIM4_SelectOnePulseMode:
 806                     ; 369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 808                     ; 372   if (TIM4_OPMode == TIM4_OPMode_Single)
 810  0000 4a            	dec	a
 811  0001 2605          	jrne	L353
 812                     ; 374     TIM4->CR1 |= TIM4_CR1_OPM ;
 814  0003 721652e0      	bset	21216,#3
 817  0007 87            	retf	
 818  0008               L353:
 819                     ; 378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 821  0008 721752e0      	bres	21216,#3
 822                     ; 380 }
 825  000c 87            	retf	
 859                     ; 388 void TIM4_Cmd(FunctionalState NewState)
 859                     ; 389 {
 860                     .text:	section	.text,new
 861  0000               f_TIM4_Cmd:
 865                     ; 391   assert_param(IS_FUNCTIONAL_STATE(NewState));
 867                     ; 394   if (NewState != DISABLE)
 869  0000 4d            	tnz	a
 870  0001 2705          	jreq	L573
 871                     ; 396     TIM4->CR1 |= TIM4_CR1_CEN ;
 873  0003 721052e0      	bset	21216,#0
 876  0007 87            	retf	
 877  0008               L573:
 878                     ; 400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 880  0008 721152e0      	bres	21216,#0
 881                     ; 402 }
 884  000c 87            	retf	
 948                     ; 430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 948                     ; 431 {
 949                     .text:	section	.text,new
 950  0000               f_TIM4_ITConfig:
 952  0000 89            	pushw	x
 953       00000000      OFST:	set	0
 956                     ; 433   assert_param(IS_TIM4_IT(TIM4_IT));
 958                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
 960                     ; 436   if (NewState != DISABLE)
 962  0001 9f            	ld	a,xl
 963  0002 4d            	tnz	a
 964  0003 2706          	jreq	L334
 965                     ; 439     TIM4->IER |= (uint8_t)TIM4_IT;
 967  0005 9e            	ld	a,xh
 968  0006 ca52e4        	or	a,21220
 970  0009 2006          	jra	L534
 971  000b               L334:
 972                     ; 444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 974  000b 7b01          	ld	a,(OFST+1,sp)
 975  000d 43            	cpl	a
 976  000e c452e4        	and	a,21220
 977  0011               L534:
 978  0011 c752e4        	ld	21220,a
 979                     ; 446 }
 982  0014 85            	popw	x
 983  0015 87            	retf	
1039                     ; 456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1039                     ; 457 {
1040                     .text:	section	.text,new
1041  0000               f_TIM4_GenerateEvent:
1045                     ; 459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1047                     ; 462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1049  0000 ca52e6        	or	a,21222
1050  0003 c752e6        	ld	21222,a
1051                     ; 463 }
1054  0006 87            	retf	
1139                     ; 474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1139                     ; 475 {
1140                     .text:	section	.text,new
1141  0000               f_TIM4_GetFlagStatus:
1143  0000 88            	push	a
1144       00000001      OFST:	set	1
1147                     ; 476   FlagStatus bitstatus = RESET;
1149  0001 0f01          	clr	(OFST+0,sp)
1150                     ; 479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1152                     ; 481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1154  0003 c452e5        	and	a,21221
1155  0006 2702          	jreq	L725
1156                     ; 483     bitstatus = SET;
1158  0008 a601          	ld	a,#1
1160  000a               L725:
1161                     ; 487     bitstatus = RESET;
1163                     ; 489   return ((FlagStatus)bitstatus);
1167  000a 5b01          	addw	sp,#1
1168  000c 87            	retf	
1202                     ; 500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1202                     ; 501 {
1203                     .text:	section	.text,new
1204  0000               f_TIM4_ClearFlag:
1208                     ; 503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1210                     ; 505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1212  0000 43            	cpl	a
1213  0001 c752e5        	ld	21221,a
1214                     ; 506 }
1217  0004 87            	retf	
1276                     ; 518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1276                     ; 519 {
1277                     .text:	section	.text,new
1278  0000               f_TIM4_GetITStatus:
1280  0000 88            	push	a
1281  0001 89            	pushw	x
1282       00000002      OFST:	set	2
1285                     ; 520   ITStatus bitstatus = RESET;
1287                     ; 522   uint8_t itStatus = 0x0, itEnable = 0x0;
1291  0002 7b02          	ld	a,(OFST+0,sp)
1292  0004 97            	ld	xl,a
1293                     ; 525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1295                     ; 527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1297  0005 c652e5        	ld	a,21221
1298  0008 1403          	and	a,(OFST+1,sp)
1299  000a 6b01          	ld	(OFST-1,sp),a
1300                     ; 529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1302  000c c652e4        	ld	a,21220
1303  000f 1403          	and	a,(OFST+1,sp)
1304  0011 6b02          	ld	(OFST+0,sp),a
1305                     ; 531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1307  0013 7b01          	ld	a,(OFST-1,sp)
1308  0015 2708          	jreq	L775
1310  0017 7b02          	ld	a,(OFST+0,sp)
1311  0019 2704          	jreq	L775
1312                     ; 533     bitstatus = (ITStatus)SET;
1314  001b a601          	ld	a,#1
1316  001d 2001          	jra	L106
1317  001f               L775:
1318                     ; 537     bitstatus = (ITStatus)RESET;
1320  001f 4f            	clr	a
1321  0020               L106:
1322                     ; 539   return ((ITStatus)bitstatus);
1326  0020 5b03          	addw	sp,#3
1327  0022 87            	retf	
1362                     ; 550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1362                     ; 551 {
1363                     .text:	section	.text,new
1364  0000               f_TIM4_ClearITPendingBit:
1368                     ; 553   assert_param(IS_TIM4_IT(TIM4_IT));
1370                     ; 556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1372  0000 43            	cpl	a
1373  0001 c752e5        	ld	21221,a
1374                     ; 557 }
1377  0004 87            	retf	
1435                     ; 568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1435                     ; 569 {
1436                     .text:	section	.text,new
1437  0000               f_TIM4_DMACmd:
1439  0000 89            	pushw	x
1440       00000000      OFST:	set	0
1443                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
1445                     ; 572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1447                     ; 574   if (NewState != DISABLE)
1449  0001 9f            	ld	a,xl
1450  0002 4d            	tnz	a
1451  0003 2706          	jreq	L156
1452                     ; 577     TIM4->DER |= (uint8_t)TIM4_DMASource;
1454  0005 9e            	ld	a,xh
1455  0006 ca52e3        	or	a,21219
1457  0009 2006          	jra	L356
1458  000b               L156:
1459                     ; 582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1461  000b 7b01          	ld	a,(OFST+1,sp)
1462  000d 43            	cpl	a
1463  000e c452e3        	and	a,21219
1464  0011               L356:
1465  0011 c752e3        	ld	21219,a
1466                     ; 584 }
1469  0014 85            	popw	x
1470  0015 87            	retf	
1493                     ; 607 void TIM4_InternalClockConfig(void)
1493                     ; 608 {
1494                     .text:	section	.text,new
1495  0000               f_TIM4_InternalClockConfig:
1499                     ; 610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1501  0000 c652e2        	ld	a,21218
1502  0003 a4f8          	and	a,#248
1503  0005 c752e2        	ld	21218,a
1504                     ; 611 }
1507  0008 87            	retf	
1588                     ; 651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1588                     ; 652 {
1589                     .text:	section	.text,new
1590  0000               f_TIM4_SelectInputTrigger:
1592  0000 88            	push	a
1593  0001 88            	push	a
1594       00000001      OFST:	set	1
1597                     ; 653   uint8_t tmpsmcr = 0;
1599  0002 0f01          	clr	(OFST+0,sp)
1600                     ; 656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1602                     ; 658   tmpsmcr = TIM4->SMCR;
1604  0004 c652e2        	ld	a,21218
1605                     ; 661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1607  0007 a48f          	and	a,#143
1608                     ; 662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1610  0009 1a02          	or	a,(OFST+1,sp)
1611                     ; 664   TIM4->SMCR = (uint8_t)tmpsmcr;
1613  000b c752e2        	ld	21218,a
1614                     ; 665 }
1617  000e 85            	popw	x
1618  000f 87            	retf	
1690                     ; 676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1690                     ; 677 {
1691                     .text:	section	.text,new
1692  0000               f_TIM4_SelectOutputTrigger:
1694  0000 88            	push	a
1695  0001 88            	push	a
1696       00000001      OFST:	set	1
1699                     ; 678   uint8_t tmpcr2 = 0;
1701  0002 0f01          	clr	(OFST+0,sp)
1702                     ; 681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1704                     ; 683   tmpcr2 = TIM4->CR2;
1706  0004 c652e1        	ld	a,21217
1707                     ; 686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1709  0007 a48f          	and	a,#143
1710                     ; 689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1712  0009 1a02          	or	a,(OFST+1,sp)
1713                     ; 691   TIM4->CR2 = tmpcr2;
1715  000b c752e1        	ld	21217,a
1716                     ; 692 }
1719  000e 85            	popw	x
1720  000f 87            	retf	
1808                     ; 706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1808                     ; 707 {
1809                     .text:	section	.text,new
1810  0000               f_TIM4_SelectSlaveMode:
1812  0000 88            	push	a
1813  0001 88            	push	a
1814       00000001      OFST:	set	1
1817                     ; 708   uint8_t tmpsmcr = 0;
1819  0002 0f01          	clr	(OFST+0,sp)
1820                     ; 711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1822                     ; 713   tmpsmcr = TIM4->SMCR;
1824  0004 c652e2        	ld	a,21218
1825                     ; 716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1827  0007 a4f8          	and	a,#248
1828                     ; 719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1830  0009 1a02          	or	a,(OFST+1,sp)
1831                     ; 721   TIM4->SMCR = tmpsmcr;
1833  000b c752e2        	ld	21218,a
1834                     ; 722 }
1837  000e 85            	popw	x
1838  000f 87            	retf	
1873                     ; 730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1873                     ; 731 {
1874                     .text:	section	.text,new
1875  0000               f_TIM4_SelectMasterSlaveMode:
1879                     ; 733   assert_param(IS_FUNCTIONAL_STATE(NewState));
1881                     ; 736   if (NewState != DISABLE)
1883  0000 4d            	tnz	a
1884  0001 2705          	jreq	L7201
1885                     ; 738     TIM4->SMCR |= TIM4_SMCR_MSM;
1887  0003 721e52e2      	bset	21218,#7
1890  0007 87            	retf	
1891  0008               L7201:
1892                     ; 742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1894  0008 721f52e2      	bres	21218,#7
1895                     ; 744 }
1898  000c 87            	retf	
1910                     	xdef	f_TIM4_SelectMasterSlaveMode
1911                     	xdef	f_TIM4_SelectSlaveMode
1912                     	xdef	f_TIM4_SelectOutputTrigger
1913                     	xdef	f_TIM4_SelectInputTrigger
1914                     	xdef	f_TIM4_InternalClockConfig
1915                     	xdef	f_TIM4_DMACmd
1916                     	xdef	f_TIM4_ClearITPendingBit
1917                     	xdef	f_TIM4_GetITStatus
1918                     	xdef	f_TIM4_ClearFlag
1919                     	xdef	f_TIM4_GetFlagStatus
1920                     	xdef	f_TIM4_GenerateEvent
1921                     	xdef	f_TIM4_ITConfig
1922                     	xdef	f_TIM4_Cmd
1923                     	xdef	f_TIM4_SelectOnePulseMode
1924                     	xdef	f_TIM4_ARRPreloadConfig
1925                     	xdef	f_TIM4_UpdateRequestConfig
1926                     	xdef	f_TIM4_UpdateDisableConfig
1927                     	xdef	f_TIM4_GetPrescaler
1928                     	xdef	f_TIM4_GetCounter
1929                     	xdef	f_TIM4_SetAutoreload
1930                     	xdef	f_TIM4_SetCounter
1931                     	xdef	f_TIM4_PrescalerConfig
1932                     	xdef	f_TIM4_TimeBaseInit
1933                     	xdef	f_TIM4_DeInit
1952                     	end
