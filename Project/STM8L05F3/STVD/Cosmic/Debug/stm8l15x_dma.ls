   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 140 void DMA_GlobalDeInit(void)
  33                     ; 141 {
  35                     .text:	section	.text,new
  36  0000               _DMA_GlobalDeInit:
  40                     ; 143   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  42  0000 72115070      	bres	20592,#0
  43                     ; 146   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  45  0004 35fc5070      	mov	20592,#252
  46                     ; 147 }
  49  0008 81            	ret	
 165                     ; 155 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 165                     ; 156 {
 166                     .text:	section	.text,new
 167  0000               _DMA_DeInit:
 169  0000 89            	pushw	x
 170       00000000      OFST:	set	0
 173                     ; 158   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 175                     ; 161   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 177  0001 f6            	ld	a,(x)
 178  0002 a4fe          	and	a,#254
 179  0004 f7            	ld	(x),a
 180                     ; 164   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 182  0005 7f            	clr	(x)
 183                     ; 167   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 185  0006 6f02          	clr	(2,x)
 186                     ; 170   if (DMA_Channelx == DMA1_Channel3)
 188  0008 a35093        	cpw	x,#20627
 189  000b 2608          	jrne	L501
 190                     ; 172     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 192  000d a640          	ld	a,#64
 193  000f e703          	ld	(3,x),a
 194                     ; 173     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 196  0011 6f05          	clr	(5,x)
 198  0013 2006          	jra	L701
 199  0015               L501:
 200                     ; 177     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 202  0015 1e01          	ldw	x,(OFST+1,sp)
 203  0017 a652          	ld	a,#82
 204  0019 e703          	ld	(3,x),a
 205  001b               L701:
 206                     ; 179   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 208  001b 1e01          	ldw	x,(OFST+1,sp)
 209  001d 6f04          	clr	(4,x)
 210                     ; 182   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 212  001f 6f06          	clr	(6,x)
 213                     ; 183   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 215  0021 6f07          	clr	(7,x)
 216                     ; 186   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 218  0023 6f01          	clr	(1,x)
 219                     ; 187 }
 222  0025 85            	popw	x
 223  0026 81            	ret	
 469                     ; 224 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 469                     ; 225               uint32_t DMA_Memory0BaseAddr,
 469                     ; 226               uint16_t DMA_PeripheralMemory1BaseAddr,
 469                     ; 227               uint8_t DMA_BufferSize,
 469                     ; 228               DMA_DIR_TypeDef DMA_DIR,
 469                     ; 229               DMA_Mode_TypeDef DMA_Mode,
 469                     ; 230               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 469                     ; 231               DMA_Priority_TypeDef DMA_Priority,
 469                     ; 232               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 469                     ; 233 {
 470                     .text:	section	.text,new
 471  0000               _DMA_Init:
 473  0000 89            	pushw	x
 474       00000000      OFST:	set	0
 477                     ; 235   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 479                     ; 236   assert_param(IS_DMA_DIR(DMA_DIR));
 481                     ; 237   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 483                     ; 238   assert_param(IS_DMA_MODE(DMA_Mode));
 485                     ; 239   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 487                     ; 240   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 489                     ; 244   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 491  0001 f6            	ld	a,(x)
 492  0002 a4fe          	and	a,#254
 493  0004 f7            	ld	(x),a
 494                     ; 247   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 496  0005 7f            	clr	(x)
 497                     ; 250   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 497                     ; 251                                            (uint8_t)DMA_Mode) | \
 497                     ; 252                                            (uint8_t)DMA_MemoryIncMode);
 499  0006 7b0c          	ld	a,(OFST+12,sp)
 500  0008 1a0d          	or	a,(OFST+13,sp)
 501  000a 1a0e          	or	a,(OFST+14,sp)
 502  000c fa            	or	a,(x)
 503  000d f7            	ld	(x),a
 504                     ; 255   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 506  000e e601          	ld	a,(1,x)
 507  0010 a4c7          	and	a,#199
 508  0012 e701          	ld	(1,x),a
 509                     ; 258   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 509                     ; 259                                   (uint8_t)DMA_MemoryDataSize);
 511  0014 7b0f          	ld	a,(OFST+15,sp)
 512  0016 1a10          	or	a,(OFST+16,sp)
 513  0018 ea01          	or	a,(1,x)
 514  001a e701          	ld	(1,x),a
 515                     ; 263   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 517  001c 7b0b          	ld	a,(OFST+11,sp)
 518  001e 1e01          	ldw	x,(OFST+1,sp)
 519  0020 e702          	ld	(2,x),a
 520                     ; 268   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 522  0022 7b09          	ld	a,(OFST+9,sp)
 523  0024 e703          	ld	(3,x),a
 524                     ; 269   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 526  0026 7b0a          	ld	a,(OFST+10,sp)
 527  0028 e704          	ld	(4,x),a
 528                     ; 273   if (DMA_Channelx == DMA1_Channel3)
 530  002a a35093        	cpw	x,#20627
 531  002d 2604          	jrne	L742
 532                     ; 275     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 534  002f 7b06          	ld	a,(OFST+6,sp)
 535  0031 e705          	ld	(5,x),a
 536  0033               L742:
 537                     ; 277   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 539  0033 7b07          	ld	a,(OFST+7,sp)
 540  0035 e706          	ld	(6,x),a
 541                     ; 278   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 543  0037 7b08          	ld	a,(OFST+8,sp)
 544  0039 e707          	ld	(7,x),a
 545                     ; 280 }
 548  003b 85            	popw	x
 549  003c 81            	ret	
 604                     ; 288 void DMA_GlobalCmd(FunctionalState NewState)
 604                     ; 289 {
 605                     .text:	section	.text,new
 606  0000               _DMA_GlobalCmd:
 610                     ; 291   assert_param(IS_FUNCTIONAL_STATE(NewState));
 612                     ; 293   if (NewState != DISABLE)
 614  0000 4d            	tnz	a
 615  0001 2705          	jreq	L772
 616                     ; 296     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 618  0003 72105070      	bset	20592,#0
 621  0007 81            	ret	
 622  0008               L772:
 623                     ; 301     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 625  0008 72115070      	bres	20592,#0
 626                     ; 303 }
 629  000c 81            	ret	
 676                     ; 314 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 676                     ; 315 {
 677                     .text:	section	.text,new
 678  0000               _DMA_Cmd:
 680  0000 89            	pushw	x
 681       00000000      OFST:	set	0
 684                     ; 317   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 686                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 688                     ; 320   if (NewState != DISABLE)
 690  0001 7b05          	ld	a,(OFST+5,sp)
 691  0003 2705          	jreq	L723
 692                     ; 323     DMA_Channelx->CCR |= DMA_CCR_CE;
 694  0005 f6            	ld	a,(x)
 695  0006 aa01          	or	a,#1
 697  0008 2005          	jra	L133
 698  000a               L723:
 699                     ; 328     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 701  000a 1e01          	ldw	x,(OFST+1,sp)
 702  000c f6            	ld	a,(x)
 703  000d a4fe          	and	a,#254
 704  000f               L133:
 705  000f f7            	ld	(x),a
 706                     ; 330 }
 709  0010 85            	popw	x
 710  0011 81            	ret	
 744                     ; 342 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 744                     ; 343 {
 745                     .text:	section	.text,new
 746  0000               _DMA_SetTimeOut:
 750                     ; 345   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 752                     ; 348   DMA1->GCSR = 0;
 754  0000 725f5070      	clr	20592
 755                     ; 349   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 757  0004 48            	sll	a
 758  0005 48            	sll	a
 759  0006 c75070        	ld	20592,a
 760                     ; 351 }
 763  0009 81            	ret	
 810                     ; 401 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 810                     ; 402 {
 811                     .text:	section	.text,new
 812  0000               _DMA_SetCurrDataCounter:
 814  0000 89            	pushw	x
 815       00000000      OFST:	set	0
 818                     ; 404   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 820                     ; 407   DMA_Channelx->CNBTR = DataNumber;
 822  0001 7b05          	ld	a,(OFST+5,sp)
 823  0003 1e01          	ldw	x,(OFST+1,sp)
 824  0005 e702          	ld	(2,x),a
 825                     ; 408 }
 828  0007 85            	popw	x
 829  0008 81            	ret	
 867                     ; 415 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 867                     ; 416 {
 868                     .text:	section	.text,new
 869  0000               _DMA_GetCurrDataCounter:
 873                     ; 418   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 875                     ; 421   return ((uint8_t)(DMA_Channelx->CNBTR));
 877  0000 e602          	ld	a,(2,x)
 880  0002 81            	ret	
 957                     ; 482 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 957                     ; 483                   DMA_ITx_TypeDef DMA_ITx,
 957                     ; 484                   FunctionalState NewState)
 957                     ; 485 {
 958                     .text:	section	.text,new
 959  0000               _DMA_ITConfig:
 961  0000 89            	pushw	x
 962       00000000      OFST:	set	0
 965                     ; 487   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 967                     ; 488   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 969                     ; 489   assert_param(IS_FUNCTIONAL_STATE(NewState));
 971                     ; 491   if (NewState != DISABLE)
 973  0001 7b06          	ld	a,(OFST+6,sp)
 974  0003 2705          	jreq	L554
 975                     ; 494     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 977  0005 f6            	ld	a,(x)
 978  0006 1a05          	or	a,(OFST+5,sp)
 980  0008 2006          	jra	L754
 981  000a               L554:
 982                     ; 499     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 984  000a 1e01          	ldw	x,(OFST+1,sp)
 985  000c 7b05          	ld	a,(OFST+5,sp)
 986  000e 43            	cpl	a
 987  000f f4            	and	a,(x)
 988  0010               L754:
 989  0010 f7            	ld	(x),a
 990                     ; 501 }
 993  0011 85            	popw	x
 994  0012 81            	ret	
1243                     ; 530 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1243                     ; 531 {
1244                     .text:	section	.text,new
1245  0000               _DMA_GetFlagStatus:
1247  0000 89            	pushw	x
1248  0001 5204          	subw	sp,#4
1249       00000004      OFST:	set	4
1252                     ; 532   FlagStatus flagstatus = RESET;
1254                     ; 533   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1256  0003 1e02          	ldw	x,(OFST-2,sp)
1257                     ; 534   uint8_t tmpgir1 = 0;
1259                     ; 535   uint8_t tmpgcsr = 0;
1261  0005 7b04          	ld	a,(OFST+0,sp)
1262  0007 97            	ld	xl,a
1263                     ; 538   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1265                     ; 541   tmpgcsr = DMA1->GCSR;
1267  0008 c65070        	ld	a,20592
1268  000b 6b04          	ld	(OFST+0,sp),a
1269                     ; 542   tmpgir1 = DMA1->GIR1;
1271  000d c65071        	ld	a,20593
1272  0010 6b01          	ld	(OFST-3,sp),a
1273                     ; 544   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1275  0012 7b05          	ld	a,(OFST+1,sp)
1276  0014 a50f          	bcp	a,#15
1277  0016 2726          	jreq	L706
1278                     ; 547     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1280  0018 a501          	bcp	a,#1
1281  001a 2705          	jreq	L116
1282                     ; 549       DMA_Channelx = DMA1_Channel0;
1284  001c ae5075        	ldw	x,#20597
1286  001f 2015          	jra	L316
1287  0021               L116:
1288                     ; 551     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1290  0021 a502          	bcp	a,#2
1291  0023 2705          	jreq	L516
1292                     ; 553       DMA_Channelx = DMA1_Channel1;
1294  0025 ae507f        	ldw	x,#20607
1296  0028 200c          	jra	L316
1297  002a               L516:
1298                     ; 555     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1300  002a a504          	bcp	a,#4
1301  002c 2705          	jreq	L126
1302                     ; 557       DMA_Channelx = DMA1_Channel2;
1304  002e ae5089        	ldw	x,#20617
1306  0031 2003          	jra	L316
1307  0033               L126:
1308                     ; 561       DMA_Channelx = DMA1_Channel3;
1310  0033 ae5093        	ldw	x,#20627
1311  0036               L316:
1312  0036 1f02          	ldw	(OFST-2,sp),x
1313                     ; 565     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1315  0038 e601          	ld	a,(1,x)
1316  003a 1406          	and	a,(OFST+2,sp)
1318  003c 200e          	jra	L526
1319  003e               L706:
1320                     ; 567   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1322  003e a510          	bcp	a,#16
1323  0040 2706          	jreq	L726
1324                     ; 570     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1326  0042 7b06          	ld	a,(OFST+2,sp)
1327  0044 1401          	and	a,(OFST-3,sp)
1329  0046 2004          	jra	L526
1330  0048               L726:
1331                     ; 575     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1333  0048 7b04          	ld	a,(OFST+0,sp)
1334  004a a402          	and	a,#2
1335  004c               L526:
1336                     ; 579   return (flagstatus);
1340  004c 5b06          	addw	sp,#6
1341  004e 81            	ret	
1388                     ; 597 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1388                     ; 598 {
1389                     .text:	section	.text,new
1390  0000               _DMA_ClearFlag:
1392  0000 89            	pushw	x
1393  0001 89            	pushw	x
1394       00000002      OFST:	set	2
1397                     ; 599   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1399  0002 ae5075        	ldw	x,#20597
1400  0005 1f01          	ldw	(OFST-1,sp),x
1401                     ; 602   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1403                     ; 605   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1405  0007 7b03          	ld	a,(OFST+1,sp)
1406  0009 a501          	bcp	a,#1
1407                     ; 607     DMA_Channelx = DMA1_Channel0;
1409  000b 2615          	jrne	L166
1410                     ; 611     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1412  000d a502          	bcp	a,#2
1413  000f 2705          	jreq	L366
1414                     ; 613       DMA_Channelx = DMA1_Channel1;
1416  0011 ae507f        	ldw	x,#20607
1418  0014 200c          	jra	L166
1419  0016               L366:
1420                     ; 617       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1422  0016 a504          	bcp	a,#4
1423  0018 2705          	jreq	L766
1424                     ; 619         DMA_Channelx = DMA1_Channel2;
1426  001a ae5089        	ldw	x,#20617
1428  001d 2003          	jra	L166
1429  001f               L766:
1430                     ; 623         DMA_Channelx = DMA1_Channel3;
1432  001f ae5093        	ldw	x,#20627
1433  0022               L166:
1435  0022 1f01          	ldw	(OFST-1,sp),x
1436                     ; 629   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1438  0024 7b04          	ld	a,(OFST+2,sp)
1439  0026 a406          	and	a,#6
1440  0028 43            	cpl	a
1441  0029 e401          	and	a,(1,x)
1442  002b e701          	ld	(1,x),a
1443                     ; 630 }
1446  002d 5b04          	addw	sp,#4
1447  002f 81            	ret	
1585                     ; 646 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1585                     ; 647 {
1586                     .text:	section	.text,new
1587  0000               _DMA_GetITStatus:
1589  0000 88            	push	a
1590  0001 5204          	subw	sp,#4
1591       00000004      OFST:	set	4
1594                     ; 648   ITStatus itstatus = RESET;
1596                     ; 649   uint8_t tmpreg = 0;
1598                     ; 650   uint8_t tmp2 = 0;
1600                     ; 651   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1602                     ; 654   assert_param(IS_DMA_GET_IT(DMA_IT));
1604                     ; 657   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1606  0003 7b05          	ld	a,(OFST+1,sp)
1607  0005 a510          	bcp	a,#16
1608  0007 2705          	jreq	L757
1609                     ; 659     DMA_Channelx = DMA1_Channel0;
1611  0009 ae5075        	ldw	x,#20597
1613  000c 2015          	jra	L167
1614  000e               L757:
1615                     ; 663     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1617  000e a520          	bcp	a,#32
1618  0010 2705          	jreq	L367
1619                     ; 665       DMA_Channelx = DMA1_Channel1;
1621  0012 ae507f        	ldw	x,#20607
1623  0015 200c          	jra	L167
1624  0017               L367:
1625                     ; 669       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1627  0017 a540          	bcp	a,#64
1628  0019 2705          	jreq	L767
1629                     ; 671         DMA_Channelx = DMA1_Channel2;
1631  001b ae5089        	ldw	x,#20617
1633  001e 2003          	jra	L167
1634  0020               L767:
1635                     ; 675         DMA_Channelx = DMA1_Channel3;
1637  0020 ae5093        	ldw	x,#20627
1638  0023               L167:
1639  0023 1f03          	ldw	(OFST-1,sp),x
1640                     ; 680   tmpreg =  DMA_Channelx->CSPR ;
1642  0025 e601          	ld	a,(1,x)
1643                     ; 681   tmpreg &= DMA_Channelx->CCR ;
1645  0027 f4            	and	a,(x)
1646  0028 6b01          	ld	(OFST-3,sp),a
1647                     ; 682   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1649  002a 7b05          	ld	a,(OFST+1,sp)
1650  002c a406          	and	a,#6
1651                     ; 683   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1653  002e 1401          	and	a,(OFST-3,sp)
1654                     ; 686   return (itstatus);
1658  0030 5b05          	addw	sp,#5
1659  0032 81            	ret	
1707                     ; 704 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1707                     ; 705 {
1708                     .text:	section	.text,new
1709  0000               _DMA_ClearITPendingBit:
1711  0000 88            	push	a
1712  0001 89            	pushw	x
1713       00000002      OFST:	set	2
1716                     ; 706   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1718  0002 ae5075        	ldw	x,#20597
1719  0005 1f01          	ldw	(OFST-1,sp),x
1720                     ; 709   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1722                     ; 711   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1724  0007 a510          	bcp	a,#16
1725                     ; 713     DMA_Channelx = DMA1_Channel0;
1727  0009 2617          	jrne	L1201
1728                     ; 717     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1730  000b 7b03          	ld	a,(OFST+1,sp)
1731  000d a520          	bcp	a,#32
1732  000f 2705          	jreq	L3201
1733                     ; 719       DMA_Channelx = DMA1_Channel1;
1735  0011 ae507f        	ldw	x,#20607
1737  0014 200c          	jra	L1201
1738  0016               L3201:
1739                     ; 723       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1741  0016 a540          	bcp	a,#64
1742  0018 2705          	jreq	L7201
1743                     ; 725         DMA_Channelx = DMA1_Channel2;
1745  001a ae5089        	ldw	x,#20617
1747  001d 2003          	jra	L1201
1748  001f               L7201:
1749                     ; 729         DMA_Channelx = DMA1_Channel3;
1751  001f ae5093        	ldw	x,#20627
1752  0022               L1201:
1754  0022 1f01          	ldw	(OFST-1,sp),x
1755                     ; 734   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1757  0024 7b03          	ld	a,(OFST+1,sp)
1758  0026 a406          	and	a,#6
1759  0028 43            	cpl	a
1760  0029 e401          	and	a,(1,x)
1761  002b e701          	ld	(1,x),a
1762                     ; 735 }
1765  002d 5b03          	addw	sp,#3
1766  002f 81            	ret	
1779                     	xdef	_DMA_ClearITPendingBit
1780                     	xdef	_DMA_GetITStatus
1781                     	xdef	_DMA_ClearFlag
1782                     	xdef	_DMA_GetFlagStatus
1783                     	xdef	_DMA_ITConfig
1784                     	xdef	_DMA_GetCurrDataCounter
1785                     	xdef	_DMA_SetCurrDataCounter
1786                     	xdef	_DMA_SetTimeOut
1787                     	xdef	_DMA_Cmd
1788                     	xdef	_DMA_GlobalCmd
1789                     	xdef	_DMA_Init
1790                     	xdef	_DMA_DeInit
1791                     	xdef	_DMA_GlobalDeInit
1810                     	end
