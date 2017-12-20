   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  45                     ; 23 static sint8 BatSelect(uint8 u8Chan)
  45                     ; 24 {
  47                     .text:	section	.text,new
  48  0000               L3_BatSelect:
  52                     ; 25 	switch(u8Chan)
  55                     ; 35 		default:
  55                     ; 36 		break;
  56  0000 4d            	tnz	a
  57  0001 2704          	jreq	L5
  58  0003 4a            	dec	a
  59  0004 2705          	jreq	L7
  61  0006 81            	ret	
  62  0007               L5:
  63                     ; 27 		case 0: // bat1
  63                     ; 28 		GPIO_WriteBit(SW_CTRL_GPIO_PORT, SW_CTRL_GPIO_PIN, 0);
  65  0007 4b00          	push	#0
  67                     ; 29 		break;
  69  0009 2002          	jp	LC001
  70  000b               L7:
  71                     ; 31 		case 1: // bat2
  71                     ; 32 		GPIO_WriteBit(SW_CTRL_GPIO_PORT, SW_CTRL_GPIO_PIN, 1);
  73  000b 4b01          	push	#1
  75  000d               LC001:
  76  000d 4b04          	push	#4
  77  000f ae5000        	ldw	x,#20480
  78  0012 cd0000        	call	_GPIO_WriteBit
  79  0015 85            	popw	x
  80                     ; 33 		break;
  82                     ; 35 		default:
  82                     ; 36 		break;
  84                     ; 38 }
  87  0016 81            	ret	
 154                     ; 43 static sint8 InrsVoltGet(uint16 *pu16CurrAd, uint16 *pu16VoltAd)
 154                     ; 44 {
 155                     .text:	section	.text,new
 156  0000               L34_InrsVoltGet:
 158  0000 89            	pushw	x
 159  0001 5243          	subw	sp,#67
 160       00000043      OFST:	set	67
 163                     ; 48 	for(i = 0; i < FRAME2_ADC_ACQ_NUM; i ++)
 165  0003 0f43          	clr	(OFST+0,sp)
 166  0005               L77:
 167                     ; 51 		u16VoltAd[0][i] = AdcGeneralAcq(CHAN_REBACK_CURRENT);
 169  0005 a603          	ld	a,#3
 170  0007 cd0000        	call	_AdcGeneralAcq
 172  000a 9096          	ldw	y,sp
 173  000c 72a90003      	addw	y,#OFST-64
 174  0010 1701          	ldw	(OFST-66,sp),y
 175  0012 7b43          	ld	a,(OFST+0,sp)
 176  0014 905f          	clrw	y
 177  0016 9097          	ld	yl,a
 178  0018 9058          	sllw	y
 179  001a 72f901        	addw	y,(OFST-66,sp)
 180  001d 90ff          	ldw	(y),x
 181                     ; 53 		u16VoltAd[1][i] = AdcGeneralAcq(CHAN_REBACK_VOLT);
 183  001f 4f            	clr	a
 184  0020 cd0000        	call	_AdcGeneralAcq
 186  0023 9096          	ldw	y,sp
 187  0025 72a90023      	addw	y,#OFST-32
 188  0029 1701          	ldw	(OFST-66,sp),y
 189  002b 7b43          	ld	a,(OFST+0,sp)
 190  002d 905f          	clrw	y
 191  002f 9097          	ld	yl,a
 192  0031 9058          	sllw	y
 193  0033 72f901        	addw	y,(OFST-66,sp)
 194  0036 90ff          	ldw	(y),x
 195                     ; 48 	for(i = 0; i < FRAME2_ADC_ACQ_NUM; i ++)
 197  0038 0c43          	inc	(OFST+0,sp)
 200  003a 7b43          	ld	a,(OFST+0,sp)
 201  003c a110          	cp	a,#16
 202  003e 25c5          	jrult	L77
 203                     ; 56 	*pu16CurrAd = U16Filter(&u16VoltAd[0][0], FRAME2_ADC_ACQ_NUM);
 205  0040 4b10          	push	#16
 206  0042 96            	ldw	x,sp
 207  0043 1c0004        	addw	x,#OFST-63
 208  0046 cd0000        	call	_U16Filter
 210  0049 84            	pop	a
 211  004a 1644          	ldw	y,(OFST+1,sp)
 212  004c 90ff          	ldw	(y),x
 213                     ; 57 	*pu16VoltAd = U16Filter(&u16VoltAd[1][0], FRAME2_ADC_ACQ_NUM);
 215  004e 4b10          	push	#16
 216  0050 96            	ldw	x,sp
 217  0051 1c0024        	addw	x,#OFST-31
 218  0054 cd0000        	call	_U16Filter
 220  0057 84            	pop	a
 221  0058 1648          	ldw	y,(OFST+5,sp)
 222  005a 90ff          	ldw	(y),x
 223                     ; 58 }
 226  005c 5b45          	addw	sp,#69
 227  005e 81            	ret	
 263                     ; 64 static sint8 InrsMesureAct(void)
 263                     ; 65 {
 264                     .text:	section	.text,new
 265  0000               L501_InrsMesureAct:
 267  0000 88            	push	a
 268       00000001      OFST:	set	1
 271                     ; 70 	for(j = 0; j < FRAME1_KPULSE_NUM; j ++)
 273  0001 0f01          	clr	(OFST+0,sp)
 274  0003               L521:
 275                     ; 72 		GPIO_ToggleBits(KPULSE_GPIO_PORT, KPULSE_GPIO_PIN);
 277  0003 4b80          	push	#128
 278  0005 ae5005        	ldw	x,#20485
 279  0008 cd0000        	call	_GPIO_ToggleBits
 281  000b ae0010        	ldw	x,#16
 282  000e 84            	pop	a
 283                     ; 73 		MsDelay(16);
 285  000f cd0000        	call	_MsDelay
 287                     ; 70 	for(j = 0; j < FRAME1_KPULSE_NUM; j ++)
 289  0012 0c01          	inc	(OFST+0,sp)
 292  0014 7b01          	ld	a,(OFST+0,sp)
 293  0016 a114          	cp	a,#20
 294  0018 25e9          	jrult	L521
 295                     ; 103 	return 0;
 297  001a 4f            	clr	a
 300  001b 5b01          	addw	sp,#1
 301  001d 81            	ret	
 326                     ; 107 sint8 InrsMesurejob(void)
 326                     ; 108 {
 327                     .text:	section	.text,new
 328  0000               _InrsMesurejob:
 332                     ; 109 	if(tInRsCtrl.u8InRsSampleFlag)
 334  0000 b608          	ld	a,_tInRsCtrl+8
 335  0002 2703          	jreq	L341
 336                     ; 111 		InrsMesureAct();
 338  0004 cd0000        	call	L501_InrsMesureAct
 340  0007               L341:
 341                     ; 113 }
 344  0007 81            	ret	
 369                     ; 116 sint8 InrsMesureInit(void)
 369                     ; 117 {
 370                     .text:	section	.text,new
 371  0000               _InrsMesureInit:
 375                     ; 118 	tInRsCtrl.u8InRsSampleFlag = 1;
 377  0000 35010008      	mov	_tInRsCtrl+8,#1
 378                     ; 120 	GPIO_Init(KPULSE_GPIO_PORT, KPULSE_GPIO_PIN, GPIO_Mode_Out_PP_High_Fast);
 380  0004 4bf0          	push	#240
 381  0006 4b80          	push	#128
 382  0008 ae5005        	ldw	x,#20485
 383  000b cd0000        	call	_GPIO_Init
 385  000e 85            	popw	x
 386                     ; 121 	GPIO_Init(SW_CTRL_GPIO_PORT, SW_CTRL_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
 388  000f 4be0          	push	#224
 389  0011 4b04          	push	#4
 390  0013 ae5000        	ldw	x,#20480
 391  0016 cd0000        	call	_GPIO_Init
 393  0019 85            	popw	x
 394                     ; 122 }
 397  001a 81            	ret	
 555                     	switch	.ubsct
 556  0000               _tInRsCtrl:
 557  0000 000000000000  	ds.b	43
 558                     	xdef	_tInRsCtrl
 559                     	xdef	_InrsMesureInit
 560                     	xdef	_InrsMesurejob
 561                     	xref	_AdcGeneralAcq
 562                     	xref	_U16Filter
 563                     	xref	_MsDelay
 564                     	xref	_GPIO_ToggleBits
 565                     	xref	_GPIO_WriteBit
 566                     	xref	_GPIO_Init
 586                     	end
