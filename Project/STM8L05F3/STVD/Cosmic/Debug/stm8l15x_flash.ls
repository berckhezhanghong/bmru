   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  68                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  68                     ; 175 {
  70                     .text:	section	.text,new
  71  0000               _FLASH_SetProgrammingTime:
  75                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  77                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  79  0000 72115050      	bres	20560,#0
  80                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  82  0004 ca5050        	or	a,20560
  83  0007 c75050        	ld	20560,a
  84                     ; 181 }
  87  000a 81            	ret	
 112                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 112                     ; 189 {
 113                     .text:	section	.text,new
 114  0000               _FLASH_GetProgrammingTime:
 118                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 120  0000 c65050        	ld	a,20560
 121  0003 a401          	and	a,#1
 124  0005 81            	ret	
 180                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 180                     ; 204 {
 181                     .text:	section	.text,new
 182  0000               _FLASH_PowerWaitModeConfig:
 186                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
 188                     ; 209   if(FLASH_Power != FLASH_Power_On)
 190  0000 4a            	dec	a
 191  0001 2705          	jreq	L57
 192                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 194  0003 72145050      	bset	20560,#2
 197  0007 81            	ret	
 198  0008               L57:
 199                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 201  0008 72155050      	bres	20560,#2
 202                     ; 218 }
 205  000c 81            	ret	
 228                     ; 259 void FLASH_DeInit(void)
 228                     ; 260 {
 229                     .text:	section	.text,new
 230  0000               _FLASH_DeInit:
 234                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 236  0000 725f5050      	clr	20560
 237                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 239  0004 725f5051      	clr	20561
 240                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 242  0008 35405054      	mov	20564,#64
 243                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 245  000c c65054        	ld	a,20564
 246                     ; 265 }
 249  000f 81            	ret	
 305                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 305                     ; 276 {
 306                     .text:	section	.text,new
 307  0000               _FLASH_Unlock:
 309  0000 88            	push	a
 310       00000000      OFST:	set	0
 313                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 315                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
 317  0001 a1fd          	cp	a,#253
 318  0003 2608          	jrne	L731
 319                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
 321  0005 35565052      	mov	20562,#86
 322                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
 324  0009 35ae5052      	mov	20562,#174
 325  000d               L731:
 326                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
 328  000d 7b01          	ld	a,(OFST+1,sp)
 329  000f a1f7          	cp	a,#247
 330  0011 2608          	jrne	L141
 331                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 333  0013 35ae5053      	mov	20563,#174
 334                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
 336  0017 35565053      	mov	20563,#86
 337  001b               L141:
 338                     ; 293 }
 341  001b 84            	pop	a
 342  001c 81            	ret	
 377                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 377                     ; 304 {
 378                     .text:	section	.text,new
 379  0000               _FLASH_Lock:
 383                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 385                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 387  0000 c45054        	and	a,20564
 388  0003 c75054        	ld	20564,a
 389                     ; 310 }
 392  0006 81            	ret	
 435                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 435                     ; 319 {
 436                     .text:	section	.text,new
 437  0000               _FLASH_ProgramByte:
 439       00000000      OFST:	set	0
 442                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 444                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 446  0000 7b07          	ld	a,(OFST+7,sp)
 447  0002 1e05          	ldw	x,(OFST+5,sp)
 448  0004 f7            	ld	(x),a
 449                     ; 324 }
 452  0005 81            	ret	
 486                     ; 331 void FLASH_EraseByte(uint32_t Address)
 486                     ; 332 {
 487                     .text:	section	.text,new
 488  0000               _FLASH_EraseByte:
 490       00000000      OFST:	set	0
 493                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 495                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 497  0000 1e05          	ldw	x,(OFST+5,sp)
 498  0002 7f            	clr	(x)
 499                     ; 337 }
 502  0003 81            	ret	
 545                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 545                     ; 346 {
 546                     .text:	section	.text,new
 547  0000               _FLASH_ProgramWord:
 549       00000000      OFST:	set	0
 552                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 554                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 556  0000 721c5051      	bset	20561,#6
 557                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 559  0004 7b07          	ld	a,(OFST+7,sp)
 560  0006 1e05          	ldw	x,(OFST+5,sp)
 561  0008 f7            	ld	(x),a
 562                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 564  0009 7b08          	ld	a,(OFST+8,sp)
 565  000b e701          	ld	(1,x),a
 566                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 568  000d 7b09          	ld	a,(OFST+9,sp)
 569  000f e702          	ld	(2,x),a
 570                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 572  0011 7b0a          	ld	a,(OFST+10,sp)
 573  0013 e703          	ld	(3,x),a
 574                     ; 360 }
 577  0015 81            	ret	
 611                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 611                     ; 368 {
 612                     .text:	section	.text,new
 613  0000               _FLASH_ReadByte:
 615       00000000      OFST:	set	0
 618                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 620  0000 1e05          	ldw	x,(OFST+5,sp)
 621  0002 f6            	ld	a,(x)
 624  0003 81            	ret	
 669                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 669                     ; 418 {
 670                     .text:	section	.text,new
 671  0000               _FLASH_ProgramOptionByte:
 673  0000 89            	pushw	x
 674       00000000      OFST:	set	0
 677                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 679                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 681  0001 721e5051      	bset	20561,#7
 682                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 684  0005 7b05          	ld	a,(OFST+5,sp)
 685  0007 1e01          	ldw	x,(OFST+1,sp)
 686  0009 f7            	ld	(x),a
 687                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 689  000a a6fd          	ld	a,#253
 690  000c cd0000        	call	_FLASH_WaitForLastOperation
 692                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 694  000f 721f5051      	bres	20561,#7
 695                     ; 432 }
 698  0013 85            	popw	x
 699  0014 81            	ret	
 735                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 735                     ; 440 {
 736                     .text:	section	.text,new
 737  0000               _FLASH_EraseOptionByte:
 741                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 743                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 745  0000 721e5051      	bset	20561,#7
 746                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 748  0004 7f            	clr	(x)
 749                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 751  0005 a6fd          	ld	a,#253
 752  0007 cd0000        	call	_FLASH_WaitForLastOperation
 754                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 756  000a 721f5051      	bres	20561,#7
 757                     ; 454 }
 760  000e 81            	ret	
 817                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 817                     ; 463 {
 818                     .text:	section	.text,new
 819  0000               _FLASH_GetReadOutProtectionStatus:
 821  0000 88            	push	a
 822       00000001      OFST:	set	1
 825                     ; 464   FunctionalState state = DISABLE;
 827  0001 0f01          	clr	(OFST+0,sp)
 828                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 830  0003 c64800        	ld	a,18432
 831  0006 a1aa          	cp	a,#170
 832  0008 2604          	jrne	L743
 833                     ; 469     state =  ENABLE;
 835  000a a601          	ld	a,#1
 837  000c 2001          	jra	L153
 838  000e               L743:
 839                     ; 474     state =  DISABLE;
 841  000e 4f            	clr	a
 842  000f               L153:
 843                     ; 477   return state;
 847  000f 5b01          	addw	sp,#1
 848  0011 81            	ret	
 882                     ; 485 uint16_t FLASH_GetBootSize(void)
 882                     ; 486 {
 883                     .text:	section	.text,new
 884  0000               _FLASH_GetBootSize:
 886  0000 89            	pushw	x
 887       00000002      OFST:	set	2
 890                     ; 487   uint16_t temp = 0;
 892                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 894  0001 c64802        	ld	a,18434
 895  0004 97            	ld	xl,a
 896  0005 4f            	clr	a
 897  0006 02            	rlwa	x,a
 898  0007 44            	srl	a
 899  0008 56            	rrcw	x
 900                     ; 493   if(OPT->UBC > 0x7F)
 902  0009 c64802        	ld	a,18434
 903  000c a180          	cp	a,#128
 904  000e 2503          	jrult	L173
 905                     ; 495     temp = 8192;
 907  0010 ae2000        	ldw	x,#8192
 908  0013               L173:
 909                     ; 499   return(temp);
 913  0013 5b02          	addw	sp,#2
 914  0015 81            	ret	
 948                     ; 508 uint16_t FLASH_GetCodeSize(void)
 948                     ; 509 {
 949                     .text:	section	.text,new
 950  0000               _FLASH_GetCodeSize:
 952  0000 89            	pushw	x
 953       00000002      OFST:	set	2
 956                     ; 510   uint16_t temp = 0;
 958                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 960  0001 c64807        	ld	a,18439
 961  0004 97            	ld	xl,a
 962  0005 4f            	clr	a
 963  0006 02            	rlwa	x,a
 964  0007 44            	srl	a
 965  0008 56            	rrcw	x
 966                     ; 516   if(OPT->PCODESIZE > 0x7F)
 968  0009 c64807        	ld	a,18439
 969  000c a180          	cp	a,#128
 970  000e 2503          	jrult	L114
 971                     ; 518     temp = 8192;
 973  0010 ae2000        	ldw	x,#8192
 974  0013               L114:
 975                     ; 522   return(temp);
 979  0013 5b02          	addw	sp,#2
 980  0015 81            	ret	
1015                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
1015                     ; 548 {
1016                     .text:	section	.text,new
1017  0000               _FLASH_ITConfig:
1021                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
1023                     ; 552   if(NewState != DISABLE)
1025  0000 4d            	tnz	a
1026  0001 2705          	jreq	L134
1027                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
1029  0003 72125050      	bset	20560,#1
1032  0007 81            	ret	
1033  0008               L134:
1034                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1036  0008 72135050      	bres	20560,#1
1037                     ; 562 }
1040  000c 81            	ret	
1149                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1149                     ; 577 {
1150                     .text:	section	.text,new
1151  0000               _FLASH_GetFlagStatus:
1153  0000 88            	push	a
1154       00000001      OFST:	set	1
1157                     ; 578   FlagStatus status = RESET;
1159  0001 0f01          	clr	(OFST+0,sp)
1160                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1162                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1164  0003 c45054        	and	a,20564
1165  0006 2702          	jreq	L505
1166                     ; 584     status = SET; /* Flash_FLAG is set*/
1168  0008 a601          	ld	a,#1
1170  000a               L505:
1171                     ; 588     status = RESET; /* Flash_FLAG is reset*/
1173                     ; 592   return status;
1177  000a 5b01          	addw	sp,#1
1178  000c 81            	ret	
1214                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1214                     ; 720 {
1215                     .text:	section	.text,new
1216  0000               _FLASH_PowerRunModeConfig:
1220                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
1222                     ; 724   if(FLASH_Power != FLASH_Power_On)
1224  0000 4a            	dec	a
1225  0001 2705          	jreq	L725
1226                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1228  0003 72165050      	bset	20560,#3
1231  0007 81            	ret	
1232  0008               L725:
1233                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1235  0008 72175050      	bres	20560,#3
1236                     ; 732 }
1239  000c 81            	ret	
1303                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1303                     ; 746 {
1304                     .text:	section	.text,new
1305  0000               _FLASH_GetPowerStatus:
1309                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1311  0000 c65050        	ld	a,20560
1312  0003 a40c          	and	a,#12
1315  0005 81            	ret	
1419                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1419                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1419                     ; 767 {
1420                     .text:	section	.text,new
1421  0000               _FLASH_ProgramBlock:
1423  0000 89            	pushw	x
1424  0001 5206          	subw	sp,#6
1425       00000006      OFST:	set	6
1428                     ; 768   uint16_t Count = 0;
1430                     ; 769   uint32_t startaddress = 0;
1432  0003 96            	ldw	x,sp
1433  0004 5c            	incw	x
1434  0005 cd0000        	call	c_ltor
1436                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1438                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1440                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
1442  0008 7b0b          	ld	a,(OFST+5,sp)
1443  000a a1fd          	cp	a,#253
1444  000c 2605          	jrne	L136
1445                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1447                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1449  000e ae8000        	ldw	x,#32768
1451  0011 2003          	jra	L336
1452  0013               L136:
1453                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1455                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1457  0013 ae1000        	ldw	x,#4096
1458  0016               L336:
1459  0016 1f03          	ldw	(OFST-3,sp),x
1460  0018 5f            	clrw	x
1461  0019 1f01          	ldw	(OFST-5,sp),x
1462                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1464  001b 1e07          	ldw	x,(OFST+1,sp)
1465  001d a640          	ld	a,#64
1466  001f cd0000        	call	c_cmulx
1468  0022 96            	ldw	x,sp
1469  0023 5c            	incw	x
1470  0024 cd0000        	call	c_lgadd
1472                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
1474  0027 7b0c          	ld	a,(OFST+6,sp)
1475  0029 2606          	jrne	L536
1476                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
1478  002b 72105051      	bset	20561,#0
1480  002f 2004          	jra	L736
1481  0031               L536:
1482                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
1484  0031 72185051      	bset	20561,#4
1485  0035               L736:
1486                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1488  0035 5f            	clrw	x
1489  0036 1f05          	ldw	(OFST-1,sp),x
1490  0038               L146:
1491                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1493  0038 1e0d          	ldw	x,(OFST+7,sp)
1494  003a 72fb05        	addw	x,(OFST-1,sp)
1495  003d f6            	ld	a,(x)
1496  003e 1e03          	ldw	x,(OFST-3,sp)
1497  0040 72fb05        	addw	x,(OFST-1,sp)
1498  0043 f7            	ld	(x),a
1499                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1501  0044 1e05          	ldw	x,(OFST-1,sp)
1502  0046 5c            	incw	x
1503  0047 1f05          	ldw	(OFST-1,sp),x
1506  0049 a30040        	cpw	x,#64
1507  004c 25ea          	jrult	L146
1508                     ; 805 }
1511  004e 5b08          	addw	sp,#8
1512  0050 81            	ret	
1575                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1575                     ; 818 {
1576                     .text:	section	.text,new
1577  0000               _FLASH_EraseBlock:
1579  0000 89            	pushw	x
1580  0001 5206          	subw	sp,#6
1581       00000006      OFST:	set	6
1584                     ; 819   uint32_t startaddress = 0;
1586  0003 96            	ldw	x,sp
1587  0004 1c0003        	addw	x,#OFST-3
1588  0007 cd0000        	call	c_ltor
1590                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1592                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
1594  000a 7b0b          	ld	a,(OFST+5,sp)
1595  000c a1fd          	cp	a,#253
1596  000e 2605          	jrne	L107
1597                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1599                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1601  0010 ae8000        	ldw	x,#32768
1603  0013 2003          	jra	L307
1604  0015               L107:
1605                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1607                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1609  0015 ae1000        	ldw	x,#4096
1610  0018               L307:
1611  0018 1f05          	ldw	(OFST-1,sp),x
1612  001a 5f            	clrw	x
1613  001b 1f03          	ldw	(OFST-3,sp),x
1614                     ; 844     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1616  001d 1e07          	ldw	x,(OFST+1,sp)
1617  001f a640          	ld	a,#64
1618  0021 cd0000        	call	c_cmulx
1620  0024 96            	ldw	x,sp
1621  0025 1c0003        	addw	x,#OFST-3
1622  0028 cd0000        	call	c_ladd
1624  002b be02          	ldw	x,c_lreg+2
1625  002d 1f01          	ldw	(OFST-5,sp),x
1626                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
1628  002f 721a5051      	bset	20561,#5
1629                     ; 855     *pwFlash = (uint32_t)0;  
1631  0033 4f            	clr	a
1632  0034 e703          	ld	(3,x),a
1633  0036 e702          	ld	(2,x),a
1634  0038 e701          	ld	(1,x),a
1635  003a f7            	ld	(x),a
1636                     ; 863 }
1639  003b 5b08          	addw	sp,#8
1640  003d 81            	ret	
1725                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1725                     ; 876 {
1726                     .text:	section	.text,new
1727  0000               _FLASH_WaitForLastOperation:
1729  0000 5203          	subw	sp,#3
1730       00000003      OFST:	set	3
1733                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
1735  0002 aeffff        	ldw	x,#65535
1736  0005 1f01          	ldw	(OFST-2,sp),x
1737                     ; 878   uint8_t flagstatus = 0x00;
1739  0007 0f03          	clr	(OFST+0,sp)
1740                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
1742  0009 a1fd          	cp	a,#253
1743  000b 2620          	jrne	L367
1745  000d 200a          	jra	L157
1746  000f               L747:
1747                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1747                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
1749  000f c65054        	ld	a,20564
1750  0012 a405          	and	a,#5
1751  0014 6b03          	ld	(OFST+0,sp),a
1752                     ; 887       timeout--;
1754  0016 5a            	decw	x
1755  0017 1f01          	ldw	(OFST-2,sp),x
1756  0019               L157:
1757                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
1759  0019 7b03          	ld	a,(OFST+0,sp)
1760  001b 2618          	jrne	L757
1762  001d 1e01          	ldw	x,(OFST-2,sp)
1763  001f 26ee          	jrne	L747
1764  0021 2012          	jra	L757
1765  0023               L167:
1766                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1766                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
1768  0023 c65054        	ld	a,20564
1769  0026 a441          	and	a,#65
1770  0028 6b03          	ld	(OFST+0,sp),a
1771                     ; 896       timeout--;
1773  002a 5a            	decw	x
1774  002b 1f01          	ldw	(OFST-2,sp),x
1775  002d               L367:
1776                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
1778  002d 7b03          	ld	a,(OFST+0,sp)
1779  002f 2604          	jrne	L757
1781  0031 1e01          	ldw	x,(OFST-2,sp)
1782  0033 26ee          	jrne	L167
1783  0035               L757:
1784                     ; 900   if(timeout == 0x00)
1786  0035 1e01          	ldw	x,(OFST-2,sp)
1787  0037 2602          	jrne	L177
1788                     ; 902     flagstatus = FLASH_Status_TimeOut;
1790  0039 a602          	ld	a,#2
1791  003b               L177:
1792                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
1796  003b 5b03          	addw	sp,#3
1797  003d 81            	ret	
1810                     	xdef	_FLASH_WaitForLastOperation
1811                     	xdef	_FLASH_EraseBlock
1812                     	xdef	_FLASH_ProgramBlock
1813                     	xdef	_FLASH_GetPowerStatus
1814                     	xdef	_FLASH_PowerRunModeConfig
1815                     	xdef	_FLASH_GetFlagStatus
1816                     	xdef	_FLASH_ITConfig
1817                     	xdef	_FLASH_EraseOptionByte
1818                     	xdef	_FLASH_ProgramOptionByte
1819                     	xdef	_FLASH_GetReadOutProtectionStatus
1820                     	xdef	_FLASH_GetCodeSize
1821                     	xdef	_FLASH_GetBootSize
1822                     	xdef	_FLASH_ReadByte
1823                     	xdef	_FLASH_ProgramWord
1824                     	xdef	_FLASH_EraseByte
1825                     	xdef	_FLASH_ProgramByte
1826                     	xdef	_FLASH_Lock
1827                     	xdef	_FLASH_Unlock
1828                     	xdef	_FLASH_DeInit
1829                     	xdef	_FLASH_PowerWaitModeConfig
1830                     	xdef	_FLASH_SetProgrammingTime
1831                     	xdef	_FLASH_GetProgrammingTime
1832                     	xref.b	c_lreg
1851                     	xref	c_ladd
1852                     	xref	c_lgadd
1853                     	xref	c_cmulx
1854                     	xref	c_ltor
1855                     	end
