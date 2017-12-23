   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     	switch	.data
   6  0000               L7_u8PasswordOK:
   7  0000 00            	dc.b	0
  66                     ; 64 sint8 DoCtrl(uint16 u16Reg, uint16 u16RegNum, uint8 *pu8Data)
  66                     ; 65 {
  67                     .text:	section	.text,new
  68  0000               f_DoCtrl:
  70  0000 89            	pushw	x
  71  0001 89            	pushw	x
  72       00000002      OFST:	set	2
  75                     ; 69 	for(i = 0; i < u16RegNum; i++)
  77  0002 0f02          	clr	(OFST+0,sp)
  79  0004 2002          	jra	L54
  80  0006               L14:
  83  0006 0c02          	inc	(OFST+0,sp)
  84  0008               L54:
  87  0008 7b02          	ld	a,(OFST+0,sp)
  88  000a 5f            	clrw	x
  89  000b 97            	ld	xl,a
  90  000c 1308          	cpw	x,(OFST+6,sp)
  91  000e 25f6          	jrult	L14
  92                     ; 74 	return s8Ret;
  94  0010 7b01          	ld	a,(OFST-1,sp)
  97  0012 5b04          	addw	sp,#4
  98  0014 87            	retf	
 129                     ; 78 sint8 RegDownSyn(uint16 u16Reg, uint16 u16RegNum, uint8 *pu8Data)
 129                     ; 79 {
 130                     .text:	section	.text,new
 131  0000               f_RegDownSyn:
 135                     ; 80 	return 0;
 137  0000 4f            	clr	a
 140  0001 87            	retf	
 198                     ; 85 sint8 CtrlAct(uint16 u16Reg, uint16 u16RegNum, uint8 *pu8Data)
 198                     ; 86 {
 199                     .text:	section	.text,new
 200  0000               f_CtrlAct:
 202  0000 89            	pushw	x
 203  0001 88            	push	a
 204       00000001      OFST:	set	1
 207                     ; 90 	if(PWD_REG_START == u16Reg)
 209  0002 a30300        	cpw	x,#768
 210  0005 2619          	jrne	L111
 211                     ; 92 		if(PASSWORD_VALUE == *((uint16 *)pu8Data))
 213  0007 1609          	ldw	y,(OFST+8,sp)
 214  0009 90fe          	ldw	y,(y)
 215  000b 90a396a5      	cpw	y,#38565
 216  000f 2605          	jrne	L311
 217                     ; 94 			u8PasswordOK = 1;
 219  0011 a601          	ld	a,#1
 220  0013 c70000        	ld	L7_u8PasswordOK,a
 221  0016               L311:
 222                     ; 98 		if(1 == u16RegNum)
 224  0016 1e07          	ldw	x,(OFST+6,sp)
 225  0018 a30001        	cpw	x,#1
 226  001b 2603          	jrne	L111
 227                     ; 100 			return 0;
 229  001d 4f            	clr	a
 231  001e 201d          	jra	L61
 232  0020               L111:
 233                     ; 105 	if((DO_REG_START <= u16Reg) && ((DO_REG_START + DO_REG_NUM) > (u16Reg + u16RegNum)))
 235  0020 1e02          	ldw	x,(OFST+1,sp)
 236  0022 a30200        	cpw	x,#512
 237  0025 2519          	jrult	L711
 239  0027 72fb07        	addw	x,(OFST+6,sp)
 240  002a a30201        	cpw	x,#513
 241  002d 2411          	jruge	L711
 242                     ; 107 		s8Ret = DoCtrl(u16Reg, u16RegNum, pu8Data);
 244  002f 1e09          	ldw	x,(OFST+8,sp)
 245  0031 89            	pushw	x
 246  0032 1e09          	ldw	x,(OFST+8,sp)
 247  0034 89            	pushw	x
 248  0035 1e06          	ldw	x,(OFST+5,sp)
 249  0037 8d000000      	callf	f_DoCtrl
 251  003b               LC001:
 252  003b 5b04          	addw	sp,#4
 253                     ; 109 		return s8Ret;
 256  003d               L61:
 258  003d 5b03          	addw	sp,#3
 259  003f 87            	retf	
 260  0040               L711:
 261                     ; 113 	if(SYSC_REG_START < (u16Reg + u16RegNum))
 263  0040 1e02          	ldw	x,(OFST+1,sp)
 264  0042 72fb07        	addw	x,(OFST+6,sp)
 265  0045 a30302        	cpw	x,#770
 266  0048 25f3          	jrult	L61
 267                     ; 115 		if(1 == u8PasswordOK)
 269  004a c60000        	ld	a,L7_u8PasswordOK
 270  004d 4a            	dec	a
 271  004e 2611          	jrne	L321
 272                     ; 117 			u8PasswordOK = 0;
 274  0050 c70000        	ld	L7_u8PasswordOK,a
 275                     ; 118 			s8Ret = RegDownSyn(u16Reg, u16RegNum, pu8Data);
 277  0053 1e09          	ldw	x,(OFST+8,sp)
 278  0055 89            	pushw	x
 279  0056 1e09          	ldw	x,(OFST+8,sp)
 280  0058 89            	pushw	x
 281  0059 1e06          	ldw	x,(OFST+5,sp)
 282  005b 8d000000      	callf	f_RegDownSyn
 284                     ; 119 			return s8Ret;
 287  005f 20da          	jpf	LC001
 288  0061               L321:
 289                     ; 123 			return -1;
 291  0061 a6ff          	ld	a,#255
 293  0063 20d8          	jra	L61
 294                     ; 128 }
 352                     ; 132 static uint8* RegCheck(uint8 u8Cmd, uint16 u16Reg, uint16 u16Num)
 352                     ; 133 {
 353                     .text:	section	.text,new
 354  0000               L721f_RegCheck:
 356  0000 88            	push	a
 357  0001 89            	pushw	x
 358       00000002      OFST:	set	2
 361                     ; 134 	uint8 *pu8Reg = NULL;
 363  0002 5f            	clrw	x
 364  0003 1f01          	ldw	(OFST-1,sp),x
 365                     ; 136 	switch(u8Cmd)
 368                     ; 193 			break;
 369  0005 a003          	sub	a,#3
 370  0007 270c          	jreq	L131
 371  0009 a003          	sub	a,#3
 372  000b 2771          	jreq	L331
 373  000d a00a          	sub	a,#10
 374  000f 276d          	jreq	L331
 375                     ; 192 			pu8Reg = NULL;
 376                     ; 193 			break;
 378  0011 acdb00db      	jpf	LC002
 379  0015               L131:
 380                     ; 140 			if((ACQ_REG_START <= u16Reg) && ((ACQ_REG_START + ACQ_REG_NUM) > (u16Reg + u16Num)))
 382  0015 1e07          	ldw	x,(OFST+5,sp)
 383  0017 72fb09        	addw	x,(OFST+7,sp)
 384  001a a3000c        	cpw	x,#12
 385  001d 1e07          	ldw	x,(OFST+5,sp)
 386  001f 2405          	jruge	L761
 387                     ; 142 				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - ACQ_REG_START]);
 389  0021 58            	sllw	x
 391  0022 acd800d8      	jpf	LC003
 392  0026               L761:
 393                     ; 144 			else if((SYS_REG_START <= u16Reg) && ((SYS_REG_START + SYS_REG_NUM) > (u16Reg + u16Num)))
 395  0026 a30048        	cpw	x,#72
 396  0029 2512          	jrult	L371
 398  002b 72fb09        	addw	x,(OFST+7,sp)
 399  002e a30055        	cpw	x,#85
 400  0031 240a          	jruge	L371
 401                     ; 146 				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - SYS_REG_START]);
 403  0033 1e07          	ldw	x,(OFST+5,sp)
 404  0035 58            	sllw	x
 405  0036 1d0090        	subw	x,#144
 407  0039 acd800d8      	jpf	LC003
 408  003d               L371:
 409                     ; 148 			else if((ACQ_AUX_REG_START <= u16Reg) && ((ACQ_AUX_REG_START + ACQ_AUX_REG_NUM) > (u16Reg + u16Num)))
 411  003d 1e07          	ldw	x,(OFST+5,sp)
 412  003f a30100        	cpw	x,#256
 413  0042 2512          	jrult	L771
 415  0044 72fb09        	addw	x,(OFST+7,sp)
 416  0047 a30105        	cpw	x,#261
 417  004a 240a          	jruge	L771
 418                     ; 150 				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - ACQ_AUX_REG_START]);
 420  004c 1e07          	ldw	x,(OFST+5,sp)
 421  004e 58            	sllw	x
 422  004f 1d0200        	subw	x,#512
 424  0052 acd800d8      	jpf	LC003
 425  0056               L771:
 426                     ; 152 			else if((SYSC_REG_START <= u16Reg) && ((SYSC_REG_START + SYSC_REG_NUM) > (u16Reg + u16Num)))
 428  0056 1e07          	ldw	x,(OFST+5,sp)
 429  0058 a30301        	cpw	x,#769
 430  005b 2510          	jrult	L302
 432  005d 72fb09        	addw	x,(OFST+7,sp)
 433  0060 a3030e        	cpw	x,#782
 434  0063 2408          	jruge	L302
 435                     ; 154 				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - SYSC_REG_START]);
 437  0065 1e07          	ldw	x,(OFST+5,sp)
 438  0067 58            	sllw	x
 439  0068 1d0602        	subw	x,#1538
 441  006b 206b          	jpf	LC003
 442  006d               L302:
 443                     ; 156 			else if((VOLT_CALI_REG_START <= u16Reg) && ((VOLT_CALI_REG_START + VOLT_CALI_REG_NUM) > (u16Reg + u16Num)))
 445  006d 1e07          	ldw	x,(OFST+5,sp)
 446  006f a30322        	cpw	x,#802
 447  0072 254f          	jrult	L522
 449  0074 72fb09        	addw	x,(OFST+7,sp)
 450  0077 a3032c        	cpw	x,#812
 451  007a 2447          	jruge	L522
 452                     ; 158 				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - VOLT_CALI_REG_START]);
 454  007c 203d          	jpf	LC005
 455                     ; 160 			else if((INRS_CALI_REG_START <= u16Reg) && ((INRS_CALI_REG_START + INRS_CALI_REG_NUM) > (u16Reg + u16Num)))
 457                     ; 162 				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - INRS_CALI_REG_START]);
 458  007e               L331:
 459                     ; 170 			if((DO_REG_START <= u16Reg) && ((DO_REG_START + DO_REG_NUM) > (u16Reg + u16Num)))
 461  007e 1e07          	ldw	x,(OFST+5,sp)
 462  0080 a30200        	cpw	x,#512
 463  0083 2510          	jrult	L512
 465  0085 72fb09        	addw	x,(OFST+7,sp)
 466  0088 a30201        	cpw	x,#513
 467  008b 2408          	jruge	L512
 468                     ; 172 				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - DO_REG_START]);
 470  008d 1e07          	ldw	x,(OFST+5,sp)
 471  008f 58            	sllw	x
 472  0090 1d0400        	subw	x,#1024
 474  0093 2043          	jpf	LC003
 475  0095               L512:
 476                     ; 174 			else if((PWD_REG_START <= u16Reg) && ((PWD_REG_START + (PWD_REG_NUM + SYSC_REG_NUM)) > (u16Reg + u16Num)))
 478  0095 1e07          	ldw	x,(OFST+5,sp)
 479  0097 a30300        	cpw	x,#768
 480  009a 2510          	jrult	L122
 482  009c 72fb09        	addw	x,(OFST+7,sp)
 483  009f a3030e        	cpw	x,#782
 484  00a2 2408          	jruge	L122
 485                     ; 176 				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - PWD_REG_START]);
 487  00a4 1e07          	ldw	x,(OFST+5,sp)
 488  00a6 58            	sllw	x
 489  00a7 1d0600        	subw	x,#1536
 491  00aa 202c          	jpf	LC003
 492  00ac               L122:
 493                     ; 178 			else if((VOLT_CALI_REG_START <= u16Reg) && ((VOLT_CALI_REG_START + VOLT_CALI_REG_NUM) > (u16Reg + u16Num)))
 495  00ac 1e07          	ldw	x,(OFST+5,sp)
 496  00ae a30322        	cpw	x,#802
 497  00b1 2510          	jrult	L522
 499  00b3 72fb09        	addw	x,(OFST+7,sp)
 500  00b6 a3032c        	cpw	x,#812
 501  00b9 2408          	jruge	L522
 502                     ; 180 				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - VOLT_CALI_REG_START]);
 504  00bb               LC005:
 506  00bb 1e07          	ldw	x,(OFST+5,sp)
 507  00bd 58            	sllw	x
 508  00be 1d0644        	subw	x,#1604
 510  00c1 2015          	jpf	LC003
 511  00c3               L522:
 512                     ; 182 			else if((INRS_CALI_REG_START <= u16Reg) && ((INRS_CALI_REG_START + INRS_CALI_REG_NUM) > (u16Reg + u16Num)))
 515                     ; 184 				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - INRS_CALI_REG_START]);
 518  00c3 1e07          	ldw	x,(OFST+5,sp)
 519  00c5 a30354        	cpw	x,#852
 520  00c8 2513          	jrult	L561
 521  00ca 72fb09        	addw	x,(OFST+7,sp)
 522  00cd a3035c        	cpw	x,#860
 523  00d0 240b          	jruge	L561
 525  00d2 1e07          	ldw	x,(OFST+5,sp)
 526  00d4 58            	sllw	x
 527  00d5 1d06a8        	subw	x,#1704
 528  00d8               LC003:
 529  00d8 1c0066        	addw	x,#_u16AcqRegTable
 530  00db               LC002:
 532  00db 1f01          	ldw	(OFST-1,sp),x
 533  00dd               L561:
 534                     ; 197 	return pu8Reg;
 536  00dd 1e01          	ldw	x,(OFST-1,sp)
 539  00df 5b03          	addw	sp,#3
 540  00e1 87            	retf	
 721                     ; 201 static sint16 AppDeal(tProtocolInfoDef tProtocolInfo, tSendProtocolInfoDef *ptSendProtocolInfo)
 721                     ; 202 {
 722                     .text:	section	.text,new
 723  0000               L332f_AppDeal:
 725  0000 5204          	subw	sp,#4
 726       00000004      OFST:	set	4
 729                     ; 204 	uint8 *pu8Addr = NULL;
 731                     ; 208 	if(NULL == ptSendProtocolInfo)
 733  0002 1e12          	ldw	x,(OFST+14,sp)
 734                     ; 210 		return -1;
 736  0004 2604ac320132  	jreq	L763
 737                     ; 213 	ptSendProtocolInfo->u8ID = tProtocolInfo.u8ID;
 739  000a 7b08          	ld	a,(OFST+4,sp)
 740  000c f7            	ld	(x),a
 741                     ; 214 	ptSendProtocolInfo->u8CommandCode = tProtocolInfo.u8CommandCode;
 743  000d 7b09          	ld	a,(OFST+5,sp)
 744  000f e701          	ld	(1,x),a
 745                     ; 215 	ptSendProtocolInfo->u16DataLen = 0;
 747  0011 905f          	clrw	y
 748  0013 ef26          	ldw	(38,x),y
 749                     ; 217 	switch(tProtocolInfo.u8CommandCode)
 752                     ; 301 			break;
 753  0015 a003          	sub	a,#3
 754  0017 2710          	jreq	L532
 755  0019 a003          	sub	a,#3
 756  001b 275c          	jreq	L732
 757  001d a00a          	sub	a,#10
 758  001f 2604acdb00db  	jreq	L142
 759                     ; 300 			s16Ret = -1;
 760                     ; 301 			break;
 762  0025 acd600d6      	jpf	L163
 763  0029               L532:
 764                     ; 221 			pu8Addr = RegCheck(tProtocolInfo.u8CommandCode, tProtocolInfo.u16RegisterStartAddr, tProtocolInfo.u16RegisterNum);
 766  0029 1e0c          	ldw	x,(OFST+8,sp)
 767  002b 89            	pushw	x
 768  002c 1e0c          	ldw	x,(OFST+8,sp)
 769  002e 89            	pushw	x
 770  002f 7b0d          	ld	a,(OFST+9,sp)
 771  0031 8d000000      	callf	L721f_RegCheck
 773  0035 5b04          	addw	sp,#4
 774  0037 1f01          	ldw	(OFST-3,sp),x
 775                     ; 222 			if(NULL != pu8Addr)
 777  0039 27cb          	jreq	L763
 778                     ; 224 				i = 0;
 780  003b 5f            	clrw	x
 781  003c 1f03          	ldw	(OFST-1,sp),x
 782                     ; 225 				PubPutU16(ptSendProtocolInfo->pu8Data, (tProtocolInfo.u16RegisterNum * 2));
 784  003e 1e0c          	ldw	x,(OFST+8,sp)
 785  0040 58            	sllw	x
 786  0041 89            	pushw	x
 787  0042 1e14          	ldw	x,(OFST+16,sp)
 788  0044 1c0006        	addw	x,#6
 789  0047 8d000000      	callf	f_PubPutU16
 791  004b 85            	popw	x
 792                     ; 226 				i += 2;
 794  004c 1e03          	ldw	x,(OFST-1,sp)
 795  004e 1c0002        	addw	x,#2
 796  0051 1f03          	ldw	(OFST-1,sp),x
 797                     ; 227 				memcpy((ptSendProtocolInfo->pu8Data + i), pu8Addr, (tProtocolInfo.u16RegisterNum * 2));
 799  0053 1e12          	ldw	x,(OFST+14,sp)
 800  0055 72fb03        	addw	x,(OFST-1,sp)
 801  0058 1c0006        	addw	x,#6
 802  005b bf00          	ldw	c_x,x
 803  005d 1601          	ldw	y,(OFST-3,sp)
 804  005f 90bf00        	ldw	c_y,y
 805  0062 1e0c          	ldw	x,(OFST+8,sp)
 806  0064 58            	sllw	x
 807  0065               L03:
 808  0065 5a            	decw	x
 809  0066 92d600        	ld	a,([c_y.w],x)
 810  0069 92d700        	ld	([c_x.w],x),a
 811  006c 5d            	tnzw	x
 812  006d 26f6          	jrne	L03
 813                     ; 228 				i += (tProtocolInfo.u16RegisterNum * 2);
 815  006f 1e0c          	ldw	x,(OFST+8,sp)
 816  0071 58            	sllw	x
 817  0072 72fb03        	addw	x,(OFST-1,sp)
 818                     ; 229 				ptSendProtocolInfo->u16DataLen = i;
 819                     ; 230 				s16Ret = 0;
 821  0075 ac270127      	jpf	LC007
 822                     ; 234 				s16Ret = -1;
 823  0079               L732:
 824                     ; 241 			pu8Addr = RegCheck(tProtocolInfo.u8CommandCode, tProtocolInfo.u16RegisterStartAddr, tProtocolInfo.u16RegisterNum);
 826  0079 1e0c          	ldw	x,(OFST+8,sp)
 827  007b 89            	pushw	x
 828  007c 1e0c          	ldw	x,(OFST+8,sp)
 829  007e 89            	pushw	x
 830  007f 7b0d          	ld	a,(OFST+9,sp)
 831  0081 8d000000      	callf	L721f_RegCheck
 833  0085 5b04          	addw	sp,#4
 834  0087 1f01          	ldw	(OFST-3,sp),x
 835                     ; 242 			if(NULL != pu8Addr)
 837  0089 2604ac320132  	jreq	L763
 838                     ; 244 				if(0 <= CtrlAct(tProtocolInfo.u16RegisterStartAddr, 1, tProtocolInfo.pu8Data))
 840  008f 1e0e          	ldw	x,(OFST+10,sp)
 841  0091 89            	pushw	x
 842  0092 ae0001        	ldw	x,#1
 843  0095 89            	pushw	x
 844  0096 1e0e          	ldw	x,(OFST+10,sp)
 845  0098 8d000000      	callf	f_CtrlAct
 847  009c 5b04          	addw	sp,#4
 848  009e 4d            	tnz	a
 849  009f 2f35          	jrslt	L163
 850                     ; 246 					i = 0;
 852  00a1 5f            	clrw	x
 853  00a2 1f03          	ldw	(OFST-1,sp),x
 854                     ; 247 					PubPutU16(ptSendProtocolInfo->pu8Data, tProtocolInfo.u16RegisterStartAddr);
 856  00a4 1e0a          	ldw	x,(OFST+6,sp)
 857  00a6 89            	pushw	x
 858  00a7 1e14          	ldw	x,(OFST+16,sp)
 859  00a9 1c0006        	addw	x,#6
 860  00ac 8d000000      	callf	f_PubPutU16
 862  00b0 85            	popw	x
 863                     ; 248 					i += 2;
 865  00b1 1e03          	ldw	x,(OFST-1,sp)
 866  00b3 1c0002        	addw	x,#2
 867  00b6 1f03          	ldw	(OFST-1,sp),x
 868                     ; 249 					memcpy((ptSendProtocolInfo->pu8Data + i), tProtocolInfo.pu8Data, 2);
 870  00b8 1e12          	ldw	x,(OFST+14,sp)
 871  00ba 72fb03        	addw	x,(OFST-1,sp)
 872  00bd 1c0006        	addw	x,#6
 873  00c0 bf00          	ldw	c_x,x
 874  00c2 160e          	ldw	y,(OFST+10,sp)
 875  00c4 90bf00        	ldw	c_y,y
 876  00c7 ae0002        	ldw	x,#2
 877  00ca               L04:
 878  00ca 5a            	decw	x
 879  00cb 92d600        	ld	a,([c_y.w],x)
 880  00ce 92d700        	ld	([c_x.w],x),a
 881  00d1 5d            	tnzw	x
 882  00d2 26f6          	jrne	L04
 883                     ; 250 					i += 2;
 884                     ; 251 					ptSendProtocolInfo->u16DataLen = i;
 885                     ; 252 					s16Ret = 0;
 887  00d4 204c          	jpf	LC008
 888  00d6               L163:
 889                     ; 256 					s16Ret = -1;
 893  00d6 aeffff        	ldw	x,#65535
 894  00d9 2058          	jra	L153
 895                     ; 261 				s16Ret = -1;
 896  00db               L142:
 897                     ; 268 			pu8Addr = RegCheck(tProtocolInfo.u8CommandCode, tProtocolInfo.u16RegisterStartAddr, tProtocolInfo.u16RegisterNum);
 899  00db 1e0c          	ldw	x,(OFST+8,sp)
 900  00dd 89            	pushw	x
 901  00de 1e0c          	ldw	x,(OFST+8,sp)
 902  00e0 89            	pushw	x
 903  00e1 7b0d          	ld	a,(OFST+9,sp)
 904  00e3 8d000000      	callf	L721f_RegCheck
 906  00e7 5b04          	addw	sp,#4
 907  00e9 1f01          	ldw	(OFST-3,sp),x
 908                     ; 269 			if(NULL != pu8Addr)
 910  00eb 2745          	jreq	L763
 911                     ; 271 				if(0 <= CtrlAct(tProtocolInfo.u16RegisterStartAddr, tProtocolInfo.u16RegisterNum, tProtocolInfo.pu8Data))
 913  00ed 1e0e          	ldw	x,(OFST+10,sp)
 914  00ef 89            	pushw	x
 915  00f0 1e0e          	ldw	x,(OFST+10,sp)
 916  00f2 89            	pushw	x
 917  00f3 1e0e          	ldw	x,(OFST+10,sp)
 918  00f5 8d000000      	callf	f_CtrlAct
 920  00f9 5b04          	addw	sp,#4
 921  00fb 4d            	tnz	a
 922  00fc 2fd8          	jrslt	L163
 923                     ; 273 					i = 0;
 925  00fe 5f            	clrw	x
 926  00ff 1f03          	ldw	(OFST-1,sp),x
 927                     ; 274 					PubPutU16(ptSendProtocolInfo->pu8Data, tProtocolInfo.u16RegisterStartAddr);
 929  0101 1e0a          	ldw	x,(OFST+6,sp)
 930  0103 89            	pushw	x
 931  0104 1e14          	ldw	x,(OFST+16,sp)
 932  0106 1c0006        	addw	x,#6
 933  0109 8d000000      	callf	f_PubPutU16
 935  010d 85            	popw	x
 936                     ; 275 					i += 2;
 938  010e 1e03          	ldw	x,(OFST-1,sp)
 939  0110 1c0002        	addw	x,#2
 940  0113 1f03          	ldw	(OFST-1,sp),x
 941                     ; 276 					PubPutU16((ptSendProtocolInfo->pu8Data + 2), tProtocolInfo.u16RegisterNum);
 943  0115 1e0c          	ldw	x,(OFST+8,sp)
 944  0117 89            	pushw	x
 945  0118 1e14          	ldw	x,(OFST+16,sp)
 946  011a 1c0008        	addw	x,#8
 947  011d 8d000000      	callf	f_PubPutU16
 949  0121 85            	popw	x
 950                     ; 277 					i += 2;
 952  0122               LC008:
 954  0122 1e03          	ldw	x,(OFST-1,sp)
 955  0124 1c0002        	addw	x,#2
 956                     ; 278 					ptSendProtocolInfo->u16DataLen = i;
 958                     ; 279 					s16Ret = 0;
 960  0127               LC007:
 961  0127 1f03          	ldw	(OFST-1,sp),x
 964  0129 1e12          	ldw	x,(OFST+14,sp)
 965  012b 1603          	ldw	y,(OFST-1,sp)
 966  012d ef26          	ldw	(38,x),y
 969  012f 5f            	clrw	x
 971  0130 2001          	jra	L153
 972                     ; 283 					s16Ret = -1;
 973  0132               L763:
 974                     ; 288 				s16Ret = -1;
 979  0132 5a            	decw	x
 980  0133               L153:
 981                     ; 305 	return s16Ret;
 985  0133 5b04          	addw	sp,#4
 986  0135 87            	retf	
1025                     ; 309 sint16 CommDoJob(void)
1025                     ; 310 {
1026                     .text:	section	.text,new
1027  0000               f_CommDoJob:
1029  0000 89            	pushw	x
1030       00000002      OFST:	set	2
1033                     ; 313 	if(UART_RCV_STA_OVER == tUartRecCtrl.u8RecSta)
1035  0001 c60022        	ld	a,_tUartRecCtrl+34
1036  0004 a102          	cp	a,#2
1037  0006 265d          	jrne	L314
1038                     ; 315 		s16Ret = ModbusParse(tUartRecCtrl.u8Buf, tUartRecCtrl.u16Len, &tProtocolInfo);
1040  0008 ae00a6        	ldw	x,#L3_tProtocolInfo
1041  000b 89            	pushw	x
1042  000c ce0020        	ldw	x,_tUartRecCtrl+32
1043  000f 89            	pushw	x
1044  0010 ae0000        	ldw	x,#_tUartRecCtrl
1045  0013 8d000000      	callf	f_ModbusParse
1047  0017 5b04          	addw	sp,#4
1048  0019 1f01          	ldw	(OFST-1,sp),x
1049                     ; 317 		if((0 == s16Ret) && (tMcuCtrl.u8DevID == tProtocolInfo.u8ID))
1051  001b 2648          	jrne	L314
1053  001d c60000        	ld	a,_tMcuCtrl
1054  0020 c100a6        	cp	a,L3_tProtocolInfo
1055  0023 2640          	jrne	L314
1056                     ; 319 			s16Ret = AppDeal(tProtocolInfo, &tSendProtocolInfo);
1058  0025 ae007e        	ldw	x,#L5_tSendProtocolInfo
1059  0028 89            	pushw	x
1060  0029 ae00a6        	ldw	x,#L3_tProtocolInfo
1061  002c bf00          	ldw	c_x,x
1062  002e ae000a        	ldw	x,#10
1063  0031               L26:
1064  0031 5a            	decw	x
1065  0032 92d600        	ld	a,([c_x.w],x)
1066  0035 88            	push	a
1067  0036 5d            	tnzw	x
1068  0037 26f8          	jrne	L26
1069  0039 8d000000      	callf	L332f_AppDeal
1071  003d 5b0c          	addw	sp,#12
1072  003f 1f01          	ldw	(OFST-1,sp),x
1073                     ; 320 			if(0 == s16Ret)
1075  0041 2622          	jrne	L314
1076                     ; 322 				ModbusBuild(tSendProtocolInfo, tUartSendCtrl.u8Buf, &tUartSendCtrl.u16Len);
1078  0043 ae0020        	ldw	x,#_tUartSendCtrl+32
1079  0046 89            	pushw	x
1080  0047 ae0000        	ldw	x,#_tUartSendCtrl
1081  004a 89            	pushw	x
1082  004b ae007e        	ldw	x,#L5_tSendProtocolInfo
1083  004e bf00          	ldw	c_x,x
1084  0050 ae0028        	ldw	x,#40
1085  0053               L66:
1086  0053 5a            	decw	x
1087  0054 92d600        	ld	a,([c_x.w],x)
1088  0057 88            	push	a
1089  0058 5d            	tnzw	x
1090  0059 26f8          	jrne	L66
1091  005b 8d000000      	callf	f_ModbusBuild
1093  005f 5b2c          	addw	sp,#44
1094                     ; 323 				tUartSendCtrl.u8SendSta = UART_SEND_STA_WAITING;
1096  0061 35010022      	mov	_tUartSendCtrl+34,#1
1097  0065               L314:
1098                     ; 328 	return 0;
1100  0065 5f            	clrw	x
1103  0066 5b02          	addw	sp,#2
1104  0068 87            	retf	
1227                     	xdef	f_CtrlAct
1228                     	xdef	f_RegDownSyn
1229                     	xdef	f_DoCtrl
1230                     	switch	.bss
1231  0000               _u16InrsCaliRegTable:
1232  0000 000000000000  	ds.b	16
1233                     	xdef	_u16InrsCaliRegTable
1234  0010               _u16VoltCaliRegTable:
1235  0010 000000000000  	ds.b	20
1236                     	xdef	_u16VoltCaliRegTable
1237  0024               _u16SyscRegTable:
1238  0024 000000000000  	ds.b	26
1239                     	xdef	_u16SyscRegTable
1240  003e               _u16PwdRegTable:
1241  003e 0000          	ds.b	2
1242                     	xdef	_u16PwdRegTable
1243  0040               _u16ACqAuxRegTable:
1244  0040 000000000000  	ds.b	10
1245                     	xdef	_u16ACqAuxRegTable
1246  004a               _u16DORegTable:
1247  004a 0000          	ds.b	2
1248                     	xdef	_u16DORegTable
1249  004c               _u16SysRegTable:
1250  004c 000000000000  	ds.b	26
1251                     	xdef	_u16SysRegTable
1252  0066               _u16AcqRegTable:
1253  0066 000000000000  	ds.b	24
1254                     	xdef	_u16AcqRegTable
1255  007e               L5_tSendProtocolInfo:
1256  007e 000000000000  	ds.b	40
1257  00a6               L3_tProtocolInfo:
1258  00a6 000000000000  	ds.b	10
1259                     	xref	_tUartSendCtrl
1260                     	xref	_tUartRecCtrl
1261                     	xref	_tMcuCtrl
1262                     	xref	f_PubPutU16
1263                     	xref	f_ModbusBuild
1264                     	xref	f_ModbusParse
1265                     	xdef	f_CommDoJob
1266                     	xref	f_memcpy
1267                     	xref.b	c_x
1268                     	xref.b	c_y
1288                     	end
