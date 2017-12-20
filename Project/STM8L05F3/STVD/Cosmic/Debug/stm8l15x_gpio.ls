   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  99                     ; 96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  99                     ; 97 {
 101                     .text:	section	.text,new
 102  0000               _GPIO_DeInit:
 106                     ; 98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 108  0000 6f04          	clr	(4,x)
 109                     ; 99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 111  0002 7f            	clr	(x)
 112                     ; 100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 114  0003 6f02          	clr	(2,x)
 115                     ; 101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 117  0005 6f03          	clr	(3,x)
 118                     ; 102 }
 121  0007 81            	ret	
 277                     ; 133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 277                     ; 134 {
 278                     .text:	section	.text,new
 279  0000               _GPIO_Init:
 281  0000 89            	pushw	x
 282       00000000      OFST:	set	0
 285                     ; 139   assert_param(IS_GPIO_MODE(GPIO_Mode));
 287                     ; 140   assert_param(IS_GPIO_PIN(GPIO_Pin));
 289                     ; 143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 291  0001 7b05          	ld	a,(OFST+5,sp)
 292  0003 43            	cpl	a
 293  0004 e404          	and	a,(4,x)
 294  0006 e704          	ld	(4,x),a
 295                     ; 149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 297  0008 7b06          	ld	a,(OFST+6,sp)
 298  000a 2a18          	jrpl	L541
 299                     ; 151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 301  000c a510          	bcp	a,#16
 302  000e 2705          	jreq	L741
 303                     ; 153       GPIOx->ODR |= GPIO_Pin;
 305  0010 f6            	ld	a,(x)
 306  0011 1a05          	or	a,(OFST+5,sp)
 308  0013 2006          	jra	L151
 309  0015               L741:
 310                     ; 156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 312  0015 1e01          	ldw	x,(OFST+1,sp)
 313  0017 7b05          	ld	a,(OFST+5,sp)
 314  0019 43            	cpl	a
 315  001a f4            	and	a,(x)
 316  001b               L151:
 317  001b f7            	ld	(x),a
 318                     ; 159     GPIOx->DDR |= GPIO_Pin;
 320  001c 1e01          	ldw	x,(OFST+1,sp)
 321  001e e602          	ld	a,(2,x)
 322  0020 1a05          	or	a,(OFST+5,sp)
 324  0022 2007          	jra	L351
 325  0024               L541:
 326                     ; 163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 328  0024 1e01          	ldw	x,(OFST+1,sp)
 329  0026 7b05          	ld	a,(OFST+5,sp)
 330  0028 43            	cpl	a
 331  0029 e402          	and	a,(2,x)
 332  002b               L351:
 333  002b e702          	ld	(2,x),a
 334                     ; 170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 336  002d 7b06          	ld	a,(OFST+6,sp)
 337  002f a540          	bcp	a,#64
 338  0031 2706          	jreq	L551
 339                     ; 172     GPIOx->CR1 |= GPIO_Pin;
 341  0033 e603          	ld	a,(3,x)
 342  0035 1a05          	or	a,(OFST+5,sp)
 344  0037 2005          	jra	L751
 345  0039               L551:
 346                     ; 175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 348  0039 7b05          	ld	a,(OFST+5,sp)
 349  003b 43            	cpl	a
 350  003c e403          	and	a,(3,x)
 351  003e               L751:
 352  003e e703          	ld	(3,x),a
 353                     ; 182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 355  0040 7b06          	ld	a,(OFST+6,sp)
 356  0042 a520          	bcp	a,#32
 357  0044 2706          	jreq	L161
 358                     ; 184     GPIOx->CR2 |= GPIO_Pin;
 360  0046 e604          	ld	a,(4,x)
 361  0048 1a05          	or	a,(OFST+5,sp)
 363  004a 2005          	jra	L361
 364  004c               L161:
 365                     ; 187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 367  004c 7b05          	ld	a,(OFST+5,sp)
 368  004e 43            	cpl	a
 369  004f e404          	and	a,(4,x)
 370  0051               L361:
 371  0051 e704          	ld	(4,x),a
 372                     ; 190 }
 375  0053 85            	popw	x
 376  0054 81            	ret	
 453                     ; 209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 453                     ; 210 {
 454                     .text:	section	.text,new
 455  0000               _GPIO_ExternalPullUpConfig:
 457  0000 89            	pushw	x
 458       00000000      OFST:	set	0
 461                     ; 212   assert_param(IS_GPIO_PIN(GPIO_Pin));
 463                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 465                     ; 215   if (NewState != DISABLE) /* External Pull-Up Set*/
 467  0001 7b06          	ld	a,(OFST+6,sp)
 468  0003 2706          	jreq	L522
 469                     ; 217     GPIOx->CR1 |= GPIO_Pin;
 471  0005 e603          	ld	a,(3,x)
 472  0007 1a05          	or	a,(OFST+5,sp)
 474  0009 2007          	jra	L722
 475  000b               L522:
 476                     ; 220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 478  000b 1e01          	ldw	x,(OFST+1,sp)
 479  000d 7b05          	ld	a,(OFST+5,sp)
 480  000f 43            	cpl	a
 481  0010 e403          	and	a,(3,x)
 482  0012               L722:
 483  0012 e703          	ld	(3,x),a
 484                     ; 222 }
 487  0014 85            	popw	x
 488  0015 81            	ret	
 534                     ; 248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 534                     ; 249 {
 535                     .text:	section	.text,new
 536  0000               _GPIO_Write:
 538  0000 89            	pushw	x
 539       00000000      OFST:	set	0
 542                     ; 250   GPIOx->ODR = GPIO_PortVal;
 544  0001 7b05          	ld	a,(OFST+5,sp)
 545  0003 1e01          	ldw	x,(OFST+1,sp)
 546  0005 f7            	ld	(x),a
 547                     ; 251 }
 550  0006 85            	popw	x
 551  0007 81            	ret	
 711                     ; 270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 711                     ; 271 {
 712                     .text:	section	.text,new
 713  0000               _GPIO_WriteBit:
 715  0000 89            	pushw	x
 716       00000000      OFST:	set	0
 719                     ; 273   assert_param(IS_GPIO_PIN(GPIO_Pin));
 721                     ; 274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 723                     ; 276   if (GPIO_BitVal != RESET)
 725  0001 7b06          	ld	a,(OFST+6,sp)
 726  0003 2705          	jreq	L743
 727                     ; 278     GPIOx->ODR |= GPIO_Pin;
 729  0005 f6            	ld	a,(x)
 730  0006 1a05          	or	a,(OFST+5,sp)
 732  0008 2006          	jra	L153
 733  000a               L743:
 734                     ; 283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 736  000a 1e01          	ldw	x,(OFST+1,sp)
 737  000c 7b05          	ld	a,(OFST+5,sp)
 738  000e 43            	cpl	a
 739  000f f4            	and	a,(x)
 740  0010               L153:
 741  0010 f7            	ld	(x),a
 742                     ; 285 }
 745  0011 85            	popw	x
 746  0012 81            	ret	
 792                     ; 303 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 792                     ; 304 {
 793                     .text:	section	.text,new
 794  0000               _GPIO_SetBits:
 796  0000 89            	pushw	x
 797       00000000      OFST:	set	0
 800                     ; 305   GPIOx->ODR |= GPIO_Pin;
 802  0001 f6            	ld	a,(x)
 803  0002 1a05          	or	a,(OFST+5,sp)
 804  0004 f7            	ld	(x),a
 805                     ; 306 }
 808  0005 85            	popw	x
 809  0006 81            	ret	
 855                     ; 324 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 855                     ; 325 {
 856                     .text:	section	.text,new
 857  0000               _GPIO_ResetBits:
 859  0000 89            	pushw	x
 860       00000000      OFST:	set	0
 863                     ; 326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 865  0001 7b05          	ld	a,(OFST+5,sp)
 866  0003 43            	cpl	a
 867  0004 f4            	and	a,(x)
 868  0005 f7            	ld	(x),a
 869                     ; 327 }
 872  0006 85            	popw	x
 873  0007 81            	ret	
 919                     ; 336 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 919                     ; 337 {
 920                     .text:	section	.text,new
 921  0000               _GPIO_ToggleBits:
 923  0000 89            	pushw	x
 924       00000000      OFST:	set	0
 927                     ; 338   GPIOx->ODR ^= GPIO_Pin;
 929  0001 f6            	ld	a,(x)
 930  0002 1805          	xor	a,(OFST+5,sp)
 931  0004 f7            	ld	(x),a
 932                     ; 339 }
 935  0005 85            	popw	x
 936  0006 81            	ret	
 973                     ; 347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 973                     ; 348 {
 974                     .text:	section	.text,new
 975  0000               _GPIO_ReadInputData:
 979                     ; 349   return ((uint8_t)GPIOx->IDR);
 981  0000 e601          	ld	a,(1,x)
 984  0002 81            	ret	
1022                     ; 358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1022                     ; 359 {
1023                     .text:	section	.text,new
1024  0000               _GPIO_ReadOutputData:
1028                     ; 360   return ((uint8_t)GPIOx->ODR);
1030  0000 f6            	ld	a,(x)
1033  0001 81            	ret	
1082                     ; 378 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1082                     ; 379 {
1083                     .text:	section	.text,new
1084  0000               _GPIO_ReadInputDataBit:
1086  0000 89            	pushw	x
1087       00000000      OFST:	set	0
1090                     ; 380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1092  0001 e601          	ld	a,(1,x)
1093  0003 1405          	and	a,(OFST+5,sp)
1096  0005 85            	popw	x
1097  0006 81            	ret	
1146                     ; 389 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1146                     ; 390 {
1147                     .text:	section	.text,new
1148  0000               _GPIO_ReadOutputDataBit:
1150  0000 89            	pushw	x
1151       00000000      OFST:	set	0
1154                     ; 391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1156  0001 f6            	ld	a,(x)
1157  0002 1405          	and	a,(OFST+5,sp)
1160  0004 85            	popw	x
1161  0005 81            	ret	
1174                     	xdef	_GPIO_ReadOutputDataBit
1175                     	xdef	_GPIO_ReadInputDataBit
1176                     	xdef	_GPIO_ReadOutputData
1177                     	xdef	_GPIO_ReadInputData
1178                     	xdef	_GPIO_ToggleBits
1179                     	xdef	_GPIO_ResetBits
1180                     	xdef	_GPIO_SetBits
1181                     	xdef	_GPIO_WriteBit
1182                     	xdef	_GPIO_Write
1183                     	xdef	_GPIO_ExternalPullUpConfig
1184                     	xdef	_GPIO_Init
1185                     	xdef	_GPIO_DeInit
1204                     	end
