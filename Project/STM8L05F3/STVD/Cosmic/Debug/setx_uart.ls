   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  46                     ; 26 void UpUartInit(void)
  46                     ; 27 {
  47                     .text:	section	.text,new
  48  0000               f_UpUartInit:
  52                     ; 28 	memset(&tUartRecCtrl, 0, sizeof(tUartRecCtrlDef));
  54  0000 ae0023        	ldw	x,#35
  55  0003               L6:
  56  0003 724f002f      	clr	(_tUartRecCtrl-1,x)
  57  0007 5a            	decw	x
  58  0008 26f9          	jrne	L6
  59                     ; 29 	memset(&tUartSendCtrl, 0, sizeof(tUartSendCtrlDef));
  61  000a ae0023        	ldw	x,#35
  62  000d               L01:
  63  000d 724f000c      	clr	(_tUartSendCtrl-1,x)
  64  0011 5a            	decw	x
  65  0012 26f9          	jrne	L01
  66                     ; 31 	SYSCFG_REMAPDeInit();
  68  0014 8d000000      	callf	f_SYSCFG_REMAPDeInit
  70                     ; 32 	SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortC, ENABLE);
  72  0018 4b01          	push	#1
  73  001a ae012c        	ldw	x,#300
  74  001d 8d000000      	callf	f_SYSCFG_REMAPPinConfig
  76  0021 ae0001        	ldw	x,#1
  77  0024 84            	pop	a
  78                     ; 33     CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
  80  0025 a605          	ld	a,#5
  81  0027 95            	ld	xh,a
  82  0028 8d000000      	callf	f_CLK_PeripheralClockConfig
  84                     ; 34     GPIO_Init(UP_UART_GPIO_PORT, UP_UART_GPIO_TX_PIN, GPIO_Mode_Out_PP_High_Fast);//TXD
  86  002c 4bf0          	push	#240
  87  002e 4b20          	push	#32
  88  0030 ae500a        	ldw	x,#20490
  89  0033 8d000000      	callf	f_GPIO_Init
  91  0037 85            	popw	x
  92                     ; 35     GPIO_Init(UP_UART_GPIO_PORT, UP_UART_GPIO_RX_PIN, GPIO_Mode_In_PU_No_IT);//RXD
  94  0038 4b40          	push	#64
  95  003a 4b40          	push	#64
  96  003c ae500a        	ldw	x,#20490
  97  003f 8d000000      	callf	f_GPIO_Init
  99  0043 85            	popw	x
 100                     ; 36     GPIO_ExternalPullUpConfig(UP_UART_GPIO_PORT, UP_UART_GPIO_TX_PIN, ENABLE);
 102  0044 4b01          	push	#1
 103  0046 4b20          	push	#32
 104  0048 ae500a        	ldw	x,#20490
 105  004b 8d000000      	callf	f_GPIO_ExternalPullUpConfig
 107  004f 85            	popw	x
 108                     ; 37     GPIO_ExternalPullUpConfig(UP_UART_GPIO_PORT, UP_UART_GPIO_RX_PIN, ENABLE);
 110  0050 4b01          	push	#1
 111  0052 4b40          	push	#64
 112  0054 ae500a        	ldw	x,#20490
 113  0057 8d000000      	callf	f_GPIO_ExternalPullUpConfig
 115  005b 85            	popw	x
 116                     ; 39     USART_DeInit(SETX_UP_UART);
 118  005c ae5230        	ldw	x,#21040
 119  005f 8d000000      	callf	f_USART_DeInit
 121                     ; 41 	USART_Init(SETX_UP_UART, UP_UART_BAUTRATE, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, (USART_Mode_Rx | USART_Mode_Tx));
 123  0063 4b0c          	push	#12
 124  0065 4b00          	push	#0
 125  0067 4b00          	push	#0
 126  0069 4b00          	push	#0
 127  006b ae2580        	ldw	x,#9600
 128  006e 89            	pushw	x
 129  006f 5f            	clrw	x
 130  0070 89            	pushw	x
 131  0071 ae5230        	ldw	x,#21040
 132  0074 8d000000      	callf	f_USART_Init
 134  0078 5b08          	addw	sp,#8
 135                     ; 43 	USART_ITConfig(SETX_UP_UART, USART_IT_RXNE, ENABLE);
 137  007a 4b01          	push	#1
 138  007c ae0255        	ldw	x,#597
 139  007f 89            	pushw	x
 140  0080 ae5230        	ldw	x,#21040
 141  0083 8d000000      	callf	f_USART_ITConfig
 143  0087 5b03          	addw	sp,#3
 144                     ; 44     USART_Cmd(SETX_UP_UART, ENABLE); 
 146  0089 4b01          	push	#1
 147  008b ae5230        	ldw	x,#21040
 148  008e 8d000000      	callf	f_USART_Cmd
 150  0092 9a            	rim	
 151  0093 84            	pop	a
 152                     ; 45     enableInterrupts();
 156                     ; 46 }
 160  0094 87            	retf	
 188                     ; 48 INTERRUPT void UP_UART_RX_IRQHandler(void)
 188                     ; 49 {
 189                     .text:	section	.text,new
 190  0000               f_UP_UART_RX_IRQHandler:
 193  0000 3b0002        	push	c_x+2
 194  0003 be00          	ldw	x,c_x
 195  0005 89            	pushw	x
 196  0006 3b0002        	push	c_y+2
 197  0009 be00          	ldw	x,c_y
 198  000b 89            	pushw	x
 201                     ; 50 	if(SET == USART_GetITStatus(SETX_UP_UART, USART_IT_RXNE)) 
 203  000c ae0255        	ldw	x,#597
 204  000f 89            	pushw	x
 205  0010 ae5230        	ldw	x,#21040
 206  0013 8d000000      	callf	f_USART_GetITStatus
 208  0017 4a            	dec	a
 209  0018 85            	popw	x
 210  0019 2634          	jrne	L13
 211                     ; 52 		if(UART_RCV_MAX_LONG > tUartRecCtrl.u16Len)
 213  001b ce0050        	ldw	x,_tUartRecCtrl+32
 214  001e a30020        	cpw	x,#32
 215  0021 2428          	jruge	L33
 216                     ; 55 			tUartRecCtrl.u8Buf[tUartRecCtrl.u16Len] = USART_ReceiveData8(SETX_UP_UART);
 218  0023 ae5230        	ldw	x,#21040
 219  0026 8d000000      	callf	f_USART_ReceiveData8
 221  002a ce0050        	ldw	x,_tUartRecCtrl+32
 222  002d d70030        	ld	(_tUartRecCtrl,x),a
 223                     ; 56 			InitMsTimeout(&tUartRcvMsTimeout, UP_UART_RCV_FRAME_TIMEOUT);
 225  0030 aeffff        	ldw	x,#65535
 226  0033 89            	pushw	x
 227  0034 89            	pushw	x
 228  0035 ae0000        	ldw	x,#_tUartRcvMsTimeout
 229  0038 8d000000      	callf	f_InitMsTimeout
 231  003c 5b04          	addw	sp,#4
 232                     ; 57 			tUartRecCtrl.u8RecSta = UART_RCV_STA_RCVING;
 234  003e 35010052      	mov	_tUartRecCtrl+34,#1
 235                     ; 58 			tUartRecCtrl.u16Len ++;
 237  0042 ce0050        	ldw	x,_tUartRecCtrl+32
 238  0045 5c            	incw	x
 239  0046 cf0050        	ldw	_tUartRecCtrl+32,x
 241  0049 2004          	jra	L13
 242  004b               L33:
 243                     ; 62 			tUartRecCtrl.u8RecSta = UART_RCV_STA_ERROR;
 245  004b 35030052      	mov	_tUartRecCtrl+34,#3
 246  004f               L13:
 247                     ; 65 }
 250  004f 85            	popw	x
 251  0050 bf00          	ldw	c_y,x
 252  0052 320002        	pop	c_y+2
 253  0055 85            	popw	x
 254  0056 bf00          	ldw	c_x,x
 255  0058 320002        	pop	c_x+2
 256  005b 80            	iret	
 306                     ; 68 uint16 UpUartSendStr(uint8 *pu8Data, uint16 u16Len)
 306                     ; 69 {
 307                     .text:	section	.text,new
 308  0000               f_UpUartSendStr:
 310  0000 89            	pushw	x
 311  0001 89            	pushw	x
 312       00000002      OFST:	set	2
 315                     ; 72 	for(i = 0; i < u16Len; i++)
 317  0002 5f            	clrw	x
 319  0003 2021          	jra	L56
 320  0005               L16:
 321                     ; 74 		USART_SendData8(SETX_UP_UART, *(pu8Data + i));
 323  0005 1e03          	ldw	x,(OFST+1,sp)
 324  0007 72fb01        	addw	x,(OFST-1,sp)
 325  000a f6            	ld	a,(x)
 326  000b 88            	push	a
 327  000c ae5230        	ldw	x,#21040
 328  000f 8d000000      	callf	f_USART_SendData8
 330  0013 84            	pop	a
 332  0014               L37:
 333                     ; 76         while(USART_GetFlagStatus(SETX_UP_UART, USART_FLAG_TC) == RESET);
 335  0014 ae0040        	ldw	x,#64
 336  0017 89            	pushw	x
 337  0018 ae5230        	ldw	x,#21040
 338  001b 8d000000      	callf	f_USART_GetFlagStatus
 340  001f 4d            	tnz	a
 341  0020 85            	popw	x
 342  0021 27f1          	jreq	L37
 343                     ; 72 	for(i = 0; i < u16Len; i++)
 345  0023 1e01          	ldw	x,(OFST-1,sp)
 346  0025 5c            	incw	x
 347  0026               L56:
 348  0026 1f01          	ldw	(OFST-1,sp),x
 351  0028 1308          	cpw	x,(OFST+6,sp)
 352  002a 25d9          	jrult	L16
 353                     ; 79 	return i;
 357  002c 5b04          	addw	sp,#4
 358  002e 87            	retf	
 384                     ; 84 sint16 UpUartRcvDoJob(void)
 384                     ; 85 {
 385                     .text:	section	.text,new
 386  0000               f_UpUartRcvDoJob:
 390                     ; 86 	if(UART_RCV_STA_RCVING == tUartRecCtrl.u8RecSta)
 392  0000 c60052        	ld	a,_tUartRecCtrl+34
 393  0003 4a            	dec	a
 394  0004 2620          	jrne	L701
 395                     ; 88 		if(IsMsTimeout(&tUartRcvMsTimeout))
 397  0006 ae0000        	ldw	x,#_tUartRcvMsTimeout
 398  0009 8d000000      	callf	f_IsMsTimeout
 400  000d 8d000000      	callf	d_lrzmp
 402  0011 2713          	jreq	L701
 403                     ; 90 			USART_ITConfig(SETX_UP_UART, USART_IT_RXNE, DISABLE);
 405  0013 4b00          	push	#0
 406  0015 ae0255        	ldw	x,#597
 407  0018 89            	pushw	x
 408  0019 ae5230        	ldw	x,#21040
 409  001c 8d000000      	callf	f_USART_ITConfig
 411  0020 5b03          	addw	sp,#3
 412                     ; 91 			tUartRecCtrl.u8RecSta = UART_RCV_STA_OVER;
 414  0022 35020052      	mov	_tUartRecCtrl+34,#2
 415  0026               L701:
 416                     ; 95 	return 0;
 418  0026 5f            	clrw	x
 421  0027 87            	retf	
 456                     ; 100 sint16 UpUartSendDoJob(void)
 456                     ; 101 {
 457                     .text:	section	.text,new
 458  0000               f_UpUartSendDoJob:
 460  0000 89            	pushw	x
 461       00000002      OFST:	set	2
 464                     ; 104 	if(UART_SEND_STA_WAITING == tUartSendCtrl.u8SendSta)
 466  0001 c6002f        	ld	a,_tUartSendCtrl+34
 467  0004 4a            	dec	a
 468  0005 263f          	jrne	L721
 469                     ; 106 		tUartSendCtrl.u8SendSta = UART_SEND_STA_SENDING;
 471  0007 3502002f      	mov	_tUartSendCtrl+34,#2
 472                     ; 107 		for(i = 0; i < tUartSendCtrl.u16Len; i++)
 474  000b 5f            	clrw	x
 476  000c 201e          	jra	L531
 477  000e               L131:
 478                     ; 109 			USART_SendData8(SETX_UP_UART, tUartSendCtrl.u8Buf[i]);
 480  000e d6000d        	ld	a,(_tUartSendCtrl,x)
 481  0011 88            	push	a
 482  0012 ae5230        	ldw	x,#21040
 483  0015 8d000000      	callf	f_USART_SendData8
 485  0019 84            	pop	a
 487  001a               L341:
 488                     ; 111 	        while(USART_GetFlagStatus(SETX_UP_UART, USART_FLAG_TC) == RESET);
 490  001a ae0040        	ldw	x,#64
 491  001d 89            	pushw	x
 492  001e ae5230        	ldw	x,#21040
 493  0021 8d000000      	callf	f_USART_GetFlagStatus
 495  0025 4d            	tnz	a
 496  0026 85            	popw	x
 497  0027 27f1          	jreq	L341
 498                     ; 107 		for(i = 0; i < tUartSendCtrl.u16Len; i++)
 500  0029 1e01          	ldw	x,(OFST-1,sp)
 501  002b 5c            	incw	x
 502  002c               L531:
 503  002c 1f01          	ldw	(OFST-1,sp),x
 506  002e c3002d        	cpw	x,_tUartSendCtrl+32
 507  0031 25db          	jrult	L131
 508                     ; 113 		tUartSendCtrl.u8SendSta = UART_SEND_STA_IDLE;
 510  0033 725f002f      	clr	_tUartSendCtrl+34
 511                     ; 115 		USART_ITConfig(SETX_UP_UART, USART_IT_RXNE, ENABLE);
 513  0037 4b01          	push	#1
 514  0039 ae0255        	ldw	x,#597
 515  003c 89            	pushw	x
 516  003d ae5230        	ldw	x,#21040
 517  0040 8d000000      	callf	f_USART_ITConfig
 519  0044 5b03          	addw	sp,#3
 520  0046               L721:
 521                     ; 118 	return 0;
 523  0046 5f            	clrw	x
 526  0047 5b02          	addw	sp,#2
 527  0049 87            	retf	
 688                     	xdef	f_UP_UART_RX_IRQHandler
 689                     	switch	.bss
 690  0000               _tUartRcvMsTimeout:
 691  0000 000000000000  	ds.b	13
 692                     	xdef	_tUartRcvMsTimeout
 693  000d               _tUartSendCtrl:
 694  000d 000000000000  	ds.b	35
 695                     	xdef	_tUartSendCtrl
 696  0030               _tUartRecCtrl:
 697  0030 000000000000  	ds.b	35
 698                     	xdef	_tUartRecCtrl
 699                     	xref	f_IsMsTimeout
 700                     	xref	f_InitMsTimeout
 701                     	xdef	f_UpUartSendDoJob
 702                     	xdef	f_UpUartRcvDoJob
 703                     	xdef	f_UpUartSendStr
 704                     	xdef	f_UpUartInit
 705                     	xref	f_USART_GetITStatus
 706                     	xref	f_USART_GetFlagStatus
 707                     	xref	f_USART_ITConfig
 708                     	xref	f_USART_ReceiveData8
 709                     	xref	f_USART_SendData8
 710                     	xref	f_USART_Cmd
 711                     	xref	f_USART_Init
 712                     	xref	f_USART_DeInit
 713                     	xref	f_SYSCFG_REMAPPinConfig
 714                     	xref	f_SYSCFG_REMAPDeInit
 715                     	xref	f_GPIO_ExternalPullUpConfig
 716                     	xref	f_GPIO_Init
 717                     	xref	f_CLK_PeripheralClockConfig
 718                     	xref	f_memset
 719                     	xref.b	c_x
 720                     	xref.b	c_y
 740                     	xref	d_lrzmp
 741                     	end
