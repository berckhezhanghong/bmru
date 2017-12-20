   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 123 void EXTI_DeInit(void)
  33                     ; 124 {
  35                     .text:	section	.text,new
  36  0000               _EXTI_DeInit:
  40                     ; 125   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  42  0000 725f50a0      	clr	20640
  43                     ; 126   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  45  0004 725f50a1      	clr	20641
  46                     ; 127   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  48  0008 725f50a2      	clr	20642
  49                     ; 128   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  51  000c 725f50aa      	clr	20650
  52                     ; 129   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  54  0010 35ff50a3      	mov	20643,#255
  55                     ; 130   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  57  0014 35ff50a4      	mov	20644,#255
  58                     ; 131   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  60  0018 725f50a5      	clr	20645
  61                     ; 132   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  63  001c 725f50ab      	clr	20651
  64                     ; 133 }
  67  0020 81            	ret	
 213                     ; 160 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 213                     ; 161 {
 214                     .text:	section	.text,new
 215  0000               _EXTI_SetPinSensitivity:
 217  0000 89            	pushw	x
 218       00000000      OFST:	set	0
 221                     ; 164   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 223                     ; 165   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 225                     ; 168   switch (EXTI_Pin)
 227  0001 9e            	ld	a,xh
 229                     ; 202     default:
 229                     ; 203       break;
 230  0002 4d            	tnz	a
 231  0003 2728          	jreq	L12
 232  0005 a002          	sub	a,#2
 233  0007 273b          	jreq	L32
 234  0009 a002          	sub	a,#2
 235  000b 274e          	jreq	L52
 236  000d a002          	sub	a,#2
 237  000f 2761          	jreq	L72
 238  0011 a00a          	sub	a,#10
 239  0013 277a          	jreq	L13
 240  0015 a002          	sub	a,#2
 241  0017 2603cc00a6    	jreq	L33
 242  001c a002          	sub	a,#2
 243  001e 2603cc00bd    	jreq	L53
 244  0023 a002          	sub	a,#2
 245  0025 2603cc00d4    	jreq	L73
 246  002a cc00ef        	jra	L721
 247  002d               L12:
 248                     ; 170     case EXTI_Pin_0:
 248                     ; 171       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 250  002d c650a0        	ld	a,20640
 251  0030 a4fc          	and	a,#252
 252  0032 c750a0        	ld	20640,a
 253                     ; 172       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 255  0035 7b01          	ld	a,(OFST+1,sp)
 256  0037 5f            	clrw	x
 257  0038 97            	ld	xl,a
 258  0039 7b02          	ld	a,(OFST+2,sp)
 259  003b 5d            	tnzw	x
 260  003c 2749          	jreq	L42
 261  003e               L21:
 262  003e 48            	sll	a
 263  003f 5a            	decw	x
 264  0040 26fc          	jrne	L21
 265                     ; 173       break;
 267  0042 2043          	jp	L42
 268  0044               L32:
 269                     ; 174     case EXTI_Pin_1:
 269                     ; 175       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 271  0044 c650a0        	ld	a,20640
 272  0047 a4f3          	and	a,#243
 273  0049 c750a0        	ld	20640,a
 274                     ; 176       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 276  004c 7b01          	ld	a,(OFST+1,sp)
 277  004e 5f            	clrw	x
 278  004f 97            	ld	xl,a
 279  0050 7b02          	ld	a,(OFST+2,sp)
 280  0052 5d            	tnzw	x
 281  0053 2732          	jreq	L42
 282  0055               L61:
 283  0055 48            	sll	a
 284  0056 5a            	decw	x
 285  0057 26fc          	jrne	L61
 286                     ; 177       break;
 288  0059 202c          	jp	L42
 289  005b               L52:
 290                     ; 178     case EXTI_Pin_2:
 290                     ; 179       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 292  005b c650a0        	ld	a,20640
 293  005e a4cf          	and	a,#207
 294  0060 c750a0        	ld	20640,a
 295                     ; 180       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 297  0063 7b01          	ld	a,(OFST+1,sp)
 298  0065 5f            	clrw	x
 299  0066 97            	ld	xl,a
 300  0067 7b02          	ld	a,(OFST+2,sp)
 301  0069 5d            	tnzw	x
 302  006a 271b          	jreq	L42
 303  006c               L22:
 304  006c 48            	sll	a
 305  006d 5a            	decw	x
 306  006e 26fc          	jrne	L22
 307                     ; 181       break;
 309  0070 2015          	jp	L42
 310  0072               L72:
 311                     ; 182     case EXTI_Pin_3:
 311                     ; 183       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 313  0072 c650a0        	ld	a,20640
 314  0075 a43f          	and	a,#63
 315  0077 c750a0        	ld	20640,a
 316                     ; 184       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 318  007a 7b01          	ld	a,(OFST+1,sp)
 319  007c 5f            	clrw	x
 320  007d 97            	ld	xl,a
 321  007e 7b02          	ld	a,(OFST+2,sp)
 322  0080 5d            	tnzw	x
 323  0081 2704          	jreq	L42
 324  0083               L62:
 325  0083 48            	sll	a
 326  0084 5a            	decw	x
 327  0085 26fc          	jrne	L62
 328  0087               L42:
 329  0087 ca50a0        	or	a,20640
 330  008a c750a0        	ld	20640,a
 331                     ; 185       break;
 333  008d 2060          	jra	L721
 334  008f               L13:
 335                     ; 186     case EXTI_Pin_4:
 335                     ; 187       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 337  008f c650a1        	ld	a,20641
 338  0092 a4fc          	and	a,#252
 339  0094 c750a1        	ld	20641,a
 340                     ; 188       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 342  0097 7b01          	ld	a,(OFST+1,sp)
 343  0099 ad56          	call	LC003
 344  009b 7b02          	ld	a,(OFST+2,sp)
 345  009d 5d            	tnzw	x
 346  009e 2749          	jreq	L44
 347  00a0               L23:
 348  00a0 48            	sll	a
 349  00a1 5a            	decw	x
 350  00a2 26fc          	jrne	L23
 351                     ; 189       break;
 353  00a4 2043          	jp	L44
 354  00a6               L33:
 355                     ; 190     case EXTI_Pin_5:
 355                     ; 191       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 357  00a6 c650a1        	ld	a,20641
 358  00a9 a4f3          	and	a,#243
 359  00ab c750a1        	ld	20641,a
 360                     ; 192       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 362  00ae 7b01          	ld	a,(OFST+1,sp)
 363  00b0 ad3f          	call	LC003
 364  00b2 7b02          	ld	a,(OFST+2,sp)
 365  00b4 5d            	tnzw	x
 366  00b5 2732          	jreq	L44
 367  00b7               L63:
 368  00b7 48            	sll	a
 369  00b8 5a            	decw	x
 370  00b9 26fc          	jrne	L63
 371                     ; 193       break;
 373  00bb 202c          	jp	L44
 374  00bd               L53:
 375                     ; 194     case EXTI_Pin_6:
 375                     ; 195       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 377  00bd c650a1        	ld	a,20641
 378  00c0 a4cf          	and	a,#207
 379  00c2 c750a1        	ld	20641,a
 380                     ; 196       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 382  00c5 7b01          	ld	a,(OFST+1,sp)
 383  00c7 ad28          	call	LC003
 384  00c9 7b02          	ld	a,(OFST+2,sp)
 385  00cb 5d            	tnzw	x
 386  00cc 271b          	jreq	L44
 387  00ce               L24:
 388  00ce 48            	sll	a
 389  00cf 5a            	decw	x
 390  00d0 26fc          	jrne	L24
 391                     ; 197       break;
 393  00d2 2015          	jp	L44
 394  00d4               L73:
 395                     ; 198     case EXTI_Pin_7:
 395                     ; 199       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 397  00d4 c650a1        	ld	a,20641
 398  00d7 a43f          	and	a,#63
 399  00d9 c750a1        	ld	20641,a
 400                     ; 200       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 402  00dc 7b01          	ld	a,(OFST+1,sp)
 403  00de ad11          	call	LC003
 404  00e0 7b02          	ld	a,(OFST+2,sp)
 405  00e2 5d            	tnzw	x
 406  00e3 2704          	jreq	L44
 407  00e5               L64:
 408  00e5 48            	sll	a
 409  00e6 5a            	decw	x
 410  00e7 26fc          	jrne	L64
 411  00e9               L44:
 412  00e9 ca50a1        	or	a,20641
 413  00ec c750a1        	ld	20641,a
 414                     ; 201       break;
 416                     ; 202     default:
 416                     ; 203       break;
 418  00ef               L721:
 419                     ; 205 }
 422  00ef 85            	popw	x
 423  00f0 81            	ret	
 425  00f1               LC003:
 426  00f1 a4ef          	and	a,#239
 427  00f3 5f            	clrw	x
 428  00f4 97            	ld	xl,a
 429  00f5 81            	ret	
 511                     ; 219 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 511                     ; 220 {
 512                     .text:	section	.text,new
 513  0000               _EXTI_SelectPort:
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
 580  0039 81            	ret	
 748                     ; 280 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 748                     ; 281                                FunctionalState NewState)
 748                     ; 282 {
 749                     .text:	section	.text,new
 750  0000               _EXTI_SetHalfPortSelection:
 752  0000 89            	pushw	x
 753       00000000      OFST:	set	0
 756                     ; 284   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 758                     ; 285   assert_param(IS_FUNCTIONAL_STATE(NewState));
 760                     ; 287   if ((EXTI_HalfPort & 0x80) == 0x00)
 762  0001 9e            	ld	a,xh
 763  0002 a580          	bcp	a,#128
 764  0004 2616          	jrne	L103
 765                     ; 289     if (NewState != DISABLE)
 767  0006 7b02          	ld	a,(OFST+2,sp)
 768  0008 2707          	jreq	L303
 769                     ; 292       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 771  000a c650a5        	ld	a,20645
 772  000d 1a01          	or	a,(OFST+1,sp)
 774  000f 2006          	jp	LC005
 775  0011               L303:
 776                     ; 297       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 778  0011 7b01          	ld	a,(OFST+1,sp)
 779  0013 43            	cpl	a
 780  0014 c450a5        	and	a,20645
 781  0017               LC005:
 782  0017 c750a5        	ld	20645,a
 783  001a 2018          	jra	L703
 784  001c               L103:
 785                     ; 302     if (NewState != DISABLE)
 787  001c 7b02          	ld	a,(OFST+2,sp)
 788  001e 2709          	jreq	L113
 789                     ; 305       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 791  0020 7b01          	ld	a,(OFST+1,sp)
 792  0022 a47f          	and	a,#127
 793  0024 ca50ab        	or	a,20651
 795  0027 2008          	jp	LC004
 796  0029               L113:
 797                     ; 310       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 799  0029 7b01          	ld	a,(OFST+1,sp)
 800  002b a47f          	and	a,#127
 801  002d 43            	cpl	a
 802  002e c450ab        	and	a,20651
 803  0031               LC004:
 804  0031 c750ab        	ld	20651,a
 805  0034               L703:
 806                     ; 313 }
 809  0034 85            	popw	x
 810  0035 81            	ret	
 856                     ; 338 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 856                     ; 339                              EXTI_Trigger_TypeDef EXTI_Trigger)
 856                     ; 340 {
 857                     .text:	section	.text,new
 858  0000               _EXTI_SetPortSensitivity:
 860  0000 89            	pushw	x
 861       00000000      OFST:	set	0
 864                     ; 342   assert_param(IS_EXTI_PORT(EXTI_Port));
 866                     ; 343   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 868                     ; 346   if ((EXTI_Port & 0xF0) == 0x00)
 870  0001 9e            	ld	a,xh
 871  0002 a5f0          	bcp	a,#240
 872  0004 2629          	jrne	L733
 873                     ; 349     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 875  0006 7b01          	ld	a,(OFST+1,sp)
 876  0008 5f            	clrw	x
 877  0009 97            	ld	xl,a
 878  000a a603          	ld	a,#3
 879  000c 5d            	tnzw	x
 880  000d 2704          	jreq	L65
 881  000f               L06:
 882  000f 48            	sll	a
 883  0010 5a            	decw	x
 884  0011 26fc          	jrne	L06
 885  0013               L65:
 886  0013 43            	cpl	a
 887  0014 c450a2        	and	a,20642
 888  0017 c750a2        	ld	20642,a
 889                     ; 351     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 891  001a 7b01          	ld	a,(OFST+1,sp)
 892  001c 5f            	clrw	x
 893  001d 97            	ld	xl,a
 894  001e 7b02          	ld	a,(OFST+2,sp)
 895  0020 5d            	tnzw	x
 896  0021 2704          	jreq	L26
 897  0023               L46:
 898  0023 48            	sll	a
 899  0024 5a            	decw	x
 900  0025 26fc          	jrne	L46
 901  0027               L26:
 902  0027 ca50a2        	or	a,20642
 903  002a c750a2        	ld	20642,a
 905  002d 202b          	jra	L143
 906  002f               L733:
 907                     ; 356     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 909  002f 7b01          	ld	a,(OFST+1,sp)
 910  0031 a40f          	and	a,#15
 911  0033 5f            	clrw	x
 912  0034 97            	ld	xl,a
 913  0035 a603          	ld	a,#3
 914  0037 5d            	tnzw	x
 915  0038 2704          	jreq	L66
 916  003a               L07:
 917  003a 48            	sll	a
 918  003b 5a            	decw	x
 919  003c 26fc          	jrne	L07
 920  003e               L66:
 921  003e 43            	cpl	a
 922  003f c450aa        	and	a,20650
 923  0042 c750aa        	ld	20650,a
 924                     ; 358     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 926  0045 7b01          	ld	a,(OFST+1,sp)
 927  0047 a40f          	and	a,#15
 928  0049 5f            	clrw	x
 929  004a 97            	ld	xl,a
 930  004b 7b02          	ld	a,(OFST+2,sp)
 931  004d 5d            	tnzw	x
 932  004e 2704          	jreq	L27
 933  0050               L47:
 934  0050 48            	sll	a
 935  0051 5a            	decw	x
 936  0052 26fc          	jrne	L47
 937  0054               L27:
 938  0054 ca50aa        	or	a,20650
 939  0057 c750aa        	ld	20650,a
 940  005a               L143:
 941                     ; 360 }
 944  005a 85            	popw	x
 945  005b 81            	ret	
 991                     ; 376 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
 991                     ; 377 {
 992                     .text:	section	.text,new
 993  0000               _EXTI_GetPinSensitivity:
 995  0000 88            	push	a
 996       00000001      OFST:	set	1
 999                     ; 378   uint8_t value = 0;
1001  0001 0f01          	clr	(OFST+0,sp)
1002                     ; 381   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1004                     ; 383   switch (EXTI_Pin)
1007                     ; 409     default:
1007                     ; 410       break;
1008  0003 4d            	tnz	a
1009  0004 2720          	jreq	L343
1010  0006 a002          	sub	a,#2
1011  0008 2721          	jreq	L543
1012  000a a002          	sub	a,#2
1013  000c 2722          	jreq	L743
1014  000e a002          	sub	a,#2
1015  0010 2724          	jreq	L153
1016  0012 a00a          	sub	a,#10
1017  0014 2725          	jreq	L353
1018  0016 a002          	sub	a,#2
1019  0018 2726          	jreq	L553
1020  001a a002          	sub	a,#2
1021  001c 272b          	jreq	L753
1022  001e a002          	sub	a,#2
1023  0020 272d          	jreq	L163
1024  0022 7b01          	ld	a,(OFST+0,sp)
1025  0024 2033          	jra	LC006
1026  0026               L343:
1027                     ; 385     case EXTI_Pin_0:
1027                     ; 386       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1029  0026 c650a0        	ld	a,20640
1030                     ; 387       break;
1032  0029 202c          	jp	LC007
1033  002b               L543:
1034                     ; 388     case EXTI_Pin_1:
1034                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1036  002b c650a0        	ld	a,20640
1037                     ; 390       break;
1039  002e 2013          	jp	LC009
1040  0030               L743:
1041                     ; 391     case EXTI_Pin_2:
1041                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1043  0030 c650a0        	ld	a,20640
1044  0033 4e            	swap	a
1045                     ; 393       break;
1047  0034 2021          	jp	LC007
1048  0036               L153:
1049                     ; 394     case EXTI_Pin_3:
1049                     ; 395       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1051  0036 c650a0        	ld	a,20640
1052                     ; 396       break;
1054  0039 2017          	jp	LC008
1055  003b               L353:
1056                     ; 397     case EXTI_Pin_4:
1056                     ; 398       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1058  003b c650a1        	ld	a,20641
1059                     ; 399       break;
1061  003e 2017          	jp	LC007
1062  0040               L553:
1063                     ; 400     case EXTI_Pin_5:
1063                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1065  0040 c650a1        	ld	a,20641
1066  0043               LC009:
1067  0043 a40c          	and	a,#12
1068  0045 44            	srl	a
1069  0046 44            	srl	a
1070                     ; 402       break;
1072  0047 2010          	jp	LC006
1073  0049               L753:
1074                     ; 403     case EXTI_Pin_6:
1074                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1076  0049 c650a1        	ld	a,20641
1077  004c 4e            	swap	a
1078                     ; 405       break;
1080  004d 2008          	jp	LC007
1081  004f               L163:
1082                     ; 406     case EXTI_Pin_7:
1082                     ; 407       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1084  004f c650a1        	ld	a,20641
1085  0052               LC008:
1086  0052 4e            	swap	a
1087  0053 a40c          	and	a,#12
1088  0055 44            	srl	a
1089  0056 44            	srl	a
1090  0057               LC007:
1091  0057 a403          	and	a,#3
1092  0059               LC006:
1093                     ; 408       break;
1095                     ; 409     default:
1095                     ; 410       break;
1097                     ; 412   return((EXTI_Trigger_TypeDef)value);
1101  0059 5b01          	addw	sp,#1
1102  005b 81            	ret	
1148                     ; 427 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1148                     ; 428 {
1149                     .text:	section	.text,new
1150  0000               _EXTI_GetPortSensitivity:
1152  0000 88            	push	a
1153  0001 88            	push	a
1154       00000001      OFST:	set	1
1157                     ; 429   uint8_t portsensitivity = 0;
1159  0002 0f01          	clr	(OFST+0,sp)
1160                     ; 432   assert_param(IS_EXTI_PORT(EXTI_Port));
1162                     ; 435   if ((EXTI_Port & 0xF0) == 0x00)
1164  0004 a5f0          	bcp	a,#240
1165  0006 2610          	jrne	L534
1166                     ; 438     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1168  0008 7b02          	ld	a,(OFST+1,sp)
1169  000a 5f            	clrw	x
1170  000b 97            	ld	xl,a
1171  000c c650a2        	ld	a,20642
1172  000f 5d            	tnzw	x
1173  0010 2716          	jreq	L601
1174  0012               L401:
1175  0012 44            	srl	a
1176  0013 5a            	decw	x
1177  0014 26fc          	jrne	L401
1179  0016 2010          	jra	L601
1180  0018               L534:
1181                     ; 444     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1183  0018 7b02          	ld	a,(OFST+1,sp)
1184  001a a40f          	and	a,#15
1185  001c 5f            	clrw	x
1186  001d 97            	ld	xl,a
1187  001e c650aa        	ld	a,20650
1188  0021 5d            	tnzw	x
1189  0022 2704          	jreq	L601
1190  0024               L011:
1191  0024 44            	srl	a
1192  0025 5a            	decw	x
1193  0026 26fc          	jrne	L011
1194  0028               L601:
1195  0028 a403          	and	a,#3
1196                     ; 447   return((EXTI_Trigger_TypeDef)portsensitivity);
1200  002a 85            	popw	x
1201  002b 81            	ret	
1371                     ; 487 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1371                     ; 488 {
1372                     .text:	section	.text,new
1373  0000               _EXTI_GetITStatus:
1375  0000 89            	pushw	x
1376  0001 88            	push	a
1377       00000001      OFST:	set	1
1380                     ; 489   ITStatus status = RESET;
1382  0002 0f01          	clr	(OFST+0,sp)
1383                     ; 491   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1385                     ; 493   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1387  0004 01            	rrwa	x,a
1388  0005 4f            	clr	a
1389  0006 02            	rlwa	x,a
1390  0007 a30100        	cpw	x,#256
1391  000a 2607          	jrne	L335
1392                     ; 495     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1394  000c 7b03          	ld	a,(OFST+2,sp)
1395  000e c450a4        	and	a,20644
1397  0011 2005          	jra	L535
1398  0013               L335:
1399                     ; 499     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1401  0013 7b03          	ld	a,(OFST+2,sp)
1402  0015 c450a3        	and	a,20643
1403  0018               L535:
1404                     ; 501   return((ITStatus)status);
1408  0018 5b03          	addw	sp,#3
1409  001a 81            	ret	
1454                     ; 524 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1454                     ; 525 {
1455                     .text:	section	.text,new
1456  0000               _EXTI_ClearITPendingBit:
1458  0000 89            	pushw	x
1459  0001 89            	pushw	x
1460       00000002      OFST:	set	2
1463                     ; 526   uint16_t tempvalue = 0;
1465                     ; 529   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1467                     ; 531   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1469  0002 7b03          	ld	a,(OFST+1,sp)
1470  0004 97            	ld	xl,a
1471  0005 4f            	clr	a
1472  0006 02            	rlwa	x,a
1473  0007 1f01          	ldw	(OFST-1,sp),x
1474                     ; 533   if ( tempvalue == 0x0100)
1476  0009 a30100        	cpw	x,#256
1477  000c 2607          	jrne	L165
1478                     ; 535     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1480  000e 7b04          	ld	a,(OFST+2,sp)
1481  0010 c750a4        	ld	20644,a
1483  0013 2005          	jra	L365
1484  0015               L165:
1485                     ; 539     EXTI->SR1 = (uint8_t) (EXTI_IT);
1487  0015 7b04          	ld	a,(OFST+2,sp)
1488  0017 c750a3        	ld	20643,a
1489  001a               L365:
1490                     ; 541 }
1493  001a 5b04          	addw	sp,#4
1494  001c 81            	ret	
1507                     	xdef	_EXTI_ClearITPendingBit
1508                     	xdef	_EXTI_GetITStatus
1509                     	xdef	_EXTI_GetPortSensitivity
1510                     	xdef	_EXTI_GetPinSensitivity
1511                     	xdef	_EXTI_SetPortSensitivity
1512                     	xdef	_EXTI_SetHalfPortSelection
1513                     	xdef	_EXTI_SelectPort
1514                     	xdef	_EXTI_SetPinSensitivity
1515                     	xdef	_EXTI_DeInit
1534                     	end
