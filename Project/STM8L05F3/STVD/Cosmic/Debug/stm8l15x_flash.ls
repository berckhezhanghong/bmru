   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  68                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  68                     ; 175 {
  69                     .text:	section	.text,new
  70  0000               f_FLASH_SetProgrammingTime:
  74                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  76                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  78  0000 72115050      	bres	20560,#0
  79                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  81  0004 ca5050        	or	a,20560
  82  0007 c75050        	ld	20560,a
  83                     ; 181 }
  86  000a 87            	retf	
 110                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 110                     ; 189 {
 111                     .text:	section	.text,new
 112  0000               f_FLASH_GetProgrammingTime:
 116                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 118  0000 c65050        	ld	a,20560
 119  0003 a401          	and	a,#1
 122  0005 87            	retf	
 177                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 177                     ; 204 {
 178                     .text:	section	.text,new
 179  0000               f_FLASH_PowerWaitModeConfig:
 183                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
 185                     ; 209   if(FLASH_Power != FLASH_Power_On)
 187  0000 4a            	dec	a
 188  0001 2705          	jreq	L57
 189                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 191  0003 72145050      	bset	20560,#2
 194  0007 87            	retf	
 195  0008               L57:
 196                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 198  0008 72155050      	bres	20560,#2
 199                     ; 218 }
 202  000c 87            	retf	
 224                     ; 259 void FLASH_DeInit(void)
 224                     ; 260 {
 225                     .text:	section	.text,new
 226  0000               f_FLASH_DeInit:
 230                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 232  0000 725f5050      	clr	20560
 233                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 235  0004 725f5051      	clr	20561
 236                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 238  0008 35405054      	mov	20564,#64
 239                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 241  000c c65054        	ld	a,20564
 242                     ; 265 }
 245  000f 87            	retf	
 300                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 300                     ; 276 {
 301                     .text:	section	.text,new
 302  0000               f_FLASH_Unlock:
 304  0000 88            	push	a
 305       00000000      OFST:	set	0
 308                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 310                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
 312  0001 a1fd          	cp	a,#253
 313  0003 2608          	jrne	L731
 314                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
 316  0005 35565052      	mov	20562,#86
 317                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
 319  0009 35ae5052      	mov	20562,#174
 320  000d               L731:
 321                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
 323  000d 7b01          	ld	a,(OFST+1,sp)
 324  000f a1f7          	cp	a,#247
 325  0011 2608          	jrne	L141
 326                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 328  0013 35ae5053      	mov	20563,#174
 329                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
 331  0017 35565053      	mov	20563,#86
 332  001b               L141:
 333                     ; 293 }
 336  001b 84            	pop	a
 337  001c 87            	retf	
 371                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 371                     ; 304 {
 372                     .text:	section	.text,new
 373  0000               f_FLASH_Lock:
 377                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 379                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 381  0000 c45054        	and	a,20564
 382  0003 c75054        	ld	20564,a
 383                     ; 310 }
 386  0006 87            	retf	
 424                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 424                     ; 319 {
 425                     .text:	section	.text,new
 426  0000               f_FLASH_ProgramByte:
 428       00000000      OFST:	set	0
 431                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 433                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 435  0000 7b08          	ld	a,(OFST+8,sp)
 436  0002 1e06          	ldw	x,(OFST+6,sp)
 437  0004 f7            	ld	(x),a
 438                     ; 324 }
 441  0005 87            	retf	
 472                     ; 331 void FLASH_EraseByte(uint32_t Address)
 472                     ; 332 {
 473                     .text:	section	.text,new
 474  0000               f_FLASH_EraseByte:
 476       00000000      OFST:	set	0
 479                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 481                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 483  0000 1e06          	ldw	x,(OFST+6,sp)
 484  0002 7f            	clr	(x)
 485                     ; 337 }
 488  0003 87            	retf	
 526                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 526                     ; 346 {
 527                     .text:	section	.text,new
 528  0000               f_FLASH_ProgramWord:
 530       00000000      OFST:	set	0
 533                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 535                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 537  0000 721c5051      	bset	20561,#6
 538                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 540  0004 7b08          	ld	a,(OFST+8,sp)
 541  0006 1e06          	ldw	x,(OFST+6,sp)
 542  0008 f7            	ld	(x),a
 543                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 545  0009 7b09          	ld	a,(OFST+9,sp)
 546  000b e701          	ld	(1,x),a
 547                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 549  000d 7b0a          	ld	a,(OFST+10,sp)
 550  000f e702          	ld	(2,x),a
 551                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 553  0011 7b0b          	ld	a,(OFST+11,sp)
 554  0013 e703          	ld	(3,x),a
 555                     ; 360 }
 558  0015 87            	retf	
 589                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 589                     ; 368 {
 590                     .text:	section	.text,new
 591  0000               f_FLASH_ReadByte:
 593       00000000      OFST:	set	0
 596                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 598  0000 1e06          	ldw	x,(OFST+6,sp)
 599  0002 f6            	ld	a,(x)
 602  0003 87            	retf	
 642                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 642                     ; 418 {
 643                     .text:	section	.text,new
 644  0000               f_FLASH_ProgramOptionByte:
 646  0000 89            	pushw	x
 647       00000000      OFST:	set	0
 650                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 652                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 654  0001 721e5051      	bset	20561,#7
 655                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 657  0005 7b06          	ld	a,(OFST+6,sp)
 658  0007 1e01          	ldw	x,(OFST+1,sp)
 659  0009 f7            	ld	(x),a
 660                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 662  000a a6fd          	ld	a,#253
 663  000c 8d000000      	callf	f_FLASH_WaitForLastOperation
 665                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 667  0010 721f5051      	bres	20561,#7
 668                     ; 432 }
 671  0014 85            	popw	x
 672  0015 87            	retf	
 705                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 705                     ; 440 {
 706                     .text:	section	.text,new
 707  0000               f_FLASH_EraseOptionByte:
 711                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 713                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 715  0000 721e5051      	bset	20561,#7
 716                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 718  0004 7f            	clr	(x)
 719                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 721  0005 a6fd          	ld	a,#253
 722  0007 8d000000      	callf	f_FLASH_WaitForLastOperation
 724                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 726  000b 721f5051      	bres	20561,#7
 727                     ; 454 }
 730  000f 87            	retf	
 786                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 786                     ; 463 {
 787                     .text:	section	.text,new
 788  0000               f_FLASH_GetReadOutProtectionStatus:
 790  0000 88            	push	a
 791       00000001      OFST:	set	1
 794                     ; 464   FunctionalState state = DISABLE;
 796  0001 0f01          	clr	(OFST+0,sp)
 797                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 799  0003 c64800        	ld	a,18432
 800  0006 a1aa          	cp	a,#170
 801  0008 2604          	jrne	L523
 802                     ; 469     state =  ENABLE;
 804  000a a601          	ld	a,#1
 806  000c 2001          	jra	L723
 807  000e               L523:
 808                     ; 474     state =  DISABLE;
 810  000e 4f            	clr	a
 811  000f               L723:
 812                     ; 477   return state;
 816  000f 5b01          	addw	sp,#1
 817  0011 87            	retf	
 848                     ; 485 uint16_t FLASH_GetBootSize(void)
 848                     ; 486 {
 849                     .text:	section	.text,new
 850  0000               f_FLASH_GetBootSize:
 852  0000 89            	pushw	x
 853       00000002      OFST:	set	2
 856                     ; 487   uint16_t temp = 0;
 858                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 860  0001 c64802        	ld	a,18434
 861  0004 97            	ld	xl,a
 862  0005 4f            	clr	a
 863  0006 02            	rlwa	x,a
 864  0007 44            	srl	a
 865  0008 56            	rrcw	x
 866                     ; 493   if(OPT->UBC > 0x7F)
 868  0009 c64802        	ld	a,18434
 869  000c a180          	cp	a,#128
 870  000e 2503          	jrult	L543
 871                     ; 495     temp = 8192;
 873  0010 ae2000        	ldw	x,#8192
 874  0013               L543:
 875                     ; 499   return(temp);
 879  0013 5b02          	addw	sp,#2
 880  0015 87            	retf	
 911                     ; 508 uint16_t FLASH_GetCodeSize(void)
 911                     ; 509 {
 912                     .text:	section	.text,new
 913  0000               f_FLASH_GetCodeSize:
 915  0000 89            	pushw	x
 916       00000002      OFST:	set	2
 919                     ; 510   uint16_t temp = 0;
 921                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 923  0001 c64807        	ld	a,18439
 924  0004 97            	ld	xl,a
 925  0005 4f            	clr	a
 926  0006 02            	rlwa	x,a
 927  0007 44            	srl	a
 928  0008 56            	rrcw	x
 929                     ; 516   if(OPT->PCODESIZE > 0x7F)
 931  0009 c64807        	ld	a,18439
 932  000c a180          	cp	a,#128
 933  000e 2503          	jrult	L363
 934                     ; 518     temp = 8192;
 936  0010 ae2000        	ldw	x,#8192
 937  0013               L363:
 938                     ; 522   return(temp);
 942  0013 5b02          	addw	sp,#2
 943  0015 87            	retf	
 977                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
 977                     ; 548 {
 978                     .text:	section	.text,new
 979  0000               f_FLASH_ITConfig:
 983                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
 985                     ; 552   if(NewState != DISABLE)
 987  0000 4d            	tnz	a
 988  0001 2705          	jreq	L304
 989                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
 991  0003 72125050      	bset	20560,#1
 994  0007 87            	retf	
 995  0008               L304:
 996                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
 998  0008 72135050      	bres	20560,#1
 999                     ; 562 }
1002  000c 87            	retf	
1110                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1110                     ; 577 {
1111                     .text:	section	.text,new
1112  0000               f_FLASH_GetFlagStatus:
1114  0000 88            	push	a
1115       00000001      OFST:	set	1
1118                     ; 578   FlagStatus status = RESET;
1120  0001 0f01          	clr	(OFST+0,sp)
1121                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1123                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1125  0003 c45054        	and	a,20564
1126  0006 2702          	jreq	L754
1127                     ; 584     status = SET; /* Flash_FLAG is set*/
1129  0008 a601          	ld	a,#1
1131  000a               L754:
1132                     ; 588     status = RESET; /* Flash_FLAG is reset*/
1134                     ; 592   return status;
1138  000a 5b01          	addw	sp,#1
1139  000c 87            	retf	
1174                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1174                     ; 720 {
1175                     .text:	section	.text,new
1176  0000               f_FLASH_PowerRunModeConfig:
1180                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
1182                     ; 724   if(FLASH_Power != FLASH_Power_On)
1184  0000 4a            	dec	a
1185  0001 2705          	jreq	L105
1186                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1188  0003 72165050      	bset	20560,#3
1191  0007 87            	retf	
1192  0008               L105:
1193                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1195  0008 72175050      	bres	20560,#3
1196                     ; 732 }
1199  000c 87            	retf	
1262                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1262                     ; 746 {
1263                     .text:	section	.text,new
1264  0000               f_FLASH_GetPowerStatus:
1268                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1270  0000 c65050        	ld	a,20560
1271  0003 a40c          	and	a,#12
1274  0005 87            	retf	
1371                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1371                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1371                     ; 767 {
1372                     .text:	section	.text,new
1373  0000               f_FLASH_ProgramBlock:
1375  0000 89            	pushw	x
1376  0001 5206          	subw	sp,#6
1377       00000006      OFST:	set	6
1380                     ; 768   uint16_t Count = 0;
1382                     ; 769   uint32_t startaddress = 0;
1384  0003 96            	ldw	x,sp
1385  0004 5c            	incw	x
1386  0005 8d000000      	callf	d_ltor
1388                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1390                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1392                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
1394  0009 7b0c          	ld	a,(OFST+6,sp)
1395  000b a1fd          	cp	a,#253
1396  000d 2605          	jrne	L575
1397                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1399                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1401  000f ae8000        	ldw	x,#32768
1403  0012 2003          	jra	L775
1404  0014               L575:
1405                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1407                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1409  0014 ae1000        	ldw	x,#4096
1410  0017               L775:
1411  0017 1f03          	ldw	(OFST-3,sp),x
1412  0019 5f            	clrw	x
1413  001a 1f01          	ldw	(OFST-5,sp),x
1414                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1416  001c 1e07          	ldw	x,(OFST+1,sp)
1417  001e a640          	ld	a,#64
1418  0020 8d000000      	callf	d_cmulx
1420  0024 96            	ldw	x,sp
1421  0025 5c            	incw	x
1422  0026 8d000000      	callf	d_lgadd
1424                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
1426  002a 7b0d          	ld	a,(OFST+7,sp)
1427  002c 2606          	jrne	L106
1428                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
1430  002e 72105051      	bset	20561,#0
1432  0032 2004          	jra	L306
1433  0034               L106:
1434                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
1436  0034 72185051      	bset	20561,#4
1437  0038               L306:
1438                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1440  0038 5f            	clrw	x
1441  0039 1f05          	ldw	(OFST-1,sp),x
1442  003b               L506:
1443                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1445  003b 1e0e          	ldw	x,(OFST+8,sp)
1446  003d 72fb05        	addw	x,(OFST-1,sp)
1447  0040 f6            	ld	a,(x)
1448  0041 1e03          	ldw	x,(OFST-3,sp)
1449  0043 72fb05        	addw	x,(OFST-1,sp)
1450  0046 f7            	ld	(x),a
1451                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1453  0047 1e05          	ldw	x,(OFST-1,sp)
1454  0049 5c            	incw	x
1455  004a 1f05          	ldw	(OFST-1,sp),x
1458  004c a30040        	cpw	x,#64
1459  004f 25ea          	jrult	L506
1460                     ; 805 }
1463  0051 5b08          	addw	sp,#8
1464  0053 87            	retf	
1522                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1522                     ; 818 {
1523                     .text:	section	.text,new
1524  0000               f_FLASH_EraseBlock:
1526  0000 89            	pushw	x
1527  0001 5206          	subw	sp,#6
1528       00000006      OFST:	set	6
1531                     ; 819   uint32_t startaddress = 0;
1533  0003 96            	ldw	x,sp
1534  0004 1c0003        	addw	x,#OFST-3
1535  0007 8d000000      	callf	d_ltor
1537                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1539                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
1541  000b 7b0c          	ld	a,(OFST+6,sp)
1542  000d a1fd          	cp	a,#253
1543  000f 2605          	jrne	L146
1544                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1546                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1548  0011 ae8000        	ldw	x,#32768
1550  0014 2003          	jra	L346
1551  0016               L146:
1552                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1554                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1556  0016 ae1000        	ldw	x,#4096
1557  0019               L346:
1558  0019 1f05          	ldw	(OFST-1,sp),x
1559  001b 5f            	clrw	x
1560  001c 1f03          	ldw	(OFST-3,sp),x
1561                     ; 844     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1563  001e 1e07          	ldw	x,(OFST+1,sp)
1564  0020 a640          	ld	a,#64
1565  0022 8d000000      	callf	d_cmulx
1567  0026 96            	ldw	x,sp
1568  0027 1c0003        	addw	x,#OFST-3
1569  002a 8d000000      	callf	d_ladd
1571  002e be02          	ldw	x,c_lreg+2
1572  0030 1f01          	ldw	(OFST-5,sp),x
1573                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
1575  0032 721a5051      	bset	20561,#5
1576                     ; 855     *pwFlash = (uint32_t)0;  
1578  0036 4f            	clr	a
1579  0037 e703          	ld	(3,x),a
1580  0039 e702          	ld	(2,x),a
1581  003b e701          	ld	(1,x),a
1582  003d f7            	ld	(x),a
1583                     ; 863 }
1586  003e 5b08          	addw	sp,#8
1587  0040 87            	retf	
1667                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1667                     ; 876 {
1668                     .text:	section	.text,new
1669  0000               f_FLASH_WaitForLastOperation:
1671  0000 5203          	subw	sp,#3
1672       00000003      OFST:	set	3
1675                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
1677  0002 aeffff        	ldw	x,#65535
1678  0005 1f01          	ldw	(OFST-2,sp),x
1679                     ; 878   uint8_t flagstatus = 0x00;
1681  0007 0f03          	clr	(OFST+0,sp)
1682                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
1684  0009 a1fd          	cp	a,#253
1685  000b 2620          	jrne	L717
1687  000d 200a          	jra	L507
1688  000f               L307:
1689                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1689                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
1691  000f c65054        	ld	a,20564
1692  0012 a405          	and	a,#5
1693  0014 6b03          	ld	(OFST+0,sp),a
1694                     ; 887       timeout--;
1696  0016 5a            	decw	x
1697  0017 1f01          	ldw	(OFST-2,sp),x
1698  0019               L507:
1699                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
1701  0019 7b03          	ld	a,(OFST+0,sp)
1702  001b 2618          	jrne	L317
1704  001d 1e01          	ldw	x,(OFST-2,sp)
1705  001f 26ee          	jrne	L307
1706  0021 2012          	jra	L317
1707  0023               L517:
1708                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1708                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
1710  0023 c65054        	ld	a,20564
1711  0026 a441          	and	a,#65
1712  0028 6b03          	ld	(OFST+0,sp),a
1713                     ; 896       timeout--;
1715  002a 5a            	decw	x
1716  002b 1f01          	ldw	(OFST-2,sp),x
1717  002d               L717:
1718                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
1720  002d 7b03          	ld	a,(OFST+0,sp)
1721  002f 2604          	jrne	L317
1723  0031 1e01          	ldw	x,(OFST-2,sp)
1724  0033 26ee          	jrne	L517
1725  0035               L317:
1726                     ; 900   if(timeout == 0x00)
1728  0035 1e01          	ldw	x,(OFST-2,sp)
1729  0037 2602          	jrne	L527
1730                     ; 902     flagstatus = FLASH_Status_TimeOut;
1732  0039 a602          	ld	a,#2
1733  003b               L527:
1734                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
1738  003b 5b03          	addw	sp,#3
1739  003d 87            	retf	
1751                     	xdef	f_FLASH_WaitForLastOperation
1752                     	xdef	f_FLASH_EraseBlock
1753                     	xdef	f_FLASH_ProgramBlock
1754                     	xdef	f_FLASH_GetPowerStatus
1755                     	xdef	f_FLASH_PowerRunModeConfig
1756                     	xdef	f_FLASH_GetFlagStatus
1757                     	xdef	f_FLASH_ITConfig
1758                     	xdef	f_FLASH_EraseOptionByte
1759                     	xdef	f_FLASH_ProgramOptionByte
1760                     	xdef	f_FLASH_GetReadOutProtectionStatus
1761                     	xdef	f_FLASH_GetCodeSize
1762                     	xdef	f_FLASH_GetBootSize
1763                     	xdef	f_FLASH_ReadByte
1764                     	xdef	f_FLASH_ProgramWord
1765                     	xdef	f_FLASH_EraseByte
1766                     	xdef	f_FLASH_ProgramByte
1767                     	xdef	f_FLASH_Lock
1768                     	xdef	f_FLASH_Unlock
1769                     	xdef	f_FLASH_DeInit
1770                     	xdef	f_FLASH_PowerWaitModeConfig
1771                     	xdef	f_FLASH_SetProgrammingTime
1772                     	xdef	f_FLASH_GetProgrammingTime
1773                     	xref.b	c_lreg
1792                     	xref	d_ladd
1793                     	xref	d_lgadd
1794                     	xref	d_cmulx
1795                     	xref	d_ltor
1796                     	end
