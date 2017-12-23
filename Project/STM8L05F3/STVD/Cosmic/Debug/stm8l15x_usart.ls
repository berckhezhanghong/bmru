   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
 153                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
 153                     ; 149 {
 154                     .text:	section	.text,new
 155  0000               f_USART_DeInit:
 157  0000 89            	pushw	x
 158       00000000      OFST:	set	0
 161                     ; 153   (void) USARTx->SR;
 163  0001 f6            	ld	a,(x)
 164                     ; 154   (void) USARTx->DR;
 166  0002 1e01          	ldw	x,(OFST+1,sp)
 167  0004 e601          	ld	a,(1,x)
 168                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 170  0006 6f03          	clr	(3,x)
 171                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 173  0008 6f02          	clr	(2,x)
 174                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 176  000a 6f04          	clr	(4,x)
 177                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 179  000c 6f05          	clr	(5,x)
 180                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 182  000e 6f06          	clr	(6,x)
 183                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 185  0010 6f07          	clr	(7,x)
 186                     ; 163 }
 189  0012 85            	popw	x
 190  0013 87            	retf	
 377                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 377                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 377                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 377                     ; 195 {
 378                     .text:	section	.text,new
 379  0000               f_USART_Init:
 381  0000 89            	pushw	x
 382  0001 5204          	subw	sp,#4
 383       00000004      OFST:	set	4
 386                     ; 196   uint32_t BaudRate_Mantissa = 0;
 388  0003 5f            	clrw	x
 389  0004 1f03          	ldw	(OFST-1,sp),x
 390  0006 1f01          	ldw	(OFST-3,sp),x
 391                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
 393                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 395                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
 397                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
 399                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
 401                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 403  0008 1e05          	ldw	x,(OFST+1,sp)
 404  000a e604          	ld	a,(4,x)
 405  000c a4e9          	and	a,#233
 406  000e e704          	ld	(4,x),a
 407                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 409  0010 7b0e          	ld	a,(OFST+10,sp)
 410  0012 1a10          	or	a,(OFST+12,sp)
 411  0014 ea04          	or	a,(4,x)
 412  0016 e704          	ld	(4,x),a
 413                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 415  0018 e606          	ld	a,(6,x)
 416  001a a4cf          	and	a,#207
 417  001c e706          	ld	(6,x),a
 418                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
 420  001e e606          	ld	a,(6,x)
 421  0020 1a0f          	or	a,(OFST+11,sp)
 422  0022 e706          	ld	(6,x),a
 423                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 425  0024 6f02          	clr	(2,x)
 426                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 428  0026 e603          	ld	a,(3,x)
 429  0028 a40f          	and	a,#15
 430  002a e703          	ld	(3,x),a
 431                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 433  002c e603          	ld	a,(3,x)
 434  002e a4f0          	and	a,#240
 435  0030 e703          	ld	(3,x),a
 436                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 438  0032 8d000000      	callf	f_CLK_GetClockFreq
 440  0036 96            	ldw	x,sp
 441  0037 1c000a        	addw	x,#OFST+6
 442  003a 8d000000      	callf	d_ludv
 444  003e 96            	ldw	x,sp
 445  003f 5c            	incw	x
 446  0040 8d000000      	callf	d_rtol
 448                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 450  0044 7b03          	ld	a,(OFST-1,sp)
 451  0046 a4f0          	and	a,#240
 452  0048 1e05          	ldw	x,(OFST+1,sp)
 453  004a e703          	ld	(3,x),a
 454                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 456  004c 7b04          	ld	a,(OFST+0,sp)
 457  004e a40f          	and	a,#15
 458  0050 ea03          	or	a,(3,x)
 459  0052 e703          	ld	(3,x),a
 460                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 462  0054 96            	ldw	x,sp
 463  0055 5c            	incw	x
 464  0056 8d000000      	callf	d_ltor
 466  005a a604          	ld	a,#4
 467  005c 8d000000      	callf	d_lursh
 469  0060 b603          	ld	a,c_lreg+3
 470  0062 1e05          	ldw	x,(OFST+1,sp)
 471  0064 e702          	ld	(2,x),a
 472                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 474  0066 e605          	ld	a,(5,x)
 475  0068 a4f3          	and	a,#243
 476  006a e705          	ld	(5,x),a
 477                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 479  006c e605          	ld	a,(5,x)
 480  006e 1a11          	or	a,(OFST+13,sp)
 481  0070 e705          	ld	(5,x),a
 482                     ; 239 }
 485  0072 5b06          	addw	sp,#6
 486  0074 87            	retf	
 645                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 645                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 645                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 645                     ; 267 {
 646                     .text:	section	.text,new
 647  0000               f_USART_ClockInit:
 649  0000 89            	pushw	x
 650       00000000      OFST:	set	0
 653                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 655                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 657                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 659                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 661                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 663  0001 e606          	ld	a,(6,x)
 664  0003 a4f8          	and	a,#248
 665  0005 e706          	ld	(6,x),a
 666                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 668  0007 7b07          	ld	a,(OFST+7,sp)
 669  0009 1a08          	or	a,(OFST+8,sp)
 670  000b 1a09          	or	a,(OFST+9,sp)
 671  000d ea06          	or	a,(6,x)
 672  000f e706          	ld	(6,x),a
 673                     ; 279   if (USART_Clock != USART_Clock_Disable)
 675  0011 7b06          	ld	a,(OFST+6,sp)
 676  0013 2706          	jreq	L123
 677                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 679  0015 e606          	ld	a,(6,x)
 680  0017 aa08          	or	a,#8
 682  0019 2006          	jra	L323
 683  001b               L123:
 684                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 686  001b 1e01          	ldw	x,(OFST+1,sp)
 687  001d e606          	ld	a,(6,x)
 688  001f a4f7          	and	a,#247
 689  0021               L323:
 690  0021 e706          	ld	(6,x),a
 691                     ; 287 }
 694  0023 85            	popw	x
 695  0024 87            	retf	
 761                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 761                     ; 297 {
 762                     .text:	section	.text,new
 763  0000               f_USART_Cmd:
 765  0000 89            	pushw	x
 766       00000000      OFST:	set	0
 769                     ; 298   if (NewState != DISABLE)
 771  0001 7b06          	ld	a,(OFST+6,sp)
 772  0003 2706          	jreq	L163
 773                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 775  0005 e604          	ld	a,(4,x)
 776  0007 a4df          	and	a,#223
 778  0009 2006          	jra	L363
 779  000b               L163:
 780                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 782  000b 1e01          	ldw	x,(OFST+1,sp)
 783  000d e604          	ld	a,(4,x)
 784  000f aa20          	or	a,#32
 785  0011               L363:
 786  0011 e704          	ld	(4,x),a
 787                     ; 306 }
 790  0013 85            	popw	x
 791  0014 87            	retf	
 834                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 834                     ; 330 {
 835                     .text:	section	.text,new
 836  0000               f_USART_SetPrescaler:
 838  0000 89            	pushw	x
 839       00000000      OFST:	set	0
 842                     ; 332   USARTx->PSCR = USART_Prescaler;
 844  0001 7b06          	ld	a,(OFST+6,sp)
 845  0003 1e01          	ldw	x,(OFST+1,sp)
 846  0005 e70a          	ld	(10,x),a
 847                     ; 333 }
 850  0007 85            	popw	x
 851  0008 87            	retf	
 887                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 887                     ; 341 {
 888                     .text:	section	.text,new
 889  0000               f_USART_SendBreak:
 893                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 895  0000 e605          	ld	a,(5,x)
 896  0002 aa01          	or	a,#1
 897  0004 e705          	ld	(5,x),a
 898                     ; 343 }
 901  0006 87            	retf	
 937                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 937                     ; 383 {
 938                     .text:	section	.text,new
 939  0000               f_USART_ReceiveData8:
 943                     ; 384   return USARTx->DR;
 945  0000 e601          	ld	a,(1,x)
 948  0002 87            	retf	
 991                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
 991                     ; 393 {
 992                     .text:	section	.text,new
 993  0000               f_USART_ReceiveData9:
 995  0000 89            	pushw	x
 996  0001 89            	pushw	x
 997       00000002      OFST:	set	2
1000                     ; 394   uint16_t temp = 0;
1002                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1004  0002 1e03          	ldw	x,(OFST+1,sp)
1005  0004 e604          	ld	a,(4,x)
1006  0006 a480          	and	a,#128
1007  0008 5f            	clrw	x
1008  0009 02            	rlwa	x,a
1009  000a 58            	sllw	x
1010  000b 1f01          	ldw	(OFST-1,sp),x
1011                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1013  000d 1e03          	ldw	x,(OFST+1,sp)
1014  000f e601          	ld	a,(1,x)
1015  0011 5f            	clrw	x
1016  0012 97            	ld	xl,a
1017  0013 01            	rrwa	x,a
1018  0014 1a02          	or	a,(OFST+0,sp)
1019  0016 01            	rrwa	x,a
1020  0017 1a01          	or	a,(OFST-1,sp)
1021  0019 a401          	and	a,#1
1022  001b 01            	rrwa	x,a
1025  001c 5b04          	addw	sp,#4
1026  001e 87            	retf	
1069                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1069                     ; 406 {
1070                     .text:	section	.text,new
1071  0000               f_USART_SendData8:
1073  0000 89            	pushw	x
1074       00000000      OFST:	set	0
1077                     ; 408   USARTx->DR = Data;
1079  0001 7b06          	ld	a,(OFST+6,sp)
1080  0003 1e01          	ldw	x,(OFST+1,sp)
1081  0005 e701          	ld	(1,x),a
1082                     ; 409 }
1085  0007 85            	popw	x
1086  0008 87            	retf	
1129                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1129                     ; 419 {
1130                     .text:	section	.text,new
1131  0000               f_USART_SendData9:
1133  0000 89            	pushw	x
1134       00000000      OFST:	set	0
1137                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
1139                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1141  0001 e604          	ld	a,(4,x)
1142  0003 a4bf          	and	a,#191
1143  0005 e704          	ld	(4,x),a
1144                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1146  0007 1606          	ldw	y,(OFST+6,sp)
1147  0009 9054          	srlw	y
1148  000b 9054          	srlw	y
1149  000d 909f          	ld	a,yl
1150  000f a440          	and	a,#64
1151  0011 ea04          	or	a,(4,x)
1152  0013 e704          	ld	(4,x),a
1153                     ; 429   USARTx->DR   = (uint8_t)(Data);
1155  0015 7b07          	ld	a,(OFST+7,sp)
1156  0017 1e01          	ldw	x,(OFST+1,sp)
1157  0019 e701          	ld	(1,x),a
1158                     ; 430 }
1161  001b 85            	popw	x
1162  001c 87            	retf	
1209                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1209                     ; 474 {
1210                     .text:	section	.text,new
1211  0000               f_USART_ReceiverWakeUpCmd:
1213  0000 89            	pushw	x
1214       00000000      OFST:	set	0
1217                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1219                     ; 477   if (NewState != DISABLE)
1221  0001 7b06          	ld	a,(OFST+6,sp)
1222  0003 2706          	jreq	L165
1223                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
1225  0005 e605          	ld	a,(5,x)
1226  0007 aa02          	or	a,#2
1228  0009 2006          	jra	L365
1229  000b               L165:
1230                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1232  000b 1e01          	ldw	x,(OFST+1,sp)
1233  000d e605          	ld	a,(5,x)
1234  000f a4fd          	and	a,#253
1235  0011               L365:
1236  0011 e705          	ld	(5,x),a
1237                     ; 487 }
1240  0013 85            	popw	x
1241  0014 87            	retf	
1284                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1284                     ; 497 {
1285                     .text:	section	.text,new
1286  0000               f_USART_SetAddress:
1288  0000 89            	pushw	x
1289       00000000      OFST:	set	0
1292                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
1294                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1296  0001 e607          	ld	a,(7,x)
1297  0003 a4f0          	and	a,#240
1298  0005 e707          	ld	(7,x),a
1299                     ; 504   USARTx->CR4 |= USART_Address;
1301  0007 e607          	ld	a,(7,x)
1302  0009 1a06          	or	a,(OFST+6,sp)
1303  000b e707          	ld	(7,x),a
1304                     ; 505 }
1307  000d 85            	popw	x
1308  000e 87            	retf	
1376                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1376                     ; 516 {
1377                     .text:	section	.text,new
1378  0000               f_USART_WakeUpConfig:
1380  0000 89            	pushw	x
1381       00000000      OFST:	set	0
1384                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1386                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1388  0001 e604          	ld	a,(4,x)
1389  0003 a4f7          	and	a,#247
1390  0005 e704          	ld	(4,x),a
1391                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1393  0007 e604          	ld	a,(4,x)
1394  0009 1a06          	or	a,(OFST+6,sp)
1395  000b e704          	ld	(4,x),a
1396                     ; 521 }
1399  000d 85            	popw	x
1400  000e 87            	retf	
1447                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1447                     ; 567 {
1448                     .text:	section	.text,new
1449  0000               f_USART_HalfDuplexCmd:
1451  0000 89            	pushw	x
1452       00000000      OFST:	set	0
1455                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1457                     ; 570   if (NewState != DISABLE)
1459  0001 7b06          	ld	a,(OFST+6,sp)
1460  0003 2706          	jreq	L766
1461                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1463  0005 e608          	ld	a,(8,x)
1464  0007 aa08          	or	a,#8
1466  0009 2006          	jra	L176
1467  000b               L766:
1468                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1470  000b 1e01          	ldw	x,(OFST+1,sp)
1471  000d e608          	ld	a,(8,x)
1472  000f a4f7          	and	a,#247
1473  0011               L176:
1474  0011 e708          	ld	(8,x),a
1475                     ; 578 }
1478  0013 85            	popw	x
1479  0014 87            	retf	
1525                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1525                     ; 645 {
1526                     .text:	section	.text,new
1527  0000               f_USART_SmartCardCmd:
1529  0000 89            	pushw	x
1530       00000000      OFST:	set	0
1533                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
1535                     ; 648   if (NewState != DISABLE)
1537  0001 7b06          	ld	a,(OFST+6,sp)
1538  0003 2706          	jreq	L717
1539                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
1541  0005 e608          	ld	a,(8,x)
1542  0007 aa20          	or	a,#32
1544  0009 2006          	jra	L127
1545  000b               L717:
1546                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1548  000b 1e01          	ldw	x,(OFST+1,sp)
1549  000d e608          	ld	a,(8,x)
1550  000f a4df          	and	a,#223
1551  0011               L127:
1552  0011 e708          	ld	(8,x),a
1553                     ; 658 }
1556  0013 85            	popw	x
1557  0014 87            	retf	
1604                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1604                     ; 668 {
1605                     .text:	section	.text,new
1606  0000               f_USART_SmartCardNACKCmd:
1608  0000 89            	pushw	x
1609       00000000      OFST:	set	0
1612                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
1614                     ; 671   if (NewState != DISABLE)
1616  0001 7b06          	ld	a,(OFST+6,sp)
1617  0003 2706          	jreq	L747
1618                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
1620  0005 e608          	ld	a,(8,x)
1621  0007 aa10          	or	a,#16
1623  0009 2006          	jra	L157
1624  000b               L747:
1625                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1627  000b 1e01          	ldw	x,(OFST+1,sp)
1628  000d e608          	ld	a,(8,x)
1629  000f a4ef          	and	a,#239
1630  0011               L157:
1631  0011 e708          	ld	(8,x),a
1632                     ; 681 }
1635  0013 85            	popw	x
1636  0014 87            	retf	
1679                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1679                     ; 691 {
1680                     .text:	section	.text,new
1681  0000               f_USART_SetGuardTime:
1683  0000 89            	pushw	x
1684       00000000      OFST:	set	0
1687                     ; 693   USARTx->GTR = USART_GuardTime;
1689  0001 7b06          	ld	a,(OFST+6,sp)
1690  0003 1e01          	ldw	x,(OFST+1,sp)
1691  0005 e709          	ld	(9,x),a
1692                     ; 694 }
1695  0007 85            	popw	x
1696  0008 87            	retf	
1764                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1764                     ; 752 {
1765                     .text:	section	.text,new
1766  0000               f_USART_IrDAConfig:
1768  0000 89            	pushw	x
1769       00000000      OFST:	set	0
1772                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1774                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
1776  0001 7b06          	ld	a,(OFST+6,sp)
1777  0003 2706          	jreq	L1301
1778                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
1780  0005 e608          	ld	a,(8,x)
1781  0007 aa04          	or	a,#4
1783  0009 2006          	jra	L3301
1784  000b               L1301:
1785                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1787  000b 1e01          	ldw	x,(OFST+1,sp)
1788  000d e608          	ld	a,(8,x)
1789  000f a4fb          	and	a,#251
1790  0011               L3301:
1791  0011 e708          	ld	(8,x),a
1792                     ; 763 }
1795  0013 85            	popw	x
1796  0014 87            	retf	
1842                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1842                     ; 773 {
1843                     .text:	section	.text,new
1844  0000               f_USART_IrDACmd:
1846  0000 89            	pushw	x
1847       00000000      OFST:	set	0
1850                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
1852                     ; 778   if (NewState != DISABLE)
1854  0001 7b06          	ld	a,(OFST+6,sp)
1855  0003 2706          	jreq	L1601
1856                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
1858  0005 e608          	ld	a,(8,x)
1859  0007 aa02          	or	a,#2
1861  0009 2006          	jra	L3601
1862  000b               L1601:
1863                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1865  000b 1e01          	ldw	x,(OFST+1,sp)
1866  000d e608          	ld	a,(8,x)
1867  000f a4fd          	and	a,#253
1868  0011               L3601:
1869  0011 e708          	ld	(8,x),a
1870                     ; 788 }
1873  0013 85            	popw	x
1874  0014 87            	retf	
1950                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
1950                     ; 819                   FunctionalState NewState)
1950                     ; 820 {
1951                     .text:	section	.text,new
1952  0000               f_USART_DMACmd:
1954  0000 89            	pushw	x
1955       00000000      OFST:	set	0
1958                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
1960                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
1962                     ; 825   if (NewState != DISABLE)
1964  0001 7b07          	ld	a,(OFST+7,sp)
1965  0003 2706          	jreq	L5211
1966                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
1968  0005 e608          	ld	a,(8,x)
1969  0007 1a06          	or	a,(OFST+6,sp)
1971  0009 2007          	jra	L7211
1972  000b               L5211:
1973                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
1975  000b 1e01          	ldw	x,(OFST+1,sp)
1976  000d 7b06          	ld	a,(OFST+6,sp)
1977  000f 43            	cpl	a
1978  0010 e408          	and	a,(8,x)
1979  0012               L7211:
1980  0012 e708          	ld	(8,x),a
1981                     ; 837 }
1984  0014 85            	popw	x
1985  0015 87            	retf	
2124                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2124                     ; 940 {
2125                     .text:	section	.text,new
2126  0000               f_USART_ITConfig:
2128  0000 89            	pushw	x
2129  0001 89            	pushw	x
2130       00000002      OFST:	set	2
2133                     ; 941   uint8_t usartreg, itpos = 0x00;
2135                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
2137                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
2139                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2141  0002 7b08          	ld	a,(OFST+6,sp)
2142  0004 6b01          	ld	(OFST-1,sp),a
2143                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2145  0006 7b09          	ld	a,(OFST+7,sp)
2146  0008 a40f          	and	a,#15
2147  000a 5f            	clrw	x
2148  000b 97            	ld	xl,a
2149  000c a601          	ld	a,#1
2150  000e 5d            	tnzw	x
2151  000f 2704          	jreq	L06
2152  0011               L26:
2153  0011 48            	sll	a
2154  0012 5a            	decw	x
2155  0013 26fc          	jrne	L26
2156  0015               L06:
2157  0015 6b02          	ld	(OFST+0,sp),a
2158                     ; 950   if (NewState != DISABLE)
2160  0017 7b0a          	ld	a,(OFST+8,sp)
2161  0019 2722          	jreq	L3121
2162                     ; 953     if (usartreg == 0x01)
2164  001b 7b01          	ld	a,(OFST-1,sp)
2165  001d a101          	cp	a,#1
2166  001f 2608          	jrne	L5121
2167                     ; 955       USARTx->CR1 |= itpos;
2169  0021 1e03          	ldw	x,(OFST+1,sp)
2170  0023 e604          	ld	a,(4,x)
2171  0025 1a02          	or	a,(OFST+0,sp)
2173  0027 2021          	jpf	LC002
2174  0029               L5121:
2175                     ; 957     else if (usartreg == 0x05)
2177  0029 a105          	cp	a,#5
2178  002b 2608          	jrne	L1221
2179                     ; 959       USARTx->CR5 |= itpos;
2181  002d 1e03          	ldw	x,(OFST+1,sp)
2182  002f e608          	ld	a,(8,x)
2183  0031 1a02          	or	a,(OFST+0,sp)
2185  0033 2024          	jpf	LC003
2186  0035               L1221:
2187                     ; 964       USARTx->CR2 |= itpos;
2189  0035 1e03          	ldw	x,(OFST+1,sp)
2190  0037 e605          	ld	a,(5,x)
2191  0039 1a02          	or	a,(OFST+0,sp)
2192  003b 2027          	jpf	LC001
2193  003d               L3121:
2194                     ; 970     if (usartreg == 0x01)
2196  003d 7b01          	ld	a,(OFST-1,sp)
2197  003f a101          	cp	a,#1
2198  0041 260b          	jrne	L7221
2199                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
2201  0043 1e03          	ldw	x,(OFST+1,sp)
2202  0045 7b02          	ld	a,(OFST+0,sp)
2203  0047 43            	cpl	a
2204  0048 e404          	and	a,(4,x)
2205  004a               LC002:
2206  004a e704          	ld	(4,x),a
2208  004c 2018          	jra	L5221
2209  004e               L7221:
2210                     ; 974     else if (usartreg == 0x05)
2212  004e a105          	cp	a,#5
2213  0050 260b          	jrne	L3321
2214                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
2216  0052 1e03          	ldw	x,(OFST+1,sp)
2217  0054 7b02          	ld	a,(OFST+0,sp)
2218  0056 43            	cpl	a
2219  0057 e408          	and	a,(8,x)
2220  0059               LC003:
2221  0059 e708          	ld	(8,x),a
2223  005b 2009          	jra	L5221
2224  005d               L3321:
2225                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
2227  005d 1e03          	ldw	x,(OFST+1,sp)
2228  005f 7b02          	ld	a,(OFST+0,sp)
2229  0061 43            	cpl	a
2230  0062 e405          	and	a,(5,x)
2231  0064               LC001:
2232  0064 e705          	ld	(5,x),a
2233  0066               L5221:
2234                     ; 984 }
2237  0066 5b04          	addw	sp,#4
2238  0068 87            	retf	
2385                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2385                     ; 1003 {
2386                     .text:	section	.text,new
2387  0000               f_USART_GetFlagStatus:
2389  0000 89            	pushw	x
2390  0001 88            	push	a
2391       00000001      OFST:	set	1
2394                     ; 1004   FlagStatus status = RESET;
2396  0002 0f01          	clr	(OFST+0,sp)
2397                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
2399                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
2401  0004 1e07          	ldw	x,(OFST+6,sp)
2402  0006 a30101        	cpw	x,#257
2403  0009 260a          	jrne	L5231
2404                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2406  000b 1e02          	ldw	x,(OFST+1,sp)
2407  000d e605          	ld	a,(5,x)
2408  000f 1508          	bcp	a,(OFST+7,sp)
2409  0011 270d          	jreq	L5331
2410                     ; 1014       status = SET;
2412  0013 2007          	jpf	LC005
2413                     ; 1019       status = RESET;
2414  0015               L5231:
2415                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2417  0015 1e02          	ldw	x,(OFST+1,sp)
2418  0017 f6            	ld	a,(x)
2419  0018 1508          	bcp	a,(OFST+7,sp)
2420  001a 2704          	jreq	L5331
2421                     ; 1027       status = SET;
2423  001c               LC005:
2425  001c a601          	ld	a,#1
2427  001e 2001          	jra	L3331
2428  0020               L5331:
2429                     ; 1032       status = RESET;
2432  0020 4f            	clr	a
2433  0021               L3331:
2434                     ; 1036   return status;
2438  0021 5b03          	addw	sp,#3
2439  0023 87            	retf	
2485                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2485                     ; 1061 {
2486                     .text:	section	.text,new
2487  0000               f_USART_ClearFlag:
2489  0000 89            	pushw	x
2490       00000000      OFST:	set	0
2493                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2495                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2497  0001 7b07          	ld	a,(OFST+7,sp)
2498  0003 43            	cpl	a
2499  0004 1e01          	ldw	x,(OFST+1,sp)
2500  0006 f7            	ld	(x),a
2501                     ; 1066 }
2504  0007 85            	popw	x
2505  0008 87            	retf	
2597                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2597                     ; 1084 {
2598                     .text:	section	.text,new
2599  0000               f_USART_GetITStatus:
2601  0000 89            	pushw	x
2602  0001 5203          	subw	sp,#3
2603       00000003      OFST:	set	3
2606                     ; 1085   ITStatus pendingbitstatus = RESET;
2608                     ; 1086   uint8_t temp = 0;
2610                     ; 1087   uint8_t itpos = 0;
2612                     ; 1088   uint8_t itmask1 = 0;
2614                     ; 1089   uint8_t itmask2 = 0;
2616                     ; 1090   uint8_t enablestatus = 0;
2618                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
2620                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2622  0003 7b0a          	ld	a,(OFST+7,sp)
2623  0005 a40f          	and	a,#15
2624  0007 5f            	clrw	x
2625  0008 97            	ld	xl,a
2626  0009 a601          	ld	a,#1
2627  000b 5d            	tnzw	x
2628  000c 2704          	jreq	L27
2629  000e               L47:
2630  000e 48            	sll	a
2631  000f 5a            	decw	x
2632  0010 26fc          	jrne	L47
2633  0012               L27:
2634  0012 6b02          	ld	(OFST-1,sp),a
2635                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2637  0014 7b0a          	ld	a,(OFST+7,sp)
2638  0016 4e            	swap	a
2639  0017 a40f          	and	a,#15
2640  0019 6b03          	ld	(OFST+0,sp),a
2641                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2643  001b 5f            	clrw	x
2644  001c 97            	ld	xl,a
2645  001d a601          	ld	a,#1
2646  001f 5d            	tnzw	x
2647  0020 2704          	jreq	L67
2648  0022               L001:
2649  0022 48            	sll	a
2650  0023 5a            	decw	x
2651  0024 26fc          	jrne	L001
2652  0026               L67:
2653  0026 6b03          	ld	(OFST+0,sp),a
2654                     ; 1103   if (USART_IT == USART_IT_PE)
2656  0028 1e09          	ldw	x,(OFST+6,sp)
2657  002a a30100        	cpw	x,#256
2658  002d 2611          	jrne	L7241
2659                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2661  002f 1e04          	ldw	x,(OFST+1,sp)
2662  0031 e604          	ld	a,(4,x)
2663  0033 1403          	and	a,(OFST+0,sp)
2664  0035 6b03          	ld	(OFST+0,sp),a
2665                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2667  0037 f6            	ld	a,(x)
2668  0038 1502          	bcp	a,(OFST-1,sp)
2669  003a 2739          	jreq	L1541
2671  003c 7b03          	ld	a,(OFST+0,sp)
2672                     ; 1112       pendingbitstatus = SET;
2674  003e 201e          	jpf	LC008
2675                     ; 1117       pendingbitstatus = RESET;
2676  0040               L7241:
2677                     ; 1121   else if (USART_IT == USART_IT_OR)
2679  0040 a30235        	cpw	x,#565
2680  0043 261f          	jrne	L7341
2681                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2683  0045 1e04          	ldw	x,(OFST+1,sp)
2684  0047 e605          	ld	a,(5,x)
2685  0049 1403          	and	a,(OFST+0,sp)
2686  004b 6b03          	ld	(OFST+0,sp),a
2687                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2689  004d e608          	ld	a,(8,x)
2690  004f a401          	and	a,#1
2691  0051 6b01          	ld	(OFST-2,sp),a
2692                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2694  0053 f6            	ld	a,(x)
2695  0054 1502          	bcp	a,(OFST-1,sp)
2696  0056 271d          	jreq	L1541
2698  0058 7b03          	ld	a,(OFST+0,sp)
2699  005a 2604          	jrne	L3441
2701  005c 7b01          	ld	a,(OFST-2,sp)
2702  005e               LC008:
2703  005e 2715          	jreq	L1541
2704  0060               L3441:
2705                     ; 1132       pendingbitstatus = SET;
2709  0060 a601          	ld	a,#1
2711  0062 2012          	jra	L5341
2712                     ; 1137       pendingbitstatus = RESET;
2713  0064               L7341:
2714                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2716  0064 1e04          	ldw	x,(OFST+1,sp)
2717  0066 e605          	ld	a,(5,x)
2718  0068 1403          	and	a,(OFST+0,sp)
2719  006a 6b03          	ld	(OFST+0,sp),a
2720                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2722  006c f6            	ld	a,(x)
2723  006d 1502          	bcp	a,(OFST-1,sp)
2724  006f 2704          	jreq	L1541
2726  0071 7b03          	ld	a,(OFST+0,sp)
2727                     ; 1149       pendingbitstatus = SET;
2729  0073 26eb          	jrne	L3441
2730  0075               L1541:
2731                     ; 1154       pendingbitstatus = RESET;
2735  0075 4f            	clr	a
2736  0076               L5341:
2737                     ; 1159   return  pendingbitstatus;
2741  0076 5b05          	addw	sp,#5
2742  0078 87            	retf	
2779                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2779                     ; 1184 {
2780                     .text:	section	.text,new
2781  0000               f_USART_ClearITPendingBit:
2785                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
2787                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2789  0000 f6            	ld	a,(x)
2790  0001 a4bf          	and	a,#191
2791  0003 f7            	ld	(x),a
2792                     ; 1189 }
2795  0004 87            	retf	
2807                     	xdef	f_USART_ClearITPendingBit
2808                     	xdef	f_USART_GetITStatus
2809                     	xdef	f_USART_ClearFlag
2810                     	xdef	f_USART_GetFlagStatus
2811                     	xdef	f_USART_ITConfig
2812                     	xdef	f_USART_DMACmd
2813                     	xdef	f_USART_IrDACmd
2814                     	xdef	f_USART_IrDAConfig
2815                     	xdef	f_USART_SetGuardTime
2816                     	xdef	f_USART_SmartCardNACKCmd
2817                     	xdef	f_USART_SmartCardCmd
2818                     	xdef	f_USART_HalfDuplexCmd
2819                     	xdef	f_USART_SetAddress
2820                     	xdef	f_USART_ReceiverWakeUpCmd
2821                     	xdef	f_USART_WakeUpConfig
2822                     	xdef	f_USART_ReceiveData9
2823                     	xdef	f_USART_ReceiveData8
2824                     	xdef	f_USART_SendData9
2825                     	xdef	f_USART_SendData8
2826                     	xdef	f_USART_SendBreak
2827                     	xdef	f_USART_SetPrescaler
2828                     	xdef	f_USART_Cmd
2829                     	xdef	f_USART_ClockInit
2830                     	xdef	f_USART_Init
2831                     	xdef	f_USART_DeInit
2832                     	xref	f_CLK_GetClockFreq
2833                     	xref.b	c_lreg
2852                     	xref	d_lursh
2853                     	xref	d_ltor
2854                     	xref	d_rtol
2855                     	xref	d_ludv
2856                     	end
