   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 123 void EXTI_DeInit(void)
  33                     ; 124 {
  34                     .text:	section	.text,new
  35  0000               f_EXTI_DeInit:
  39                     ; 125   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  41  0000 725f50a0      	clr	20640
  42                     ; 126   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  44  0004 725f50a1      	clr	20641
  45                     ; 127   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  47  0008 725f50a2      	clr	20642
  48                     ; 128   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  50  000c 725f50aa      	clr	20650
  51                     ; 129   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  53  0010 35ff50a3      	mov	20643,#255
  54                     ; 130   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  56  0014 35ff50a4      	mov	20644,#255
  57                     ; 131   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  59  0018 725f50a5      	clr	20645
  60                     ; 132   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  62  001c 725f50ab      	clr	20651
  63                     ; 133 }
  66  0020 87            	retf	
 211                     ; 160 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 211                     ; 161 {
 212                     .text:	section	.text,new
 213  0000               f_EXTI_SetPinSensitivity:
 215  0000 89            	pushw	x
 216       00000000      OFST:	set	0
 219                     ; 164   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 221                     ; 165   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 223                     ; 168   switch (EXTI_Pin)
 225  0001 9e            	ld	a,xh
 227                     ; 202     default:
 227                     ; 203       break;
 228  0002 4d            	tnz	a
 229  0003 2730          	jreq	L12
 230  0005 a002          	sub	a,#2
 231  0007 2743          	jreq	L32
 232  0009 a002          	sub	a,#2
 233  000b 2756          	jreq	L52
 234  000d a002          	sub	a,#2
 235  000f 2769          	jreq	L72
 236  0011 a00a          	sub	a,#10
 237  0013 2604ac970097  	jreq	L13
 238  0019 a002          	sub	a,#2
 239  001b 2604acb000b0  	jreq	L33
 240  0021 a002          	sub	a,#2
 241  0023 2604acc900c9  	jreq	L53
 242  0029 a002          	sub	a,#2
 243  002b 2604ace200e2  	jreq	L73
 244  0031 acff00ff      	jra	L721
 245  0035               L12:
 246                     ; 170     case EXTI_Pin_0:
 246                     ; 171       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 248  0035 c650a0        	ld	a,20640
 249  0038 a4fc          	and	a,#252
 250  003a c750a0        	ld	20640,a
 251                     ; 172       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 253  003d 7b01          	ld	a,(OFST+1,sp)
 254  003f 5f            	clrw	x
 255  0040 97            	ld	xl,a
 256  0041 7b02          	ld	a,(OFST+2,sp)
 257  0043 5d            	tnzw	x
 258  0044 2749          	jreq	L42
 259  0046               L21:
 260  0046 48            	sll	a
 261  0047 5a            	decw	x
 262  0048 26fc          	jrne	L21
 263                     ; 173       break;
 265  004a 2043          	jpf	L42
 266  004c               L32:
 267                     ; 174     case EXTI_Pin_1:
 267                     ; 175       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 269  004c c650a0        	ld	a,20640
 270  004f a4f3          	and	a,#243
 271  0051 c750a0        	ld	20640,a
 272                     ; 176       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 274  0054 7b01          	ld	a,(OFST+1,sp)
 275  0056 5f            	clrw	x
 276  0057 97            	ld	xl,a
 277  0058 7b02          	ld	a,(OFST+2,sp)
 278  005a 5d            	tnzw	x
 279  005b 2732          	jreq	L42
 280  005d               L61:
 281  005d 48            	sll	a
 282  005e 5a            	decw	x
 283  005f 26fc          	jrne	L61
 284                     ; 177       break;
 286  0061 202c          	jpf	L42
 287  0063               L52:
 288                     ; 178     case EXTI_Pin_2:
 288                     ; 179       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 290  0063 c650a0        	ld	a,20640
 291  0066 a4cf          	and	a,#207
 292  0068 c750a0        	ld	20640,a
 293                     ; 180       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 295  006b 7b01          	ld	a,(OFST+1,sp)
 296  006d 5f            	clrw	x
 297  006e 97            	ld	xl,a
 298  006f 7b02          	ld	a,(OFST+2,sp)
 299  0071 5d            	tnzw	x
 300  0072 271b          	jreq	L42
 301  0074               L22:
 302  0074 48            	sll	a
 303  0075 5a            	decw	x
 304  0076 26fc          	jrne	L22
 305                     ; 181       break;
 307  0078 2015          	jpf	L42
 308  007a               L72:
 309                     ; 182     case EXTI_Pin_3:
 309                     ; 183       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 311  007a c650a0        	ld	a,20640
 312  007d a43f          	and	a,#63
 313  007f c750a0        	ld	20640,a
 314                     ; 184       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 316  0082 7b01          	ld	a,(OFST+1,sp)
 317  0084 5f            	clrw	x
 318  0085 97            	ld	xl,a
 319  0086 7b02          	ld	a,(OFST+2,sp)
 320  0088 5d            	tnzw	x
 321  0089 2704          	jreq	L42
 322  008b               L62:
 323  008b 48            	sll	a
 324  008c 5a            	decw	x
 325  008d 26fc          	jrne	L62
 326  008f               L42:
 327  008f ca50a0        	or	a,20640
 328  0092 c750a0        	ld	20640,a
 329                     ; 185       break;
 331  0095 2068          	jra	L721
 332  0097               L13:
 333                     ; 186     case EXTI_Pin_4:
 333                     ; 187       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 335  0097 c650a1        	ld	a,20641
 336  009a a4fc          	and	a,#252
 337  009c c750a1        	ld	20641,a
 338                     ; 188       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 340  009f 7b01          	ld	a,(OFST+1,sp)
 341  00a1 a4ef          	and	a,#239
 342  00a3 5f            	clrw	x
 343  00a4 97            	ld	xl,a
 344  00a5 7b02          	ld	a,(OFST+2,sp)
 345  00a7 5d            	tnzw	x
 346  00a8 274f          	jreq	L44
 347  00aa               L23:
 348  00aa 48            	sll	a
 349  00ab 5a            	decw	x
 350  00ac 26fc          	jrne	L23
 351                     ; 189       break;
 353  00ae 2049          	jpf	L44
 354  00b0               L33:
 355                     ; 190     case EXTI_Pin_5:
 355                     ; 191       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 357  00b0 c650a1        	ld	a,20641
 358  00b3 a4f3          	and	a,#243
 359  00b5 c750a1        	ld	20641,a
 360                     ; 192       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 362  00b8 7b01          	ld	a,(OFST+1,sp)
 363  00ba a4ef          	and	a,#239
 364  00bc 5f            	clrw	x
 365  00bd 97            	ld	xl,a
 366  00be 7b02          	ld	a,(OFST+2,sp)
 367  00c0 5d            	tnzw	x
 368  00c1 2736          	jreq	L44
 369  00c3               L63:
 370  00c3 48            	sll	a
 371  00c4 5a            	decw	x
 372  00c5 26fc          	jrne	L63
 373                     ; 193       break;
 375  00c7 2030          	jpf	L44
 376  00c9               L53:
 377                     ; 194     case EXTI_Pin_6:
 377                     ; 195       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 379  00c9 c650a1        	ld	a,20641
 380  00cc a4cf          	and	a,#207
 381  00ce c750a1        	ld	20641,a
 382                     ; 196       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 384  00d1 7b01          	ld	a,(OFST+1,sp)
 385  00d3 a4ef          	and	a,#239
 386  00d5 5f            	clrw	x
 387  00d6 97            	ld	xl,a
 388  00d7 7b02          	ld	a,(OFST+2,sp)
 389  00d9 5d            	tnzw	x
 390  00da 271d          	jreq	L44
 391  00dc               L24:
 392  00dc 48            	sll	a
 393  00dd 5a            	decw	x
 394  00de 26fc          	jrne	L24
 395                     ; 197       break;
 397  00e0 2017          	jpf	L44
 398  00e2               L73:
 399                     ; 198     case EXTI_Pin_7:
 399                     ; 199       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 401  00e2 c650a1        	ld	a,20641
 402  00e5 a43f          	and	a,#63
 403  00e7 c750a1        	ld	20641,a
 404                     ; 200       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 406  00ea 7b01          	ld	a,(OFST+1,sp)
 407  00ec a4ef          	and	a,#239
 408  00ee 5f            	clrw	x
 409  00ef 97            	ld	xl,a
 410  00f0 7b02          	ld	a,(OFST+2,sp)
 411  00f2 5d            	tnzw	x
 412  00f3 2704          	jreq	L44
 413  00f5               L64:
 414  00f5 48            	sll	a
 415  00f6 5a            	decw	x
 416  00f7 26fc          	jrne	L64
 417  00f9               L44:
 418  00f9 ca50a1        	or	a,20641
 419  00fc c750a1        	ld	20641,a
 420                     ; 201       break;
 422                     ; 202     default:
 422                     ; 203       break;
 424  00ff               L721:
 425                     ; 205 }
 428  00ff 85            	popw	x
 429  0100 87            	retf	
 511                     ; 219 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 511                     ; 220 {
 512                     .text:	section	.text,new
 513  0000               f_EXTI_SelectPort:
 515  0000 88            	push	a
 516       00000000      OFST:	set	0
 519                     ; 222   assert_param(IS_EXTI_PORT(EXTI_Port));
 521                     ; 224   if (EXTI_Port == EXTI_Port_B)
 523  0001 4d            	tnz	a
 524  0002 2606          	jrne	L761
 525                     ; 227     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 527  0004 721b50ab      	bres	20651,#5
 529  0008 202e          	jra	L171
 530  000a               L761:
 531                     ; 229   else if (EXTI_Port == EXTI_Port_D)
 533  000a 7b01          	ld	a,(OFST+1,sp)
 534  000c a102          	cp	a,#2
 535  000e 2606          	jrne	L371
 536                     ; 232     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 538  0010 721d50ab      	bres	20651,#6
 540  0014 2022          	jra	L171
 541  0016               L371:
 542                     ; 234   else if (EXTI_Port == EXTI_Port_E)
 544  0016 a104          	cp	a,#4
 545  0018 2606          	jrne	L771
 546                     ; 237     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 548  001a 721f50a5      	bres	20645,#7
 550  001e 2018          	jra	L171
 551  0020               L771:
 552                     ; 239   else if (EXTI_Port == EXTI_Port_F)
 554  0020 a106          	cp	a,#6
 555  0022 2606          	jrne	L302
 556                     ; 242     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 558  0024 721e50a5      	bset	20645,#7
 560  0028 200e          	jra	L171
 561  002a               L302:
 562                     ; 244   else if (EXTI_Port == EXTI_Port_G)
 564  002a a110          	cp	a,#16
 565  002c 2606          	jrne	L702
 566                     ; 247     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 568  002e 721a50ab      	bset	20651,#5
 570  0032 2004          	jra	L171
 571  0034               L702:
 572                     ; 252     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 574  0034 721c50ab      	bset	20651,#6
 575  0038               L171:
 576                     ; 254 }
 579  0038 84            	pop	a
 580  0039 87            	retf	
 747                     ; 280 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 747                     ; 281                                FunctionalState NewState)
 747                     ; 282 {
 748                     .text:	section	.text,new
 749  0000               f_EXTI_SetHalfPortSelection:
 751  0000 89            	pushw	x
 752       00000000      OFST:	set	0
 755                     ; 284   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 757                     ; 285   assert_param(IS_FUNCTIONAL_STATE(NewState));
 759                     ; 287   if ((EXTI_HalfPort & 0x80) == 0x00)
 761  0001 9e            	ld	a,xh
 762  0002 a580          	bcp	a,#128
 763  0004 2616          	jrne	L103
 764                     ; 289     if (NewState != DISABLE)
 766  0006 7b02          	ld	a,(OFST+2,sp)
 767  0008 2707          	jreq	L303
 768                     ; 292       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 770  000a c650a5        	ld	a,20645
 771  000d 1a01          	or	a,(OFST+1,sp)
 773  000f 2006          	jpf	LC004
 774  0011               L303:
 775                     ; 297       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 777  0011 7b01          	ld	a,(OFST+1,sp)
 778  0013 43            	cpl	a
 779  0014 c450a5        	and	a,20645
 780  0017               LC004:
 781  0017 c750a5        	ld	20645,a
 782  001a 2018          	jra	L703
 783  001c               L103:
 784                     ; 302     if (NewState != DISABLE)
 786  001c 7b02          	ld	a,(OFST+2,sp)
 787  001e 2709          	jreq	L113
 788                     ; 305       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 790  0020 7b01          	ld	a,(OFST+1,sp)
 791  0022 a47f          	and	a,#127
 792  0024 ca50ab        	or	a,20651
 794  0027 2008          	jpf	LC003
 795  0029               L113:
 796                     ; 310       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 798  0029 7b01          	ld	a,(OFST+1,sp)
 799  002b a47f          	and	a,#127
 800  002d 43            	cpl	a
 801  002e c450ab        	and	a,20651
 802  0031               LC003:
 803  0031 c750ab        	ld	20651,a
 804  0034               L703:
 805                     ; 313 }
 808  0034 85            	popw	x
 809  0035 87            	retf	
 854                     ; 338 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 854                     ; 339                              EXTI_Trigger_TypeDef EXTI_Trigger)
 854                     ; 340 {
 855                     .text:	section	.text,new
 856  0000               f_EXTI_SetPortSensitivity:
 858  0000 89            	pushw	x
 859       00000000      OFST:	set	0
 862                     ; 342   assert_param(IS_EXTI_PORT(EXTI_Port));
 864                     ; 343   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 866                     ; 346   if ((EXTI_Port & 0xF0) == 0x00)
 868  0001 9e            	ld	a,xh
 869  0002 a5f0          	bcp	a,#240
 870  0004 2629          	jrne	L733
 871                     ; 349     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 873  0006 7b01          	ld	a,(OFST+1,sp)
 874  0008 5f            	clrw	x
 875  0009 97            	ld	xl,a
 876  000a a603          	ld	a,#3
 877  000c 5d            	tnzw	x
 878  000d 2704          	jreq	L65
 879  000f               L06:
 880  000f 48            	sll	a
 881  0010 5a            	decw	x
 882  0011 26fc          	jrne	L06
 883  0013               L65:
 884  0013 43            	cpl	a
 885  0014 c450a2        	and	a,20642
 886  0017 c750a2        	ld	20642,a
 887                     ; 351     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 889  001a 7b01          	ld	a,(OFST+1,sp)
 890  001c 5f            	clrw	x
 891  001d 97            	ld	xl,a
 892  001e 7b02          	ld	a,(OFST+2,sp)
 893  0020 5d            	tnzw	x
 894  0021 2704          	jreq	L26
 895  0023               L46:
 896  0023 48            	sll	a
 897  0024 5a            	decw	x
 898  0025 26fc          	jrne	L46
 899  0027               L26:
 900  0027 ca50a2        	or	a,20642
 901  002a c750a2        	ld	20642,a
 903  002d 202b          	jra	L143
 904  002f               L733:
 905                     ; 356     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 907  002f 7b01          	ld	a,(OFST+1,sp)
 908  0031 a40f          	and	a,#15
 909  0033 5f            	clrw	x
 910  0034 97            	ld	xl,a
 911  0035 a603          	ld	a,#3
 912  0037 5d            	tnzw	x
 913  0038 2704          	jreq	L66
 914  003a               L07:
 915  003a 48            	sll	a
 916  003b 5a            	decw	x
 917  003c 26fc          	jrne	L07
 918  003e               L66:
 919  003e 43            	cpl	a
 920  003f c450aa        	and	a,20650
 921  0042 c750aa        	ld	20650,a
 922                     ; 358     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 924  0045 7b01          	ld	a,(OFST+1,sp)
 925  0047 a40f          	and	a,#15
 926  0049 5f            	clrw	x
 927  004a 97            	ld	xl,a
 928  004b 7b02          	ld	a,(OFST+2,sp)
 929  004d 5d            	tnzw	x
 930  004e 2704          	jreq	L27
 931  0050               L47:
 932  0050 48            	sll	a
 933  0051 5a            	decw	x
 934  0052 26fc          	jrne	L47
 935  0054               L27:
 936  0054 ca50aa        	or	a,20650
 937  0057 c750aa        	ld	20650,a
 938  005a               L143:
 939                     ; 360 }
 942  005a 85            	popw	x
 943  005b 87            	retf	
 986                     ; 376 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
 986                     ; 377 {
 987                     .text:	section	.text,new
 988  0000               f_EXTI_GetPinSensitivity:
 990  0000 88            	push	a
 991       00000001      OFST:	set	1
 994                     ; 378   uint8_t value = 0;
 996  0001 0f01          	clr	(OFST+0,sp)
 997                     ; 381   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 999                     ; 383   switch (EXTI_Pin)
1002                     ; 409     default:
1002                     ; 410       break;
1003  0003 4d            	tnz	a
1004  0004 2720          	jreq	L343
1005  0006 a002          	sub	a,#2
1006  0008 2721          	jreq	L543
1007  000a a002          	sub	a,#2
1008  000c 2722          	jreq	L743
1009  000e a002          	sub	a,#2
1010  0010 2724          	jreq	L153
1011  0012 a00a          	sub	a,#10
1012  0014 2725          	jreq	L353
1013  0016 a002          	sub	a,#2
1014  0018 2726          	jreq	L553
1015  001a a002          	sub	a,#2
1016  001c 272b          	jreq	L753
1017  001e a002          	sub	a,#2
1018  0020 272d          	jreq	L163
1019  0022 7b01          	ld	a,(OFST+0,sp)
1020  0024 2033          	jra	LC005
1021  0026               L343:
1022                     ; 385     case EXTI_Pin_0:
1022                     ; 386       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1024  0026 c650a0        	ld	a,20640
1025                     ; 387       break;
1027  0029 202c          	jpf	LC006
1028  002b               L543:
1029                     ; 388     case EXTI_Pin_1:
1029                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1031  002b c650a0        	ld	a,20640
1032                     ; 390       break;
1034  002e 2013          	jpf	LC008
1035  0030               L743:
1036                     ; 391     case EXTI_Pin_2:
1036                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1038  0030 c650a0        	ld	a,20640
1039  0033 4e            	swap	a
1040                     ; 393       break;
1042  0034 2021          	jpf	LC006
1043  0036               L153:
1044                     ; 394     case EXTI_Pin_3:
1044                     ; 395       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1046  0036 c650a0        	ld	a,20640
1047                     ; 396       break;
1049  0039 2017          	jpf	LC007
1050  003b               L353:
1051                     ; 397     case EXTI_Pin_4:
1051                     ; 398       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1053  003b c650a1        	ld	a,20641
1054                     ; 399       break;
1056  003e 2017          	jpf	LC006
1057  0040               L553:
1058                     ; 400     case EXTI_Pin_5:
1058                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1060  0040 c650a1        	ld	a,20641
1061  0043               LC008:
1062  0043 a40c          	and	a,#12
1063  0045 44            	srl	a
1064  0046 44            	srl	a
1065                     ; 402       break;
1067  0047 2010          	jpf	LC005
1068  0049               L753:
1069                     ; 403     case EXTI_Pin_6:
1069                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1071  0049 c650a1        	ld	a,20641
1072  004c 4e            	swap	a
1073                     ; 405       break;
1075  004d 2008          	jpf	LC006
1076  004f               L163:
1077                     ; 406     case EXTI_Pin_7:
1077                     ; 407       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1079  004f c650a1        	ld	a,20641
1080  0052               LC007:
1081  0052 4e            	swap	a
1082  0053 a40c          	and	a,#12
1083  0055 44            	srl	a
1084  0056 44            	srl	a
1085  0057               LC006:
1086  0057 a403          	and	a,#3
1087  0059               LC005:
1088                     ; 408       break;
1090                     ; 409     default:
1090                     ; 410       break;
1092                     ; 412   return((EXTI_Trigger_TypeDef)value);
1096  0059 5b01          	addw	sp,#1
1097  005b 87            	retf	
1140                     ; 427 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1140                     ; 428 {
1141                     .text:	section	.text,new
1142  0000               f_EXTI_GetPortSensitivity:
1144  0000 88            	push	a
1145  0001 88            	push	a
1146       00000001      OFST:	set	1
1149                     ; 429   uint8_t portsensitivity = 0;
1151  0002 0f01          	clr	(OFST+0,sp)
1152                     ; 432   assert_param(IS_EXTI_PORT(EXTI_Port));
1154                     ; 435   if ((EXTI_Port & 0xF0) == 0x00)
1156  0004 a5f0          	bcp	a,#240
1157  0006 2610          	jrne	L134
1158                     ; 438     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1160  0008 7b02          	ld	a,(OFST+1,sp)
1161  000a 5f            	clrw	x
1162  000b 97            	ld	xl,a
1163  000c c650a2        	ld	a,20642
1164  000f 5d            	tnzw	x
1165  0010 2716          	jreq	L601
1166  0012               L401:
1167  0012 44            	srl	a
1168  0013 5a            	decw	x
1169  0014 26fc          	jrne	L401
1171  0016 2010          	jra	L601
1172  0018               L134:
1173                     ; 444     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1175  0018 7b02          	ld	a,(OFST+1,sp)
1176  001a a40f          	and	a,#15
1177  001c 5f            	clrw	x
1178  001d 97            	ld	xl,a
1179  001e c650aa        	ld	a,20650
1180  0021 5d            	tnzw	x
1181  0022 2704          	jreq	L601
1182  0024               L011:
1183  0024 44            	srl	a
1184  0025 5a            	decw	x
1185  0026 26fc          	jrne	L011
1186  0028               L601:
1187  0028 a403          	and	a,#3
1188                     ; 447   return((EXTI_Trigger_TypeDef)portsensitivity);
1192  002a 85            	popw	x
1193  002b 87            	retf	
1362                     ; 487 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1362                     ; 488 {
1363                     .text:	section	.text,new
1364  0000               f_EXTI_GetITStatus:
1366  0000 89            	pushw	x
1367  0001 88            	push	a
1368       00000001      OFST:	set	1
1371                     ; 489   ITStatus status = RESET;
1373  0002 0f01          	clr	(OFST+0,sp)
1374                     ; 491   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1376                     ; 493   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1378  0004 01            	rrwa	x,a
1379  0005 4f            	clr	a
1380  0006 02            	rlwa	x,a
1381  0007 a30100        	cpw	x,#256
1382  000a 2607          	jrne	L725
1383                     ; 495     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1385  000c 7b03          	ld	a,(OFST+2,sp)
1386  000e c450a4        	and	a,20644
1388  0011 2005          	jra	L135
1389  0013               L725:
1390                     ; 499     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1392  0013 7b03          	ld	a,(OFST+2,sp)
1393  0015 c450a3        	and	a,20643
1394  0018               L135:
1395                     ; 501   return((ITStatus)status);
1399  0018 5b03          	addw	sp,#3
1400  001a 87            	retf	
1442                     ; 524 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1442                     ; 525 {
1443                     .text:	section	.text,new
1444  0000               f_EXTI_ClearITPendingBit:
1446  0000 89            	pushw	x
1447  0001 89            	pushw	x
1448       00000002      OFST:	set	2
1451                     ; 526   uint16_t tempvalue = 0;
1453                     ; 529   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1455                     ; 531   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1457  0002 7b03          	ld	a,(OFST+1,sp)
1458  0004 97            	ld	xl,a
1459  0005 4f            	clr	a
1460  0006 02            	rlwa	x,a
1461  0007 1f01          	ldw	(OFST-1,sp),x
1462                     ; 533   if ( tempvalue == 0x0100)
1464  0009 a30100        	cpw	x,#256
1465  000c 2607          	jrne	L355
1466                     ; 535     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1468  000e 7b04          	ld	a,(OFST+2,sp)
1469  0010 c750a4        	ld	20644,a
1471  0013 2005          	jra	L555
1472  0015               L355:
1473                     ; 539     EXTI->SR1 = (uint8_t) (EXTI_IT);
1475  0015 7b04          	ld	a,(OFST+2,sp)
1476  0017 c750a3        	ld	20643,a
1477  001a               L555:
1478                     ; 541 }
1481  001a 5b04          	addw	sp,#4
1482  001c 87            	retf	
1494                     	xdef	f_EXTI_ClearITPendingBit
1495                     	xdef	f_EXTI_GetITStatus
1496                     	xdef	f_EXTI_GetPortSensitivity
1497                     	xdef	f_EXTI_GetPinSensitivity
1498                     	xdef	f_EXTI_SetPortSensitivity
1499                     	xdef	f_EXTI_SetHalfPortSelection
1500                     	xdef	f_EXTI_SelectPort
1501                     	xdef	f_EXTI_SetPinSensitivity
1502                     	xdef	f_EXTI_DeInit
1521                     	end
