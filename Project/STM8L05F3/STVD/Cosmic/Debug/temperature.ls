   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  43                     ; 47 static void Pin_temper1_Dir(uint8 u8Type)
  43                     ; 48 {
  44                     .text:	section	.text,new
  45  0000               L3f_Pin_temper1_Dir:
  49                     ; 49 	if(PIN_DIR_INPUT == u8Type)
  51  0000 4d            	tnz	a
  52  0001 2604          	jrne	L72
  53                     ; 51 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
  55  0003 4b40          	push	#64
  58  0005 2002          	jra	L13
  59  0007               L72:
  60                     ; 55 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
  62  0007 4be0          	push	#224
  64  0009               L13:
  65  0009 4b01          	push	#1
  66  000b ae500a        	ldw	x,#20490
  67  000e 8d000000      	callf	f_GPIO_Init
  68  0012 85            	popw	x
  69                     ; 57 }
  72  0013 87            	retf	
 104                     ; 60 static void Pin_temper2_Dir(uint8 u8Type)
 104                     ; 61 {
 105                     .text:	section	.text,new
 106  0000               L33f_Pin_temper2_Dir:
 110                     ; 62 	if(PIN_DIR_INPUT == u8Type)
 112  0000 4d            	tnz	a
 113  0001 2604          	jrne	L15
 114                     ; 64 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
 116  0003 4b40          	push	#64
 119  0005 2002          	jra	L35
 120  0007               L15:
 121                     ; 68 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
 123  0007 4be0          	push	#224
 125  0009               L35:
 126  0009 4b02          	push	#2
 127  000b ae500a        	ldw	x,#20490
 128  000e 8d000000      	callf	f_GPIO_Init
 129  0012 85            	popw	x
 130                     ; 70 }
 133  0013 87            	retf	
 164                     ; 73 static void Pin_temper1_Write(uint8 u8Data)
 164                     ; 74 {
 165                     .text:	section	.text,new
 166  0000               L55f_Pin_temper1_Write:
 170                     ; 75 	if(0 == u8Data)
 172  0000 4d            	tnz	a
 173  0001 2605          	jrne	L37
 174                     ; 78 		TEMPER_GPIO_PORT->ODR |= TEMPER1_GPIO_PIN;
 176  0003 7210500a      	bset	20490,#0
 179  0007 87            	retf	
 180  0008               L37:
 181                     ; 83 		TEMPER_GPIO_PORT->ODR &= (uint8_t)(~TEMPER1_GPIO_PIN);
 183  0008 7211500a      	bres	20490,#0
 184                     ; 85 }
 187  000c 87            	retf	
 218                     ; 88 static void Pin_temper2_Write(uint8 u8Data)
 218                     ; 89 {
 219                     .text:	section	.text,new
 220  0000               L77f_Pin_temper2_Write:
 224                     ; 90 	if(0 == u8Data)
 226  0000 4d            	tnz	a
 227  0001 2605          	jrne	L511
 228                     ; 93 		TEMPER_GPIO_PORT->ODR |= TEMPER2_GPIO_PIN;
 230  0003 7212500a      	bset	20490,#1
 233  0007 87            	retf	
 234  0008               L511:
 235                     ; 98 		TEMPER_GPIO_PORT->ODR &= (uint8_t)(~TEMPER2_GPIO_PIN);
 237  0008 7213500a      	bres	20490,#1
 238                     ; 100 }
 241  000c 87            	retf	
 263                     ; 103 static uint8 Pin_temper1_Read(void)
 263                     ; 104 {
 264                     .text:	section	.text,new
 265  0000               L121f_Pin_temper1_Read:
 269                     ; 106 	if(0 == (TEMPER_GPIO_PORT->IDR & (uint8_t)TEMPER1_GPIO_PIN))
 271  0000 7200500b02    	btjt	20491,#0,L331
 272                     ; 108 		return 0;         //
 274  0005 4f            	clr	a
 277  0006 87            	retf	
 278  0007               L331:
 279                     ; 112 		return 1;         //
 281  0007 a601          	ld	a,#1
 284  0009 87            	retf	
 306                     ; 117 static uint8 Pin_temper2_Read(void)
 306                     ; 118 {
 307                     .text:	section	.text,new
 308  0000               L731f_Pin_temper2_Read:
 312                     ; 120 	if(0 == (TEMPER_GPIO_PORT->IDR & (uint8_t)TEMPER2_GPIO_PIN))
 314  0000 7202500b02    	btjt	20491,#1,L151
 315                     ; 122 		return 0;         //
 317  0005 4f            	clr	a
 320  0006 87            	retf	
 321  0007               L151:
 322                     ; 126 		return 1;         //
 324  0007 a601          	ld	a,#1
 327  0009 87            	retf	
 359                     ; 131 static void TemperPowerCtrl(uint8 u8Type)
 359                     ; 132 {
 360                     .text:	section	.text,new
 361  0000               L551f_TemperPowerCtrl:
 365                     ; 133 	if(0 == u8Type)
 367  0000 4d            	tnz	a
 368  0001 2604          	jrne	L371
 369                     ; 135 		GPIO_WriteBit(TEMPER_GPIO_PORT, TEMPER_POWER_GPIO_PIN, 1);
 371  0003 4b01          	push	#1
 374  0005 2002          	jra	L571
 375  0007               L371:
 376                     ; 139 		GPIO_WriteBit(TEMPER_GPIO_PORT, TEMPER_POWER_GPIO_PIN, 0);
 378  0007 4b00          	push	#0
 380  0009               L571:
 381  0009 4b10          	push	#16
 382  000b ae500a        	ldw	x,#20490
 383  000e 8d000000      	callf	f_GPIO_WriteBit
 384  0012 85            	popw	x
 385                     ; 142 }
 388  0013 87            	retf	
 463                     ; 160 static uint8 TempCRCResult(uint8* pRead)
 463                     ; 161 {
 464                     .text:	section	.text,new
 465  0000               L771f_TempCRCResult:
 467  0000 89            	pushw	x
 468  0001 520e          	subw	sp,#14
 469       0000000e      OFST:	set	14
 472                     ; 164 	uint8 CrcData=0;
 474  0003 0f0e          	clr	(OFST+0,sp)
 475                     ; 165 	uint8 *pbTmp=NULL;
 477                     ; 168 	pbTmp=pRead;
 479  0005 1e0f          	ldw	x,(OFST+1,sp)
 480  0007 1f01          	ldw	(OFST-13,sp),x
 481                     ; 169 	for(i=0;i<9;i++)	/*包括CRC值共9个字节*/
 483  0009 0f0d          	clr	(OFST-1,sp)
 484  000b               L532:
 485                     ; 171 		pabDataBuff[i]=*pbTmp;
 487  000b 96            	ldw	x,sp
 488  000c 1c0004        	addw	x,#OFST-10
 489  000f 9f            	ld	a,xl
 490  0010 5e            	swapw	x
 491  0011 1b0d          	add	a,(OFST-1,sp)
 492  0013 2401          	jrnc	L04
 493  0015 5c            	incw	x
 494  0016               L04:
 495  0016 02            	rlwa	x,a
 496  0017 1601          	ldw	y,(OFST-13,sp)
 497  0019 90f6          	ld	a,(y)
 498  001b f7            	ld	(x),a
 499                     ; 172 		pbTmp++;
 501  001c 1e01          	ldw	x,(OFST-13,sp)
 502  001e 5c            	incw	x
 503  001f 1f01          	ldw	(OFST-13,sp),x
 504                     ; 173 		for(j=0;j<8;j++)
 506  0021 0f03          	clr	(OFST-11,sp)
 507  0023               L342:
 508                     ; 176 			if((CrcData^pabDataBuff[i])&0x01)
 510  0023 96            	ldw	x,sp
 511  0024 1c0004        	addw	x,#OFST-10
 512  0027 9f            	ld	a,xl
 513  0028 5e            	swapw	x
 514  0029 1b0d          	add	a,(OFST-1,sp)
 515  002b 2401          	jrnc	L24
 516  002d 5c            	incw	x
 517  002e               L24:
 518  002e 02            	rlwa	x,a
 519  002f f6            	ld	a,(x)
 520  0030 180e          	xor	a,(OFST+0,sp)
 521  0032 a501          	bcp	a,#1
 522  0034 270b          	jreq	L152
 523                     ; 178 				CrcData=CrcData^0x18;
 525  0036 7b0e          	ld	a,(OFST+0,sp)
 526  0038 a818          	xor	a,#24
 527  003a 44            	srl	a
 528                     ; 179 				CrcData>>=1;
 530                     ; 180 				CrcData=CrcData|0x80;
 532  003b aa80          	or	a,#128
 533  003d 6b0e          	ld	(OFST+0,sp),a
 535  003f 2002          	jra	L352
 536  0041               L152:
 537                     ; 184 				CrcData>>=1;
 539  0041 040e          	srl	(OFST+0,sp)
 540  0043               L352:
 541                     ; 186 			pabDataBuff[i]>>=1;
 543  0043 96            	ldw	x,sp
 544  0044 1c0004        	addw	x,#OFST-10
 545  0047 9f            	ld	a,xl
 546  0048 5e            	swapw	x
 547  0049 1b0d          	add	a,(OFST-1,sp)
 548  004b 2401          	jrnc	L44
 549  004d 5c            	incw	x
 550  004e               L44:
 551  004e 02            	rlwa	x,a
 552  004f 74            	srl	(x)
 553                     ; 173 		for(j=0;j<8;j++)
 555  0050 0c03          	inc	(OFST-11,sp)
 558  0052 7b03          	ld	a,(OFST-11,sp)
 559  0054 a108          	cp	a,#8
 560  0056 25cb          	jrult	L342
 561                     ; 169 	for(i=0;i<9;i++)	/*包括CRC值共9个字节*/
 563  0058 0c0d          	inc	(OFST-1,sp)
 566  005a 7b0d          	ld	a,(OFST-1,sp)
 567  005c a109          	cp	a,#9
 568  005e 25ab          	jrult	L532
 569                     ; 189 	return CrcData;
 571  0060 7b0e          	ld	a,(OFST+0,sp)
 574  0062 5b10          	addw	sp,#16
 575  0064 87            	retf	
 631                     ; 209 static sint32 OneWireByteWrite(uint8 u8Channal, uint8 u8Status)
 631                     ; 210 {
 632                     .text:	section	.text,new
 633  0000               L552f_OneWireByteWrite:
 635  0000 89            	pushw	x
 636  0001 89            	pushw	x
 637       00000002      OFST:	set	2
 640                     ; 214 	if(0 == u8Channal)
 642  0002 9e            	ld	a,xh
 643  0003 4d            	tnz	a
 644  0004 2606          	jrne	L103
 645                     ; 216 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
 647  0006 4be0          	push	#224
 648  0008 4b01          	push	#1
 651  000a 2009          	jpf	LC001
 652  000c               L103:
 653                     ; 218 	else if(1 == u8Channal)
 655  000c 7b03          	ld	a,(OFST+1,sp)
 656  000e 4a            	dec	a
 657  000f 260c          	jrne	L303
 658                     ; 220 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
 660  0011 4be0          	push	#224
 661  0013 4b02          	push	#2
 663  0015               LC001:
 664  0015 ae500a        	ldw	x,#20490
 665  0018 8d000000      	callf	f_GPIO_Init
 666  001c 85            	popw	x
 667  001d               L303:
 668                     ; 223 	for(i = 0; i < 8; i++)
 670  001d 4f            	clr	a
 671  001e 6b01          	ld	(OFST-1,sp),a
 672  0020               L703:
 673                     ; 225 		u8Tmp = u8Status >> i;
 675  0020 5f            	clrw	x
 676  0021 97            	ld	xl,a
 677  0022 7b04          	ld	a,(OFST+2,sp)
 678  0024 5d            	tnzw	x
 679  0025 2704          	jreq	L45
 680  0027               L65:
 681  0027 44            	srl	a
 682  0028 5a            	decw	x
 683  0029 26fc          	jrne	L65
 684  002b               L45:
 685                     ; 226 		u8Tmp &= 0x01;
 687  002b a401          	and	a,#1
 688  002d 6b02          	ld	(OFST+0,sp),a
 689                     ; 228 		if(0 == u8Channal)
 691  002f 7b03          	ld	a,(OFST+1,sp)
 692  0031 2626          	jrne	L513
 693                     ; 230 			Pin_temper1_Write(0);
 695  0033 8d000000      	callf	L55f_Pin_temper1_Write
 697                     ; 231 			if(u8Tmp)
 699  0037 7b02          	ld	a,(OFST+0,sp)
 700  0039 270f          	jreq	L713
 701                     ; 233 				UsDelay(5);
 703  003b ae0005        	ldw	x,#5
 704  003e 8d000000      	callf	f_UsDelay
 706                     ; 234 				Pin_temper1_Write(1);
 708  0042 a601          	ld	a,#1
 709  0044 8d000000      	callf	L55f_Pin_temper1_Write
 711                     ; 235 				UsDelay(80);
 714  0048 2027          	jpf	LC004
 715  004a               L713:
 716                     ; 239 				UsDelay(80);
 718  004a ae0050        	ldw	x,#80
 719  004d 8d000000      	callf	f_UsDelay
 721                     ; 240 				Pin_temper1_Write(1);
 723  0051 a601          	ld	a,#1
 724  0053 8d000000      	callf	L55f_Pin_temper1_Write
 726                     ; 241 				UsDelay(5);
 728  0057 202a          	jpf	LC003
 729  0059               L513:
 730                     ; 244 		else if(1 == u8Channal)
 732  0059 4a            	dec	a
 733  005a 262e          	jrne	L323
 734                     ; 246 			Pin_temper2_Write(0);
 736  005c 8d000000      	callf	L77f_Pin_temper2_Write
 738                     ; 247 			if(u8Tmp)
 740  0060 7b02          	ld	a,(OFST+0,sp)
 741  0062 2712          	jreq	L723
 742                     ; 249 				UsDelay(5);
 744  0064 ae0005        	ldw	x,#5
 745  0067 8d000000      	callf	f_UsDelay
 747                     ; 250 				Pin_temper2_Write(1);
 749  006b a601          	ld	a,#1
 750  006d 8d000000      	callf	L77f_Pin_temper2_Write
 752                     ; 251 				UsDelay(80);
 754  0071               LC004:
 756  0071 ae0050        	ldw	x,#80
 759  0074 2010          	jpf	LC002
 760  0076               L723:
 761                     ; 255 				UsDelay(80);
 763  0076 ae0050        	ldw	x,#80
 764  0079 8d000000      	callf	f_UsDelay
 766                     ; 256 				Pin_temper2_Write(1);
 768  007d a601          	ld	a,#1
 769  007f 8d000000      	callf	L77f_Pin_temper2_Write
 771                     ; 257 				UsDelay(5);
 773  0083               LC003:
 775  0083 ae0005        	ldw	x,#5
 776  0086               LC002:
 777  0086 8d000000      	callf	f_UsDelay
 779  008a               L323:
 780                     ; 223 	for(i = 0; i < 8; i++)
 782  008a 0c01          	inc	(OFST-1,sp)
 785  008c 7b01          	ld	a,(OFST-1,sp)
 786  008e a108          	cp	a,#8
 787  0090 258e          	jrult	L703
 788                     ; 263     return 0;
 790  0092 5f            	clrw	x
 791  0093 bf02          	ldw	c_lreg+2,x
 792  0095 bf00          	ldw	c_lreg,x
 795  0097 5b04          	addw	sp,#4
 796  0099 87            	retf	
 862                     ; 281 static uint8 OneWireByteRead(uint8 u8Channal)
 862                     ; 282 {
 863                     .text:	section	.text,new
 864  0000               L333f_OneWireByteRead:
 866  0000 88            	push	a
 867  0001 5203          	subw	sp,#3
 868       00000003      OFST:	set	3
 871                     ; 288 	u8Value = 0;
 873  0003 0f01          	clr	(OFST-2,sp)
 874                     ; 290 	if(0 == u8Channal)
 876  0005 4d            	tnz	a
 877  0006 2661          	jrne	L753
 878                     ; 292 		for (i = 0; i < 8; i ++)
 880  0008 6b03          	ld	(OFST+0,sp),a
 881  000a               L163:
 882                     ; 294 			GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
 884  000a 4be0          	push	#224
 885  000c 4b01          	push	#1
 886  000e ae500a        	ldw	x,#20490
 887  0011 8d000000      	callf	f_GPIO_Init
 889  0015 4f            	clr	a
 890  0016 85            	popw	x
 891                     ; 295 			Pin_temper1_Write(0);
 893  0017 8d000000      	callf	L55f_Pin_temper1_Write
 895                     ; 296 			nop();
 898  001b 9d            	nop	
 900                     ; 297 			nop();
 904  001c 9d            	nop	
 906                     ; 298 			UsDelay(1);
 909  001d ae0001        	ldw	x,#1
 910  0020 8d000000      	callf	f_UsDelay
 912                     ; 299 			Pin_temper1_Write(1);
 914  0024 a601          	ld	a,#1
 915  0026 8d000000      	callf	L55f_Pin_temper1_Write
 917                     ; 300 			nop();
 920  002a 9d            	nop	
 922                     ; 301 			nop();
 926  002b 9d            	nop	
 928                     ; 302 			UsDelay(1);
 931  002c ae0001        	ldw	x,#1
 932  002f 8d000000      	callf	f_UsDelay
 934                     ; 304 			GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
 936  0033 4b40          	push	#64
 937  0035 4b01          	push	#1
 938  0037 ae500a        	ldw	x,#20490
 939  003a 8d000000      	callf	f_GPIO_Init
 941  003e 85            	popw	x
 942                     ; 305 			u8Tmp = Pin_temper1_Read();
 944  003f 8d000000      	callf	L121f_Pin_temper1_Read
 946  0043 6b02          	ld	(OFST-1,sp),a
 947                     ; 306 			if (u8Tmp)
 949  0045 2711          	jreq	L763
 950                     ; 308 				u8Value |= 1 << i;
 952  0047 7b03          	ld	a,(OFST+0,sp)
 953  0049 5f            	clrw	x
 954  004a 97            	ld	xl,a
 955  004b a601          	ld	a,#1
 956  004d 5d            	tnzw	x
 957  004e 2704          	jreq	L431
 958  0050               L631:
 959  0050 48            	sll	a
 960  0051 5a            	decw	x
 961  0052 26fc          	jrne	L631
 962  0054               L431:
 963  0054 1a01          	or	a,(OFST-2,sp)
 964  0056 6b01          	ld	(OFST-2,sp),a
 965  0058               L763:
 966                     ; 310 			UsDelay(80);
 968  0058 ae0050        	ldw	x,#80
 969  005b 8d000000      	callf	f_UsDelay
 971                     ; 292 		for (i = 0; i < 8; i ++)
 973  005f 0c03          	inc	(OFST+0,sp)
 976  0061 7b03          	ld	a,(OFST+0,sp)
 977  0063 a108          	cp	a,#8
 978  0065 25a3          	jrult	L163
 980  0067 205d          	jra	L173
 981  0069               L753:
 982                     ; 314 	else if(1 == u8Channal)
 984  0069 7b04          	ld	a,(OFST+1,sp)
 985  006b 4a            	dec	a
 986  006c 2658          	jrne	L173
 987                     ; 316 		for (i = 0; i < 8; i ++)
 989  006e 6b03          	ld	(OFST+0,sp),a
 990  0070               L573:
 991                     ; 318 			GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
 993  0070 4be0          	push	#224
 994  0072 4b02          	push	#2
 995  0074 ae500a        	ldw	x,#20490
 996  0077 8d000000      	callf	f_GPIO_Init
 998  007b 4f            	clr	a
 999  007c 85            	popw	x
1000                     ; 319 			Pin_temper2_Write(0);
1002  007d 8d000000      	callf	L77f_Pin_temper2_Write
1004                     ; 320 			nop();
1007  0081 9d            	nop	
1009                     ; 321 			nop();
1013  0082 9d            	nop	
1015                     ; 322 			UsDelay(1);
1018  0083 ae0001        	ldw	x,#1
1019  0086 8d000000      	callf	f_UsDelay
1021                     ; 323 			Pin_temper2_Write(1);
1023  008a a601          	ld	a,#1
1024  008c 8d000000      	callf	L77f_Pin_temper2_Write
1026                     ; 324 			nop();
1029  0090 9d            	nop	
1031                     ; 325 			nop();
1035  0091 9d            	nop	
1037                     ; 327 			GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
1040  0092 4b40          	push	#64
1041  0094 4b02          	push	#2
1042  0096 ae500a        	ldw	x,#20490
1043  0099 8d000000      	callf	f_GPIO_Init
1045  009d 85            	popw	x
1046                     ; 328 			u8Tmp = Pin_temper2_Read();
1048  009e 8d000000      	callf	L731f_Pin_temper2_Read
1050  00a2 6b02          	ld	(OFST-1,sp),a
1051                     ; 329 			if (u8Tmp)
1053  00a4 2711          	jreq	L304
1054                     ; 331 				u8Value |= 1 << i;
1056  00a6 7b03          	ld	a,(OFST+0,sp)
1057  00a8 5f            	clrw	x
1058  00a9 97            	ld	xl,a
1059  00aa a601          	ld	a,#1
1060  00ac 5d            	tnzw	x
1061  00ad 2704          	jreq	L651
1062  00af               L061:
1063  00af 48            	sll	a
1064  00b0 5a            	decw	x
1065  00b1 26fc          	jrne	L061
1066  00b3               L651:
1067  00b3 1a01          	or	a,(OFST-2,sp)
1068  00b5 6b01          	ld	(OFST-2,sp),a
1069  00b7               L304:
1070                     ; 333 			UsDelay(80);
1072  00b7 ae0050        	ldw	x,#80
1073  00ba 8d000000      	callf	f_UsDelay
1075                     ; 316 		for (i = 0; i < 8; i ++)
1077  00be 0c03          	inc	(OFST+0,sp)
1080  00c0 7b03          	ld	a,(OFST+0,sp)
1081  00c2 a108          	cp	a,#8
1082  00c4 25aa          	jrult	L573
1083  00c6               L173:
1084                     ; 337 	return u8Value;
1086  00c6 7b01          	ld	a,(OFST-2,sp)
1089  00c8 5b04          	addw	sp,#4
1090  00ca 87            	retf	
1134                     ; 355 static uint8 OneWireReset(uint8 u8Channal)
1134                     ; 356 {
1135                     .text:	section	.text,new
1136  0000               L504f_OneWireReset:
1138  0000 88            	push	a
1139  0001 88            	push	a
1140       00000001      OFST:	set	1
1143                     ; 359 	if(0 == u8Channal)
1145  0002 4d            	tnz	a
1146  0003 263e          	jrne	L524
1147                     ; 361 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
1149  0005 4be0          	push	#224
1150  0007 4b01          	push	#1
1151  0009 ae500a        	ldw	x,#20490
1152  000c 8d000000      	callf	f_GPIO_Init
1154  0010 4f            	clr	a
1155  0011 85            	popw	x
1156                     ; 362 		Pin_temper1_Write(0);
1158  0012 8d000000      	callf	L55f_Pin_temper1_Write
1160                     ; 363 		UsDelay(750);
1162  0016 ae02ee        	ldw	x,#750
1163  0019 8d000000      	callf	f_UsDelay
1165                     ; 365 		Pin_temper1_Write(1);
1167  001d a601          	ld	a,#1
1168  001f 8d000000      	callf	L55f_Pin_temper1_Write
1170                     ; 366 		UsDelay(70);
1172  0023 ae0046        	ldw	x,#70
1173  0026 8d000000      	callf	f_UsDelay
1175                     ; 368 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
1177  002a 4b40          	push	#64
1178  002c 4b01          	push	#1
1179  002e ae500a        	ldw	x,#20490
1180  0031 8d000000      	callf	f_GPIO_Init
1182  0035 85            	popw	x
1183                     ; 369 		UsDelay(1);
1185  0036 ae0001        	ldw	x,#1
1186  0039 8d000000      	callf	f_UsDelay
1188                     ; 370 		u8Result = Pin_temper1_Read();
1190  003d 8d000000      	callf	L121f_Pin_temper1_Read
1192                     ; 371 		UsDelay(500);
1195  0041 2041          	jpf	LC005
1196  0043               L524:
1197                     ; 374 	else if(1 == u8Channal)
1199  0043 7b02          	ld	a,(OFST+1,sp)
1200  0045 4a            	dec	a
1201  0046 2649          	jrne	L134
1202                     ; 376 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
1204  0048 4be0          	push	#224
1205  004a 4b02          	push	#2
1206  004c ae500a        	ldw	x,#20490
1207  004f 8d000000      	callf	f_GPIO_Init
1209  0053 4f            	clr	a
1210  0054 85            	popw	x
1211                     ; 377 		Pin_temper2_Write(0);
1213  0055 8d000000      	callf	L77f_Pin_temper2_Write
1215                     ; 378 		UsDelay(750);
1217  0059 ae02ee        	ldw	x,#750
1218  005c 8d000000      	callf	f_UsDelay
1220                     ; 380 		Pin_temper2_Write(1);
1222  0060 a601          	ld	a,#1
1223  0062 8d000000      	callf	L77f_Pin_temper2_Write
1225                     ; 381 		UsDelay(70);
1227  0066 ae0046        	ldw	x,#70
1228  0069 8d000000      	callf	f_UsDelay
1230                     ; 383 		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
1232  006d 4b40          	push	#64
1233  006f 4b02          	push	#2
1234  0071 ae500a        	ldw	x,#20490
1235  0074 8d000000      	callf	f_GPIO_Init
1237  0078 85            	popw	x
1238                     ; 384 		UsDelay(1);
1240  0079 ae0001        	ldw	x,#1
1241  007c 8d000000      	callf	f_UsDelay
1243                     ; 385 		u8Result = Pin_temper2_Read();
1245  0080 8d000000      	callf	L731f_Pin_temper2_Read
1247                     ; 386 		UsDelay(500);
1249  0084               LC005:
1250  0084 6b01          	ld	(OFST+0,sp),a
1252  0086 ae01f4        	ldw	x,#500
1253  0089 8d000000      	callf	f_UsDelay
1256  008d 7b01          	ld	a,(OFST+0,sp)
1257  008f 2002          	jra	L724
1258  0091               L134:
1259                     ; 391 		u8Result = 0xff;
1261  0091 a6ff          	ld	a,#255
1262  0093               L724:
1263                     ; 394 	return u8Result;
1267  0093 85            	popw	x
1268  0094 87            	retf	
1302                     ; 412 static sint32 Ds18B20StartAllConvert(void)
1302                     ; 413 {
1303                     .text:	section	.text,new
1304  0000               L534f_Ds18B20StartAllConvert:
1306  0000 88            	push	a
1307       00000001      OFST:	set	1
1310                     ; 416 	for(i = 0; i < TEMPRATURE_MAX_NUM; i ++)
1312  0001 4f            	clr	a
1313  0002 6b01          	ld	(OFST+0,sp),a
1314  0004               L354:
1315                     ; 418 		OneWireReset(i);
1317  0004 8d000000      	callf	L504f_OneWireReset
1319                     ; 419 		OneWireByteWrite(i, 0xcc);
1321  0008 ae00cc        	ldw	x,#204
1322  000b 7b01          	ld	a,(OFST+0,sp)
1323  000d 95            	ld	xh,a
1324  000e 8d000000      	callf	L552f_OneWireByteWrite
1326                     ; 420     	OneWireByteWrite(i ,0x44);
1328  0012 ae0044        	ldw	x,#68
1329  0015 7b01          	ld	a,(OFST+0,sp)
1330  0017 95            	ld	xh,a
1331  0018 8d000000      	callf	L552f_OneWireByteWrite
1333                     ; 416 	for(i = 0; i < TEMPRATURE_MAX_NUM; i ++)
1335  001c 0c01          	inc	(OFST+0,sp)
1338  001e 7b01          	ld	a,(OFST+0,sp)
1339  0020 a102          	cp	a,#2
1340  0022 25e0          	jrult	L354
1341                     ; 423 	return 0;
1343  0024 5f            	clrw	x
1344  0025 bf02          	ldw	c_lreg+2,x
1345  0027 bf00          	ldw	c_lreg,x
1348  0029 84            	pop	a
1349  002a 87            	retf	
1351                     .const:	section	.text
1352  0000               L364_pu8Value:
1353  0000 00            	dc.b	0
1354  0001 000000000000  	ds.b	9
1459                     ; 442 static sint16 Ds18B20Read(uint8 u8Channal, tTemperReadDef *ptTemperRead)
1459                     ; 443 {
1460                     .text:	section	.text,new
1461  0000               L164f_Ds18B20Read:
1463  0000 88            	push	a
1464  0001 520e          	subw	sp,#14
1465       0000000e      OFST:	set	14
1468                     ; 444     uint8 pu8Value[10] = {0};
1470  0003 96            	ldw	x,sp
1471  0004 1c0002        	addw	x,#OFST-12
1472  0007 90ae0000      	ldw	y,#L364_pu8Value
1473  000b a60a          	ld	a,#10
1474  000d 8d000000      	callf	d_xymvx
1476                     ; 447 	sint16 s16Tmp = 0;
1478  0011 5f            	clrw	x
1479  0012 1f0c          	ldw	(OFST-2,sp),x
1480                     ; 451 	OneWireReset(u8Channal);
1482  0014 7b0f          	ld	a,(OFST+1,sp)
1483  0016 8d000000      	callf	L504f_OneWireReset
1485                     ; 452 	OneWireByteWrite(u8Channal, 0xcc);
1487  001a ae00cc        	ldw	x,#204
1488  001d 7b0f          	ld	a,(OFST+1,sp)
1489  001f 95            	ld	xh,a
1490  0020 8d000000      	callf	L552f_OneWireByteWrite
1492                     ; 453     OneWireByteWrite(u8Channal ,0xbe);
1494  0024 ae00be        	ldw	x,#190
1495  0027 7b0f          	ld	a,(OFST+1,sp)
1496  0029 95            	ld	xh,a
1497  002a 8d000000      	callf	L552f_OneWireByteWrite
1499                     ; 455 	for(i = 0; i < 9; i ++)
1501  002e 0f0e          	clr	(OFST+0,sp)
1502  0030               L335:
1503                     ; 457 		pu8Value[i] = OneWireByteRead(u8Channal);
1505  0030 96            	ldw	x,sp
1506  0031 1c0002        	addw	x,#OFST-12
1507  0034 9f            	ld	a,xl
1508  0035 5e            	swapw	x
1509  0036 1b0e          	add	a,(OFST+0,sp)
1510  0038 2401          	jrnc	L252
1511  003a 5c            	incw	x
1512  003b               L252:
1513  003b 02            	rlwa	x,a
1514  003c 89            	pushw	x
1515  003d 7b11          	ld	a,(OFST+3,sp)
1516  003f 8d000000      	callf	L333f_OneWireByteRead
1518  0043 85            	popw	x
1519  0044 f7            	ld	(x),a
1520                     ; 455 	for(i = 0; i < 9; i ++)
1522  0045 0c0e          	inc	(OFST+0,sp)
1525  0047 7b0e          	ld	a,(OFST+0,sp)
1526  0049 a109          	cp	a,#9
1527  004b 25e3          	jrult	L335
1528                     ; 459 	if (pu8Value[5] != 0xFF)
1530  004d 7b07          	ld	a,(OFST-7,sp)
1531  004f 4c            	inc	a
1532                     ; 461 		return -1;
1534  0050 2704acdb00db  	jrne	LC007
1535                     ; 464 	if(!TempCRCResult(pu8Value))
1537  0056 96            	ldw	x,sp
1538  0057 1c0002        	addw	x,#OFST-12
1539  005a 8d000000      	callf	L771f_TempCRCResult
1541  005e 4d            	tnz	a
1542  005f 2676          	jrne	L165
1543                     ; 466 		u8LSB = pu8Value[0];
1545  0061 7b02          	ld	a,(OFST-12,sp)
1546  0063 6b0e          	ld	(OFST+0,sp),a
1547                     ; 467 		u8MSB = pu8Value[1];
1549  0065 7b03          	ld	a,(OFST-11,sp)
1550  0067 6b01          	ld	(OFST-13,sp),a
1551                     ; 470         u8LSB >>= 3;
1553  0069 040e          	srl	(OFST+0,sp)
1554  006b 040e          	srl	(OFST+0,sp)
1555  006d 040e          	srl	(OFST+0,sp)
1556                     ; 471         u8LSB &= 0x1F;
1558  006f 7b0e          	ld	a,(OFST+0,sp)
1559  0071 a41f          	and	a,#31
1560  0073 6b0e          	ld	(OFST+0,sp),a
1561                     ; 473         u8LSB = u8LSB | ((u8MSB & 0x07) << 5);
1563  0075 7b01          	ld	a,(OFST-13,sp)
1564  0077 a407          	and	a,#7
1565  0079 97            	ld	xl,a
1566  007a a620          	ld	a,#32
1567  007c 42            	mul	x,a
1568  007d 9f            	ld	a,xl
1569  007e 1a0e          	or	a,(OFST+0,sp)
1570  0080 6b0e          	ld	(OFST+0,sp),a
1571                     ; 475         u8MSB >>= 3;
1573  0082 0401          	srl	(OFST-13,sp)
1574  0084 0401          	srl	(OFST-13,sp)
1575  0086 0401          	srl	(OFST-13,sp)
1576                     ; 476         u8MSB &= 0x1F;
1578  0088 7b01          	ld	a,(OFST-13,sp)
1579  008a a41f          	and	a,#31
1580  008c 6b01          	ld	(OFST-13,sp),a
1581                     ; 478 		if(u8MSB == 0)
1583  008e 261a          	jrne	L545
1584                     ; 480 			s16Tmp = u8LSB >> 1;
1586  0090 7b0e          	ld	a,(OFST+0,sp)
1587  0092 44            	srl	a
1588  0093 5f            	clrw	x
1589  0094 97            	ld	xl,a
1590                     ; 481 			s16Tmp *= 10;
1592  0095 90ae000a      	ldw	y,#10
1593  0099 8d000000      	callf	d_imul
1595  009d 1f0c          	ldw	(OFST-2,sp),x
1596                     ; 482 			if(u8LSB & 0x01) //LSB represent 0.5
1598  009f 7b0e          	ld	a,(OFST+0,sp)
1599  00a1 a501          	bcp	a,#1
1600  00a3 2726          	jreq	L155
1601                     ; 484 				s16Tmp += 5;
1603  00a5 1c0005        	addw	x,#5
1604  00a8 201f          	jpf	LC006
1605  00aa               L545:
1606                     ; 487 		else if(u8MSB == 0x1f) //negative value
1608  00aa a11f          	cp	a,#31
1609  00ac 261d          	jrne	L155
1610                     ; 489 			u8LSB = (~u8LSB) + 1;
1612  00ae 7b0e          	ld	a,(OFST+0,sp)
1613  00b0 43            	cpl	a
1614  00b1 4c            	inc	a
1615  00b2 6b0e          	ld	(OFST+0,sp),a
1616                     ; 490 			s16Tmp = u8LSB >> 1;
1618  00b4 44            	srl	a
1619  00b5 5f            	clrw	x
1620  00b6 97            	ld	xl,a
1621                     ; 491 			s16Tmp *= 10;
1623  00b7 90ae000a      	ldw	y,#10
1624  00bb 8d000000      	callf	d_imul
1626                     ; 492 			if(u8LSB & 0x01) //LSB represent 0.5
1628  00bf 7b0e          	ld	a,(OFST+0,sp)
1629  00c1 a501          	bcp	a,#1
1630  00c3 2703          	jreq	L555
1631                     ; 494 				s16Tmp += 5;
1633  00c5 1c0005        	addw	x,#5
1634  00c8               L555:
1635                     ; 496 			s16Tmp *= -1;
1637  00c8 50            	negw	x
1638  00c9               LC006:
1639  00c9 1f0c          	ldw	(OFST-2,sp),x
1640  00cb               L155:
1641                     ; 499 		if((s16Tmp >= 1000) || (s16Tmp < -550)) //illegal value
1643  00cb 1e0c          	ldw	x,(OFST-2,sp)
1644  00cd a303e8        	cpw	x,#1000
1645  00d0 2e05          	jrsge	L165
1647  00d2 a3fdda        	cpw	x,#64986
1648  00d5 2e0a          	jrsge	L755
1649  00d7               L165:
1650                     ; 501 			ptTemperRead->u8Status = FALSE;
1653  00d7 1e13          	ldw	x,(OFST+5,sp)
1654  00d9 6f02          	clr	(2,x)
1655                     ; 502 			return -1;
1657  00db               LC007:
1660  00db aeffff        	ldw	x,#65535
1662  00de               L062:
1664  00de 5b0f          	addw	sp,#15
1665  00e0 87            	retf	
1666  00e1               L755:
1667                     ; 506 			ptTemperRead->s16Temp = s16Tmp;
1669  00e1 1e13          	ldw	x,(OFST+5,sp)
1670  00e3 160c          	ldw	y,(OFST-2,sp)
1671  00e5 ff            	ldw	(x),y
1672                     ; 507 			ptTemperRead->u8Status = TRUE;
1674  00e6 a601          	ld	a,#1
1675  00e8 e702          	ld	(2,x),a
1676                     ; 516 	return 0;
1678  00ea 5f            	clrw	x
1680  00eb 20f1          	jra	L062
1681                     ; 512 		ptTemperRead->u8Status = FALSE;
1682                     ; 513 		return -1;
1752                     ; 521 static sint16 TemperFilter(sint16 *ps16TempBuf, sint16 s16Temp, sint16 s16TempCurrent, uint8 u8Sta)
1752                     ; 522 {
1753                     .text:	section	.text,new
1754  0000               L765f_TemperFilter:
1756  0000 89            	pushw	x
1757  0001 5203          	subw	sp,#3
1758       00000003      OFST:	set	3
1761                     ; 526 	if(NULL == ps16TempBuf)
1763  0003 5d            	tnzw	x
1764                     ; 528 		return TEMP_ERROR_VALUE;
1766  0004 2707          	jreq	LC009
1767                     ; 532 	if(TEMP_ERROR_VALUE == s16Temp)
1769  0006 1e09          	ldw	x,(OFST+6,sp)
1770  0008 a3f556        	cpw	x,#62806
1771  000b 2606          	jrne	L326
1772                     ; 534 		return TEMP_ERROR_VALUE;
1774  000d               LC009:
1776  000d aef556        	ldw	x,#62806
1778  0010               L462:
1780  0010 5b05          	addw	sp,#5
1781  0012 87            	retf	
1782  0013               L326:
1783                     ; 537 	for(i = 1; i < TEMPERATURE_FILTER_NUM; i ++)
1785  0013 a601          	ld	a,#1
1786  0015 6b03          	ld	(OFST+0,sp),a
1787  0017               L526:
1788                     ; 539 		if(DS1820_STATUS_OK != u8Sta)
1790  0017 7b0d          	ld	a,(OFST+10,sp)
1791  0019 4a            	dec	a
1792  001a 2710          	jreq	L336
1793                     ; 541 			ps16TempBuf[i - 1] = s16Temp;
1795  001c 7b03          	ld	a,(OFST+0,sp)
1796  001e 5f            	clrw	x
1797  001f 97            	ld	xl,a
1798  0020 58            	sllw	x
1799  0021 1d0002        	subw	x,#2
1800  0024 72fb04        	addw	x,(OFST+1,sp)
1801  0027 1609          	ldw	y,(OFST+6,sp)
1802  0029 ff            	ldw	(x),y
1804  002a 2018          	jra	L536
1805  002c               L336:
1806                     ; 545 			ps16TempBuf[i - 1] = ps16TempBuf[i];
1808  002c 7b03          	ld	a,(OFST+0,sp)
1809  002e 5f            	clrw	x
1810  002f 97            	ld	xl,a
1811  0030 58            	sllw	x
1812  0031 72fb04        	addw	x,(OFST+1,sp)
1813  0034 905f          	clrw	y
1814  0036 9097          	ld	yl,a
1815  0038 9058          	sllw	y
1816  003a 72a20002      	subw	y,#2
1817  003e 72f904        	addw	y,(OFST+1,sp)
1818  0041 fe            	ldw	x,(x)
1819  0042 90ff          	ldw	(y),x
1820  0044               L536:
1821                     ; 537 	for(i = 1; i < TEMPERATURE_FILTER_NUM; i ++)
1823  0044 0c03          	inc	(OFST+0,sp)
1826  0046 7b03          	ld	a,(OFST+0,sp)
1827  0048 a105          	cp	a,#5
1828  004a 25cb          	jrult	L526
1829                     ; 549 	ps16TempBuf[TEMPERATURE_FILTER_NUM - 1] = s16Temp;
1831  004c 1e04          	ldw	x,(OFST+1,sp)
1832  004e 1609          	ldw	y,(OFST+6,sp)
1833  0050 ef08          	ldw	(8,x),y
1834                     ; 551 	for(i = 1; i < TEMPERATURE_FILTER_NUM; i ++)
1836  0052 a601          	ld	a,#1
1837  0054 6b03          	ld	(OFST+0,sp),a
1838  0056               L736:
1839                     ; 554 		if((TEMP_ERROR_VALUE == ps16TempBuf[i]) || (TEMP_ERROR_VALUE == ps16TempBuf[i - 1]))
1841  0056 5f            	clrw	x
1842  0057 97            	ld	xl,a
1843  0058 58            	sllw	x
1844  0059 72fb04        	addw	x,(OFST+1,sp)
1845  005c 9093          	ldw	y,x
1846  005e 90fe          	ldw	y,(y)
1847  0060 90a3f556      	cpw	y,#62806
1848  0064 2742          	jreq	L146
1850  0066 5f            	clrw	x
1851  0067 97            	ld	xl,a
1852  0068 58            	sllw	x
1853  0069 1d0002        	subw	x,#2
1854  006c 72fb04        	addw	x,(OFST+1,sp)
1855  006f 9093          	ldw	y,x
1856  0071 90fe          	ldw	y,(y)
1857  0073 90a3f556      	cpw	y,#62806
1858  0077 272f          	jreq	L146
1859                     ; 560 			s16Variation = ps16TempBuf[i] - ps16TempBuf[i - 1];
1861  0079 5f            	clrw	x
1862  007a 97            	ld	xl,a
1863  007b 58            	sllw	x
1864  007c 72fb04        	addw	x,(OFST+1,sp)
1865  007f fe            	ldw	x,(x)
1866  0080 905f          	clrw	y
1867  0082 9097          	ld	yl,a
1868  0084 9058          	sllw	y
1869  0086 72a20002      	subw	y,#2
1870  008a 72f904        	addw	y,(OFST+1,sp)
1871  008d 90fe          	ldw	y,(y)
1872  008f 90bf00        	ldw	c_x,y
1873  0092 72b00000      	subw	x,c_x
1874  0096 1f01          	ldw	(OFST-2,sp),x
1875                     ; 563 			if(((0 - TEMPER_FILTER_MAX_VARIATION) > s16Variation) || 
1875                     ; 564 			   (TEMPER_FILTER_MAX_VARIATION < s16Variation))
1877  0098 a3ffc4        	cpw	x,#65476
1878  009b 2f05          	jrslt	L556
1880  009d a3003d        	cpw	x,#61
1881  00a0 2f06          	jrslt	L146
1882  00a2               L556:
1883                     ; 566 				return s16TempCurrent;
1885  00a2 1e0b          	ldw	x,(OFST+8,sp)
1887  00a4 ac100010      	jra	L462
1888  00a8               L146:
1889                     ; 551 	for(i = 1; i < TEMPERATURE_FILTER_NUM; i ++)
1891  00a8 0c03          	inc	(OFST+0,sp)
1894  00aa 7b03          	ld	a,(OFST+0,sp)
1895  00ac a105          	cp	a,#5
1896  00ae 25a6          	jrult	L736
1897                     ; 571 	return s16Temp;
1899  00b0 1e09          	ldw	x,(OFST+6,sp)
1901  00b2 ac100010      	jra	L462
1947                     ; 579 uint8 temper_85_err_check(sint16 s16temp, sint16 s16temp_last)
1947                     ; 580 {
1948                     .text:	section	.text,new
1949  0000               f_temper_85_err_check:
1951  0000 89            	pushw	x
1952  0001 89            	pushw	x
1953       00000002      OFST:	set	2
1956                     ; 583 	s16data = s16temp - s16temp_last;
1958  0002 72f008        	subw	x,(OFST+6,sp)
1959  0005 1f01          	ldw	(OFST-1,sp),x
1960                     ; 585 	if((TEMPER_ERROR_85 == s16temp) && 
1960                     ; 586 	   ((TEMPER_ERROR_85_FLP < s16data) || (TEMPER_ERROR_85_FLN > s16data)))
1962  0007 1e03          	ldw	x,(OFST+1,sp)
1963  0009 a30352        	cpw	x,#850
1964  000c 260f          	jrne	L776
1966  000e 1e01          	ldw	x,(OFST-1,sp)
1967  0010 a300c9        	cpw	x,#201
1968  0013 2e05          	jrsge	L107
1970  0015 a3ff38        	cpw	x,#65336
1971  0018 2e03          	jrsge	L776
1972  001a               L107:
1973                     ; 588 		return 0;
1975  001a 4f            	clr	a
1977  001b 2002          	jra	L072
1978  001d               L776:
1979                     ; 592 		return 1;
1981  001d a601          	ld	a,#1
1983  001f               L072:
1985  001f 5b04          	addw	sp,#4
1986  0021 87            	retf	
2041                     ; 611 static sint32 Ds18B20ReadAll(void)
2041                     ; 612 {
2042                     .text:	section	.text,new
2043  0000               L507f_Ds18B20ReadAll:
2045  0000 5208          	subw	sp,#8
2046       00000008      OFST:	set	8
2049                     ; 618 	for(i = 0; i < TEMPRATURE_MAX_NUM; i ++)
2051  0002 0f08          	clr	(OFST+0,sp)
2052  0004               L137:
2053                     ; 620 		tTemperRead.s16Temp = - 2730;
2055  0004 aef556        	ldw	x,#62806
2056  0007 1f05          	ldw	(OFST-3,sp),x
2057                     ; 621 		s32Ret = Ds18B20Read(i, &tTemperRead);
2059  0009 96            	ldw	x,sp
2060  000a 1c0005        	addw	x,#OFST-3
2061  000d 89            	pushw	x
2062  000e 7b0a          	ld	a,(OFST+2,sp)
2063  0010 8d000000      	callf	L164f_Ds18B20Read
2065  0014 5b02          	addw	sp,#2
2066  0016 8d000000      	callf	d_itolx
2068  001a 96            	ldw	x,sp
2069  001b 5c            	incw	x
2070  001c 8d000000      	callf	d_rtol
2072                     ; 625 		sprintf((char *)DebugBuf, "temperature%u:%d\r\n", (uint16)i, tTemperRead.s16Temp);
2074  0020 1e05          	ldw	x,(OFST-3,sp)
2075  0022 89            	pushw	x
2076  0023 7b0a          	ld	a,(OFST+2,sp)
2077  0025 5f            	clrw	x
2078  0026 97            	ld	xl,a
2079  0027 89            	pushw	x
2080  0028 ae000a        	ldw	x,#L737
2081  002b 89            	pushw	x
2082  002c ae0000        	ldw	x,#_DebugBuf
2083  002f 8d000000      	callf	f_sprintf
2085  0033 5b06          	addw	sp,#6
2086                     ; 626 		DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);
2088  0035 ae0000        	ldw	x,#_DebugBuf
2089  0038 89            	pushw	x
2090  0039 a603          	ld	a,#3
2091  003b 8d000000      	callf	f_DebugStrOutput
2093  003f 85            	popw	x
2094                     ; 629 		if((0 == s32Ret)&& 
2094                     ; 630 		   (temper_85_err_check(tTemperRead.s16Temp, tTempSampleCtrl.tTemperData[i].s16Temp)))
2096  0040 96            	ldw	x,sp
2097  0041 5c            	incw	x
2098  0042 8d000000      	callf	d_lzmp
2100  0046 2667          	jrne	L147
2102  0048 7b08          	ld	a,(OFST+0,sp)
2103  004a 97            	ld	xl,a
2104  004b a60c          	ld	a,#12
2105  004d 42            	mul	x,a
2106  004e de0000        	ldw	x,(_tTempSampleCtrl,x)
2107  0051 89            	pushw	x
2108  0052 1e07          	ldw	x,(OFST-1,sp)
2109  0054 8d000000      	callf	f_temper_85_err_check
2111  0058 4d            	tnz	a
2112  0059 85            	popw	x
2113  005a 2753          	jreq	L147
2114                     ; 633 			tTemperRead.s16Temp = TemperFilter(tTempSampleCtrl.tTemperData[i].s16TempBuf, tTemperRead.s16Temp, 
2114                     ; 634 											   tTempSampleCtrl.tTemperData[i].s16Temp, 
2114                     ; 635 											   tTempSampleCtrl.u8Ds18b20Status[i]);
2116  005c 7b08          	ld	a,(OFST+0,sp)
2117  005e 5f            	clrw	x
2118  005f 97            	ld	xl,a
2119  0060 d60018        	ld	a,(_tTempSampleCtrl+24,x)
2120  0063 88            	push	a
2121  0064 7b09          	ld	a,(OFST+1,sp)
2122  0066 97            	ld	xl,a
2123  0067 a60c          	ld	a,#12
2124  0069 42            	mul	x,a
2125  006a de0000        	ldw	x,(_tTempSampleCtrl,x)
2126  006d 89            	pushw	x
2127  006e 1e08          	ldw	x,(OFST+0,sp)
2128  0070 89            	pushw	x
2129  0071 7b0d          	ld	a,(OFST+5,sp)
2130  0073 97            	ld	xl,a
2131  0074 a60c          	ld	a,#12
2132  0076 42            	mul	x,a
2133  0077 1c0002        	addw	x,#_tTempSampleCtrl+2
2134  007a 8d000000      	callf	L765f_TemperFilter
2136  007e 5b05          	addw	sp,#5
2137  0080 1f05          	ldw	(OFST-3,sp),x
2138                     ; 637 			tTempSampleCtrl.tTemperData[i].s16Temp = tTemperRead.s16Temp;
2140  0082 7b08          	ld	a,(OFST+0,sp)
2141  0084 97            	ld	xl,a
2142  0085 a60c          	ld	a,#12
2143  0087 42            	mul	x,a
2144  0088 1605          	ldw	y,(OFST-3,sp)
2145  008a df0000        	ldw	(_tTempSampleCtrl,x),y
2146                     ; 639 			tTempSampleCtrl.u8Ds18b20Status[i] = DS1820_STATUS_OK;
2148  008d 7b08          	ld	a,(OFST+0,sp)
2149  008f 5f            	clrw	x
2150  0090 97            	ld	xl,a
2151  0091 a601          	ld	a,#1
2152  0093 d70018        	ld	(_tTempSampleCtrl+24,x),a
2153                     ; 640 			tTempSampleCtrl.u8FailCnt[i] = 0;
2155  0096 7b08          	ld	a,(OFST+0,sp)
2156  0098 5f            	clrw	x
2157  0099 97            	ld	xl,a
2158  009a 724f0035      	clr	(_tTempSampleCtrl+53,x)
2159                     ; 643 			if(0 == i)
2161  009e 7b08          	ld	a,(OFST+0,sp)
2162  00a0 2605          	jrne	L347
2163                     ; 645 				tTempSampleCtrl.u32ErrorCode &= 0xffffff00;
2165  00a2 c7003a        	ld	_tTempSampleCtrl+58,a
2167  00a5 2057          	jra	L157
2168  00a7               L347:
2169                     ; 647 			else if(1 == i)
2171  00a7 4a            	dec	a
2172  00a8 2654          	jrne	L157
2173                     ; 649 				tTempSampleCtrl.u32ErrorCode &= 0xffff00ff;
2175  00aa c70039        	ld	_tTempSampleCtrl+57,a
2176  00ad 204f          	jra	L157
2177  00af               L147:
2178                     ; 652 		else if(0 != s32Ret)
2180  00af 96            	ldw	x,sp
2181  00b0 5c            	incw	x
2182  00b1 8d000000      	callf	d_lzmp
2184  00b5 2747          	jreq	L157
2185                     ; 654 			tTempSampleCtrl.u8FailCnt[i] ++;
2187  00b7 7b08          	ld	a,(OFST+0,sp)
2188  00b9 5f            	clrw	x
2189  00ba 97            	ld	xl,a
2190  00bb 724c0035      	inc	(_tTempSampleCtrl+53,x)
2191                     ; 655 			if(TEMPER_FAIL_MAXTIMES < tTempSampleCtrl.u8FailCnt[i])
2193  00bf 5f            	clrw	x
2194  00c0 97            	ld	xl,a
2195  00c1 d60035        	ld	a,(_tTempSampleCtrl+53,x)
2196  00c4 a115          	cp	a,#21
2197  00c6 2536          	jrult	L157
2198                     ; 657 				tTempSampleCtrl.tTemperData[i].s16Temp= TEMP_ERROR_VALUE;
2200  00c8 7b08          	ld	a,(OFST+0,sp)
2201  00ca 97            	ld	xl,a
2202  00cb a60c          	ld	a,#12
2203  00cd 42            	mul	x,a
2204  00ce 90aef556      	ldw	y,#62806
2205  00d2 df0000        	ldw	(_tTempSampleCtrl,x),y
2206                     ; 659 				tTempSampleCtrl.u8Ds18b20Status[i] = DS1820_STATUS_ERROR;
2208  00d5 7b08          	ld	a,(OFST+0,sp)
2209  00d7 5f            	clrw	x
2210  00d8 97            	ld	xl,a
2211  00d9 a602          	ld	a,#2
2212  00db d70018        	ld	(_tTempSampleCtrl+24,x),a
2213                     ; 661 				tTempSampleCtrl.u8FailCnt[i] = TEMPER_FAIL_MAXTIMES;
2215  00de 7b08          	ld	a,(OFST+0,sp)
2216  00e0 5f            	clrw	x
2217  00e1 97            	ld	xl,a
2218  00e2 a614          	ld	a,#20
2219  00e4 d70035        	ld	(_tTempSampleCtrl+53,x),a
2220                     ; 664 				if(0 == i)
2222  00e7 7b08          	ld	a,(OFST+0,sp)
2223  00e9 2609          	jrne	L757
2224                     ; 666 					tTempSampleCtrl.u32ErrorCode &= 0xffffff00;
2226  00eb c7003a        	ld	_tTempSampleCtrl+58,a
2227                     ; 667 					tTempSampleCtrl.u32ErrorCode |= 0x00000001;
2229  00ee 7210003a      	bset	_tTempSampleCtrl+58,#0
2231  00f2 200a          	jra	L157
2232  00f4               L757:
2233                     ; 669 				else if(1 == i)
2235  00f4 4a            	dec	a
2236  00f5 2607          	jrne	L157
2237                     ; 671 					tTempSampleCtrl.u32ErrorCode &= 0xffff00ff;
2239  00f7 c70039        	ld	_tTempSampleCtrl+57,a
2240                     ; 672 					tTempSampleCtrl.u32ErrorCode |= 0x00000100;
2242  00fa 72100039      	bset	_tTempSampleCtrl+57,#0
2243  00fe               L157:
2244                     ; 618 	for(i = 0; i < TEMPRATURE_MAX_NUM; i ++)
2246  00fe 0c08          	inc	(OFST+0,sp)
2249  0100 7b08          	ld	a,(OFST+0,sp)
2250  0102 a102          	cp	a,#2
2251  0104 2404ac040004  	jrult	L137
2252                     ; 681 	return 0;
2254  010a 5f            	clrw	x
2255  010b bf02          	ldw	c_lreg+2,x
2256  010d bf00          	ldw	c_lreg,x
2259  010f 5b08          	addw	sp,#8
2260  0111 87            	retf	
2288                     ; 686 sint8 TemperTask(void)
2288                     ; 687 {	
2289                     .text:	section	.text,new
2290  0000               f_TemperTask:
2294                     ; 688 	if(DS18B20_STATUS_CONVERTING == tTempSampleCtrl.u8TempSampleStatus)
2296  0000 c6001a        	ld	a,_tTempSampleCtrl+26
2297  0003 4a            	dec	a
2298  0004 2631          	jrne	L577
2299                     ; 690 		if(IsMsTimeout(&tTempSampleCtrl.tDSConvertTimeout))
2301  0006 ae0028        	ldw	x,#_tTempSampleCtrl+40
2302  0009 8d000000      	callf	f_IsMsTimeout
2304  000d 8d000000      	callf	d_lrzmp
2306  0011 2776          	jreq	L7001
2307                     ; 692 			Ds18B20ReadAll();
2309  0013 8d000000      	callf	L507f_Ds18B20ReadAll
2311                     ; 698 			if(((DS1820_STATUS_OK == tTempSampleCtrl.u8Ds18b20Status[0]) ||
2311                     ; 699 			    (DS1820_STATUS_ERROR == tTempSampleCtrl.u8Ds18b20Status[0])) &&
2311                     ; 700 			   ((DS1820_STATUS_OK == tTempSampleCtrl.u8Ds18b20Status[1]) ||
2311                     ; 701 			    (DS1820_STATUS_ERROR == tTempSampleCtrl.u8Ds18b20Status[1])))
2313  0017 c60018        	ld	a,_tTempSampleCtrl+24
2314  001a a101          	cp	a,#1
2315  001c 2704          	jreq	L3001
2317  001e a102          	cp	a,#2
2318  0020 260f          	jrne	L1001
2319  0022               L3001:
2321  0022 c60019        	ld	a,_tTempSampleCtrl+25
2322  0025 a101          	cp	a,#1
2323  0027 2704          	jreq	L5001
2325  0029 a102          	cp	a,#2
2326  002b 2604          	jrne	L1001
2327  002d               L5001:
2328                     ; 703 				tTempSampleCtrl.u8TempOk = 1;
2330  002d 3501003b      	mov	_tTempSampleCtrl+59,#1
2331  0031               L1001:
2332                     ; 706 			tTempSampleCtrl.u8TempSampleStatus = DS18B20_STATUS_IDLE;
2334  0031 725f001a      	clr	_tTempSampleCtrl+26
2335  0035 2052          	jra	L7001
2336  0037               L577:
2337                     ; 710 	else if(DS18B20_STATUS_IDLE == tTempSampleCtrl.u8TempSampleStatus)
2339  0037 c6001a        	ld	a,_tTempSampleCtrl+26
2340  003a 2645          	jrne	L1101
2341                     ; 712 		if(IsMsTimeout(&tTempSampleCtrl.tTempSampleTimeout) || 
2341                     ; 713 		   (tTempSampleCtrl.u8SampleFlag))
2343  003c ae001b        	ldw	x,#_tTempSampleCtrl+27
2344  003f 8d000000      	callf	f_IsMsTimeout
2346  0043 8d000000      	callf	d_lrzmp
2348  0047 2605          	jrne	L5101
2350  0049 c6003c        	ld	a,_tTempSampleCtrl+60
2351  004c 273b          	jreq	L7001
2352  004e               L5101:
2353                     ; 715 			InitMsTimeout(&tTempSampleCtrl.tTempSampleTimeout, TEMPER_SAMPLE_INTERVAL);
2355  004e ae0bb8        	ldw	x,#3000
2356  0051 89            	pushw	x
2357  0052 5f            	clrw	x
2358  0053 89            	pushw	x
2359  0054 ae001b        	ldw	x,#_tTempSampleCtrl+27
2360  0057 8d000000      	callf	f_InitMsTimeout
2362  005b 5b04          	addw	sp,#4
2363                     ; 716 			tTempSampleCtrl.u8SampleFlag = 0;
2365  005d 725f003c      	clr	_tTempSampleCtrl+60
2366                     ; 720 			MsDelay(5);
2368  0061 ae0005        	ldw	x,#5
2369  0064 8d000000      	callf	f_MsDelay
2371                     ; 721 			Ds18B20StartAllConvert();
2373  0068 8d000000      	callf	L534f_Ds18B20StartAllConvert
2375                     ; 723 			InitMsTimeout(&tTempSampleCtrl.tDSConvertTimeout, TEMPER_CONVERT_TIME);		
2377  006c ae03e8        	ldw	x,#1000
2378  006f 89            	pushw	x
2379  0070 5f            	clrw	x
2380  0071 89            	pushw	x
2381  0072 ae0028        	ldw	x,#_tTempSampleCtrl+40
2382  0075 8d000000      	callf	f_InitMsTimeout
2384  0079 5b04          	addw	sp,#4
2385                     ; 724 			tTempSampleCtrl.u8TempSampleStatus = DS18B20_STATUS_CONVERTING;
2387  007b 3501001a      	mov	_tTempSampleCtrl+26,#1
2388  007f 2008          	jra	L7001
2389  0081               L1101:
2390                     ; 729 		tTempSampleCtrl.u8TempSampleStatus = DS18B20_STATUS_IDLE;
2392  0081 725f001a      	clr	_tTempSampleCtrl+26
2393                     ; 730 		tTempSampleCtrl.u8SampleFlag = 1;
2395  0085 3501003c      	mov	_tTempSampleCtrl+60,#1
2396  0089               L7001:
2397                     ; 733 	return 0;
2399  0089 4f            	clr	a
2402  008a 87            	retf	
2594                     ; 737 tTempSampleCtrlDef *GetTemperInfo(void)
2594                     ; 738 {
2595                     .text:	section	.text,new
2596  0000               f_GetTemperInfo:
2600                     ; 739 	return &tTempSampleCtrl;
2602  0000 ae0000        	ldw	x,#_tTempSampleCtrl
2605  0003 87            	retf	
2631                     ; 743 sint8 TemperTaskInit(void)
2631                     ; 744 {
2632                     .text:	section	.text,new
2633  0000               f_TemperTaskInit:
2637                     ; 746 	GPIO_Init(TEMPER_GPIO_PORT, TEMPER_POWER_GPIO_PIN, GPIO_Mode_Out_PP_High_Slow);
2639  0000 4bd0          	push	#208
2640  0002 4b10          	push	#16
2641  0004 ae500a        	ldw	x,#20490
2642  0007 8d000000      	callf	f_GPIO_Init
2644  000b 85            	popw	x
2645                     ; 747 	GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_High_Fast);
2647  000c 4bf0          	push	#240
2648  000e 4b01          	push	#1
2649  0010 ae500a        	ldw	x,#20490
2650  0013 8d000000      	callf	f_GPIO_Init
2652  0017 85            	popw	x
2653                     ; 748 	GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_High_Fast);
2655  0018 4bf0          	push	#240
2656  001a 4b02          	push	#2
2657  001c ae500a        	ldw	x,#20490
2658  001f 8d000000      	callf	f_GPIO_Init
2660  0023 85            	popw	x
2661                     ; 750 	memset(&tTempSampleCtrl, 0, sizeof(tTempSampleCtrlDef));
2663  0024 ae003d        	ldw	x,#61
2664  0027               L043:
2665  0027 724fffff      	clr	(_tTempSampleCtrl-1,x)
2666  002b 5a            	decw	x
2667  002c 26f9          	jrne	L043
2668                     ; 752 	InitMsTimeout(&tTempSampleCtrl.tTempSampleTimeout, TEMPER_SAMPLE_INTERVAL_INIT);
2670  002e ae0bb8        	ldw	x,#3000
2671  0031 89            	pushw	x
2672  0032 5f            	clrw	x
2673  0033 89            	pushw	x
2674  0034 ae001b        	ldw	x,#_tTempSampleCtrl+27
2675  0037 8d000000      	callf	f_InitMsTimeout
2677  003b 5b04          	addw	sp,#4
2678                     ; 753 	tTempSampleCtrl.u8SampleFlag = 0;
2680  003d 725f003c      	clr	_tTempSampleCtrl+60
2681                     ; 755 	return 0;
2683  0041 4f            	clr	a
2686  0042 87            	retf	
2710                     	xdef	f_temper_85_err_check
2711                     	switch	.bss
2712  0000               _tTempSampleCtrl:
2713  0000 000000000000  	ds.b	61
2714                     	xdef	_tTempSampleCtrl
2715                     	xdef	f_TemperTaskInit
2716                     	xdef	f_GetTemperInfo
2717                     	xdef	f_TemperTask
2718                     	xref	f_DebugStrOutput
2719                     	xref	_DebugBuf
2720                     	xref	f_IsMsTimeout
2721                     	xref	f_InitMsTimeout
2722                     	xref	f_UsDelay
2723                     	xref	f_MsDelay
2724                     	xref	f_GPIO_WriteBit
2725                     	xref	f_GPIO_Init
2726                     	xref	f_sprintf
2727                     	xref	f_memset
2728                     	switch	.const
2729  000a               L737:
2730  000a 74656d706572  	dc.b	"temperature%u:%d",13
2731  001b 0a00          	dc.b	10,0
2732                     	xref.b	c_lreg
2733                     	xref.b	c_x
2753                     	xref	d_lrzmp
2754                     	xref	d_lzmp
2755                     	xref	d_rtol
2756                     	xref	d_itolx
2757                     	xref	d_imul
2758                     	xref	d_xymvx
2759                     	end
