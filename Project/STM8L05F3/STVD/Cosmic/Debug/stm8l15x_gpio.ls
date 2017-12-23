   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  99                     ; 96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  99                     ; 97 {
 100                     .text:	section	.text,new
 101  0000               f_GPIO_DeInit:
 105                     ; 98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 107  0000 6f04          	clr	(4,x)
 108                     ; 99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 110  0002 7f            	clr	(x)
 111                     ; 100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 113  0003 6f02          	clr	(2,x)
 114                     ; 101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 116  0005 6f03          	clr	(3,x)
 117                     ; 102 }
 120  0007 87            	retf	
 273                     ; 133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 273                     ; 134 {
 274                     .text:	section	.text,new
 275  0000               f_GPIO_Init:
 277  0000 89            	pushw	x
 278       00000000      OFST:	set	0
 281                     ; 139   assert_param(IS_GPIO_MODE(GPIO_Mode));
 283                     ; 140   assert_param(IS_GPIO_PIN(GPIO_Pin));
 285                     ; 143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 287  0001 7b06          	ld	a,(OFST+6,sp)
 288  0003 43            	cpl	a
 289  0004 e404          	and	a,(4,x)
 290  0006 e704          	ld	(4,x),a
 291                     ; 149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 293  0008 7b07          	ld	a,(OFST+7,sp)
 294  000a 2a18          	jrpl	L341
 295                     ; 151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 297  000c a510          	bcp	a,#16
 298  000e 2705          	jreq	L541
 299                     ; 153       GPIOx->ODR |= GPIO_Pin;
 301  0010 f6            	ld	a,(x)
 302  0011 1a06          	or	a,(OFST+6,sp)
 304  0013 2006          	jra	L741
 305  0015               L541:
 306                     ; 156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 308  0015 1e01          	ldw	x,(OFST+1,sp)
 309  0017 7b06          	ld	a,(OFST+6,sp)
 310  0019 43            	cpl	a
 311  001a f4            	and	a,(x)
 312  001b               L741:
 313  001b f7            	ld	(x),a
 314                     ; 159     GPIOx->DDR |= GPIO_Pin;
 316  001c 1e01          	ldw	x,(OFST+1,sp)
 317  001e e602          	ld	a,(2,x)
 318  0020 1a06          	or	a,(OFST+6,sp)
 320  0022 2007          	jra	L151
 321  0024               L341:
 322                     ; 163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 324  0024 1e01          	ldw	x,(OFST+1,sp)
 325  0026 7b06          	ld	a,(OFST+6,sp)
 326  0028 43            	cpl	a
 327  0029 e402          	and	a,(2,x)
 328  002b               L151:
 329  002b e702          	ld	(2,x),a
 330                     ; 170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 332  002d 7b07          	ld	a,(OFST+7,sp)
 333  002f a540          	bcp	a,#64
 334  0031 2706          	jreq	L351
 335                     ; 172     GPIOx->CR1 |= GPIO_Pin;
 337  0033 e603          	ld	a,(3,x)
 338  0035 1a06          	or	a,(OFST+6,sp)
 340  0037 2005          	jra	L551
 341  0039               L351:
 342                     ; 175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 344  0039 7b06          	ld	a,(OFST+6,sp)
 345  003b 43            	cpl	a
 346  003c e403          	and	a,(3,x)
 347  003e               L551:
 348  003e e703          	ld	(3,x),a
 349                     ; 182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 351  0040 7b07          	ld	a,(OFST+7,sp)
 352  0042 a520          	bcp	a,#32
 353  0044 2706          	jreq	L751
 354                     ; 184     GPIOx->CR2 |= GPIO_Pin;
 356  0046 e604          	ld	a,(4,x)
 357  0048 1a06          	or	a,(OFST+6,sp)
 359  004a 2005          	jra	L161
 360  004c               L751:
 361                     ; 187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 363  004c 7b06          	ld	a,(OFST+6,sp)
 364  004e 43            	cpl	a
 365  004f e404          	and	a,(4,x)
 366  0051               L161:
 367  0051 e704          	ld	(4,x),a
 368                     ; 190 }
 371  0053 85            	popw	x
 372  0054 87            	retf	
 446                     ; 209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 446                     ; 210 {
 447                     .text:	section	.text,new
 448  0000               f_GPIO_ExternalPullUpConfig:
 450  0000 89            	pushw	x
 451       00000000      OFST:	set	0
 454                     ; 212   assert_param(IS_GPIO_PIN(GPIO_Pin));
 456                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 458                     ; 215   if (NewState != DISABLE) /* External Pull-Up Set*/
 460  0001 7b07          	ld	a,(OFST+7,sp)
 461  0003 2706          	jreq	L122
 462                     ; 217     GPIOx->CR1 |= GPIO_Pin;
 464  0005 e603          	ld	a,(3,x)
 465  0007 1a06          	or	a,(OFST+6,sp)
 467  0009 2007          	jra	L322
 468  000b               L122:
 469                     ; 220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 471  000b 1e01          	ldw	x,(OFST+1,sp)
 472  000d 7b06          	ld	a,(OFST+6,sp)
 473  000f 43            	cpl	a
 474  0010 e403          	and	a,(3,x)
 475  0012               L322:
 476  0012 e703          	ld	(3,x),a
 477                     ; 222 }
 480  0014 85            	popw	x
 481  0015 87            	retf	
 524                     ; 248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 524                     ; 249 {
 525                     .text:	section	.text,new
 526  0000               f_GPIO_Write:
 528  0000 89            	pushw	x
 529       00000000      OFST:	set	0
 532                     ; 250   GPIOx->ODR = GPIO_PortVal;
 534  0001 7b06          	ld	a,(OFST+6,sp)
 535  0003 1e01          	ldw	x,(OFST+1,sp)
 536  0005 f7            	ld	(x),a
 537                     ; 251 }
 540  0006 85            	popw	x
 541  0007 87            	retf	
 700                     ; 270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 700                     ; 271 {
 701                     .text:	section	.text,new
 702  0000               f_GPIO_WriteBit:
 704  0000 89            	pushw	x
 705       00000000      OFST:	set	0
 708                     ; 273   assert_param(IS_GPIO_PIN(GPIO_Pin));
 710                     ; 274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 712                     ; 276   if (GPIO_BitVal != RESET)
 714  0001 7b07          	ld	a,(OFST+7,sp)
 715  0003 2705          	jreq	L143
 716                     ; 278     GPIOx->ODR |= GPIO_Pin;
 718  0005 f6            	ld	a,(x)
 719  0006 1a06          	or	a,(OFST+6,sp)
 721  0008 2006          	jra	L343
 722  000a               L143:
 723                     ; 283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 725  000a 1e01          	ldw	x,(OFST+1,sp)
 726  000c 7b06          	ld	a,(OFST+6,sp)
 727  000e 43            	cpl	a
 728  000f f4            	and	a,(x)
 729  0010               L343:
 730  0010 f7            	ld	(x),a
 731                     ; 285 }
 734  0011 85            	popw	x
 735  0012 87            	retf	
 778                     ; 303 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 778                     ; 304 {
 779                     .text:	section	.text,new
 780  0000               f_GPIO_SetBits:
 782  0000 89            	pushw	x
 783       00000000      OFST:	set	0
 786                     ; 305   GPIOx->ODR |= GPIO_Pin;
 788  0001 f6            	ld	a,(x)
 789  0002 1a06          	or	a,(OFST+6,sp)
 790  0004 f7            	ld	(x),a
 791                     ; 306 }
 794  0005 85            	popw	x
 795  0006 87            	retf	
 838                     ; 324 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 838                     ; 325 {
 839                     .text:	section	.text,new
 840  0000               f_GPIO_ResetBits:
 842  0000 89            	pushw	x
 843       00000000      OFST:	set	0
 846                     ; 326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 848  0001 7b06          	ld	a,(OFST+6,sp)
 849  0003 43            	cpl	a
 850  0004 f4            	and	a,(x)
 851  0005 f7            	ld	(x),a
 852                     ; 327 }
 855  0006 85            	popw	x
 856  0007 87            	retf	
 899                     ; 336 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 899                     ; 337 {
 900                     .text:	section	.text,new
 901  0000               f_GPIO_ToggleBits:
 903  0000 89            	pushw	x
 904       00000000      OFST:	set	0
 907                     ; 338   GPIOx->ODR ^= GPIO_Pin;
 909  0001 f6            	ld	a,(x)
 910  0002 1806          	xor	a,(OFST+6,sp)
 911  0004 f7            	ld	(x),a
 912                     ; 339 }
 915  0005 85            	popw	x
 916  0006 87            	retf	
 952                     ; 347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 952                     ; 348 {
 953                     .text:	section	.text,new
 954  0000               f_GPIO_ReadInputData:
 958                     ; 349   return ((uint8_t)GPIOx->IDR);
 960  0000 e601          	ld	a,(1,x)
 963  0002 87            	retf	
1000                     ; 358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1000                     ; 359 {
1001                     .text:	section	.text,new
1002  0000               f_GPIO_ReadOutputData:
1006                     ; 360   return ((uint8_t)GPIOx->ODR);
1008  0000 f6            	ld	a,(x)
1011  0001 87            	retf	
1059                     ; 378 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1059                     ; 379 {
1060                     .text:	section	.text,new
1061  0000               f_GPIO_ReadInputDataBit:
1063  0000 89            	pushw	x
1064       00000000      OFST:	set	0
1067                     ; 380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1069  0001 e601          	ld	a,(1,x)
1070  0003 1406          	and	a,(OFST+6,sp)
1073  0005 85            	popw	x
1074  0006 87            	retf	
1122                     ; 389 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1122                     ; 390 {
1123                     .text:	section	.text,new
1124  0000               f_GPIO_ReadOutputDataBit:
1126  0000 89            	pushw	x
1127       00000000      OFST:	set	0
1130                     ; 391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1132  0001 f6            	ld	a,(x)
1133  0002 1406          	and	a,(OFST+6,sp)
1136  0004 85            	popw	x
1137  0005 87            	retf	
1149                     	xdef	f_GPIO_ReadOutputDataBit
1150                     	xdef	f_GPIO_ReadInputDataBit
1151                     	xdef	f_GPIO_ReadOutputData
1152                     	xdef	f_GPIO_ReadInputData
1153                     	xdef	f_GPIO_ToggleBits
1154                     	xdef	f_GPIO_ResetBits
1155                     	xdef	f_GPIO_SetBits
1156                     	xdef	f_GPIO_WriteBit
1157                     	xdef	f_GPIO_Write
1158                     	xdef	f_GPIO_ExternalPullUpConfig
1159                     	xdef	f_GPIO_Init
1160                     	xdef	f_GPIO_DeInit
1179                     	end
