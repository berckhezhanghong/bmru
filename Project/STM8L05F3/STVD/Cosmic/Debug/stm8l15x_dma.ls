   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 140 void DMA_GlobalDeInit(void)
  33                     ; 141 {
  34                     .text:	section	.text,new
  35  0000               f_DMA_GlobalDeInit:
  39                     ; 143   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  41  0000 72115070      	bres	20592,#0
  42                     ; 146   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  44  0004 35fc5070      	mov	20592,#252
  45                     ; 147 }
  48  0008 87            	retf	
 163                     ; 155 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 163                     ; 156 {
 164                     .text:	section	.text,new
 165  0000               f_DMA_DeInit:
 167  0000 89            	pushw	x
 168       00000000      OFST:	set	0
 171                     ; 158   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 173                     ; 161   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 175  0001 f6            	ld	a,(x)
 176  0002 a4fe          	and	a,#254
 177  0004 f7            	ld	(x),a
 178                     ; 164   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 180  0005 7f            	clr	(x)
 181                     ; 167   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 183  0006 6f02          	clr	(2,x)
 184                     ; 170   if (DMA_Channelx == DMA1_Channel3)
 186  0008 a35093        	cpw	x,#20627
 187  000b 2608          	jrne	L501
 188                     ; 172     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 190  000d a640          	ld	a,#64
 191  000f e703          	ld	(3,x),a
 192                     ; 173     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 194  0011 6f05          	clr	(5,x)
 196  0013 2006          	jra	L701
 197  0015               L501:
 198                     ; 177     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 200  0015 1e01          	ldw	x,(OFST+1,sp)
 201  0017 a652          	ld	a,#82
 202  0019 e703          	ld	(3,x),a
 203  001b               L701:
 204                     ; 179   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 206  001b 1e01          	ldw	x,(OFST+1,sp)
 207  001d 6f04          	clr	(4,x)
 208                     ; 182   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 210  001f 6f06          	clr	(6,x)
 211                     ; 183   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 213  0021 6f07          	clr	(7,x)
 214                     ; 186   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 216  0023 6f01          	clr	(1,x)
 217                     ; 187 }
 220  0025 85            	popw	x
 221  0026 87            	retf	
 460                     ; 224 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 460                     ; 225               uint32_t DMA_Memory0BaseAddr,
 460                     ; 226               uint16_t DMA_PeripheralMemory1BaseAddr,
 460                     ; 227               uint8_t DMA_BufferSize,
 460                     ; 228               DMA_DIR_TypeDef DMA_DIR,
 460                     ; 229               DMA_Mode_TypeDef DMA_Mode,
 460                     ; 230               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 460                     ; 231               DMA_Priority_TypeDef DMA_Priority,
 460                     ; 232               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 460                     ; 233 {
 461                     .text:	section	.text,new
 462  0000               f_DMA_Init:
 464  0000 89            	pushw	x
 465       00000000      OFST:	set	0
 468                     ; 235   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 470                     ; 236   assert_param(IS_DMA_DIR(DMA_DIR));
 472                     ; 237   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 474                     ; 238   assert_param(IS_DMA_MODE(DMA_Mode));
 476                     ; 239   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 478                     ; 240   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 480                     ; 244   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 482  0001 f6            	ld	a,(x)
 483  0002 a4fe          	and	a,#254
 484  0004 f7            	ld	(x),a
 485                     ; 247   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 487  0005 7f            	clr	(x)
 488                     ; 250   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 488                     ; 251                                            (uint8_t)DMA_Mode) | \
 488                     ; 252                                            (uint8_t)DMA_MemoryIncMode);
 490  0006 7b0d          	ld	a,(OFST+13,sp)
 491  0008 1a0e          	or	a,(OFST+14,sp)
 492  000a 1a0f          	or	a,(OFST+15,sp)
 493  000c fa            	or	a,(x)
 494  000d f7            	ld	(x),a
 495                     ; 255   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 497  000e e601          	ld	a,(1,x)
 498  0010 a4c7          	and	a,#199
 499  0012 e701          	ld	(1,x),a
 500                     ; 258   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 500                     ; 259                                   (uint8_t)DMA_MemoryDataSize);
 502  0014 7b10          	ld	a,(OFST+16,sp)
 503  0016 1a11          	or	a,(OFST+17,sp)
 504  0018 ea01          	or	a,(1,x)
 505  001a e701          	ld	(1,x),a
 506                     ; 263   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 508  001c 7b0c          	ld	a,(OFST+12,sp)
 509  001e 1e01          	ldw	x,(OFST+1,sp)
 510  0020 e702          	ld	(2,x),a
 511                     ; 268   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 513  0022 7b0a          	ld	a,(OFST+10,sp)
 514  0024 e703          	ld	(3,x),a
 515                     ; 269   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 517  0026 7b0b          	ld	a,(OFST+11,sp)
 518  0028 e704          	ld	(4,x),a
 519                     ; 273   if (DMA_Channelx == DMA1_Channel3)
 521  002a a35093        	cpw	x,#20627
 522  002d 2604          	jrne	L142
 523                     ; 275     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 525  002f 7b07          	ld	a,(OFST+7,sp)
 526  0031 e705          	ld	(5,x),a
 527  0033               L142:
 528                     ; 277   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 530  0033 7b08          	ld	a,(OFST+8,sp)
 531  0035 e706          	ld	(6,x),a
 532                     ; 278   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 534  0037 7b09          	ld	a,(OFST+9,sp)
 535  0039 e707          	ld	(7,x),a
 536                     ; 280 }
 539  003b 85            	popw	x
 540  003c 87            	retf	
 594                     ; 288 void DMA_GlobalCmd(FunctionalState NewState)
 594                     ; 289 {
 595                     .text:	section	.text,new
 596  0000               f_DMA_GlobalCmd:
 600                     ; 291   assert_param(IS_FUNCTIONAL_STATE(NewState));
 602                     ; 293   if (NewState != DISABLE)
 604  0000 4d            	tnz	a
 605  0001 2705          	jreq	L172
 606                     ; 296     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 608  0003 72105070      	bset	20592,#0
 611  0007 87            	retf	
 612  0008               L172:
 613                     ; 301     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 615  0008 72115070      	bres	20592,#0
 616                     ; 303 }
 619  000c 87            	retf	
 665                     ; 314 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 665                     ; 315 {
 666                     .text:	section	.text,new
 667  0000               f_DMA_Cmd:
 669  0000 89            	pushw	x
 670       00000000      OFST:	set	0
 673                     ; 317   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 675                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 677                     ; 320   if (NewState != DISABLE)
 679  0001 7b06          	ld	a,(OFST+6,sp)
 680  0003 2705          	jreq	L123
 681                     ; 323     DMA_Channelx->CCR |= DMA_CCR_CE;
 683  0005 f6            	ld	a,(x)
 684  0006 aa01          	or	a,#1
 686  0008 2005          	jra	L323
 687  000a               L123:
 688                     ; 328     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 690  000a 1e01          	ldw	x,(OFST+1,sp)
 691  000c f6            	ld	a,(x)
 692  000d a4fe          	and	a,#254
 693  000f               L323:
 694  000f f7            	ld	(x),a
 695                     ; 330 }
 698  0010 85            	popw	x
 699  0011 87            	retf	
 730                     ; 342 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 730                     ; 343 {
 731                     .text:	section	.text,new
 732  0000               f_DMA_SetTimeOut:
 736                     ; 345   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 738                     ; 348   DMA1->GCSR = 0;
 740  0000 725f5070      	clr	20592
 741                     ; 349   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 743  0004 48            	sll	a
 744  0005 48            	sll	a
 745  0006 c75070        	ld	20592,a
 746                     ; 351 }
 749  0009 87            	retf	
 793                     ; 401 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 793                     ; 402 {
 794                     .text:	section	.text,new
 795  0000               f_DMA_SetCurrDataCounter:
 797  0000 89            	pushw	x
 798       00000000      OFST:	set	0
 801                     ; 404   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 803                     ; 407   DMA_Channelx->CNBTR = DataNumber;
 805  0001 7b06          	ld	a,(OFST+6,sp)
 806  0003 1e01          	ldw	x,(OFST+1,sp)
 807  0005 e702          	ld	(2,x),a
 808                     ; 408 }
 811  0007 85            	popw	x
 812  0008 87            	retf	
 849                     ; 415 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 849                     ; 416 {
 850                     .text:	section	.text,new
 851  0000               f_DMA_GetCurrDataCounter:
 855                     ; 418   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 857                     ; 421   return ((uint8_t)(DMA_Channelx->CNBTR));
 859  0000 e602          	ld	a,(2,x)
 862  0002 87            	retf	
 938                     ; 482 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 938                     ; 483                   DMA_ITx_TypeDef DMA_ITx,
 938                     ; 484                   FunctionalState NewState)
 938                     ; 485 {
 939                     .text:	section	.text,new
 940  0000               f_DMA_ITConfig:
 942  0000 89            	pushw	x
 943       00000000      OFST:	set	0
 946                     ; 487   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 948                     ; 488   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 950                     ; 489   assert_param(IS_FUNCTIONAL_STATE(NewState));
 952                     ; 491   if (NewState != DISABLE)
 954  0001 7b07          	ld	a,(OFST+7,sp)
 955  0003 2705          	jreq	L344
 956                     ; 494     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 958  0005 f6            	ld	a,(x)
 959  0006 1a06          	or	a,(OFST+6,sp)
 961  0008 2006          	jra	L544
 962  000a               L344:
 963                     ; 499     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 965  000a 1e01          	ldw	x,(OFST+1,sp)
 966  000c 7b06          	ld	a,(OFST+6,sp)
 967  000e 43            	cpl	a
 968  000f f4            	and	a,(x)
 969  0010               L544:
 970  0010 f7            	ld	(x),a
 971                     ; 501 }
 974  0011 85            	popw	x
 975  0012 87            	retf	
1219                     ; 530 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1219                     ; 531 {
1220                     .text:	section	.text,new
1221  0000               f_DMA_GetFlagStatus:
1223  0000 89            	pushw	x
1224  0001 5204          	subw	sp,#4
1225       00000004      OFST:	set	4
1228                     ; 532   FlagStatus flagstatus = RESET;
1230                     ; 533   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1232  0003 1e02          	ldw	x,(OFST-2,sp)
1233                     ; 534   uint8_t tmpgir1 = 0;
1235                     ; 535   uint8_t tmpgcsr = 0;
1237  0005 7b04          	ld	a,(OFST+0,sp)
1238  0007 97            	ld	xl,a
1239                     ; 538   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1241                     ; 541   tmpgcsr = DMA1->GCSR;
1243  0008 c65070        	ld	a,20592
1244  000b 6b04          	ld	(OFST+0,sp),a
1245                     ; 542   tmpgir1 = DMA1->GIR1;
1247  000d c65071        	ld	a,20593
1248  0010 6b01          	ld	(OFST-3,sp),a
1249                     ; 544   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1251  0012 7b05          	ld	a,(OFST+1,sp)
1252  0014 a50f          	bcp	a,#15
1253  0016 2726          	jreq	L175
1254                     ; 547     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1256  0018 a501          	bcp	a,#1
1257  001a 2705          	jreq	L375
1258                     ; 549       DMA_Channelx = DMA1_Channel0;
1260  001c ae5075        	ldw	x,#20597
1262  001f 2015          	jra	L575
1263  0021               L375:
1264                     ; 551     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1266  0021 a502          	bcp	a,#2
1267  0023 2705          	jreq	L775
1268                     ; 553       DMA_Channelx = DMA1_Channel1;
1270  0025 ae507f        	ldw	x,#20607
1272  0028 200c          	jra	L575
1273  002a               L775:
1274                     ; 555     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1276  002a a504          	bcp	a,#4
1277  002c 2705          	jreq	L306
1278                     ; 557       DMA_Channelx = DMA1_Channel2;
1280  002e ae5089        	ldw	x,#20617
1282  0031 2003          	jra	L575
1283  0033               L306:
1284                     ; 561       DMA_Channelx = DMA1_Channel3;
1286  0033 ae5093        	ldw	x,#20627
1287  0036               L575:
1288  0036 1f02          	ldw	(OFST-2,sp),x
1289                     ; 565     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1291  0038 e601          	ld	a,(1,x)
1292  003a 1406          	and	a,(OFST+2,sp)
1294  003c 200e          	jra	L706
1295  003e               L175:
1296                     ; 567   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1298  003e a510          	bcp	a,#16
1299  0040 2706          	jreq	L116
1300                     ; 570     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1302  0042 7b06          	ld	a,(OFST+2,sp)
1303  0044 1401          	and	a,(OFST-3,sp)
1305  0046 2004          	jra	L706
1306  0048               L116:
1307                     ; 575     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1309  0048 7b04          	ld	a,(OFST+0,sp)
1310  004a a402          	and	a,#2
1311  004c               L706:
1312                     ; 579   return (flagstatus);
1316  004c 5b06          	addw	sp,#6
1317  004e 87            	retf	
1363                     ; 597 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1363                     ; 598 {
1364                     .text:	section	.text,new
1365  0000               f_DMA_ClearFlag:
1367  0000 89            	pushw	x
1368  0001 89            	pushw	x
1369       00000002      OFST:	set	2
1372                     ; 599   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1374  0002 ae5075        	ldw	x,#20597
1375  0005 1f01          	ldw	(OFST-1,sp),x
1376                     ; 602   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1378                     ; 605   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1380  0007 7b03          	ld	a,(OFST+1,sp)
1381  0009 a501          	bcp	a,#1
1382                     ; 607     DMA_Channelx = DMA1_Channel0;
1384  000b 2615          	jrne	L346
1385                     ; 611     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1387  000d a502          	bcp	a,#2
1388  000f 2705          	jreq	L546
1389                     ; 613       DMA_Channelx = DMA1_Channel1;
1391  0011 ae507f        	ldw	x,#20607
1393  0014 200c          	jra	L346
1394  0016               L546:
1395                     ; 617       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1397  0016 a504          	bcp	a,#4
1398  0018 2705          	jreq	L156
1399                     ; 619         DMA_Channelx = DMA1_Channel2;
1401  001a ae5089        	ldw	x,#20617
1403  001d 2003          	jra	L346
1404  001f               L156:
1405                     ; 623         DMA_Channelx = DMA1_Channel3;
1407  001f ae5093        	ldw	x,#20627
1408  0022               L346:
1410  0022 1f01          	ldw	(OFST-1,sp),x
1411                     ; 629   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1413  0024 7b04          	ld	a,(OFST+2,sp)
1414  0026 a406          	and	a,#6
1415  0028 43            	cpl	a
1416  0029 e401          	and	a,(1,x)
1417  002b e701          	ld	(1,x),a
1418                     ; 630 }
1421  002d 5b04          	addw	sp,#4
1422  002f 87            	retf	
1555                     ; 646 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1555                     ; 647 {
1556                     .text:	section	.text,new
1557  0000               f_DMA_GetITStatus:
1559  0000 88            	push	a
1560  0001 5204          	subw	sp,#4
1561       00000004      OFST:	set	4
1564                     ; 648   ITStatus itstatus = RESET;
1566                     ; 649   uint8_t tmpreg = 0;
1568                     ; 650   uint8_t tmp2 = 0;
1570                     ; 651   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1572                     ; 654   assert_param(IS_DMA_GET_IT(DMA_IT));
1574                     ; 657   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1576  0003 7b05          	ld	a,(OFST+1,sp)
1577  0005 a510          	bcp	a,#16
1578  0007 2705          	jreq	L537
1579                     ; 659     DMA_Channelx = DMA1_Channel0;
1581  0009 ae5075        	ldw	x,#20597
1583  000c 2015          	jra	L737
1584  000e               L537:
1585                     ; 663     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1587  000e a520          	bcp	a,#32
1588  0010 2705          	jreq	L147
1589                     ; 665       DMA_Channelx = DMA1_Channel1;
1591  0012 ae507f        	ldw	x,#20607
1593  0015 200c          	jra	L737
1594  0017               L147:
1595                     ; 669       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1597  0017 a540          	bcp	a,#64
1598  0019 2705          	jreq	L547
1599                     ; 671         DMA_Channelx = DMA1_Channel2;
1601  001b ae5089        	ldw	x,#20617
1603  001e 2003          	jra	L737
1604  0020               L547:
1605                     ; 675         DMA_Channelx = DMA1_Channel3;
1607  0020 ae5093        	ldw	x,#20627
1608  0023               L737:
1609  0023 1f03          	ldw	(OFST-1,sp),x
1610                     ; 680   tmpreg =  DMA_Channelx->CSPR ;
1612  0025 e601          	ld	a,(1,x)
1613                     ; 681   tmpreg &= DMA_Channelx->CCR ;
1615  0027 f4            	and	a,(x)
1616  0028 6b01          	ld	(OFST-3,sp),a
1617                     ; 682   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1619  002a 7b05          	ld	a,(OFST+1,sp)
1620  002c a406          	and	a,#6
1621                     ; 683   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1623  002e 1401          	and	a,(OFST-3,sp)
1624                     ; 686   return (itstatus);
1628  0030 5b05          	addw	sp,#5
1629  0032 87            	retf	
1676                     ; 704 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1676                     ; 705 {
1677                     .text:	section	.text,new
1678  0000               f_DMA_ClearITPendingBit:
1680  0000 88            	push	a
1681  0001 89            	pushw	x
1682       00000002      OFST:	set	2
1685                     ; 706   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1687  0002 ae5075        	ldw	x,#20597
1688  0005 1f01          	ldw	(OFST-1,sp),x
1689                     ; 709   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1691                     ; 711   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1693  0007 a510          	bcp	a,#16
1694                     ; 713     DMA_Channelx = DMA1_Channel0;
1696  0009 2617          	jrne	L777
1697                     ; 717     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1699  000b 7b03          	ld	a,(OFST+1,sp)
1700  000d a520          	bcp	a,#32
1701  000f 2705          	jreq	L1001
1702                     ; 719       DMA_Channelx = DMA1_Channel1;
1704  0011 ae507f        	ldw	x,#20607
1706  0014 200c          	jra	L777
1707  0016               L1001:
1708                     ; 723       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1710  0016 a540          	bcp	a,#64
1711  0018 2705          	jreq	L5001
1712                     ; 725         DMA_Channelx = DMA1_Channel2;
1714  001a ae5089        	ldw	x,#20617
1716  001d 2003          	jra	L777
1717  001f               L5001:
1718                     ; 729         DMA_Channelx = DMA1_Channel3;
1720  001f ae5093        	ldw	x,#20627
1721  0022               L777:
1723  0022 1f01          	ldw	(OFST-1,sp),x
1724                     ; 734   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1726  0024 7b03          	ld	a,(OFST+1,sp)
1727  0026 a406          	and	a,#6
1728  0028 43            	cpl	a
1729  0029 e401          	and	a,(1,x)
1730  002b e701          	ld	(1,x),a
1731                     ; 735 }
1734  002d 5b03          	addw	sp,#3
1735  002f 87            	retf	
1747                     	xdef	f_DMA_ClearITPendingBit
1748                     	xdef	f_DMA_GetITStatus
1749                     	xdef	f_DMA_ClearFlag
1750                     	xdef	f_DMA_GetFlagStatus
1751                     	xdef	f_DMA_ITConfig
1752                     	xdef	f_DMA_GetCurrDataCounter
1753                     	xdef	f_DMA_SetCurrDataCounter
1754                     	xdef	f_DMA_SetTimeOut
1755                     	xdef	f_DMA_Cmd
1756                     	xdef	f_DMA_GlobalCmd
1757                     	xdef	f_DMA_Init
1758                     	xdef	f_DMA_DeInit
1759                     	xdef	f_DMA_GlobalDeInit
1778                     	end
