   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  46                     ; 21 void UpUartInit(void)
  46                     ; 22 {
  48                     .text:	section	.text,new
  49  0000               _UpUartInit:
  53                     ; 23 	memset(&tUartRecCtrl, 0, sizeof(tUartRecCtrlDef));
  55  0000 ae0017        	ldw	x,#23
  56  0003               L6:
  57  0003 6f16          	clr	(_tUartRecCtrl-1,x)
  58  0005 5a            	decw	x
  59  0006 26fb          	jrne	L6
  60                     ; 24 	memset(&tUartSendCtrl, 0, sizeof(tUartSendCtrlDef));
  62  0008 ae0017        	ldw	x,#23
  63  000b               L01:
  64  000b 6fff          	clr	(_tUartSendCtrl-1,x)
  65  000d 5a            	decw	x
  66  000e 26fb          	jrne	L01
  67                     ; 26 	SYSCFG_REMAPDeInit();
  69  0010 cd0000        	call	_SYSCFG_REMAPDeInit
  71                     ; 27 	SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortC, ENABLE);
  73  0013 4b01          	push	#1
  74  0015 ae012c        	ldw	x,#300
  75  0018 cd0000        	call	_SYSCFG_REMAPPinConfig
  77  001b ae0001        	ldw	x,#1
  78  001e 84            	pop	a
  79                     ; 28     CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
  81  001f a605          	ld	a,#5
  82  0021 95            	ld	xh,a
  83  0022 cd0000        	call	_CLK_PeripheralClockConfig
  85                     ; 29     GPIO_Init(UP_UART_GPIO_PORT, UP_UART_GPIO_TX_PIN, GPIO_Mode_Out_PP_High_Fast);//TXD
  87  0025 4bf0          	push	#240
  88  0027 4b20          	push	#32
  89  0029 ae500a        	ldw	x,#20490
  90  002c cd0000        	call	_GPIO_Init
  92  002f 85            	popw	x
  93                     ; 30     GPIO_Init(UP_UART_GPIO_PORT, UP_UART_GPIO_RX_PIN, GPIO_Mode_In_PU_No_IT);//RXD
  95  0030 4b40          	push	#64
  96  0032 4b40          	push	#64
  97  0034 ae500a        	ldw	x,#20490
  98  0037 cd0000        	call	_GPIO_Init
 100  003a 85            	popw	x
 101                     ; 31     GPIO_ExternalPullUpConfig(UP_UART_GPIO_PORT, UP_UART_GPIO_TX_PIN, ENABLE);
 103  003b 4b01          	push	#1
 104  003d 4b20          	push	#32
 105  003f ae500a        	ldw	x,#20490
 106  0042 cd0000        	call	_GPIO_ExternalPullUpConfig
 108  0045 85            	popw	x
 109                     ; 32     GPIO_ExternalPullUpConfig(UP_UART_GPIO_PORT, UP_UART_GPIO_RX_PIN, ENABLE);
 111  0046 4b01          	push	#1
 112  0048 4b40          	push	#64
 113  004a ae500a        	ldw	x,#20490
 114  004d cd0000        	call	_GPIO_ExternalPullUpConfig
 116  0050 85            	popw	x
 117                     ; 34     USART_DeInit(SETX_UP_UART);
 119  0051 ae5230        	ldw	x,#21040
 120  0054 cd0000        	call	_USART_DeInit
 122                     ; 36 	USART_Init(SETX_UP_UART, 9600, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, (USART_Mode_Rx | USART_Mode_Tx));
 124  0057 4b0c          	push	#12
 125  0059 4b00          	push	#0
 126  005b 4b00          	push	#0
 127  005d 4b00          	push	#0
 128  005f ae2580        	ldw	x,#9600
 129  0062 89            	pushw	x
 130  0063 5f            	clrw	x
 131  0064 89            	pushw	x
 132  0065 ae5230        	ldw	x,#21040
 133  0068 cd0000        	call	_USART_Init
 135  006b 5b08          	addw	sp,#8
 136                     ; 38 	USART_ITConfig(SETX_UP_UART, USART_IT_RXNE, ENABLE);
 138  006d 4b01          	push	#1
 139  006f ae0255        	ldw	x,#597
 140  0072 89            	pushw	x
 141  0073 ae5230        	ldw	x,#21040
 142  0076 cd0000        	call	_USART_ITConfig
 144  0079 5b03          	addw	sp,#3
 145                     ; 39     USART_Cmd(SETX_UP_UART, ENABLE); 
 147  007b 4b01          	push	#1
 148  007d ae5230        	ldw	x,#21040
 149  0080 cd0000        	call	_USART_Cmd
 151  0083 9a            	rim	
 152  0084 84            	pop	a
 153                     ; 40     enableInterrupts();
 157                     ; 41 }
 161  0085 81            	ret	
 188                     ; 43 INTERRUPT void UP_UART_RX_IRQHandler(void)
 188                     ; 44 {
 190                     .text:	section	.text,new
 191  0000               f_UP_UART_RX_IRQHandler:
 194  0000 3b0002        	push	c_x+2
 195  0003 be00          	ldw	x,c_x
 196  0005 89            	pushw	x
 197  0006 3b0002        	push	c_y+2
 198  0009 be00          	ldw	x,c_y
 199  000b 89            	pushw	x
 202                     ; 45 	if(SET == USART_GetITStatus(SETX_UP_UART, USART_IT_RXNE)) 
 204  000c ae0255        	ldw	x,#597
 205  000f 89            	pushw	x
 206  0010 ae5230        	ldw	x,#21040
 207  0013 cd0000        	call	_USART_GetITStatus
 209  0016 4a            	dec	a
 210  0017 85            	popw	x
 211  0018 261e          	jrne	L13
 212                     ; 47 		tUartRecCtrl.u8RecSta = UART_RCV_STA_RCVING;
 214  001a 3501002d      	mov	_tUartRecCtrl+22,#1
 215                     ; 48 		if(UART_RCV_MAX_LONG > tUartRecCtrl.u16Len)
 217  001e be2b          	ldw	x,_tUartRecCtrl+20
 218  0020 a30014        	cpw	x,#20
 219  0023 240f          	jruge	L33
 220                     ; 50 			tUartRecCtrl.u8Buf[tUartRecCtrl.u16Len] = USART_ReceiveData8(SETX_UP_UART);
 222  0025 ae5230        	ldw	x,#21040
 223  0028 cd0000        	call	_USART_ReceiveData8
 225  002b be2b          	ldw	x,_tUartRecCtrl+20
 226  002d e717          	ld	(_tUartRecCtrl,x),a
 227                     ; 51 			tUartRecCtrl.u16Len ++;
 229  002f 5c            	incw	x
 230  0030 bf2b          	ldw	_tUartRecCtrl+20,x
 232  0032 2004          	jra	L13
 233  0034               L33:
 234                     ; 55 			tUartRecCtrl.u8RecSta = UART_RCV_STA_ERROR;
 236  0034 3503002d      	mov	_tUartRecCtrl+22,#3
 237  0038               L13:
 238                     ; 58 }
 241  0038 85            	popw	x
 242  0039 bf00          	ldw	c_y,x
 243  003b 320002        	pop	c_y+2
 244  003e 85            	popw	x
 245  003f bf00          	ldw	c_x,x
 246  0041 320002        	pop	c_x+2
 247  0044 80            	iret	
 301                     ; 61 uint16 UpUartSendStr(uint8 *pu8Data, uint16 u16Len)
 301                     ; 62 {
 303                     .text:	section	.text,new
 304  0000               _UpUartSendStr:
 306  0000 89            	pushw	x
 307  0001 89            	pushw	x
 308       00000002      OFST:	set	2
 311                     ; 65 	for(i = 0; i < u16Len; i++)
 313  0002 5f            	clrw	x
 315  0003 201f          	jra	L17
 316  0005               L56:
 317                     ; 67 		USART_SendData8(SETX_UP_UART, *(pu8Data + i));
 319  0005 1e03          	ldw	x,(OFST+1,sp)
 320  0007 72fb01        	addw	x,(OFST-1,sp)
 321  000a f6            	ld	a,(x)
 322  000b 88            	push	a
 323  000c ae5230        	ldw	x,#21040
 324  000f cd0000        	call	_USART_SendData8
 326  0012 84            	pop	a
 328  0013               L77:
 329                     ; 69         while(USART_GetFlagStatus(SETX_UP_UART, USART_FLAG_TC) == RESET);
 331  0013 ae0040        	ldw	x,#64
 332  0016 89            	pushw	x
 333  0017 ae5230        	ldw	x,#21040
 334  001a cd0000        	call	_USART_GetFlagStatus
 336  001d 4d            	tnz	a
 337  001e 85            	popw	x
 338  001f 27f2          	jreq	L77
 339                     ; 65 	for(i = 0; i < u16Len; i++)
 341  0021 1e01          	ldw	x,(OFST-1,sp)
 342  0023 5c            	incw	x
 343  0024               L17:
 344  0024 1f01          	ldw	(OFST-1,sp),x
 347  0026 1307          	cpw	x,(OFST+5,sp)
 348  0028 25db          	jrult	L56
 349                     ; 72 	return i;
 353  002a 5b04          	addw	sp,#4
 354  002c 81            	ret	
 391                     ; 76 uint16 UpUartSendDoJob(void)
 391                     ; 77 {
 392                     .text:	section	.text,new
 393  0000               _UpUartSendDoJob:
 395  0000 89            	pushw	x
 396       00000002      OFST:	set	2
 399                     ; 80 	if(UART_SEND_STA_WAITING == tUartSendCtrl.u8SendSta)
 401  0001 b616          	ld	a,_tUartSendCtrl+22
 402  0003 4a            	dec	a
 403  0004 262a          	jrne	L121
 404                     ; 82 		tUartSendCtrl.u8SendSta = UART_SEND_STA_SENDING;
 406  0006 35020016      	mov	_tUartSendCtrl+22,#2
 407                     ; 83 		for(i = 0; i < tUartSendCtrl.u16Len; i++)
 409  000a 5f            	clrw	x
 411  000b 201b          	jra	L721
 412  000d               L321:
 413                     ; 85 			USART_SendData8(SETX_UP_UART, tUartSendCtrl.u8Buf[i]);
 415  000d e600          	ld	a,(_tUartSendCtrl,x)
 416  000f 88            	push	a
 417  0010 ae5230        	ldw	x,#21040
 418  0013 cd0000        	call	_USART_SendData8
 420  0016 84            	pop	a
 422  0017               L531:
 423                     ; 87 	        while(USART_GetFlagStatus(SETX_UP_UART, USART_FLAG_TC) == RESET);
 425  0017 ae0040        	ldw	x,#64
 426  001a 89            	pushw	x
 427  001b ae5230        	ldw	x,#21040
 428  001e cd0000        	call	_USART_GetFlagStatus
 430  0021 4d            	tnz	a
 431  0022 85            	popw	x
 432  0023 27f2          	jreq	L531
 433                     ; 83 		for(i = 0; i < tUartSendCtrl.u16Len; i++)
 435  0025 1e01          	ldw	x,(OFST-1,sp)
 436  0027 5c            	incw	x
 437  0028               L721:
 438  0028 1f01          	ldw	(OFST-1,sp),x
 441  002a b314          	cpw	x,_tUartSendCtrl+20
 442  002c 25df          	jrult	L321
 443                     ; 90 		tUartSendCtrl.u8SendSta = UART_SEND_STA_IDLE;
 445  002e 3f16          	clr	_tUartSendCtrl+22
 446  0030               L121:
 447                     ; 93 	return i;
 449  0030 1e01          	ldw	x,(OFST-1,sp)
 452  0032 5b02          	addw	sp,#2
 453  0034 81            	ret	
 488                     ; 98 uint16 UpUartRcv(uint8 *pu8Data)
 488                     ; 99 {
 489                     .text:	section	.text,new
 490  0000               _UpUartRcv:
 494                     ; 101 }
 497  0000 81            	ret	
 594                     	xdef	_UpUartRcv
 595                     	xdef	f_UP_UART_RX_IRQHandler
 596                     	switch	.ubsct
 597  0000               _tUartSendCtrl:
 598  0000 000000000000  	ds.b	23
 599                     	xdef	_tUartSendCtrl
 600  0017               _tUartRecCtrl:
 601  0017 000000000000  	ds.b	23
 602                     	xdef	_tUartRecCtrl
 603                     	xdef	_UpUartSendDoJob
 604                     	xdef	_UpUartSendStr
 605                     	xdef	_UpUartInit
 606                     	xref	_USART_GetITStatus
 607                     	xref	_USART_GetFlagStatus
 608                     	xref	_USART_ITConfig
 609                     	xref	_USART_ReceiveData8
 610                     	xref	_USART_SendData8
 611                     	xref	_USART_Cmd
 612                     	xref	_USART_Init
 613                     	xref	_USART_DeInit
 614                     	xref	_SYSCFG_REMAPPinConfig
 615                     	xref	_SYSCFG_REMAPDeInit
 616                     	xref	_GPIO_ExternalPullUpConfig
 617                     	xref	_GPIO_Init
 618                     	xref	_CLK_PeripheralClockConfig
 619                     	xref	_memset
 620                     	xref.b	c_x
 621                     	xref.b	c_y
 641                     	end
