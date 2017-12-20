   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
 153                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
 153                     ; 149 {
 155                     .text:	section	.text,new
 156  0000               _USART_DeInit:
 158  0000 89            	pushw	x
 159       00000000      OFST:	set	0
 162                     ; 153   (void) USARTx->SR;
 164  0001 f6            	ld	a,(x)
 165                     ; 154   (void) USARTx->DR;
 167  0002 1e01          	ldw	x,(OFST+1,sp)
 168  0004 e601          	ld	a,(1,x)
 169                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 171  0006 6f03          	clr	(3,x)
 172                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 174  0008 6f02          	clr	(2,x)
 175                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 177  000a 6f04          	clr	(4,x)
 178                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 180  000c 6f05          	clr	(5,x)
 181                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 183  000e 6f06          	clr	(6,x)
 184                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 186  0010 6f07          	clr	(7,x)
 187                     ; 163 }
 190  0012 85            	popw	x
 191  0013 81            	ret	
 383                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 383                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 383                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 383                     ; 195 {
 384                     .text:	section	.text,new
 385  0000               _USART_Init:
 387  0000 89            	pushw	x
 388  0001 5204          	subw	sp,#4
 389       00000004      OFST:	set	4
 392                     ; 196   uint32_t BaudRate_Mantissa = 0;
 394  0003 5f            	clrw	x
 395  0004 1f03          	ldw	(OFST-1,sp),x
 396  0006 1f01          	ldw	(OFST-3,sp),x
 397                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
 399                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 401                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
 403                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
 405                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
 407                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 409  0008 1e05          	ldw	x,(OFST+1,sp)
 410  000a e604          	ld	a,(4,x)
 411  000c a4e9          	and	a,#233
 412  000e e704          	ld	(4,x),a
 413                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 415  0010 7b0d          	ld	a,(OFST+9,sp)
 416  0012 1a0f          	or	a,(OFST+11,sp)
 417  0014 ea04          	or	a,(4,x)
 418  0016 e704          	ld	(4,x),a
 419                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 421  0018 e606          	ld	a,(6,x)
 422  001a a4cf          	and	a,#207
 423  001c e706          	ld	(6,x),a
 424                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
 426  001e e606          	ld	a,(6,x)
 427  0020 1a0e          	or	a,(OFST+10,sp)
 428  0022 e706          	ld	(6,x),a
 429                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 431  0024 6f02          	clr	(2,x)
 432                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 434  0026 e603          	ld	a,(3,x)
 435  0028 a40f          	and	a,#15
 436  002a e703          	ld	(3,x),a
 437                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 439  002c e603          	ld	a,(3,x)
 440  002e a4f0          	and	a,#240
 441  0030 e703          	ld	(3,x),a
 442                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 444  0032 cd0000        	call	_CLK_GetClockFreq
 446  0035 96            	ldw	x,sp
 447  0036 1c0009        	addw	x,#OFST+5
 448  0039 cd0000        	call	c_ludv
 450  003c 96            	ldw	x,sp
 451  003d 5c            	incw	x
 452  003e cd0000        	call	c_rtol
 454                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 456  0041 7b03          	ld	a,(OFST-1,sp)
 457  0043 a4f0          	and	a,#240
 458  0045 1e05          	ldw	x,(OFST+1,sp)
 459  0047 e703          	ld	(3,x),a
 460                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 462  0049 7b04          	ld	a,(OFST+0,sp)
 463  004b a40f          	and	a,#15
 464  004d ea03          	or	a,(3,x)
 465  004f e703          	ld	(3,x),a
 466                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 468  0051 96            	ldw	x,sp
 469  0052 5c            	incw	x
 470  0053 cd0000        	call	c_ltor
 472  0056 a604          	ld	a,#4
 473  0058 cd0000        	call	c_lursh
 475  005b b603          	ld	a,c_lreg+3
 476  005d 1e05          	ldw	x,(OFST+1,sp)
 477  005f e702          	ld	(2,x),a
 478                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 480  0061 e605          	ld	a,(5,x)
 481  0063 a4f3          	and	a,#243
 482  0065 e705          	ld	(5,x),a
 483                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 485  0067 e605          	ld	a,(5,x)
 486  0069 1a10          	or	a,(OFST+12,sp)
 487  006b e705          	ld	(5,x),a
 488                     ; 239 }
 491  006d 5b06          	addw	sp,#6
 492  006f 81            	ret	
 652                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 652                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 652                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 652                     ; 267 {
 653                     .text:	section	.text,new
 654  0000               _USART_ClockInit:
 656  0000 89            	pushw	x
 657       00000000      OFST:	set	0
 660                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 662                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 664                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 666                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 668                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 670  0001 e606          	ld	a,(6,x)
 671  0003 a4f8          	and	a,#248
 672  0005 e706          	ld	(6,x),a
 673                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 675  0007 7b06          	ld	a,(OFST+6,sp)
 676  0009 1a07          	or	a,(OFST+7,sp)
 677  000b 1a08          	or	a,(OFST+8,sp)
 678  000d ea06          	or	a,(6,x)
 679  000f e706          	ld	(6,x),a
 680                     ; 279   if (USART_Clock != USART_Clock_Disable)
 682  0011 7b05          	ld	a,(OFST+5,sp)
 683  0013 2706          	jreq	L523
 684                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 686  0015 e606          	ld	a,(6,x)
 687  0017 aa08          	or	a,#8
 689  0019 2006          	jra	L723
 690  001b               L523:
 691                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 693  001b 1e01          	ldw	x,(OFST+1,sp)
 694  001d e606          	ld	a,(6,x)
 695  001f a4f7          	and	a,#247
 696  0021               L723:
 697  0021 e706          	ld	(6,x),a
 698                     ; 287 }
 701  0023 85            	popw	x
 702  0024 81            	ret	
 769                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 769                     ; 297 {
 770                     .text:	section	.text,new
 771  0000               _USART_Cmd:
 773  0000 89            	pushw	x
 774       00000000      OFST:	set	0
 777                     ; 298   if (NewState != DISABLE)
 779  0001 7b05          	ld	a,(OFST+5,sp)
 780  0003 2706          	jreq	L563
 781                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 783  0005 e604          	ld	a,(4,x)
 784  0007 a4df          	and	a,#223
 786  0009 2006          	jra	L763
 787  000b               L563:
 788                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 790  000b 1e01          	ldw	x,(OFST+1,sp)
 791  000d e604          	ld	a,(4,x)
 792  000f aa20          	or	a,#32
 793  0011               L763:
 794  0011 e704          	ld	(4,x),a
 795                     ; 306 }
 798  0013 85            	popw	x
 799  0014 81            	ret	
 845                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 845                     ; 330 {
 846                     .text:	section	.text,new
 847  0000               _USART_SetPrescaler:
 849  0000 89            	pushw	x
 850       00000000      OFST:	set	0
 853                     ; 332   USARTx->PSCR = USART_Prescaler;
 855  0001 7b05          	ld	a,(OFST+5,sp)
 856  0003 1e01          	ldw	x,(OFST+1,sp)
 857  0005 e70a          	ld	(10,x),a
 858                     ; 333 }
 861  0007 85            	popw	x
 862  0008 81            	ret	
 899                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 899                     ; 341 {
 900                     .text:	section	.text,new
 901  0000               _USART_SendBreak:
 905                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 907  0000 e605          	ld	a,(5,x)
 908  0002 aa01          	or	a,#1
 909  0004 e705          	ld	(5,x),a
 910                     ; 343 }
 913  0006 81            	ret	
 950                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 950                     ; 383 {
 951                     .text:	section	.text,new
 952  0000               _USART_ReceiveData8:
 956                     ; 384   return USARTx->DR;
 958  0000 e601          	ld	a,(1,x)
 961  0002 81            	ret	
1007                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1007                     ; 393 {
1008                     .text:	section	.text,new
1009  0000               _USART_ReceiveData9:
1011  0000 89            	pushw	x
1012  0001 89            	pushw	x
1013       00000002      OFST:	set	2
1016                     ; 394   uint16_t temp = 0;
1018                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1020  0002 1e03          	ldw	x,(OFST+1,sp)
1021  0004 e604          	ld	a,(4,x)
1022  0006 a480          	and	a,#128
1023  0008 5f            	clrw	x
1024  0009 02            	rlwa	x,a
1025  000a 58            	sllw	x
1026  000b 1f01          	ldw	(OFST-1,sp),x
1027                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1029  000d 1e03          	ldw	x,(OFST+1,sp)
1030  000f e601          	ld	a,(1,x)
1031  0011 5f            	clrw	x
1032  0012 97            	ld	xl,a
1033  0013 01            	rrwa	x,a
1034  0014 1a02          	or	a,(OFST+0,sp)
1035  0016 01            	rrwa	x,a
1036  0017 1a01          	or	a,(OFST-1,sp)
1037  0019 a401          	and	a,#1
1038  001b 01            	rrwa	x,a
1041  001c 5b04          	addw	sp,#4
1042  001e 81            	ret	
1088                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1088                     ; 406 {
1089                     .text:	section	.text,new
1090  0000               _USART_SendData8:
1092  0000 89            	pushw	x
1093       00000000      OFST:	set	0
1096                     ; 408   USARTx->DR = Data;
1098  0001 7b05          	ld	a,(OFST+5,sp)
1099  0003 1e01          	ldw	x,(OFST+1,sp)
1100  0005 e701          	ld	(1,x),a
1101                     ; 409 }
1104  0007 85            	popw	x
1105  0008 81            	ret	
1151                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1151                     ; 419 {
1152                     .text:	section	.text,new
1153  0000               _USART_SendData9:
1155  0000 89            	pushw	x
1156       00000000      OFST:	set	0
1159                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
1161                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1163  0001 e604          	ld	a,(4,x)
1164  0003 a4bf          	and	a,#191
1165  0005 e704          	ld	(4,x),a
1166                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1168  0007 1605          	ldw	y,(OFST+5,sp)
1169  0009 9054          	srlw	y
1170  000b 9054          	srlw	y
1171  000d 909f          	ld	a,yl
1172  000f a440          	and	a,#64
1173  0011 ea04          	or	a,(4,x)
1174  0013 e704          	ld	(4,x),a
1175                     ; 429   USARTx->DR   = (uint8_t)(Data);
1177  0015 7b06          	ld	a,(OFST+6,sp)
1178  0017 1e01          	ldw	x,(OFST+1,sp)
1179  0019 e701          	ld	(1,x),a
1180                     ; 430 }
1183  001b 85            	popw	x
1184  001c 81            	ret	
1232                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1232                     ; 474 {
1233                     .text:	section	.text,new
1234  0000               _USART_ReceiverWakeUpCmd:
1236  0000 89            	pushw	x
1237       00000000      OFST:	set	0
1240                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1242                     ; 477   if (NewState != DISABLE)
1244  0001 7b05          	ld	a,(OFST+5,sp)
1245  0003 2706          	jreq	L575
1246                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
1248  0005 e605          	ld	a,(5,x)
1249  0007 aa02          	or	a,#2
1251  0009 2006          	jra	L775
1252  000b               L575:
1253                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1255  000b 1e01          	ldw	x,(OFST+1,sp)
1256  000d e605          	ld	a,(5,x)
1257  000f a4fd          	and	a,#253
1258  0011               L775:
1259  0011 e705          	ld	(5,x),a
1260                     ; 487 }
1263  0013 85            	popw	x
1264  0014 81            	ret	
1310                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1310                     ; 497 {
1311                     .text:	section	.text,new
1312  0000               _USART_SetAddress:
1314  0000 89            	pushw	x
1315       00000000      OFST:	set	0
1318                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
1320                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1322  0001 e607          	ld	a,(7,x)
1323  0003 a4f0          	and	a,#240
1324  0005 e707          	ld	(7,x),a
1325                     ; 504   USARTx->CR4 |= USART_Address;
1327  0007 e607          	ld	a,(7,x)
1328  0009 1a05          	or	a,(OFST+5,sp)
1329  000b e707          	ld	(7,x),a
1330                     ; 505 }
1333  000d 85            	popw	x
1334  000e 81            	ret	
1403                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1403                     ; 516 {
1404                     .text:	section	.text,new
1405  0000               _USART_WakeUpConfig:
1407  0000 89            	pushw	x
1408       00000000      OFST:	set	0
1411                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1413                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1415  0001 e604          	ld	a,(4,x)
1416  0003 a4f7          	and	a,#247
1417  0005 e704          	ld	(4,x),a
1418                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1420  0007 e604          	ld	a,(4,x)
1421  0009 1a05          	or	a,(OFST+5,sp)
1422  000b e704          	ld	(4,x),a
1423                     ; 521 }
1426  000d 85            	popw	x
1427  000e 81            	ret	
1475                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1475                     ; 567 {
1476                     .text:	section	.text,new
1477  0000               _USART_HalfDuplexCmd:
1479  0000 89            	pushw	x
1480       00000000      OFST:	set	0
1483                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1485                     ; 570   if (NewState != DISABLE)
1487  0001 7b05          	ld	a,(OFST+5,sp)
1488  0003 2706          	jreq	L507
1489                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1491  0005 e608          	ld	a,(8,x)
1492  0007 aa08          	or	a,#8
1494  0009 2006          	jra	L707
1495  000b               L507:
1496                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1498  000b 1e01          	ldw	x,(OFST+1,sp)
1499  000d e608          	ld	a,(8,x)
1500  000f a4f7          	and	a,#247
1501  0011               L707:
1502  0011 e708          	ld	(8,x),a
1503                     ; 578 }
1506  0013 85            	popw	x
1507  0014 81            	ret	
1554                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1554                     ; 645 {
1555                     .text:	section	.text,new
1556  0000               _USART_SmartCardCmd:
1558  0000 89            	pushw	x
1559       00000000      OFST:	set	0
1562                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
1564                     ; 648   if (NewState != DISABLE)
1566  0001 7b05          	ld	a,(OFST+5,sp)
1567  0003 2706          	jreq	L537
1568                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
1570  0005 e608          	ld	a,(8,x)
1571  0007 aa20          	or	a,#32
1573  0009 2006          	jra	L737
1574  000b               L537:
1575                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1577  000b 1e01          	ldw	x,(OFST+1,sp)
1578  000d e608          	ld	a,(8,x)
1579  000f a4df          	and	a,#223
1580  0011               L737:
1581  0011 e708          	ld	(8,x),a
1582                     ; 658 }
1585  0013 85            	popw	x
1586  0014 81            	ret	
1634                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1634                     ; 668 {
1635                     .text:	section	.text,new
1636  0000               _USART_SmartCardNACKCmd:
1638  0000 89            	pushw	x
1639       00000000      OFST:	set	0
1642                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
1644                     ; 671   if (NewState != DISABLE)
1646  0001 7b05          	ld	a,(OFST+5,sp)
1647  0003 2706          	jreq	L567
1648                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
1650  0005 e608          	ld	a,(8,x)
1651  0007 aa10          	or	a,#16
1653  0009 2006          	jra	L767
1654  000b               L567:
1655                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1657  000b 1e01          	ldw	x,(OFST+1,sp)
1658  000d e608          	ld	a,(8,x)
1659  000f a4ef          	and	a,#239
1660  0011               L767:
1661  0011 e708          	ld	(8,x),a
1662                     ; 681 }
1665  0013 85            	popw	x
1666  0014 81            	ret	
1712                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1712                     ; 691 {
1713                     .text:	section	.text,new
1714  0000               _USART_SetGuardTime:
1716  0000 89            	pushw	x
1717       00000000      OFST:	set	0
1720                     ; 693   USARTx->GTR = USART_GuardTime;
1722  0001 7b05          	ld	a,(OFST+5,sp)
1723  0003 1e01          	ldw	x,(OFST+1,sp)
1724  0005 e709          	ld	(9,x),a
1725                     ; 694 }
1728  0007 85            	popw	x
1729  0008 81            	ret	
1798                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1798                     ; 752 {
1799                     .text:	section	.text,new
1800  0000               _USART_IrDAConfig:
1802  0000 89            	pushw	x
1803       00000000      OFST:	set	0
1806                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1808                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
1810  0001 7b05          	ld	a,(OFST+5,sp)
1811  0003 2706          	jreq	L1501
1812                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
1814  0005 e608          	ld	a,(8,x)
1815  0007 aa04          	or	a,#4
1817  0009 2006          	jra	L3501
1818  000b               L1501:
1819                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1821  000b 1e01          	ldw	x,(OFST+1,sp)
1822  000d e608          	ld	a,(8,x)
1823  000f a4fb          	and	a,#251
1824  0011               L3501:
1825  0011 e708          	ld	(8,x),a
1826                     ; 763 }
1829  0013 85            	popw	x
1830  0014 81            	ret	
1877                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1877                     ; 773 {
1878                     .text:	section	.text,new
1879  0000               _USART_IrDACmd:
1881  0000 89            	pushw	x
1882       00000000      OFST:	set	0
1885                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
1887                     ; 778   if (NewState != DISABLE)
1889  0001 7b05          	ld	a,(OFST+5,sp)
1890  0003 2706          	jreq	L1011
1891                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
1893  0005 e608          	ld	a,(8,x)
1894  0007 aa02          	or	a,#2
1896  0009 2006          	jra	L3011
1897  000b               L1011:
1898                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1900  000b 1e01          	ldw	x,(OFST+1,sp)
1901  000d e608          	ld	a,(8,x)
1902  000f a4fd          	and	a,#253
1903  0011               L3011:
1904  0011 e708          	ld	(8,x),a
1905                     ; 788 }
1908  0013 85            	popw	x
1909  0014 81            	ret	
1986                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
1986                     ; 819                   FunctionalState NewState)
1986                     ; 820 {
1987                     .text:	section	.text,new
1988  0000               _USART_DMACmd:
1990  0000 89            	pushw	x
1991       00000000      OFST:	set	0
1994                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
1996                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
1998                     ; 825   if (NewState != DISABLE)
2000  0001 7b06          	ld	a,(OFST+6,sp)
2001  0003 2706          	jreq	L5411
2002                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2004  0005 e608          	ld	a,(8,x)
2005  0007 1a05          	or	a,(OFST+5,sp)
2007  0009 2007          	jra	L7411
2008  000b               L5411:
2009                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2011  000b 1e01          	ldw	x,(OFST+1,sp)
2012  000d 7b05          	ld	a,(OFST+5,sp)
2013  000f 43            	cpl	a
2014  0010 e408          	and	a,(8,x)
2015  0012               L7411:
2016  0012 e708          	ld	(8,x),a
2017                     ; 837 }
2020  0014 85            	popw	x
2021  0015 81            	ret	
2165                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2165                     ; 940 {
2166                     .text:	section	.text,new
2167  0000               _USART_ITConfig:
2169  0000 89            	pushw	x
2170  0001 89            	pushw	x
2171       00000002      OFST:	set	2
2174                     ; 941   uint8_t usartreg, itpos = 0x00;
2176                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
2178                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
2180                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2182  0002 7b07          	ld	a,(OFST+5,sp)
2183  0004 6b01          	ld	(OFST-1,sp),a
2184                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2186  0006 7b08          	ld	a,(OFST+6,sp)
2187  0008 a40f          	and	a,#15
2188  000a 5f            	clrw	x
2189  000b 97            	ld	xl,a
2190  000c a601          	ld	a,#1
2191  000e 5d            	tnzw	x
2192  000f 2704          	jreq	L06
2193  0011               L26:
2194  0011 48            	sll	a
2195  0012 5a            	decw	x
2196  0013 26fc          	jrne	L26
2197  0015               L06:
2198  0015 6b02          	ld	(OFST+0,sp),a
2199                     ; 950   if (NewState != DISABLE)
2201  0017 7b09          	ld	a,(OFST+7,sp)
2202  0019 2722          	jreq	L7321
2203                     ; 953     if (usartreg == 0x01)
2205  001b 7b01          	ld	a,(OFST-1,sp)
2206  001d a101          	cp	a,#1
2207  001f 2608          	jrne	L1421
2208                     ; 955       USARTx->CR1 |= itpos;
2210  0021 1e03          	ldw	x,(OFST+1,sp)
2211  0023 e604          	ld	a,(4,x)
2212  0025 1a02          	or	a,(OFST+0,sp)
2214  0027 2021          	jp	LC002
2215  0029               L1421:
2216                     ; 957     else if (usartreg == 0x05)
2218  0029 a105          	cp	a,#5
2219  002b 2608          	jrne	L5421
2220                     ; 959       USARTx->CR5 |= itpos;
2222  002d 1e03          	ldw	x,(OFST+1,sp)
2223  002f e608          	ld	a,(8,x)
2224  0031 1a02          	or	a,(OFST+0,sp)
2226  0033 2024          	jp	LC003
2227  0035               L5421:
2228                     ; 964       USARTx->CR2 |= itpos;
2230  0035 1e03          	ldw	x,(OFST+1,sp)
2231  0037 e605          	ld	a,(5,x)
2232  0039 1a02          	or	a,(OFST+0,sp)
2233  003b 2027          	jp	LC001
2234  003d               L7321:
2235                     ; 970     if (usartreg == 0x01)
2237  003d 7b01          	ld	a,(OFST-1,sp)
2238  003f a101          	cp	a,#1
2239  0041 260b          	jrne	L3521
2240                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
2242  0043 1e03          	ldw	x,(OFST+1,sp)
2243  0045 7b02          	ld	a,(OFST+0,sp)
2244  0047 43            	cpl	a
2245  0048 e404          	and	a,(4,x)
2246  004a               LC002:
2247  004a e704          	ld	(4,x),a
2249  004c 2018          	jra	L1521
2250  004e               L3521:
2251                     ; 974     else if (usartreg == 0x05)
2253  004e a105          	cp	a,#5
2254  0050 260b          	jrne	L7521
2255                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
2257  0052 1e03          	ldw	x,(OFST+1,sp)
2258  0054 7b02          	ld	a,(OFST+0,sp)
2259  0056 43            	cpl	a
2260  0057 e408          	and	a,(8,x)
2261  0059               LC003:
2262  0059 e708          	ld	(8,x),a
2264  005b 2009          	jra	L1521
2265  005d               L7521:
2266                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
2268  005d 1e03          	ldw	x,(OFST+1,sp)
2269  005f 7b02          	ld	a,(OFST+0,sp)
2270  0061 43            	cpl	a
2271  0062 e405          	and	a,(5,x)
2272  0064               LC001:
2273  0064 e705          	ld	(5,x),a
2274  0066               L1521:
2275                     ; 984 }
2278  0066 5b04          	addw	sp,#4
2279  0068 81            	ret	
2427                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2427                     ; 1003 {
2428                     .text:	section	.text,new
2429  0000               _USART_GetFlagStatus:
2431  0000 89            	pushw	x
2432  0001 88            	push	a
2433       00000001      OFST:	set	1
2436                     ; 1004   FlagStatus status = RESET;
2438  0002 0f01          	clr	(OFST+0,sp)
2439                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
2441                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
2443  0004 1e06          	ldw	x,(OFST+5,sp)
2444  0006 a30101        	cpw	x,#257
2445  0009 260a          	jrne	L1531
2446                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2448  000b 1e02          	ldw	x,(OFST+1,sp)
2449  000d e605          	ld	a,(5,x)
2450  000f 1507          	bcp	a,(OFST+6,sp)
2451  0011 270d          	jreq	L1631
2452                     ; 1014       status = SET;
2454  0013 2007          	jp	LC005
2455                     ; 1019       status = RESET;
2456  0015               L1531:
2457                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2459  0015 1e02          	ldw	x,(OFST+1,sp)
2460  0017 f6            	ld	a,(x)
2461  0018 1507          	bcp	a,(OFST+6,sp)
2462  001a 2704          	jreq	L1631
2463                     ; 1027       status = SET;
2465  001c               LC005:
2467  001c a601          	ld	a,#1
2469  001e 2001          	jra	L7531
2470  0020               L1631:
2471                     ; 1032       status = RESET;
2474  0020 4f            	clr	a
2475  0021               L7531:
2476                     ; 1036   return status;
2480  0021 5b03          	addw	sp,#3
2481  0023 81            	ret	
2528                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2528                     ; 1061 {
2529                     .text:	section	.text,new
2530  0000               _USART_ClearFlag:
2532  0000 89            	pushw	x
2533       00000000      OFST:	set	0
2536                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2538                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2540  0001 7b06          	ld	a,(OFST+6,sp)
2541  0003 43            	cpl	a
2542  0004 1e01          	ldw	x,(OFST+1,sp)
2543  0006 f7            	ld	(x),a
2544                     ; 1066 }
2547  0007 85            	popw	x
2548  0008 81            	ret	
2651                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2651                     ; 1084 {
2652                     .text:	section	.text,new
2653  0000               _USART_GetITStatus:
2655  0000 89            	pushw	x
2656  0001 5203          	subw	sp,#3
2657       00000003      OFST:	set	3
2660                     ; 1085   ITStatus pendingbitstatus = RESET;
2662                     ; 1086   uint8_t temp = 0;
2664                     ; 1087   uint8_t itpos = 0;
2666                     ; 1088   uint8_t itmask1 = 0;
2668                     ; 1089   uint8_t itmask2 = 0;
2670                     ; 1090   uint8_t enablestatus = 0;
2672                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
2674                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2676  0003 7b09          	ld	a,(OFST+6,sp)
2677  0005 a40f          	and	a,#15
2678  0007 5f            	clrw	x
2679  0008 97            	ld	xl,a
2680  0009 a601          	ld	a,#1
2681  000b 5d            	tnzw	x
2682  000c 2704          	jreq	L27
2683  000e               L47:
2684  000e 48            	sll	a
2685  000f 5a            	decw	x
2686  0010 26fc          	jrne	L47
2687  0012               L27:
2688  0012 6b02          	ld	(OFST-1,sp),a
2689                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2691  0014 7b09          	ld	a,(OFST+6,sp)
2692  0016 4e            	swap	a
2693  0017 a40f          	and	a,#15
2694  0019 6b03          	ld	(OFST+0,sp),a
2695                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2697  001b 5f            	clrw	x
2698  001c 97            	ld	xl,a
2699  001d a601          	ld	a,#1
2700  001f 5d            	tnzw	x
2701  0020 2704          	jreq	L67
2702  0022               L001:
2703  0022 48            	sll	a
2704  0023 5a            	decw	x
2705  0024 26fc          	jrne	L001
2706  0026               L67:
2707  0026 6b03          	ld	(OFST+0,sp),a
2708                     ; 1103   if (USART_IT == USART_IT_PE)
2710  0028 1e08          	ldw	x,(OFST+5,sp)
2711  002a a30100        	cpw	x,#256
2712  002d 2611          	jrne	L5641
2713                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2715  002f 1e04          	ldw	x,(OFST+1,sp)
2716  0031 e604          	ld	a,(4,x)
2717  0033 1403          	and	a,(OFST+0,sp)
2718  0035 6b03          	ld	(OFST+0,sp),a
2719                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2721  0037 f6            	ld	a,(x)
2722  0038 1502          	bcp	a,(OFST-1,sp)
2723  003a 2739          	jreq	L7051
2725  003c 7b03          	ld	a,(OFST+0,sp)
2726                     ; 1112       pendingbitstatus = SET;
2728  003e 201e          	jp	LC008
2729                     ; 1117       pendingbitstatus = RESET;
2730  0040               L5641:
2731                     ; 1121   else if (USART_IT == USART_IT_OR)
2733  0040 a30235        	cpw	x,#565
2734  0043 261f          	jrne	L5741
2735                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2737  0045 1e04          	ldw	x,(OFST+1,sp)
2738  0047 e605          	ld	a,(5,x)
2739  0049 1403          	and	a,(OFST+0,sp)
2740  004b 6b03          	ld	(OFST+0,sp),a
2741                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2743  004d e608          	ld	a,(8,x)
2744  004f a401          	and	a,#1
2745  0051 6b01          	ld	(OFST-2,sp),a
2746                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2748  0053 f6            	ld	a,(x)
2749  0054 1502          	bcp	a,(OFST-1,sp)
2750  0056 271d          	jreq	L7051
2752  0058 7b03          	ld	a,(OFST+0,sp)
2753  005a 2604          	jrne	L1051
2755  005c 7b01          	ld	a,(OFST-2,sp)
2756  005e               LC008:
2757  005e 2715          	jreq	L7051
2758  0060               L1051:
2759                     ; 1132       pendingbitstatus = SET;
2763  0060 a601          	ld	a,#1
2765  0062 2012          	jra	L3741
2766                     ; 1137       pendingbitstatus = RESET;
2767  0064               L5741:
2768                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2770  0064 1e04          	ldw	x,(OFST+1,sp)
2771  0066 e605          	ld	a,(5,x)
2772  0068 1403          	and	a,(OFST+0,sp)
2773  006a 6b03          	ld	(OFST+0,sp),a
2774                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2776  006c f6            	ld	a,(x)
2777  006d 1502          	bcp	a,(OFST-1,sp)
2778  006f 2704          	jreq	L7051
2780  0071 7b03          	ld	a,(OFST+0,sp)
2781                     ; 1149       pendingbitstatus = SET;
2783  0073 26eb          	jrne	L1051
2784  0075               L7051:
2785                     ; 1154       pendingbitstatus = RESET;
2789  0075 4f            	clr	a
2790  0076               L3741:
2791                     ; 1159   return  pendingbitstatus;
2795  0076 5b05          	addw	sp,#5
2796  0078 81            	ret	
2834                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2834                     ; 1184 {
2835                     .text:	section	.text,new
2836  0000               _USART_ClearITPendingBit:
2840                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
2842                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2844  0000 f6            	ld	a,(x)
2845  0001 a4bf          	and	a,#191
2846  0003 f7            	ld	(x),a
2847                     ; 1189 }
2850  0004 81            	ret	
2863                     	xdef	_USART_ClearITPendingBit
2864                     	xdef	_USART_GetITStatus
2865                     	xdef	_USART_ClearFlag
2866                     	xdef	_USART_GetFlagStatus
2867                     	xdef	_USART_ITConfig
2868                     	xdef	_USART_DMACmd
2869                     	xdef	_USART_IrDACmd
2870                     	xdef	_USART_IrDAConfig
2871                     	xdef	_USART_SetGuardTime
2872                     	xdef	_USART_SmartCardNACKCmd
2873                     	xdef	_USART_SmartCardCmd
2874                     	xdef	_USART_HalfDuplexCmd
2875                     	xdef	_USART_SetAddress
2876                     	xdef	_USART_ReceiverWakeUpCmd
2877                     	xdef	_USART_WakeUpConfig
2878                     	xdef	_USART_ReceiveData9
2879                     	xdef	_USART_ReceiveData8
2880                     	xdef	_USART_SendData9
2881                     	xdef	_USART_SendData8
2882                     	xdef	_USART_SendBreak
2883                     	xdef	_USART_SetPrescaler
2884                     	xdef	_USART_Cmd
2885                     	xdef	_USART_ClockInit
2886                     	xdef	_USART_Init
2887                     	xdef	_USART_DeInit
2888                     	xref	_CLK_GetClockFreq
2889                     	xref.b	c_lreg
2908                     	xref	c_lursh
2909                     	xref	c_ltor
2910                     	xref	c_rtol
2911                     	xref	c_ludv
2912                     	end
