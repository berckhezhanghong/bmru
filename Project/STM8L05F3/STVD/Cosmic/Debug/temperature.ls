   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  45                     ; 47 static void Pin_temper1_Dir(uint8 u8Type)
  45                     ; 48 {
  47                     .text:	section	.text,new
  48  0000               L3_Pin_temper1_Dir:
  52                     ; 49 	if(PIN_DIR_INPUT == u8Type)
  54  0000 4d            	tnz	a
  55  0001 2604          	jrne	L13
  56                     ; 51 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
  58  0003 4b40          	push	#64
  61  0005 2002          	jra	L33
  62  0007               L13:
  63                     ; 55 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
  65  0007 4be0          	push	#224
  67  0009               L33:
  68  0009 4b01          	push	#1
  69  000b ae500a        	ldw	x,#20490
  70  000e cd0000        	call	_GPIO_Init
  71  0011 85            	popw	x
  72                     ; 57 }
  75  0012 81            	ret	
 110                     ; 60 static void Pin_temper2_Dir(uint8 u8Type)
 110                     ; 61 {
 111                     .text:	section	.text,new
 112  0000               L53_Pin_temper2_Dir:
 116                     ; 62 	if(PIN_DIR_INPUT == u8Type)
 118  0000 4d            	tnz	a
 119  0001 2604          	jrne	L55
 120                     ; 64 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
 122  0003 4b40          	push	#64
 125  0005 2002          	jra	L75
 126  0007               L55:
 127                     ; 68 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
 129  0007 4be0          	push	#224
 131  0009               L75:
 132  0009 4b02          	push	#2
 133  000b ae500a        	ldw	x,#20490
 134  000e cd0000        	call	_GPIO_Init
 135  0011 85            	popw	x
 136                     ; 70 }
 139  0012 81            	ret	
 174                     ; 73 static void Pin_temper1_Write(uint8 u8Data)
 174                     ; 74 {
 175                     .text:	section	.text,new
 176  0000               L16_Pin_temper1_Write:
 180                     ; 75 	if(0 == u8Data)
 182  0000 4d            	tnz	a
 183  0001 2604          	jrne	L101
 184                     ; 77 		GPIO_WriteBit(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, 0);
 186  0003 4b00          	push	#0
 189  0005 2002          	jra	L301
 190  0007               L101:
 191                     ; 81 		GPIO_WriteBit(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, 1);
 193  0007 4b01          	push	#1
 195  0009               L301:
 196  0009 4b01          	push	#1
 197  000b ae500a        	ldw	x,#20490
 198  000e cd0000        	call	_GPIO_WriteBit
 199  0011 85            	popw	x
 200                     ; 83 }
 203  0012 81            	ret	
 238                     ; 86 static void Pin_temper2_Write(uint8 u8Data)
 238                     ; 87 {
 239                     .text:	section	.text,new
 240  0000               L501_Pin_temper2_Write:
 244                     ; 88 	if(0 == u8Data)
 246  0000 4d            	tnz	a
 247  0001 2604          	jrne	L521
 248                     ; 90 		GPIO_WriteBit(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, 0);
 250  0003 4b00          	push	#0
 253  0005 2002          	jra	L721
 254  0007               L521:
 255                     ; 94 		GPIO_WriteBit(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, 1);
 257  0007 4b01          	push	#1
 259  0009               L721:
 260  0009 4b02          	push	#2
 261  000b ae500a        	ldw	x,#20490
 262  000e cd0000        	call	_GPIO_WriteBit
 263  0011 85            	popw	x
 264                     ; 96 }
 267  0012 81            	ret	
 291                     ; 99 static uint8 Pin_temper1_Read(void)
 291                     ; 100 {
 292                     .text:	section	.text,new
 293  0000               L131_Pin_temper1_Read:
 297                     ; 101 	if(0 == GPIO_ReadInputDataBit(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN))
 299  0000 4b01          	push	#1
 300  0002 ae500a        	ldw	x,#20490
 301  0005 cd0000        	call	_GPIO_ReadInputDataBit
 303  0008 5b01          	addw	sp,#1
 304  000a 4d            	tnz	a
 305  000b 2601          	jrne	L341
 306                     ; 103 		return 0;         //
 310  000d 81            	ret	
 311  000e               L341:
 312                     ; 107 		return 1;         //
 314  000e a601          	ld	a,#1
 317  0010 81            	ret	
 341                     ; 112 static uint8 Pin_temper2_Read(void)
 341                     ; 113 {
 342                     .text:	section	.text,new
 343  0000               L741_Pin_temper2_Read:
 347                     ; 114 	if(0 == GPIO_ReadInputDataBit(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN))
 349  0000 4b02          	push	#2
 350  0002 ae500a        	ldw	x,#20490
 351  0005 cd0000        	call	_GPIO_ReadInputDataBit
 353  0008 5b01          	addw	sp,#1
 354  000a 4d            	tnz	a
 355  000b 2601          	jrne	L161
 356                     ; 116 		return 0;         //
 360  000d 81            	ret	
 361  000e               L161:
 362                     ; 120 		return 1;         //
 364  000e a601          	ld	a,#1
 367  0010 81            	ret	
 402                     ; 125 static void TemperPowerCtrl(uint8 u8Type)
 402                     ; 126 {
 403                     .text:	section	.text,new
 404  0000               L561_TemperPowerCtrl:
 408                     ; 127 	if(0 == u8Type)
 410  0000 4d            	tnz	a
 411  0001 2604          	jrne	L502
 412                     ; 129 		GPIO_WriteBit(TEMPER_GPIO_PORT, TEMPER_POWER_GPIO_PIN, 1);
 414  0003 4b01          	push	#1
 417  0005 2002          	jra	L702
 418  0007               L502:
 419                     ; 133 		GPIO_WriteBit(TEMPER_GPIO_PORT, TEMPER_POWER_GPIO_PIN, 0);
 421  0007 4b00          	push	#0
 423  0009               L702:
 424  0009 4b10          	push	#16
 425  000b ae500a        	ldw	x,#20490
 426  000e cd0000        	call	_GPIO_WriteBit
 427  0011 85            	popw	x
 428                     ; 136 }
 431  0012 81            	ret	
 513                     ; 154 static uint8 TempCRCResult(uint8* pRead)
 513                     ; 155 {
 514                     .text:	section	.text,new
 515  0000               L112_TempCRCResult:
 517  0000 89            	pushw	x
 518  0001 520e          	subw	sp,#14
 519       0000000e      OFST:	set	14
 522                     ; 158 	uint8 CrcData=0;
 524  0003 0f0e          	clr	(OFST+0,sp)
 525                     ; 159 	uint8 *pbTmp=NULL;
 527                     ; 162 	pbTmp=pRead;
 529  0005 1e0f          	ldw	x,(OFST+1,sp)
 530  0007 1f01          	ldw	(OFST-13,sp),x
 531                     ; 163 	for(i=0;i<9;i++)	/*包括CRC值共9个字节*/
 533  0009 0f0d          	clr	(OFST-1,sp)
 534  000b               L552:
 535                     ; 165 		pabDataBuff[i]=*pbTmp;
 537  000b 96            	ldw	x,sp
 538  000c ad4e          	call	LC001
 539  000e 1b0d          	add	a,(OFST-1,sp)
 540  0010 2401          	jrnc	L45
 541  0012 5c            	incw	x
 542  0013               L45:
 543  0013 02            	rlwa	x,a
 544  0014 1601          	ldw	y,(OFST-13,sp)
 545  0016 90f6          	ld	a,(y)
 546  0018 f7            	ld	(x),a
 547                     ; 166 		pbTmp++;
 549  0019 1e01          	ldw	x,(OFST-13,sp)
 550  001b 5c            	incw	x
 551  001c 1f01          	ldw	(OFST-13,sp),x
 552                     ; 167 		for(j=0;j<8;j++)
 554  001e 0f03          	clr	(OFST-11,sp)
 555  0020               L362:
 556                     ; 170 			if((CrcData^pabDataBuff[i])&0x01)
 558  0020 96            	ldw	x,sp
 559  0021 ad39          	call	LC001
 560  0023 1b0d          	add	a,(OFST-1,sp)
 561  0025 2401          	jrnc	L65
 562  0027 5c            	incw	x
 563  0028               L65:
 564  0028 02            	rlwa	x,a
 565  0029 f6            	ld	a,(x)
 566  002a 180e          	xor	a,(OFST+0,sp)
 567  002c a501          	bcp	a,#1
 568  002e 270b          	jreq	L172
 569                     ; 172 				CrcData=CrcData^0x18;
 571  0030 7b0e          	ld	a,(OFST+0,sp)
 572  0032 a818          	xor	a,#24
 573  0034 44            	srl	a
 574                     ; 173 				CrcData>>=1;
 576                     ; 174 				CrcData=CrcData|0x80;
 578  0035 aa80          	or	a,#128
 579  0037 6b0e          	ld	(OFST+0,sp),a
 581  0039 2002          	jra	L372
 582  003b               L172:
 583                     ; 178 				CrcData>>=1;
 585  003b 040e          	srl	(OFST+0,sp)
 586  003d               L372:
 587                     ; 180 			pabDataBuff[i]>>=1;
 589  003d 96            	ldw	x,sp
 590  003e ad1c          	call	LC001
 591  0040 1b0d          	add	a,(OFST-1,sp)
 592  0042 2401          	jrnc	L06
 593  0044 5c            	incw	x
 594  0045               L06:
 595  0045 02            	rlwa	x,a
 596  0046 74            	srl	(x)
 597                     ; 167 		for(j=0;j<8;j++)
 599  0047 0c03          	inc	(OFST-11,sp)
 602  0049 7b03          	ld	a,(OFST-11,sp)
 603  004b a108          	cp	a,#8
 604  004d 25d1          	jrult	L362
 605                     ; 163 	for(i=0;i<9;i++)	/*包括CRC值共9个字节*/
 607  004f 0c0d          	inc	(OFST-1,sp)
 610  0051 7b0d          	ld	a,(OFST-1,sp)
 611  0053 a109          	cp	a,#9
 612  0055 25b4          	jrult	L552
 613                     ; 183 	return CrcData;
 615  0057 7b0e          	ld	a,(OFST+0,sp)
 618  0059 5b10          	addw	sp,#16
 619  005b 81            	ret	
 621  005c               LC001:
 622  005c 1c0004        	addw	x,#OFST-10
 623  005f 9f            	ld	a,xl
 624  0060 5e            	swapw	x
 625  0061 81            	ret	
 689                     ; 203 static sint32 OneWireByteWrite(uint8 u8Channal, uint8 u8Status)
 689                     ; 204 {
 690                     .text:	section	.text,new
 691  0000               L572_OneWireByteWrite:
 693  0000 89            	pushw	x
 694  0001 89            	pushw	x
 695       00000002      OFST:	set	2
 698                     ; 208 	if(0 == u8Channal)
 700  0002 9e            	ld	a,xh
 701  0003 4d            	tnz	a
 702  0004 2606          	jrne	L133
 703                     ; 210 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
 705  0006 4be0          	push	#224
 706  0008 4b01          	push	#1
 709  000a 2009          	jp	LC002
 710  000c               L133:
 711                     ; 212 	else if(1 == u8Channal)
 713  000c 7b03          	ld	a,(OFST+1,sp)
 714  000e 4a            	dec	a
 715  000f 260b          	jrne	L333
 716                     ; 214 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
 718  0011 4be0          	push	#224
 719  0013 4b02          	push	#2
 721  0015               LC002:
 722  0015 ae500a        	ldw	x,#20490
 723  0018 cd0000        	call	_GPIO_Init
 724  001b 85            	popw	x
 725  001c               L333:
 726                     ; 217 	for(i = 0; i < 8; i++)
 728  001c 4f            	clr	a
 729  001d 6b01          	ld	(OFST-1,sp),a
 730  001f               L733:
 731                     ; 219 		u8Tmp = u8Status >> i;
 733  001f 5f            	clrw	x
 734  0020 97            	ld	xl,a
 735  0021 7b04          	ld	a,(OFST+2,sp)
 736  0023 5d            	tnzw	x
 737  0024 2704          	jreq	L07
 738  0026               L27:
 739  0026 44            	srl	a
 740  0027 5a            	decw	x
 741  0028 26fc          	jrne	L27
 742  002a               L07:
 743                     ; 220 		u8Tmp &= 0x01;
 745  002a a401          	and	a,#1
 746  002c 6b02          	ld	(OFST+0,sp),a
 747                     ; 222 		if(0 == u8Channal)
 749  002e 7b03          	ld	a,(OFST+1,sp)
 750  0030 2621          	jrne	L543
 751                     ; 224 			Pin_temper1_Write(0);
 753  0032 cd0000        	call	L16_Pin_temper1_Write
 755                     ; 225 			if(u8Tmp)
 757  0035 7b02          	ld	a,(OFST+0,sp)
 758  0037 270d          	jreq	L743
 759                     ; 227 				UsDelay(5);
 761  0039 ae0005        	ldw	x,#5
 762  003c cd0000        	call	_UsDelay
 764                     ; 228 				Pin_temper1_Write(1);
 766  003f a601          	ld	a,#1
 767  0041 cd0000        	call	L16_Pin_temper1_Write
 769                     ; 229 				UsDelay(80);
 772  0044 2022          	jp	LC005
 773  0046               L743:
 774                     ; 233 				UsDelay(80);
 776  0046 ae0050        	ldw	x,#80
 777  0049 cd0000        	call	_UsDelay
 779                     ; 234 				Pin_temper1_Write(1);
 781  004c a601          	ld	a,#1
 782  004e cd0000        	call	L16_Pin_temper1_Write
 784                     ; 235 				UsDelay(5);
 786  0051 2025          	jp	LC004
 787  0053               L543:
 788                     ; 238 		else if(1 == u8Channal)
 790  0053 4a            	dec	a
 791  0054 2628          	jrne	L353
 792                     ; 240 			Pin_temper2_Write(0);
 794  0056 cd0000        	call	L501_Pin_temper2_Write
 796                     ; 241 			if(u8Tmp)
 798  0059 7b02          	ld	a,(OFST+0,sp)
 799  005b 2710          	jreq	L753
 800                     ; 243 				UsDelay(5);
 802  005d ae0005        	ldw	x,#5
 803  0060 cd0000        	call	_UsDelay
 805                     ; 244 				Pin_temper2_Write(1);
 807  0063 a601          	ld	a,#1
 808  0065 cd0000        	call	L501_Pin_temper2_Write
 810                     ; 245 				UsDelay(80);
 812  0068               LC005:
 814  0068 ae0050        	ldw	x,#80
 817  006b 200e          	jp	LC003
 818  006d               L753:
 819                     ; 249 				UsDelay(80);
 821  006d ae0050        	ldw	x,#80
 822  0070 cd0000        	call	_UsDelay
 824                     ; 250 				Pin_temper2_Write(1);
 826  0073 a601          	ld	a,#1
 827  0075 cd0000        	call	L501_Pin_temper2_Write
 829                     ; 251 				UsDelay(5);
 831  0078               LC004:
 833  0078 ae0005        	ldw	x,#5
 834  007b               LC003:
 835  007b cd0000        	call	_UsDelay
 837  007e               L353:
 838                     ; 217 	for(i = 0; i < 8; i++)
 840  007e 0c01          	inc	(OFST-1,sp)
 843  0080 7b01          	ld	a,(OFST-1,sp)
 844  0082 a108          	cp	a,#8
 845  0084 2599          	jrult	L733
 846                     ; 257     return 0;
 848  0086 5f            	clrw	x
 849  0087 bf02          	ldw	c_lreg+2,x
 850  0089 bf00          	ldw	c_lreg,x
 853  008b 5b04          	addw	sp,#4
 854  008d 81            	ret	
 929                     ; 275 static uint8 OneWireByteRead(uint8 u8Channal)
 929                     ; 276 {
 930                     .text:	section	.text,new
 931  0000               L363_OneWireByteRead:
 933  0000 88            	push	a
 934  0001 5203          	subw	sp,#3
 935       00000003      OFST:	set	3
 938                     ; 282 	u8Value = 0;
 940  0003 0f01          	clr	(OFST-2,sp)
 941                     ; 284 	if(0 == u8Channal)
 943  0005 4d            	tnz	a
 944  0006 264f          	jrne	L714
 945                     ; 286 		for (i = 0; i < 8; i ++)
 947  0008 6b03          	ld	(OFST+0,sp),a
 948  000a               L124:
 949                     ; 288 			GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
 951  000a 4be0          	push	#224
 952  000c 4b01          	push	#1
 953  000e ae500a        	ldw	x,#20490
 954  0011 cd0000        	call	_GPIO_Init
 956  0014 4f            	clr	a
 957  0015 85            	popw	x
 958                     ; 289 			Pin_temper1_Write(0);
 960  0016 cd0000        	call	L16_Pin_temper1_Write
 962                     ; 290 			nop();
 965  0019 cd00ac        	call	LC006
 967                     ; 293 			Pin_temper1_Write(1);
 969  001c a601          	ld	a,#1
 970  001e cd0000        	call	L16_Pin_temper1_Write
 972                     ; 294 			nop();
 975  0021 cd00ac        	call	LC006
 977                     ; 298 			GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
 979  0024 4b40          	push	#64
 980  0026 4b01          	push	#1
 981  0028 ae500a        	ldw	x,#20490
 982  002b cd0000        	call	_GPIO_Init
 984  002e 85            	popw	x
 985                     ; 299 			u8Tmp = Pin_temper1_Read();
 987  002f cd0000        	call	L131_Pin_temper1_Read
 989  0032 6b02          	ld	(OFST-1,sp),a
 990                     ; 300 			if (u8Tmp)
 992  0034 2711          	jreq	L724
 993                     ; 302 				u8Value |= 1 << i;
 995  0036 7b03          	ld	a,(OFST+0,sp)
 996  0038 5f            	clrw	x
 997  0039 97            	ld	xl,a
 998  003a a601          	ld	a,#1
 999  003c 5d            	tnzw	x
1000  003d 2704          	jreq	L051
1001  003f               L251:
1002  003f 48            	sll	a
1003  0040 5a            	decw	x
1004  0041 26fc          	jrne	L251
1005  0043               L051:
1006  0043 1a01          	or	a,(OFST-2,sp)
1007  0045 6b01          	ld	(OFST-2,sp),a
1008  0047               L724:
1009                     ; 304 			UsDelay(80);
1011  0047 ae0050        	ldw	x,#80
1012  004a cd0000        	call	_UsDelay
1014                     ; 286 		for (i = 0; i < 8; i ++)
1016  004d 0c03          	inc	(OFST+0,sp)
1019  004f 7b03          	ld	a,(OFST+0,sp)
1020  0051 a108          	cp	a,#8
1021  0053 25b5          	jrult	L124
1023  0055 2050          	jra	L134
1024  0057               L714:
1025                     ; 308 	else if(1 == u8Channal)
1027  0057 7b04          	ld	a,(OFST+1,sp)
1028  0059 4a            	dec	a
1029  005a 264b          	jrne	L134
1030                     ; 310 		for (i = 0; i < 8; i ++)
1032  005c 6b03          	ld	(OFST+0,sp),a
1033  005e               L534:
1034                     ; 312 			GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
1036  005e 4be0          	push	#224
1037  0060 4b02          	push	#2
1038  0062 ae500a        	ldw	x,#20490
1039  0065 cd0000        	call	_GPIO_Init
1041  0068 4f            	clr	a
1042  0069 85            	popw	x
1043                     ; 313 			Pin_temper2_Write(0);
1045  006a cd0000        	call	L501_Pin_temper2_Write
1047                     ; 314 			nop();
1050  006d ad3d          	call	LC006
1052                     ; 317 			Pin_temper2_Write(1);
1054  006f a601          	ld	a,#1
1055  0071 cd0000        	call	L501_Pin_temper2_Write
1057                     ; 318 			nop();
1060  0074 9d            	nop	
1062                     ; 319 			nop();
1066  0075 9d            	nop	
1068                     ; 321 			GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
1071  0076 4b40          	push	#64
1072  0078 4b02          	push	#2
1073  007a ae500a        	ldw	x,#20490
1074  007d cd0000        	call	_GPIO_Init
1076  0080 85            	popw	x
1077                     ; 322 			u8Tmp = Pin_temper2_Read();
1079  0081 cd0000        	call	L741_Pin_temper2_Read
1081  0084 6b02          	ld	(OFST-1,sp),a
1082                     ; 323 			if (u8Tmp)
1084  0086 2711          	jreq	L344
1085                     ; 325 				u8Value |= 1 << i;
1087  0088 7b03          	ld	a,(OFST+0,sp)
1088  008a 5f            	clrw	x
1089  008b 97            	ld	xl,a
1090  008c a601          	ld	a,#1
1091  008e 5d            	tnzw	x
1092  008f 2704          	jreq	L271
1093  0091               L471:
1094  0091 48            	sll	a
1095  0092 5a            	decw	x
1096  0093 26fc          	jrne	L471
1097  0095               L271:
1098  0095 1a01          	or	a,(OFST-2,sp)
1099  0097 6b01          	ld	(OFST-2,sp),a
1100  0099               L344:
1101                     ; 327 			UsDelay(80);
1103  0099 ae0050        	ldw	x,#80
1104  009c cd0000        	call	_UsDelay
1106                     ; 310 		for (i = 0; i < 8; i ++)
1108  009f 0c03          	inc	(OFST+0,sp)
1111  00a1 7b03          	ld	a,(OFST+0,sp)
1112  00a3 a108          	cp	a,#8
1113  00a5 25b7          	jrult	L534
1114  00a7               L134:
1115                     ; 331 	return u8Value;
1117  00a7 7b01          	ld	a,(OFST-2,sp)
1120  00a9 5b04          	addw	sp,#4
1121  00ab 81            	ret	
1123  00ac               LC006:
1124  00ac 9d            	nop	
1126                     ; 291 			nop();
1130  00ad 9d            	nop	
1132                     ; 292 			UsDelay(1);
1135  00ae ae0001        	ldw	x,#1
1136  00b1 cc0000        	jp	_UsDelay
1184                     ; 349 static uint8 OneWireReset(uint8 u8Channal)
1184                     ; 350 {
1185                     .text:	section	.text,new
1186  0000               L544_OneWireReset:
1188  0000 88            	push	a
1189  0001 88            	push	a
1190       00000001      OFST:	set	1
1193                     ; 353 	if(0 == u8Channal)
1195  0002 4d            	tnz	a
1196  0003 2636          	jrne	L174
1197                     ; 355 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
1199  0005 4be0          	push	#224
1200  0007 4b01          	push	#1
1201  0009 ae500a        	ldw	x,#20490
1202  000c cd0000        	call	_GPIO_Init
1204  000f 4f            	clr	a
1205  0010 85            	popw	x
1206                     ; 356 		Pin_temper1_Write(0);
1208  0011 cd0000        	call	L16_Pin_temper1_Write
1210                     ; 357 		UsDelay(750);
1212  0014 ae02ee        	ldw	x,#750
1213  0017 cd0000        	call	_UsDelay
1215                     ; 359 		Pin_temper1_Write(1);
1217  001a a601          	ld	a,#1
1218  001c cd0000        	call	L16_Pin_temper1_Write
1220                     ; 360 		UsDelay(70);
1222  001f ae0046        	ldw	x,#70
1223  0022 cd0000        	call	_UsDelay
1225                     ; 362 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
1227  0025 4b40          	push	#64
1228  0027 4b01          	push	#1
1229  0029 ae500a        	ldw	x,#20490
1230  002c cd0000        	call	_GPIO_Init
1232  002f 85            	popw	x
1233                     ; 363 		UsDelay(1);
1235  0030 ae0001        	ldw	x,#1
1236  0033 cd0000        	call	_UsDelay
1238                     ; 364 		u8Result = Pin_temper1_Read();
1240  0036 cd0000        	call	L131_Pin_temper1_Read
1242                     ; 365 		UsDelay(500);
1245  0039 2039          	jp	LC007
1246  003b               L174:
1247                     ; 368 	else if(1 == u8Channal)
1249  003b 7b02          	ld	a,(OFST+1,sp)
1250  003d 4a            	dec	a
1251  003e 2640          	jrne	L574
1252                     ; 370 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
1254  0040 4be0          	push	#224
1255  0042 4b02          	push	#2
1256  0044 ae500a        	ldw	x,#20490
1257  0047 cd0000        	call	_GPIO_Init
1259  004a 4f            	clr	a
1260  004b 85            	popw	x
1261                     ; 371 		Pin_temper2_Write(0);
1263  004c cd0000        	call	L501_Pin_temper2_Write
1265                     ; 372 		UsDelay(750);
1267  004f ae02ee        	ldw	x,#750
1268  0052 cd0000        	call	_UsDelay
1270                     ; 374 		Pin_temper2_Write(1);
1272  0055 a601          	ld	a,#1
1273  0057 cd0000        	call	L501_Pin_temper2_Write
1275                     ; 375 		UsDelay(70);
1277  005a ae0046        	ldw	x,#70
1278  005d cd0000        	call	_UsDelay
1280                     ; 377 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
1282  0060 4b40          	push	#64
1283  0062 4b02          	push	#2
1284  0064 ae500a        	ldw	x,#20490
1285  0067 cd0000        	call	_GPIO_Init
1287  006a 85            	popw	x
1288                     ; 378 		UsDelay(1);
1290  006b ae0001        	ldw	x,#1
1291  006e cd0000        	call	_UsDelay
1293                     ; 379 		u8Result = Pin_temper2_Read();
1295  0071 cd0000        	call	L741_Pin_temper2_Read
1297                     ; 380 		UsDelay(500);
1299  0074               LC007:
1300  0074 6b01          	ld	(OFST+0,sp),a
1302  0076 ae01f4        	ldw	x,#500
1303  0079 cd0000        	call	_UsDelay
1306  007c 7b01          	ld	a,(OFST+0,sp)
1307  007e 2002          	jra	L374
1308  0080               L574:
1309                     ; 385 		u8Result = 0xff;
1311  0080 a6ff          	ld	a,#255
1312  0082               L374:
1313                     ; 388 	return u8Result;
1317  0082 85            	popw	x
1318  0083 81            	ret	
1355                     ; 406 static sint32 Ds18B20StartAllConvert(void)
1355                     ; 407 {
1356                     .text:	section	.text,new
1357  0000               L105_Ds18B20StartAllConvert:
1359  0000 88            	push	a
1360       00000001      OFST:	set	1
1363                     ; 410 	for(i = 0; i < TEMPRATURE_MAX_NUM; i ++)
1365  0001 4f            	clr	a
1366  0002 6b01          	ld	(OFST+0,sp),a
1367  0004               L125:
1368                     ; 412 		OneWireReset(i);
1370  0004 cd0000        	call	L544_OneWireReset
1372                     ; 413 		OneWireByteWrite(i, 0xcc);
1374  0007 ae00cc        	ldw	x,#204
1375  000a 7b01          	ld	a,(OFST+0,sp)
1376  000c 95            	ld	xh,a
1377  000d cd0000        	call	L572_OneWireByteWrite
1379                     ; 414     	OneWireByteWrite(i ,0x44);
1381  0010 ae0044        	ldw	x,#68
1382  0013 7b01          	ld	a,(OFST+0,sp)
1383  0015 95            	ld	xh,a
1384  0016 cd0000        	call	L572_OneWireByteWrite
1386                     ; 410 	for(i = 0; i < TEMPRATURE_MAX_NUM; i ++)
1388  0019 0c01          	inc	(OFST+0,sp)
1391  001b 7b01          	ld	a,(OFST+0,sp)
1392  001d a102          	cp	a,#2
1393  001f 25e3          	jrult	L125
1394                     ; 417 	return 0;
1396  0021 5f            	clrw	x
1397  0022 bf02          	ldw	c_lreg+2,x
1398  0024 bf00          	ldw	c_lreg,x
1401  0026 84            	pop	a
1402  0027 81            	ret	
1405                     .const:	section	.text
1406  0000               L135_pu8Value:
1407  0000 00            	dc.b	0
1408  0001 000000000000  	ds.b	9
1523                     ; 436 static sint16 Ds18B20Read(uint8 u8Channal, tTemperReadDef *ptTemperRead)
1523                     ; 437 {
1524                     .text:	section	.text,new
1525  0000               L725_Ds18B20Read:
1527  0000 88            	push	a
1528  0001 520e          	subw	sp,#14
1529       0000000e      OFST:	set	14
1532                     ; 438     uint8 pu8Value[10] = {0};
1534  0003 96            	ldw	x,sp
1535  0004 1c0002        	addw	x,#OFST-12
1536  0007 90ae0000      	ldw	y,#L135_pu8Value
1537  000b a60a          	ld	a,#10
1538  000d cd0000        	call	c_xymvx
1540                     ; 441 	sint16 s16Tmp = 0;
1542  0010 5f            	clrw	x
1543  0011 1f0c          	ldw	(OFST-2,sp),x
1544                     ; 445 	OneWireReset(u8Channal);
1546  0013 7b0f          	ld	a,(OFST+1,sp)
1547  0015 cd0000        	call	L544_OneWireReset
1549                     ; 446 	OneWireByteWrite(u8Channal, 0xcc);
1551  0018 ae00cc        	ldw	x,#204
1552  001b 7b0f          	ld	a,(OFST+1,sp)
1553  001d 95            	ld	xh,a
1554  001e cd0000        	call	L572_OneWireByteWrite
1556                     ; 447     OneWireByteWrite(u8Channal ,0xbe);
1558  0021 ae00be        	ldw	x,#190
1559  0024 7b0f          	ld	a,(OFST+1,sp)
1560  0026 95            	ld	xh,a
1561  0027 cd0000        	call	L572_OneWireByteWrite
1563                     ; 449 	for(i = 0; i < 9; i ++)
1565  002a 0f0e          	clr	(OFST+0,sp)
1566  002c               L316:
1567                     ; 451 		pu8Value[i] = OneWireByteRead(u8Channal);
1569  002c 96            	ldw	x,sp
1570  002d 1c0002        	addw	x,#OFST-12
1571  0030 9f            	ld	a,xl
1572  0031 5e            	swapw	x
1573  0032 1b0e          	add	a,(OFST+0,sp)
1574  0034 2401          	jrnc	L662
1575  0036 5c            	incw	x
1576  0037               L662:
1577  0037 02            	rlwa	x,a
1578  0038 89            	pushw	x
1579  0039 7b11          	ld	a,(OFST+3,sp)
1580  003b cd0000        	call	L363_OneWireByteRead
1582  003e 85            	popw	x
1583  003f f7            	ld	(x),a
1584                     ; 449 	for(i = 0; i < 9; i ++)
1586  0040 0c0e          	inc	(OFST+0,sp)
1589  0042 7b0e          	ld	a,(OFST+0,sp)
1590  0044 a109          	cp	a,#9
1591  0046 25e4          	jrult	L316
1592                     ; 453 	if (pu8Value[5] != 0xFF)
1594  0048 7b07          	ld	a,(OFST-7,sp)
1595  004a 4c            	inc	a
1596                     ; 455 		return -1;
1598  004b 2672          	jrne	LC009
1599                     ; 458 	if(!TempCRCResult(pu8Value))
1601  004d 96            	ldw	x,sp
1602  004e 1c0002        	addw	x,#OFST-12
1603  0051 cd0000        	call	L112_TempCRCResult
1605  0054 4d            	tnz	a
1606  0055 2664          	jrne	L146
1607                     ; 460 		u8LSB = pu8Value[0];
1609  0057 7b02          	ld	a,(OFST-12,sp)
1610  0059 6b0e          	ld	(OFST+0,sp),a
1611                     ; 461 		u8MSB = pu8Value[1];
1613  005b 7b03          	ld	a,(OFST-11,sp)
1614  005d 6b01          	ld	(OFST-13,sp),a
1615                     ; 464         u8LSB >>= 3;
1617  005f 040e          	srl	(OFST+0,sp)
1618  0061 040e          	srl	(OFST+0,sp)
1619  0063 040e          	srl	(OFST+0,sp)
1620                     ; 465         u8LSB &= 0x1F;
1622  0065 7b0e          	ld	a,(OFST+0,sp)
1623  0067 a41f          	and	a,#31
1624  0069 6b0e          	ld	(OFST+0,sp),a
1625                     ; 467         u8LSB = u8LSB | ((u8MSB & 0x07) << 5);
1627  006b 7b01          	ld	a,(OFST-13,sp)
1628  006d a407          	and	a,#7
1629  006f 97            	ld	xl,a
1630  0070 a620          	ld	a,#32
1631  0072 42            	mul	x,a
1632  0073 9f            	ld	a,xl
1633  0074 1a0e          	or	a,(OFST+0,sp)
1634  0076 6b0e          	ld	(OFST+0,sp),a
1635                     ; 469         u8MSB >>= 3;
1637  0078 0401          	srl	(OFST-13,sp)
1638  007a 0401          	srl	(OFST-13,sp)
1639  007c 0401          	srl	(OFST-13,sp)
1640                     ; 470         u8MSB &= 0x1F;
1642  007e 7b01          	ld	a,(OFST-13,sp)
1643  0080 a41f          	and	a,#31
1644  0082 6b01          	ld	(OFST-13,sp),a
1645                     ; 472 		if(u8MSB == 0)
1647  0084 2611          	jrne	L526
1648                     ; 474 			s16Tmp = u8LSB >> 1;
1650  0086 7b0e          	ld	a,(OFST+0,sp)
1651  0088 ad47          	call	LC011
1653  008a 1f0c          	ldw	(OFST-2,sp),x
1654                     ; 476 			if(u8LSB & 0x01) //LSB represent 0.5
1656  008c 7b0e          	ld	a,(OFST+0,sp)
1657  008e a501          	bcp	a,#1
1658  0090 271d          	jreq	L136
1659                     ; 478 				s16Tmp += 5;
1661  0092 1c0005        	addw	x,#5
1662  0095 2016          	jp	LC008
1663  0097               L526:
1664                     ; 481 		else if(u8MSB == 0x1f) //negative value
1666  0097 a11f          	cp	a,#31
1667  0099 2614          	jrne	L136
1668                     ; 483 			u8LSB = (~u8LSB) + 1;
1670  009b 7b0e          	ld	a,(OFST+0,sp)
1671  009d 43            	cpl	a
1672  009e 4c            	inc	a
1673  009f 6b0e          	ld	(OFST+0,sp),a
1674                     ; 484 			s16Tmp = u8LSB >> 1;
1676  00a1 ad2e          	call	LC011
1678                     ; 486 			if(u8LSB & 0x01) //LSB represent 0.5
1680  00a3 7b0e          	ld	a,(OFST+0,sp)
1681  00a5 a501          	bcp	a,#1
1682  00a7 2703          	jreq	L536
1683                     ; 488 				s16Tmp += 5;
1685  00a9 1c0005        	addw	x,#5
1686  00ac               L536:
1687                     ; 490 			s16Tmp *= -1;
1689  00ac 50            	negw	x
1690  00ad               LC008:
1691  00ad 1f0c          	ldw	(OFST-2,sp),x
1692  00af               L136:
1693                     ; 493 		if((s16Tmp >= 1000) || (s16Tmp < -550)) //illegal value
1695  00af 1e0c          	ldw	x,(OFST-2,sp)
1696  00b1 a303e8        	cpw	x,#1000
1697  00b4 2e05          	jrsge	L146
1699  00b6 a3fdda        	cpw	x,#64986
1700  00b9 2e0a          	jrsge	L736
1701  00bb               L146:
1702                     ; 495 			ptTemperRead->u8Status = FALSE;
1705  00bb 1e12          	ldw	x,(OFST+4,sp)
1706  00bd 6f02          	clr	(2,x)
1707                     ; 496 			return -1;
1709  00bf               LC009:
1712  00bf aeffff        	ldw	x,#65535
1714  00c2               L472:
1716  00c2 5b0f          	addw	sp,#15
1717  00c4 81            	ret	
1718  00c5               L736:
1719                     ; 500 			ptTemperRead->s16Temp = s16Tmp;
1721  00c5 1e12          	ldw	x,(OFST+4,sp)
1722  00c7 160c          	ldw	y,(OFST-2,sp)
1723  00c9 ff            	ldw	(x),y
1724                     ; 501 			ptTemperRead->u8Status = TRUE;
1726  00ca a601          	ld	a,#1
1727  00cc e702          	ld	(2,x),a
1728                     ; 510 	return 0;
1730  00ce 5f            	clrw	x
1732  00cf 20f1          	jra	L472
1733                     ; 506 		ptTemperRead->u8Status = FALSE;
1734                     ; 507 		return -1;
1737  00d1               LC011:
1738  00d1 44            	srl	a
1739  00d2 5f            	clrw	x
1740  00d3 97            	ld	xl,a
1741                     ; 485 			s16Tmp *= 10;
1743  00d4 90ae000a      	ldw	y,#10
1744  00d8 cc0000        	jp	c_imul
1823                     ; 515 static sint16 TemperFilter(sint16 *ps16TempBuf, sint16 s16Temp, sint16 s16TempCurrent, uint8 u8Sta)
1823                     ; 516 {
1824                     .text:	section	.text,new
1825  0000               L746_TemperFilter:
1827  0000 89            	pushw	x
1828  0001 5203          	subw	sp,#3
1829       00000003      OFST:	set	3
1832                     ; 520 	if(NULL == ps16TempBuf)
1834  0003 5d            	tnzw	x
1835                     ; 522 		return TEMP_ERROR_VALUE;
1837  0004 2707          	jreq	LC012
1838                     ; 526 	if(TEMP_ERROR_VALUE == s16Temp)
1840  0006 1e08          	ldw	x,(OFST+5,sp)
1841  0008 a3f556        	cpw	x,#62806
1842  000b 2606          	jrne	L517
1843                     ; 528 		return TEMP_ERROR_VALUE;
1845  000d               LC012:
1847  000d aef556        	ldw	x,#62806
1849  0010               L003:
1851  0010 5b05          	addw	sp,#5
1852  0012 81            	ret	
1853  0013               L517:
1854                     ; 531 	for(i = 1; i < TEMPERATURE_FILTER_NUM; i ++)
1856  0013 a601          	ld	a,#1
1857  0015 6b03          	ld	(OFST+0,sp),a
1858  0017               L717:
1859                     ; 533 		if(DS1820_STATUS_OK != u8Sta)
1861  0017 7b0c          	ld	a,(OFST+9,sp)
1862  0019 4a            	dec	a
1863  001a 2710          	jreq	L527
1864                     ; 535 			ps16TempBuf[i - 1] = s16Temp;
1866  001c 7b03          	ld	a,(OFST+0,sp)
1867  001e 5f            	clrw	x
1868  001f 97            	ld	xl,a
1869  0020 58            	sllw	x
1870  0021 1d0002        	subw	x,#2
1871  0024 72fb04        	addw	x,(OFST+1,sp)
1872  0027 1608          	ldw	y,(OFST+5,sp)
1873  0029 ff            	ldw	(x),y
1875  002a 2010          	jra	L727
1876  002c               L527:
1877                     ; 539 			ps16TempBuf[i - 1] = ps16TempBuf[i];
1879  002c 7b03          	ld	a,(OFST+0,sp)
1880  002e 5f            	clrw	x
1881  002f 97            	ld	xl,a
1882  0030 58            	sllw	x
1883  0031 72fb04        	addw	x,(OFST+1,sp)
1884  0034 ad6e          	call	LC013
1885  0036 72f904        	addw	y,(OFST+1,sp)
1886  0039 fe            	ldw	x,(x)
1887  003a 90ff          	ldw	(y),x
1888  003c               L727:
1889                     ; 531 	for(i = 1; i < TEMPERATURE_FILTER_NUM; i ++)
1891  003c 0c03          	inc	(OFST+0,sp)
1894  003e 7b03          	ld	a,(OFST+0,sp)
1895  0040 a105          	cp	a,#5
1896  0042 25d3          	jrult	L717
1897                     ; 543 	ps16TempBuf[TEMPERATURE_FILTER_NUM - 1] = s16Temp;
1899  0044 1e04          	ldw	x,(OFST+1,sp)
1900  0046 1608          	ldw	y,(OFST+5,sp)
1901  0048 ef08          	ldw	(8,x),y
1902                     ; 545 	for(i = 1; i < TEMPERATURE_FILTER_NUM; i ++)
1904  004a a601          	ld	a,#1
1905  004c 6b03          	ld	(OFST+0,sp),a
1906  004e               L137:
1907                     ; 548 		if((TEMP_ERROR_VALUE == ps16TempBuf[i]) || (TEMP_ERROR_VALUE == ps16TempBuf[i - 1]))
1909  004e 5f            	clrw	x
1910  004f 97            	ld	xl,a
1911  0050 58            	sllw	x
1912  0051 72fb04        	addw	x,(OFST+1,sp)
1913  0054 9093          	ldw	y,x
1914  0056 90fe          	ldw	y,(y)
1915  0058 90a3f556      	cpw	y,#62806
1916  005c 2739          	jreq	L337
1918  005e 5f            	clrw	x
1919  005f 97            	ld	xl,a
1920  0060 58            	sllw	x
1921  0061 1d0002        	subw	x,#2
1922  0064 72fb04        	addw	x,(OFST+1,sp)
1923  0067 9093          	ldw	y,x
1924  0069 90fe          	ldw	y,(y)
1925  006b 90a3f556      	cpw	y,#62806
1926  006f 2726          	jreq	L337
1927                     ; 554 			s16Variation = ps16TempBuf[i] - ps16TempBuf[i - 1];
1929  0071 5f            	clrw	x
1930  0072 97            	ld	xl,a
1931  0073 58            	sllw	x
1932  0074 72fb04        	addw	x,(OFST+1,sp)
1933  0077 fe            	ldw	x,(x)
1934  0078 ad2a          	call	LC013
1935  007a 72f904        	addw	y,(OFST+1,sp)
1936  007d 90fe          	ldw	y,(y)
1937  007f 90bf00        	ldw	c_x,y
1938  0082 72b00000      	subw	x,c_x
1939  0086 1f01          	ldw	(OFST-2,sp),x
1940                     ; 557 			if(((0 - TEMPER_FILTER_MAX_VARIATION) > s16Variation) || 
1940                     ; 558 			   (TEMPER_FILTER_MAX_VARIATION < s16Variation))
1942  0088 a3ffc4        	cpw	x,#65476
1943  008b 2f05          	jrslt	L747
1945  008d a3003d        	cpw	x,#61
1946  0090 2f05          	jrslt	L337
1947  0092               L747:
1948                     ; 560 				return s16TempCurrent;
1950  0092 1e0a          	ldw	x,(OFST+7,sp)
1952  0094 cc0010        	jra	L003
1953  0097               L337:
1954                     ; 545 	for(i = 1; i < TEMPERATURE_FILTER_NUM; i ++)
1956  0097 0c03          	inc	(OFST+0,sp)
1959  0099 7b03          	ld	a,(OFST+0,sp)
1960  009b a105          	cp	a,#5
1961  009d 25af          	jrult	L137
1962                     ; 565 	return s16Temp;
1964  009f 1e08          	ldw	x,(OFST+5,sp)
1966  00a1 cc0010        	jra	L003
1968  00a4               LC013:
1969  00a4 905f          	clrw	y
1970  00a6 9097          	ld	yl,a
1971  00a8 9058          	sllw	y
1972  00aa 72a20002      	subw	y,#2
1973  00ae 81            	ret	
2025                     ; 573 uint8 temper_85_err_check(sint16 s16temp, sint16 s16temp_last)
2025                     ; 574 {
2026                     .text:	section	.text,new
2027  0000               _temper_85_err_check:
2029  0000 89            	pushw	x
2030  0001 89            	pushw	x
2031       00000002      OFST:	set	2
2034                     ; 577 	s16data = s16temp - s16temp_last;
2036  0002 72f007        	subw	x,(OFST+5,sp)
2037  0005 1f01          	ldw	(OFST-1,sp),x
2038                     ; 579 	if((TEMPER_ERROR_85 == s16temp) && 
2038                     ; 580 	   ((TEMPER_ERROR_85_FLP < s16data) || (TEMPER_ERROR_85_FLN > s16data)))
2040  0007 1e03          	ldw	x,(OFST+1,sp)
2041  0009 a30352        	cpw	x,#850
2042  000c 260f          	jrne	L777
2044  000e 1e01          	ldw	x,(OFST-1,sp)
2045  0010 a300c9        	cpw	x,#201
2046  0013 2e05          	jrsge	L1001
2048  0015 a3ff38        	cpw	x,#65336
2049  0018 2e03          	jrsge	L777
2050  001a               L1001:
2051                     ; 582 		return 0;
2053  001a 4f            	clr	a
2055  001b 2002          	jra	L403
2056  001d               L777:
2057                     ; 586 		return 1;
2059  001d a601          	ld	a,#1
2061  001f               L403:
2063  001f 5b04          	addw	sp,#4
2064  0021 81            	ret	
2124                     ; 605 static sint32 Ds18B20ReadAll(void)
2124                     ; 606 {
2125                     .text:	section	.text,new
2126  0000               L5001_Ds18B20ReadAll:
2128  0000 5209          	subw	sp,#9
2129       00000009      OFST:	set	9
2132                     ; 612 	for(i = 0; i < TEMPRATURE_MAX_NUM; i ++)
2134  0002 0f09          	clr	(OFST+0,sp)
2135  0004               L5301:
2136                     ; 614 		tTemperRead.s16Temp = - 2730;
2138  0004 aef556        	ldw	x,#62806
2139  0007 1f06          	ldw	(OFST-3,sp),x
2140                     ; 615 		s32Ret = Ds18B20Read(i, &tTemperRead);
2142  0009 96            	ldw	x,sp
2143  000a 1c0006        	addw	x,#OFST-3
2144  000d 89            	pushw	x
2145  000e 7b0b          	ld	a,(OFST+2,sp)
2146  0010 cd0000        	call	L725_Ds18B20Read
2148  0013 5b02          	addw	sp,#2
2149  0015 cd0000        	call	c_itolx
2151  0018 96            	ldw	x,sp
2152  0019 1c0002        	addw	x,#OFST-7
2153  001c cd0000        	call	c_rtol
2155                     ; 619 		sprintf((char *)DebugBuf, "temperature%u:%d\r\n", (uint16)i, tTemperRead.s16Temp);
2157  001f 1e06          	ldw	x,(OFST-3,sp)
2158  0021 89            	pushw	x
2159  0022 7b0b          	ld	a,(OFST+2,sp)
2160  0024 5f            	clrw	x
2161  0025 97            	ld	xl,a
2162  0026 89            	pushw	x
2163  0027 ae000a        	ldw	x,#L3401
2164  002a 89            	pushw	x
2165  002b ae0000        	ldw	x,#_DebugBuf
2166  002e cd0000        	call	_sprintf
2168  0031 5b06          	addw	sp,#6
2169                     ; 620 		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);
2171  0033 ae0000        	ldw	x,#_DebugBuf
2172  0036 89            	pushw	x
2173  0037 a603          	ld	a,#3
2174  0039 cd0000        	call	_DebugStrOutput
2176  003c 85            	popw	x
2177                     ; 623 		if((0 == s32Ret)&& 
2177                     ; 624 		   (temper_85_err_check(tTemperRead.s16Temp, tTempSampleCtrl.tTemperData[i].s16Temp)))
2179  003d 96            	ldw	x,sp
2180  003e 1c0002        	addw	x,#OFST-7
2181  0041 cd0000        	call	c_lzmp
2183  0044 265d          	jrne	L5401
2185  0046 7b09          	ld	a,(OFST+0,sp)
2186  0048 cd00fc        	call	LC014
2187  004b ee00          	ldw	x,(_tTempSampleCtrl,x)
2188  004d 89            	pushw	x
2189  004e 1e08          	ldw	x,(OFST-1,sp)
2190  0050 cd0000        	call	_temper_85_err_check
2192  0053 4d            	tnz	a
2193  0054 85            	popw	x
2194  0055 274c          	jreq	L5401
2195                     ; 627 			tTemperRead.s16Temp = TemperFilter(tTempSampleCtrl.tTemperData[i].s16TempBuf, tTemperRead.s16Temp, 
2195                     ; 628 											   tTempSampleCtrl.tTemperData[i].s16Temp, 
2195                     ; 629 											   tTempSampleCtrl.u8Ds18b20Status[i]);
2197  0057 7b09          	ld	a,(OFST+0,sp)
2198  0059 5f            	clrw	x
2199  005a 97            	ld	xl,a
2200  005b e618          	ld	a,(_tTempSampleCtrl+24,x)
2201  005d 88            	push	a
2202  005e 7b0a          	ld	a,(OFST+1,sp)
2203  0060 cd00fc        	call	LC014
2204  0063 ee00          	ldw	x,(_tTempSampleCtrl,x)
2205  0065 89            	pushw	x
2206  0066 1e09          	ldw	x,(OFST+0,sp)
2207  0068 89            	pushw	x
2208  0069 a602          	ld	a,#_tTempSampleCtrl+2
2209  006b 6b06          	ld	(OFST-3,sp),a
2210  006d 7b0e          	ld	a,(OFST+5,sp)
2211  006f cd00fc        	call	LC014
2212  0072 01            	rrwa	x,a
2213  0073 1b06          	add	a,(OFST-3,sp)
2214  0075 5f            	clrw	x
2215  0076 97            	ld	xl,a
2216  0077 cd0000        	call	L746_TemperFilter
2218  007a 5b05          	addw	sp,#5
2219  007c 1f06          	ldw	(OFST-3,sp),x
2220                     ; 631 			tTempSampleCtrl.tTemperData[i].s16Temp = tTemperRead.s16Temp;
2222  007e 7b09          	ld	a,(OFST+0,sp)
2223  0080 ad7a          	call	LC014
2224  0082 1606          	ldw	y,(OFST-3,sp)
2225  0084 ef00          	ldw	(_tTempSampleCtrl,x),y
2226                     ; 633 			tTempSampleCtrl.u8Ds18b20Status[i] = DS1820_STATUS_OK;
2228  0086 7b09          	ld	a,(OFST+0,sp)
2229  0088 5f            	clrw	x
2230  0089 97            	ld	xl,a
2231  008a a601          	ld	a,#1
2232  008c e718          	ld	(_tTempSampleCtrl+24,x),a
2233                     ; 634 			tTempSampleCtrl.u8FailCnt[i] = 0;
2235  008e 7b09          	ld	a,(OFST+0,sp)
2236  0090 5f            	clrw	x
2237  0091 97            	ld	xl,a
2238  0092 6f35          	clr	(_tTempSampleCtrl+53,x)
2239                     ; 637 			if(0 == i)
2241  0094 7b09          	ld	a,(OFST+0,sp)
2242  0096 2604          	jrne	L7401
2243                     ; 639 				tTempSampleCtrl.u32ErrorCode &= 0xffffff00;
2245  0098 b73a          	ld	_tTempSampleCtrl+58,a
2247  009a 204d          	jra	L5501
2248  009c               L7401:
2249                     ; 641 			else if(1 == i)
2251  009c 4a            	dec	a
2252  009d 264a          	jrne	L5501
2253                     ; 643 				tTempSampleCtrl.u32ErrorCode &= 0xffff00ff;
2255  009f b739          	ld	_tTempSampleCtrl+57,a
2256  00a1 2046          	jra	L5501
2257  00a3               L5401:
2258                     ; 646 		else if(0 != s32Ret)
2260  00a3 96            	ldw	x,sp
2261  00a4 1c0002        	addw	x,#OFST-7
2262  00a7 cd0000        	call	c_lzmp
2264  00aa 273d          	jreq	L5501
2265                     ; 648 			tTempSampleCtrl.u8FailCnt[i] ++;
2267  00ac 7b09          	ld	a,(OFST+0,sp)
2268  00ae 5f            	clrw	x
2269  00af 97            	ld	xl,a
2270  00b0 6c35          	inc	(_tTempSampleCtrl+53,x)
2271                     ; 649 			if(TEMPER_FAIL_MAXTIMES < tTempSampleCtrl.u8FailCnt[i])
2273  00b2 5f            	clrw	x
2274  00b3 97            	ld	xl,a
2275  00b4 e635          	ld	a,(_tTempSampleCtrl+53,x)
2276  00b6 a115          	cp	a,#21
2277  00b8 252f          	jrult	L5501
2278                     ; 651 				tTempSampleCtrl.tTemperData[i].s16Temp= TEMP_ERROR_VALUE;
2280  00ba 7b09          	ld	a,(OFST+0,sp)
2281  00bc ad3e          	call	LC014
2282  00be 90aef556      	ldw	y,#62806
2283  00c2 ef00          	ldw	(_tTempSampleCtrl,x),y
2284                     ; 653 				tTempSampleCtrl.u8Ds18b20Status[i] = DS1820_STATUS_ERROR;
2286  00c4 7b09          	ld	a,(OFST+0,sp)
2287  00c6 5f            	clrw	x
2288  00c7 97            	ld	xl,a
2289  00c8 a602          	ld	a,#2
2290  00ca e718          	ld	(_tTempSampleCtrl+24,x),a
2291                     ; 655 				tTempSampleCtrl.u8FailCnt[i] = TEMPER_FAIL_MAXTIMES;
2293  00cc 7b09          	ld	a,(OFST+0,sp)
2294  00ce 5f            	clrw	x
2295  00cf 97            	ld	xl,a
2296  00d0 a614          	ld	a,#20
2297  00d2 e735          	ld	(_tTempSampleCtrl+53,x),a
2298                     ; 658 				if(0 == i)
2300  00d4 7b09          	ld	a,(OFST+0,sp)
2301  00d6 2608          	jrne	L3601
2302                     ; 660 					tTempSampleCtrl.u32ErrorCode &= 0xffffff00;
2304  00d8 b73a          	ld	_tTempSampleCtrl+58,a
2305                     ; 661 					tTempSampleCtrl.u32ErrorCode |= 0x00000001;
2307  00da 7210003a      	bset	_tTempSampleCtrl+58,#0
2309  00de 2009          	jra	L5501
2310  00e0               L3601:
2311                     ; 663 				else if(1 == i)
2313  00e0 4a            	dec	a
2314  00e1 2606          	jrne	L5501
2315                     ; 665 					tTempSampleCtrl.u32ErrorCode &= 0xffff00ff;
2317  00e3 b739          	ld	_tTempSampleCtrl+57,a
2318                     ; 666 					tTempSampleCtrl.u32ErrorCode |= 0x00000100;
2320  00e5 72100039      	bset	_tTempSampleCtrl+57,#0
2321  00e9               L5501:
2322                     ; 612 	for(i = 0; i < TEMPRATURE_MAX_NUM; i ++)
2324  00e9 0c09          	inc	(OFST+0,sp)
2327  00eb 7b09          	ld	a,(OFST+0,sp)
2328  00ed a102          	cp	a,#2
2329  00ef 2403cc0004    	jrult	L5301
2330                     ; 675 	return 0;
2332  00f4 5f            	clrw	x
2333  00f5 bf02          	ldw	c_lreg+2,x
2334  00f7 bf00          	ldw	c_lreg,x
2337  00f9 5b09          	addw	sp,#9
2338  00fb 81            	ret	
2340  00fc               LC014:
2341  00fc 97            	ld	xl,a
2342  00fd a60c          	ld	a,#12
2343  00ff 42            	mul	x,a
2344  0100 81            	ret	
2373                     ; 680 sint8 TemperTask(void)
2373                     ; 681 {	
2374                     .text:	section	.text,new
2375  0000               _TemperTask:
2379                     ; 682 	if(DS18B20_STATUS_CONVERTING == tTempSampleCtrl.u8TempSampleStatus)
2381  0000 b61a          	ld	a,_tTempSampleCtrl+26
2382  0002 4a            	dec	a
2383  0003 262e          	jrne	L1011
2384                     ; 684 		if(IsMsTimeout(&tTempSampleCtrl.tDSConvertTimeout))
2386  0005 ae0028        	ldw	x,#_tTempSampleCtrl+40
2387  0008 cd0000        	call	_IsMsTimeout
2389  000b cd0000        	call	c_lrzmp
2391  000e 276e          	jreq	L3111
2392                     ; 686 			Ds18B20ReadAll();
2394  0010 cd0000        	call	L5001_Ds18B20ReadAll
2396                     ; 689 			TemperPowerCtrl(0);
2398  0013 4f            	clr	a
2399  0014 cd0000        	call	L561_TemperPowerCtrl
2401                     ; 692 			if(((DS1820_STATUS_OK == tTempSampleCtrl.u8Ds18b20Status[0]) ||
2401                     ; 693 			    (DS1820_STATUS_ERROR == tTempSampleCtrl.u8Ds18b20Status[0])) &&
2401                     ; 694 			   ((DS1820_STATUS_OK == tTempSampleCtrl.u8Ds18b20Status[1]) ||
2401                     ; 695 			    (DS1820_STATUS_ERROR == tTempSampleCtrl.u8Ds18b20Status[1])))
2403  0017 b618          	ld	a,_tTempSampleCtrl+24
2404  0019 a101          	cp	a,#1
2405  001b 2704          	jreq	L7011
2407  001d a102          	cp	a,#2
2408  001f 260e          	jrne	L5011
2409  0021               L7011:
2411  0021 b619          	ld	a,_tTempSampleCtrl+25
2412  0023 a101          	cp	a,#1
2413  0025 2704          	jreq	L1111
2415  0027 a102          	cp	a,#2
2416  0029 2604          	jrne	L5011
2417  002b               L1111:
2418                     ; 697 				tTempSampleCtrl.u8TempOk = 1;
2420  002b 3501003b      	mov	_tTempSampleCtrl+59,#1
2421  002f               L5011:
2422                     ; 700 			tTempSampleCtrl.u8TempSampleStatus = DS18B20_STATUS_IDLE;
2424  002f 3f1a          	clr	_tTempSampleCtrl+26
2425  0031 204b          	jra	L3111
2426  0033               L1011:
2427                     ; 704 	else if(DS18B20_STATUS_IDLE == tTempSampleCtrl.u8TempSampleStatus)
2429  0033 b61a          	ld	a,_tTempSampleCtrl+26
2430  0035 2641          	jrne	L5111
2431                     ; 706 		if(IsMsTimeout(&tTempSampleCtrl.tTempSampleTimeout) || 
2431                     ; 707 		   (tTempSampleCtrl.u8SampleFlag))
2433  0037 ae001b        	ldw	x,#_tTempSampleCtrl+27
2434  003a cd0000        	call	_IsMsTimeout
2436  003d cd0000        	call	c_lrzmp
2438  0040 2604          	jrne	L1211
2440  0042 b63c          	ld	a,_tTempSampleCtrl+60
2441  0044 2738          	jreq	L3111
2442  0046               L1211:
2443                     ; 709 			InitMsTimeout(&tTempSampleCtrl.tTempSampleTimeout, TEMPER_SAMPLE_INTERVAL);
2445  0046 ae0bb8        	ldw	x,#3000
2446  0049 89            	pushw	x
2447  004a 5f            	clrw	x
2448  004b 89            	pushw	x
2449  004c ae001b        	ldw	x,#_tTempSampleCtrl+27
2450  004f cd0000        	call	_InitMsTimeout
2452  0052 5b04          	addw	sp,#4
2453                     ; 710 			tTempSampleCtrl.u8SampleFlag = 0;
2455  0054 3f3c          	clr	_tTempSampleCtrl+60
2456                     ; 713 			TemperPowerCtrl(1);
2458  0056 a601          	ld	a,#1
2459  0058 cd0000        	call	L561_TemperPowerCtrl
2461                     ; 714 			MsDelay(5);
2463  005b ae0005        	ldw	x,#5
2464  005e cd0000        	call	_MsDelay
2466                     ; 715 			Ds18B20StartAllConvert();
2468  0061 cd0000        	call	L105_Ds18B20StartAllConvert
2470                     ; 717 			InitMsTimeout(&tTempSampleCtrl.tDSConvertTimeout, TEMPER_CONVERT_TIME);		
2472  0064 ae03e8        	ldw	x,#1000
2473  0067 89            	pushw	x
2474  0068 5f            	clrw	x
2475  0069 89            	pushw	x
2476  006a ae0028        	ldw	x,#_tTempSampleCtrl+40
2477  006d cd0000        	call	_InitMsTimeout
2479  0070 5b04          	addw	sp,#4
2480                     ; 718 			tTempSampleCtrl.u8TempSampleStatus = DS18B20_STATUS_CONVERTING;
2482  0072 3501001a      	mov	_tTempSampleCtrl+26,#1
2483  0076 2006          	jra	L3111
2484  0078               L5111:
2485                     ; 723 		tTempSampleCtrl.u8TempSampleStatus = DS18B20_STATUS_IDLE;
2487  0078 3f1a          	clr	_tTempSampleCtrl+26
2488                     ; 724 		tTempSampleCtrl.u8SampleFlag = 1;
2490  007a 3501003c      	mov	_tTempSampleCtrl+60,#1
2491  007e               L3111:
2492                     ; 727 	return 0;
2494  007e 4f            	clr	a
2497  007f 81            	ret	
2690                     ; 731 tTempSampleCtrlDef *GetTemperInfo(void)
2690                     ; 732 {
2691                     .text:	section	.text,new
2692  0000               _GetTemperInfo:
2696                     ; 733 	return &tTempSampleCtrl;
2698  0000 ae0000        	ldw	x,#_tTempSampleCtrl
2701  0003 81            	ret	
2728                     ; 737 sint8 TemperTaskInit(void)
2728                     ; 738 {
2729                     .text:	section	.text,new
2730  0000               _TemperTaskInit:
2734                     ; 739 	GPIO_Init(TEMPER_GPIO_PORT, TEMPER_POWER_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
2736  0000 4be0          	push	#224
2737  0002 4b10          	push	#16
2738  0004 ae500a        	ldw	x,#20490
2739  0007 cd0000        	call	_GPIO_Init
2741  000a 85            	popw	x
2742                     ; 740 	GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_High_Fast);
2744  000b 4bf0          	push	#240
2745  000d 4b01          	push	#1
2746  000f ae500a        	ldw	x,#20490
2747  0012 cd0000        	call	_GPIO_Init
2749  0015 85            	popw	x
2750                     ; 741 	GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_High_Fast);
2752  0016 4bf0          	push	#240
2753  0018 4b02          	push	#2
2754  001a ae500a        	ldw	x,#20490
2755  001d cd0000        	call	_GPIO_Init
2757  0020 85            	popw	x
2758                     ; 743 	memset(&tTempSampleCtrl, 0, sizeof(tTempSampleCtrlDef));
2760  0021 ae003d        	ldw	x,#61
2761  0024               L263:
2762  0024 6fff          	clr	(_tTempSampleCtrl-1,x)
2763  0026 5a            	decw	x
2764  0027 26fb          	jrne	L263
2765                     ; 745 	InitMsTimeout(&tTempSampleCtrl.tTempSampleTimeout, TEMPER_SAMPLE_INTERVAL_INIT);
2767  0029 ae0bb8        	ldw	x,#3000
2768  002c 89            	pushw	x
2769  002d 5f            	clrw	x
2770  002e 89            	pushw	x
2771  002f ae001b        	ldw	x,#_tTempSampleCtrl+27
2772  0032 cd0000        	call	_InitMsTimeout
2774  0035 5b04          	addw	sp,#4
2775                     ; 746 	tTempSampleCtrl.u8SampleFlag = 0;
2777  0037 3f3c          	clr	_tTempSampleCtrl+60
2778                     ; 748 	return 0;
2780  0039 4f            	clr	a
2783  003a 81            	ret	
2808                     	xdef	_temper_85_err_check
2809                     	switch	.ubsct
2810  0000               _tTempSampleCtrl:
2811  0000 000000000000  	ds.b	61
2812                     	xdef	_tTempSampleCtrl
2813                     	xdef	_TemperTaskInit
2814                     	xdef	_GetTemperInfo
2815                     	xdef	_TemperTask
2816                     	xref	_DebugStrOutput
2817                     	xref.b	_DebugBuf
2818                     	xref	_IsMsTimeout
2819                     	xref	_InitMsTimeout
2820                     	xref	_UsDelay
2821                     	xref	_MsDelay
2822                     	xref	_GPIO_ReadInputDataBit
2823                     	xref	_GPIO_WriteBit
2824                     	xref	_GPIO_Init
2825                     	xref	_sprintf
2826                     	xref	_memset
2827                     	switch	.const
2828  000a               L3401:
2829  000a 74656d706572  	dc.b	"temperature%u:%d",13
2830  001b 0a00          	dc.b	10,0
2831                     	xref.b	c_lreg
2832                     	xref.b	c_x
2852                     	xref	c_lrzmp
2853                     	xref	c_lzmp
2854                     	xref	c_rtol
2855                     	xref	c_itolx
2856                     	xref	c_imul
2857                     	xref	c_xymvx
2858                     	end
