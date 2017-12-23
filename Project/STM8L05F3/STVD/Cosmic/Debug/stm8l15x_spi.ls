   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
 126                     ; 128 void SPI_DeInit(SPI_TypeDef* SPIx)
 126                     ; 129 {
 127                     .text:	section	.text,new
 128  0000               f_SPI_DeInit:
 132                     ; 130   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 134  0000 7f            	clr	(x)
 135                     ; 131   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 137  0001 6f01          	clr	(1,x)
 138                     ; 132   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 140  0003 6f02          	clr	(2,x)
 141                     ; 133   SPIx->SR     = SPI_SR_RESET_VALUE;
 143  0005 a602          	ld	a,#2
 144  0007 e703          	ld	(3,x),a
 145                     ; 134   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 147  0009 a607          	ld	a,#7
 148  000b e705          	ld	(5,x),a
 149                     ; 135 }
 152  000d 87            	retf	
 475                     ; 177 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 475                     ; 178               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 475                     ; 179               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 475                     ; 180               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 475                     ; 181               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 475                     ; 182 {
 476                     .text:	section	.text,new
 477  0000               f_SPI_Init:
 479  0000 89            	pushw	x
 480  0001 88            	push	a
 481       00000001      OFST:	set	1
 484                     ; 184   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 486                     ; 185   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 488                     ; 186   assert_param(IS_SPI_MODE(SPI_Mode));
 490                     ; 187   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 492                     ; 188   assert_param(IS_SPI_PHASE(SPI_CPHA));
 494                     ; 189   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 496                     ; 190   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 498                     ; 191   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 500                     ; 194   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 500                     ; 195                                   (uint8_t)SPI_BaudRatePrescaler) |
 500                     ; 196                         (uint8_t)((uint8_t)SPI_CPOL |
 500                     ; 197                                   SPI_CPHA));
 502  0002 7b0a          	ld	a,(OFST+9,sp)
 503  0004 1a0b          	or	a,(OFST+10,sp)
 504  0006 6b01          	ld	(OFST+0,sp),a
 505  0008 7b07          	ld	a,(OFST+6,sp)
 506  000a 1a08          	or	a,(OFST+7,sp)
 507  000c 1a01          	or	a,(OFST+0,sp)
 508  000e 1e02          	ldw	x,(OFST+1,sp)
 509  0010 f7            	ld	(x),a
 510                     ; 200   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 512  0011 7b0c          	ld	a,(OFST+11,sp)
 513  0013 1a0d          	or	a,(OFST+12,sp)
 514  0015 e701          	ld	(1,x),a
 515                     ; 202   if (SPI_Mode == SPI_Mode_Master)
 517  0017 7b09          	ld	a,(OFST+8,sp)
 518  0019 a104          	cp	a,#4
 519  001b 2606          	jrne	L362
 520                     ; 204     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 522  001d e601          	ld	a,(1,x)
 523  001f aa01          	or	a,#1
 525  0021 2004          	jra	L562
 526  0023               L362:
 527                     ; 208     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 529  0023 e601          	ld	a,(1,x)
 530  0025 a4fe          	and	a,#254
 531  0027               L562:
 532  0027 e701          	ld	(1,x),a
 533                     ; 212   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 535  0029 f6            	ld	a,(x)
 536  002a 1a09          	or	a,(OFST+8,sp)
 537  002c f7            	ld	(x),a
 538                     ; 215   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 540  002d 7b0e          	ld	a,(OFST+13,sp)
 541  002f e705          	ld	(5,x),a
 542                     ; 216 }
 545  0031 5b03          	addw	sp,#3
 546  0033 87            	retf	
 612                     ; 225 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 612                     ; 226 {
 613                     .text:	section	.text,new
 614  0000               f_SPI_Cmd:
 616  0000 89            	pushw	x
 617       00000000      OFST:	set	0
 620                     ; 228   assert_param(IS_FUNCTIONAL_STATE(NewState));
 622                     ; 230   if (NewState != DISABLE)
 624  0001 7b06          	ld	a,(OFST+6,sp)
 625  0003 2705          	jreq	L323
 626                     ; 232     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 628  0005 f6            	ld	a,(x)
 629  0006 aa40          	or	a,#64
 631  0008 2005          	jra	L523
 632  000a               L323:
 633                     ; 236     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 635  000a 1e01          	ldw	x,(OFST+1,sp)
 636  000c f6            	ld	a,(x)
 637  000d a4bf          	and	a,#191
 638  000f               L523:
 639  000f f7            	ld	(x),a
 640                     ; 238 }
 643  0010 85            	popw	x
 644  0011 87            	retf	
 691                     ; 247 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 691                     ; 248 {
 692                     .text:	section	.text,new
 693  0000               f_SPI_NSSInternalSoftwareCmd:
 695  0000 89            	pushw	x
 696       00000000      OFST:	set	0
 699                     ; 250   assert_param(IS_FUNCTIONAL_STATE(NewState));
 701                     ; 252   if (NewState != DISABLE)
 703  0001 7b06          	ld	a,(OFST+6,sp)
 704  0003 2706          	jreq	L353
 705                     ; 254     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 707  0005 e601          	ld	a,(1,x)
 708  0007 aa01          	or	a,#1
 710  0009 2006          	jra	L553
 711  000b               L353:
 712                     ; 258     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 714  000b 1e01          	ldw	x,(OFST+1,sp)
 715  000d e601          	ld	a,(1,x)
 716  000f a4fe          	and	a,#254
 717  0011               L553:
 718  0011 e701          	ld	(1,x),a
 719                     ; 260 }
 722  0013 85            	popw	x
 723  0014 87            	retf	
 790                     ; 271 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 790                     ; 272 {
 791                     .text:	section	.text,new
 792  0000               f_SPI_BiDirectionalLineConfig:
 794  0000 89            	pushw	x
 795       00000000      OFST:	set	0
 798                     ; 274   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 800                     ; 276   if (SPI_Direction != SPI_Direction_Rx)
 802  0001 7b06          	ld	a,(OFST+6,sp)
 803  0003 2706          	jreq	L314
 804                     ; 278     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 806  0005 e601          	ld	a,(1,x)
 807  0007 aa40          	or	a,#64
 809  0009 2006          	jra	L514
 810  000b               L314:
 811                     ; 282     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 813  000b 1e01          	ldw	x,(OFST+1,sp)
 814  000d e601          	ld	a,(1,x)
 815  000f a4bf          	and	a,#191
 816  0011               L514:
 817  0011 e701          	ld	(1,x),a
 818                     ; 284 }
 821  0013 85            	popw	x
 822  0014 87            	retf	
 865                     ; 319 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 865                     ; 320 {
 866                     .text:	section	.text,new
 867  0000               f_SPI_SendData:
 869  0000 89            	pushw	x
 870       00000000      OFST:	set	0
 873                     ; 321   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 875  0001 7b06          	ld	a,(OFST+6,sp)
 876  0003 1e01          	ldw	x,(OFST+1,sp)
 877  0005 e704          	ld	(4,x),a
 878                     ; 322 }
 881  0007 85            	popw	x
 882  0008 87            	retf	
 918                     ; 329 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 918                     ; 330 {
 919                     .text:	section	.text,new
 920  0000               f_SPI_ReceiveData:
 924                     ; 331   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 926  0000 e604          	ld	a,(4,x)
 929  0002 87            	retf	
 965                     ; 414 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 965                     ; 415 {
 966                     .text:	section	.text,new
 967  0000               f_SPI_TransmitCRC:
 971                     ; 416   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 973  0000 e601          	ld	a,(1,x)
 974  0002 aa10          	or	a,#16
 975  0004 e701          	ld	(1,x),a
 976                     ; 417 }
 979  0006 87            	retf	
1027                     ; 426 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1027                     ; 427 {
1028                     .text:	section	.text,new
1029  0000               f_SPI_CalculateCRCCmd:
1031  0000 89            	pushw	x
1032       00000000      OFST:	set	0
1035                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
1037                     ; 432   SPI_Cmd(SPI1, DISABLE);
1039  0001 4b00          	push	#0
1040  0003 ae5200        	ldw	x,#20992
1041  0006 8d000000      	callf	f_SPI_Cmd
1043  000a 84            	pop	a
1044                     ; 434   if (NewState != DISABLE)
1046  000b 7b06          	ld	a,(OFST+6,sp)
1047  000d 2708          	jreq	L525
1048                     ; 436     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1050  000f 1e01          	ldw	x,(OFST+1,sp)
1051  0011 e601          	ld	a,(1,x)
1052  0013 aa20          	or	a,#32
1054  0015 2006          	jra	L725
1055  0017               L525:
1056                     ; 440     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1058  0017 1e01          	ldw	x,(OFST+1,sp)
1059  0019 e601          	ld	a,(1,x)
1060  001b a4df          	and	a,#223
1061  001d               L725:
1062  001d e701          	ld	(1,x),a
1063                     ; 442 }
1066  001f 85            	popw	x
1067  0020 87            	retf	
1140                     ; 453 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1140                     ; 454 {
1141                     .text:	section	.text,new
1142  0000               f_SPI_GetCRC:
1144  0000 89            	pushw	x
1145  0001 88            	push	a
1146       00000001      OFST:	set	1
1149                     ; 455   uint8_t crcreg = 0;
1151  0002 0f01          	clr	(OFST+0,sp)
1152                     ; 458   assert_param(IS_SPI_CRC(SPI_CRC));
1154                     ; 460   if (SPI_CRC != SPI_CRC_RX)
1156  0004 7b07          	ld	a,(OFST+6,sp)
1157  0006 2704          	jreq	L765
1158                     ; 462     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1160  0008 e607          	ld	a,(7,x)
1162  000a 2004          	jra	L175
1163  000c               L765:
1164                     ; 466     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1166  000c 1e02          	ldw	x,(OFST+1,sp)
1167  000e e606          	ld	a,(6,x)
1168  0010               L175:
1169                     ; 470   return crcreg;
1173  0010 5b03          	addw	sp,#3
1174  0012 87            	retf	
1212                     ; 478 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1212                     ; 479 {
1213                     .text:	section	.text,new
1214  0000               f_SPI_ResetCRC:
1216  0000 89            	pushw	x
1217       00000000      OFST:	set	0
1220                     ; 482   SPI_CalculateCRCCmd(SPIx, ENABLE);
1222  0001 4b01          	push	#1
1223  0003 8d000000      	callf	f_SPI_CalculateCRCCmd
1225  0007 84            	pop	a
1226                     ; 485   SPI_Cmd(SPIx, ENABLE);
1228  0008 4b01          	push	#1
1229  000a 1e02          	ldw	x,(OFST+2,sp)
1230  000c 8d000000      	callf	f_SPI_Cmd
1232  0010 84            	pop	a
1233                     ; 486 }
1236  0011 85            	popw	x
1237  0012 87            	retf	
1274                     ; 493 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1274                     ; 494 {
1275                     .text:	section	.text,new
1276  0000               f_SPI_GetCRCPolynomial:
1280                     ; 495   return SPIx->CRCPR; /* Return the CRC polynomial register */
1282  0000 e605          	ld	a,(5,x)
1285  0002 87            	retf	
1361                     ; 525 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1361                     ; 526 {
1362                     .text:	section	.text,new
1363  0000               f_SPI_DMACmd:
1365  0000 89            	pushw	x
1366       00000000      OFST:	set	0
1369                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1371                     ; 529   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1373                     ; 531   if (NewState != DISABLE)
1375  0001 7b07          	ld	a,(OFST+7,sp)
1376  0003 2706          	jreq	L376
1377                     ; 534     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1379  0005 e602          	ld	a,(2,x)
1380  0007 1a06          	or	a,(OFST+6,sp)
1382  0009 2007          	jra	L576
1383  000b               L376:
1384                     ; 539     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1386  000b 1e01          	ldw	x,(OFST+1,sp)
1387  000d 7b06          	ld	a,(OFST+6,sp)
1388  000f 43            	cpl	a
1389  0010 e402          	and	a,(2,x)
1390  0012               L576:
1391  0012 e702          	ld	(2,x),a
1392                     ; 541 }
1395  0014 85            	popw	x
1396  0015 87            	retf	
1514                     ; 626 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1514                     ; 627 {
1515                     .text:	section	.text,new
1516  0000               f_SPI_ITConfig:
1518  0000 89            	pushw	x
1519  0001 88            	push	a
1520       00000001      OFST:	set	1
1523                     ; 628   uint8_t itpos = 0;
1525  0002 0f01          	clr	(OFST+0,sp)
1526                     ; 630   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1528                     ; 631   assert_param(IS_FUNCTIONAL_STATE(NewState));
1530                     ; 634   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1532  0004 7b07          	ld	a,(OFST+6,sp)
1533  0006 a40f          	and	a,#15
1534  0008 5f            	clrw	x
1535  0009 97            	ld	xl,a
1536  000a a601          	ld	a,#1
1537  000c 5d            	tnzw	x
1538  000d 2704          	jreq	L64
1539  000f               L05:
1540  000f 48            	sll	a
1541  0010 5a            	decw	x
1542  0011 26fc          	jrne	L05
1543  0013               L64:
1544  0013 6b01          	ld	(OFST+0,sp),a
1545                     ; 636   if (NewState != DISABLE)
1547  0015 0d08          	tnz	(OFST+7,sp)
1548  0017 2708          	jreq	L357
1549                     ; 638     SPIx->CR3 |= itpos; /* Enable interrupt*/
1551  0019 1e02          	ldw	x,(OFST+1,sp)
1552  001b e602          	ld	a,(2,x)
1553  001d 1a01          	or	a,(OFST+0,sp)
1555  001f 2005          	jra	L557
1556  0021               L357:
1557                     ; 642     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1559  0021 1e02          	ldw	x,(OFST+1,sp)
1560  0023 43            	cpl	a
1561  0024 e402          	and	a,(2,x)
1562  0026               L557:
1563  0026 e702          	ld	(2,x),a
1564                     ; 644 }
1567  0028 5b03          	addw	sp,#3
1568  002a 87            	retf	
1700                     ; 661 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1700                     ; 662 {
1701                     .text:	section	.text,new
1702  0000               f_SPI_GetFlagStatus:
1704  0000 89            	pushw	x
1705  0001 88            	push	a
1706       00000001      OFST:	set	1
1709                     ; 663   FlagStatus status = RESET;
1711  0002 0f01          	clr	(OFST+0,sp)
1712                     ; 665   assert_param(IS_SPI_FLAG(SPI_FLAG));
1714                     ; 668   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1716  0004 e603          	ld	a,(3,x)
1717  0006 1507          	bcp	a,(OFST+6,sp)
1718  0008 2704          	jreq	L1401
1719                     ; 670     status = SET; /* SPI_FLAG is set */
1721  000a a601          	ld	a,#1
1723  000c 2001          	jra	L3401
1724  000e               L1401:
1725                     ; 674     status = RESET; /* SPI_FLAG is reset*/
1727  000e 4f            	clr	a
1728  000f               L3401:
1729                     ; 678   return status;
1733  000f 5b03          	addw	sp,#3
1734  0011 87            	retf	
1780                     ; 696 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1780                     ; 697 {
1781                     .text:	section	.text,new
1782  0000               f_SPI_ClearFlag:
1784  0000 89            	pushw	x
1785       00000000      OFST:	set	0
1788                     ; 698   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1790                     ; 700   SPIx->SR = (uint8_t)(~SPI_FLAG);
1792  0001 7b06          	ld	a,(OFST+6,sp)
1793  0003 43            	cpl	a
1794  0004 1e01          	ldw	x,(OFST+1,sp)
1795  0006 e703          	ld	(3,x),a
1796                     ; 701 }
1799  0008 85            	popw	x
1800  0009 87            	retf	
1887                     ; 717 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1887                     ; 718 {
1888                     .text:	section	.text,new
1889  0000               f_SPI_GetITStatus:
1891  0000 89            	pushw	x
1892  0001 5203          	subw	sp,#3
1893       00000003      OFST:	set	3
1896                     ; 719   ITStatus pendingbitstatus = RESET;
1898                     ; 720   uint8_t itpos = 0;
1900                     ; 721   uint8_t itmask1 = 0;
1902                     ; 722   uint8_t itmask2 = 0;
1904                     ; 723   __IO uint8_t enablestatus = 0;
1906  0003 0f02          	clr	(OFST-1,sp)
1907                     ; 724   assert_param(IS_SPI_GET_IT(SPI_IT));
1909                     ; 726   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1911  0005 7b09          	ld	a,(OFST+6,sp)
1912  0007 a40f          	and	a,#15
1913  0009 5f            	clrw	x
1914  000a 97            	ld	xl,a
1915  000b a601          	ld	a,#1
1916  000d 5d            	tnzw	x
1917  000e 2704          	jreq	L06
1918  0010               L26:
1919  0010 48            	sll	a
1920  0011 5a            	decw	x
1921  0012 26fc          	jrne	L26
1922  0014               L06:
1923  0014 6b01          	ld	(OFST-2,sp),a
1924                     ; 729   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1926  0016 7b09          	ld	a,(OFST+6,sp)
1927  0018 4e            	swap	a
1928  0019 a40f          	and	a,#15
1929  001b 6b03          	ld	(OFST+0,sp),a
1930                     ; 731   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1932  001d 5f            	clrw	x
1933  001e 97            	ld	xl,a
1934  001f a601          	ld	a,#1
1935  0021 5d            	tnzw	x
1936  0022 2704          	jreq	L46
1937  0024               L66:
1938  0024 48            	sll	a
1939  0025 5a            	decw	x
1940  0026 26fc          	jrne	L66
1941  0028               L46:
1942  0028 6b03          	ld	(OFST+0,sp),a
1943                     ; 733   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
1945  002a 1e04          	ldw	x,(OFST+1,sp)
1946  002c e603          	ld	a,(3,x)
1947  002e 1403          	and	a,(OFST+0,sp)
1948  0030 6b02          	ld	(OFST-1,sp),a
1949                     ; 735   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
1951  0032 e602          	ld	a,(2,x)
1952  0034 1501          	bcp	a,(OFST-2,sp)
1953  0036 2708          	jreq	L3311
1955  0038 0d02          	tnz	(OFST-1,sp)
1956  003a 2704          	jreq	L3311
1957                     ; 738     pendingbitstatus = SET;
1959  003c a601          	ld	a,#1
1961  003e 2001          	jra	L5311
1962  0040               L3311:
1963                     ; 743     pendingbitstatus = RESET;
1965  0040 4f            	clr	a
1966  0041               L5311:
1967                     ; 746   return  pendingbitstatus;
1971  0041 5b05          	addw	sp,#5
1972  0043 87            	retf	
2026                     ; 764 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2026                     ; 765 {
2027                     .text:	section	.text,new
2028  0000               f_SPI_ClearITPendingBit:
2030  0000 89            	pushw	x
2031  0001 88            	push	a
2032       00000001      OFST:	set	1
2035                     ; 766   uint8_t itpos = 0;
2037  0002 0f01          	clr	(OFST+0,sp)
2038                     ; 767   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2040                     ; 772   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2042  0004 7b07          	ld	a,(OFST+6,sp)
2043  0006 4e            	swap	a
2044  0007 a40f          	and	a,#15
2045  0009 5f            	clrw	x
2046  000a 97            	ld	xl,a
2047  000b a601          	ld	a,#1
2048  000d 5d            	tnzw	x
2049  000e 2704          	jreq	L27
2050  0010               L47:
2051  0010 48            	sll	a
2052  0011 5a            	decw	x
2053  0012 26fc          	jrne	L47
2054  0014               L27:
2055  0014 6b01          	ld	(OFST+0,sp),a
2056                     ; 774   SPIx->SR = (uint8_t)(~itpos);
2058  0016 43            	cpl	a
2059  0017 1e02          	ldw	x,(OFST+1,sp)
2060  0019 e703          	ld	(3,x),a
2061                     ; 776 }
2064  001b 5b03          	addw	sp,#3
2065  001d 87            	retf	
2077                     	xdef	f_SPI_ClearITPendingBit
2078                     	xdef	f_SPI_GetITStatus
2079                     	xdef	f_SPI_ClearFlag
2080                     	xdef	f_SPI_GetFlagStatus
2081                     	xdef	f_SPI_ITConfig
2082                     	xdef	f_SPI_DMACmd
2083                     	xdef	f_SPI_GetCRCPolynomial
2084                     	xdef	f_SPI_ResetCRC
2085                     	xdef	f_SPI_GetCRC
2086                     	xdef	f_SPI_CalculateCRCCmd
2087                     	xdef	f_SPI_TransmitCRC
2088                     	xdef	f_SPI_ReceiveData
2089                     	xdef	f_SPI_SendData
2090                     	xdef	f_SPI_BiDirectionalLineConfig
2091                     	xdef	f_SPI_NSSInternalSoftwareCmd
2092                     	xdef	f_SPI_Cmd
2093                     	xdef	f_SPI_Init
2094                     	xdef	f_SPI_DeInit
2113                     	end
