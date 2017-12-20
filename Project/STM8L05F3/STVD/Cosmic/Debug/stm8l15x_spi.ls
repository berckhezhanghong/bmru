   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
 126                     ; 128 void SPI_DeInit(SPI_TypeDef* SPIx)
 126                     ; 129 {
 128                     .text:	section	.text,new
 129  0000               _SPI_DeInit:
 133                     ; 130   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 135  0000 7f            	clr	(x)
 136                     ; 131   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 138  0001 6f01          	clr	(1,x)
 139                     ; 132   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 141  0003 6f02          	clr	(2,x)
 142                     ; 133   SPIx->SR     = SPI_SR_RESET_VALUE;
 144  0005 a602          	ld	a,#2
 145  0007 e703          	ld	(3,x),a
 146                     ; 134   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 148  0009 a607          	ld	a,#7
 149  000b e705          	ld	(5,x),a
 150                     ; 135 }
 153  000d 81            	ret	
 479                     ; 177 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 479                     ; 178               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 479                     ; 179               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 479                     ; 180               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 479                     ; 181               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 479                     ; 182 {
 480                     .text:	section	.text,new
 481  0000               _SPI_Init:
 483  0000 89            	pushw	x
 484  0001 88            	push	a
 485       00000001      OFST:	set	1
 488                     ; 184   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 490                     ; 185   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 492                     ; 186   assert_param(IS_SPI_MODE(SPI_Mode));
 494                     ; 187   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 496                     ; 188   assert_param(IS_SPI_PHASE(SPI_CPHA));
 498                     ; 189   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 500                     ; 190   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 502                     ; 191   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 504                     ; 194   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 504                     ; 195                                   (uint8_t)SPI_BaudRatePrescaler) |
 504                     ; 196                         (uint8_t)((uint8_t)SPI_CPOL |
 504                     ; 197                                   SPI_CPHA));
 506  0002 7b09          	ld	a,(OFST+8,sp)
 507  0004 1a0a          	or	a,(OFST+9,sp)
 508  0006 6b01          	ld	(OFST+0,sp),a
 509  0008 7b06          	ld	a,(OFST+5,sp)
 510  000a 1a07          	or	a,(OFST+6,sp)
 511  000c 1a01          	or	a,(OFST+0,sp)
 512  000e 1e02          	ldw	x,(OFST+1,sp)
 513  0010 f7            	ld	(x),a
 514                     ; 200   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 516  0011 7b0b          	ld	a,(OFST+10,sp)
 517  0013 1a0c          	or	a,(OFST+11,sp)
 518  0015 e701          	ld	(1,x),a
 519                     ; 202   if (SPI_Mode == SPI_Mode_Master)
 521  0017 7b08          	ld	a,(OFST+7,sp)
 522  0019 a104          	cp	a,#4
 523  001b 2606          	jrne	L562
 524                     ; 204     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 526  001d e601          	ld	a,(1,x)
 527  001f aa01          	or	a,#1
 529  0021 2004          	jra	L762
 530  0023               L562:
 531                     ; 208     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 533  0023 e601          	ld	a,(1,x)
 534  0025 a4fe          	and	a,#254
 535  0027               L762:
 536  0027 e701          	ld	(1,x),a
 537                     ; 212   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 539  0029 f6            	ld	a,(x)
 540  002a 1a08          	or	a,(OFST+7,sp)
 541  002c f7            	ld	(x),a
 542                     ; 215   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 544  002d 7b0d          	ld	a,(OFST+12,sp)
 545  002f e705          	ld	(5,x),a
 546                     ; 216 }
 549  0031 5b03          	addw	sp,#3
 550  0033 81            	ret	
 617                     ; 225 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 617                     ; 226 {
 618                     .text:	section	.text,new
 619  0000               _SPI_Cmd:
 621  0000 89            	pushw	x
 622       00000000      OFST:	set	0
 625                     ; 228   assert_param(IS_FUNCTIONAL_STATE(NewState));
 627                     ; 230   if (NewState != DISABLE)
 629  0001 7b05          	ld	a,(OFST+5,sp)
 630  0003 2705          	jreq	L523
 631                     ; 232     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 633  0005 f6            	ld	a,(x)
 634  0006 aa40          	or	a,#64
 636  0008 2005          	jra	L723
 637  000a               L523:
 638                     ; 236     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 640  000a 1e01          	ldw	x,(OFST+1,sp)
 641  000c f6            	ld	a,(x)
 642  000d a4bf          	and	a,#191
 643  000f               L723:
 644  000f f7            	ld	(x),a
 645                     ; 238 }
 648  0010 85            	popw	x
 649  0011 81            	ret	
 697                     ; 247 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 697                     ; 248 {
 698                     .text:	section	.text,new
 699  0000               _SPI_NSSInternalSoftwareCmd:
 701  0000 89            	pushw	x
 702       00000000      OFST:	set	0
 705                     ; 250   assert_param(IS_FUNCTIONAL_STATE(NewState));
 707                     ; 252   if (NewState != DISABLE)
 709  0001 7b05          	ld	a,(OFST+5,sp)
 710  0003 2706          	jreq	L553
 711                     ; 254     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 713  0005 e601          	ld	a,(1,x)
 714  0007 aa01          	or	a,#1
 716  0009 2006          	jra	L753
 717  000b               L553:
 718                     ; 258     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 720  000b 1e01          	ldw	x,(OFST+1,sp)
 721  000d e601          	ld	a,(1,x)
 722  000f a4fe          	and	a,#254
 723  0011               L753:
 724  0011 e701          	ld	(1,x),a
 725                     ; 260 }
 728  0013 85            	popw	x
 729  0014 81            	ret	
 797                     ; 271 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 797                     ; 272 {
 798                     .text:	section	.text,new
 799  0000               _SPI_BiDirectionalLineConfig:
 801  0000 89            	pushw	x
 802       00000000      OFST:	set	0
 805                     ; 274   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 807                     ; 276   if (SPI_Direction != SPI_Direction_Rx)
 809  0001 7b05          	ld	a,(OFST+5,sp)
 810  0003 2706          	jreq	L514
 811                     ; 278     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 813  0005 e601          	ld	a,(1,x)
 814  0007 aa40          	or	a,#64
 816  0009 2006          	jra	L714
 817  000b               L514:
 818                     ; 282     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 820  000b 1e01          	ldw	x,(OFST+1,sp)
 821  000d e601          	ld	a,(1,x)
 822  000f a4bf          	and	a,#191
 823  0011               L714:
 824  0011 e701          	ld	(1,x),a
 825                     ; 284 }
 828  0013 85            	popw	x
 829  0014 81            	ret	
 875                     ; 319 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 875                     ; 320 {
 876                     .text:	section	.text,new
 877  0000               _SPI_SendData:
 879  0000 89            	pushw	x
 880       00000000      OFST:	set	0
 883                     ; 321   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 885  0001 7b05          	ld	a,(OFST+5,sp)
 886  0003 1e01          	ldw	x,(OFST+1,sp)
 887  0005 e704          	ld	(4,x),a
 888                     ; 322 }
 891  0007 85            	popw	x
 892  0008 81            	ret	
 929                     ; 329 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 929                     ; 330 {
 930                     .text:	section	.text,new
 931  0000               _SPI_ReceiveData:
 935                     ; 331   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 937  0000 e604          	ld	a,(4,x)
 940  0002 81            	ret	
 977                     ; 414 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 977                     ; 415 {
 978                     .text:	section	.text,new
 979  0000               _SPI_TransmitCRC:
 983                     ; 416   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 985  0000 e601          	ld	a,(1,x)
 986  0002 aa10          	or	a,#16
 987  0004 e701          	ld	(1,x),a
 988                     ; 417 }
 991  0006 81            	ret	
1040                     ; 426 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1040                     ; 427 {
1041                     .text:	section	.text,new
1042  0000               _SPI_CalculateCRCCmd:
1044  0000 89            	pushw	x
1045       00000000      OFST:	set	0
1048                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
1050                     ; 432   SPI_Cmd(SPI1, DISABLE);
1052  0001 4b00          	push	#0
1053  0003 ae5200        	ldw	x,#20992
1054  0006 cd0000        	call	_SPI_Cmd
1056  0009 84            	pop	a
1057                     ; 434   if (NewState != DISABLE)
1059  000a 7b05          	ld	a,(OFST+5,sp)
1060  000c 2708          	jreq	L135
1061                     ; 436     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1063  000e 1e01          	ldw	x,(OFST+1,sp)
1064  0010 e601          	ld	a,(1,x)
1065  0012 aa20          	or	a,#32
1067  0014 2006          	jra	L335
1068  0016               L135:
1069                     ; 440     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1071  0016 1e01          	ldw	x,(OFST+1,sp)
1072  0018 e601          	ld	a,(1,x)
1073  001a a4df          	and	a,#223
1074  001c               L335:
1075  001c e701          	ld	(1,x),a
1076                     ; 442 }
1079  001e 85            	popw	x
1080  001f 81            	ret	
1156                     ; 453 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1156                     ; 454 {
1157                     .text:	section	.text,new
1158  0000               _SPI_GetCRC:
1160  0000 89            	pushw	x
1161  0001 88            	push	a
1162       00000001      OFST:	set	1
1165                     ; 455   uint8_t crcreg = 0;
1167  0002 0f01          	clr	(OFST+0,sp)
1168                     ; 458   assert_param(IS_SPI_CRC(SPI_CRC));
1170                     ; 460   if (SPI_CRC != SPI_CRC_RX)
1172  0004 7b06          	ld	a,(OFST+5,sp)
1173  0006 2704          	jreq	L575
1174                     ; 462     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1176  0008 e607          	ld	a,(7,x)
1178  000a 2004          	jra	L775
1179  000c               L575:
1180                     ; 466     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1182  000c 1e02          	ldw	x,(OFST+1,sp)
1183  000e e606          	ld	a,(6,x)
1184  0010               L775:
1185                     ; 470   return crcreg;
1189  0010 5b03          	addw	sp,#3
1190  0012 81            	ret	
1229                     ; 478 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1229                     ; 479 {
1230                     .text:	section	.text,new
1231  0000               _SPI_ResetCRC:
1233  0000 89            	pushw	x
1234       00000000      OFST:	set	0
1237                     ; 482   SPI_CalculateCRCCmd(SPIx, ENABLE);
1239  0001 4b01          	push	#1
1240  0003 cd0000        	call	_SPI_CalculateCRCCmd
1242  0006 84            	pop	a
1243                     ; 485   SPI_Cmd(SPIx, ENABLE);
1245  0007 4b01          	push	#1
1246  0009 1e02          	ldw	x,(OFST+2,sp)
1247  000b cd0000        	call	_SPI_Cmd
1249  000e 84            	pop	a
1250                     ; 486 }
1253  000f 85            	popw	x
1254  0010 81            	ret	
1292                     ; 493 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1292                     ; 494 {
1293                     .text:	section	.text,new
1294  0000               _SPI_GetCRCPolynomial:
1298                     ; 495   return SPIx->CRCPR; /* Return the CRC polynomial register */
1300  0000 e605          	ld	a,(5,x)
1303  0002 81            	ret	
1380                     ; 525 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1380                     ; 526 {
1381                     .text:	section	.text,new
1382  0000               _SPI_DMACmd:
1384  0000 89            	pushw	x
1385       00000000      OFST:	set	0
1388                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1390                     ; 529   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1392                     ; 531   if (NewState != DISABLE)
1394  0001 7b06          	ld	a,(OFST+6,sp)
1395  0003 2706          	jreq	L107
1396                     ; 534     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1398  0005 e602          	ld	a,(2,x)
1399  0007 1a05          	or	a,(OFST+5,sp)
1401  0009 2007          	jra	L307
1402  000b               L107:
1403                     ; 539     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1405  000b 1e01          	ldw	x,(OFST+1,sp)
1406  000d 7b05          	ld	a,(OFST+5,sp)
1407  000f 43            	cpl	a
1408  0010 e402          	and	a,(2,x)
1409  0012               L307:
1410  0012 e702          	ld	(2,x),a
1411                     ; 541 }
1414  0014 85            	popw	x
1415  0015 81            	ret	
1536                     ; 626 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1536                     ; 627 {
1537                     .text:	section	.text,new
1538  0000               _SPI_ITConfig:
1540  0000 89            	pushw	x
1541  0001 88            	push	a
1542       00000001      OFST:	set	1
1545                     ; 628   uint8_t itpos = 0;
1547  0002 0f01          	clr	(OFST+0,sp)
1548                     ; 630   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1550                     ; 631   assert_param(IS_FUNCTIONAL_STATE(NewState));
1552                     ; 634   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1554  0004 7b06          	ld	a,(OFST+5,sp)
1555  0006 a40f          	and	a,#15
1556  0008 5f            	clrw	x
1557  0009 97            	ld	xl,a
1558  000a a601          	ld	a,#1
1559  000c 5d            	tnzw	x
1560  000d 2704          	jreq	L64
1561  000f               L05:
1562  000f 48            	sll	a
1563  0010 5a            	decw	x
1564  0011 26fc          	jrne	L05
1565  0013               L64:
1566  0013 6b01          	ld	(OFST+0,sp),a
1567                     ; 636   if (NewState != DISABLE)
1569  0015 0d07          	tnz	(OFST+6,sp)
1570  0017 2708          	jreq	L367
1571                     ; 638     SPIx->CR3 |= itpos; /* Enable interrupt*/
1573  0019 1e02          	ldw	x,(OFST+1,sp)
1574  001b e602          	ld	a,(2,x)
1575  001d 1a01          	or	a,(OFST+0,sp)
1577  001f 2005          	jra	L567
1578  0021               L367:
1579                     ; 642     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1581  0021 1e02          	ldw	x,(OFST+1,sp)
1582  0023 43            	cpl	a
1583  0024 e402          	and	a,(2,x)
1584  0026               L567:
1585  0026 e702          	ld	(2,x),a
1586                     ; 644 }
1589  0028 5b03          	addw	sp,#3
1590  002a 81            	ret	
1723                     ; 661 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1723                     ; 662 {
1724                     .text:	section	.text,new
1725  0000               _SPI_GetFlagStatus:
1727  0000 89            	pushw	x
1728  0001 88            	push	a
1729       00000001      OFST:	set	1
1732                     ; 663   FlagStatus status = RESET;
1734  0002 0f01          	clr	(OFST+0,sp)
1735                     ; 665   assert_param(IS_SPI_FLAG(SPI_FLAG));
1737                     ; 668   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1739  0004 e603          	ld	a,(3,x)
1740  0006 1506          	bcp	a,(OFST+5,sp)
1741  0008 2704          	jreq	L1501
1742                     ; 670     status = SET; /* SPI_FLAG is set */
1744  000a a601          	ld	a,#1
1746  000c 2001          	jra	L3501
1747  000e               L1501:
1748                     ; 674     status = RESET; /* SPI_FLAG is reset*/
1750  000e 4f            	clr	a
1751  000f               L3501:
1752                     ; 678   return status;
1756  000f 5b03          	addw	sp,#3
1757  0011 81            	ret	
1804                     ; 696 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1804                     ; 697 {
1805                     .text:	section	.text,new
1806  0000               _SPI_ClearFlag:
1808  0000 89            	pushw	x
1809       00000000      OFST:	set	0
1812                     ; 698   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1814                     ; 700   SPIx->SR = (uint8_t)(~SPI_FLAG);
1816  0001 7b05          	ld	a,(OFST+5,sp)
1817  0003 43            	cpl	a
1818  0004 1e01          	ldw	x,(OFST+1,sp)
1819  0006 e703          	ld	(3,x),a
1820                     ; 701 }
1823  0008 85            	popw	x
1824  0009 81            	ret	
1918                     ; 717 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1918                     ; 718 {
1919                     .text:	section	.text,new
1920  0000               _SPI_GetITStatus:
1922  0000 89            	pushw	x
1923  0001 5203          	subw	sp,#3
1924       00000003      OFST:	set	3
1927                     ; 719   ITStatus pendingbitstatus = RESET;
1929                     ; 720   uint8_t itpos = 0;
1931                     ; 721   uint8_t itmask1 = 0;
1933                     ; 722   uint8_t itmask2 = 0;
1935                     ; 723   __IO uint8_t enablestatus = 0;
1937  0003 0f02          	clr	(OFST-1,sp)
1938                     ; 724   assert_param(IS_SPI_GET_IT(SPI_IT));
1940                     ; 726   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1942  0005 7b08          	ld	a,(OFST+5,sp)
1943  0007 a40f          	and	a,#15
1944  0009 5f            	clrw	x
1945  000a 97            	ld	xl,a
1946  000b a601          	ld	a,#1
1947  000d 5d            	tnzw	x
1948  000e 2704          	jreq	L06
1949  0010               L26:
1950  0010 48            	sll	a
1951  0011 5a            	decw	x
1952  0012 26fc          	jrne	L26
1953  0014               L06:
1954  0014 6b01          	ld	(OFST-2,sp),a
1955                     ; 729   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1957  0016 7b08          	ld	a,(OFST+5,sp)
1958  0018 4e            	swap	a
1959  0019 a40f          	and	a,#15
1960  001b 6b03          	ld	(OFST+0,sp),a
1961                     ; 731   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1963  001d 5f            	clrw	x
1964  001e 97            	ld	xl,a
1965  001f a601          	ld	a,#1
1966  0021 5d            	tnzw	x
1967  0022 2704          	jreq	L46
1968  0024               L66:
1969  0024 48            	sll	a
1970  0025 5a            	decw	x
1971  0026 26fc          	jrne	L66
1972  0028               L46:
1973  0028 6b03          	ld	(OFST+0,sp),a
1974                     ; 733   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
1976  002a 1e04          	ldw	x,(OFST+1,sp)
1977  002c e603          	ld	a,(3,x)
1978  002e 1403          	and	a,(OFST+0,sp)
1979  0030 6b02          	ld	(OFST-1,sp),a
1980                     ; 735   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
1982  0032 e602          	ld	a,(2,x)
1983  0034 1501          	bcp	a,(OFST-2,sp)
1984  0036 2708          	jreq	L1511
1986  0038 0d02          	tnz	(OFST-1,sp)
1987  003a 2704          	jreq	L1511
1988                     ; 738     pendingbitstatus = SET;
1990  003c a601          	ld	a,#1
1992  003e 2001          	jra	L3511
1993  0040               L1511:
1994                     ; 743     pendingbitstatus = RESET;
1996  0040 4f            	clr	a
1997  0041               L3511:
1998                     ; 746   return  pendingbitstatus;
2002  0041 5b05          	addw	sp,#5
2003  0043 81            	ret	
2060                     ; 764 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2060                     ; 765 {
2061                     .text:	section	.text,new
2062  0000               _SPI_ClearITPendingBit:
2064  0000 89            	pushw	x
2065  0001 88            	push	a
2066       00000001      OFST:	set	1
2069                     ; 766   uint8_t itpos = 0;
2071  0002 0f01          	clr	(OFST+0,sp)
2072                     ; 767   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2074                     ; 772   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2076  0004 7b06          	ld	a,(OFST+5,sp)
2077  0006 4e            	swap	a
2078  0007 a40f          	and	a,#15
2079  0009 5f            	clrw	x
2080  000a 97            	ld	xl,a
2081  000b a601          	ld	a,#1
2082  000d 5d            	tnzw	x
2083  000e 2704          	jreq	L27
2084  0010               L47:
2085  0010 48            	sll	a
2086  0011 5a            	decw	x
2087  0012 26fc          	jrne	L47
2088  0014               L27:
2089  0014 6b01          	ld	(OFST+0,sp),a
2090                     ; 774   SPIx->SR = (uint8_t)(~itpos);
2092  0016 43            	cpl	a
2093  0017 1e02          	ldw	x,(OFST+1,sp)
2094  0019 e703          	ld	(3,x),a
2095                     ; 776 }
2098  001b 5b03          	addw	sp,#3
2099  001d 81            	ret	
2112                     	xdef	_SPI_ClearITPendingBit
2113                     	xdef	_SPI_GetITStatus
2114                     	xdef	_SPI_ClearFlag
2115                     	xdef	_SPI_GetFlagStatus
2116                     	xdef	_SPI_ITConfig
2117                     	xdef	_SPI_DMACmd
2118                     	xdef	_SPI_GetCRCPolynomial
2119                     	xdef	_SPI_ResetCRC
2120                     	xdef	_SPI_GetCRC
2121                     	xdef	_SPI_CalculateCRCCmd
2122                     	xdef	_SPI_TransmitCRC
2123                     	xdef	_SPI_ReceiveData
2124                     	xdef	_SPI_SendData
2125                     	xdef	_SPI_BiDirectionalLineConfig
2126                     	xdef	_SPI_NSSInternalSoftwareCmd
2127                     	xdef	_SPI_Cmd
2128                     	xdef	_SPI_Init
2129                     	xdef	_SPI_DeInit
2148                     	end
