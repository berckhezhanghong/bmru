   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
 189                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
 189                     ; 142 {
 190                     .text:	section	.text,new
 191  0000               f_I2C_DeInit:
 195                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 197  0000 7f            	clr	(x)
 198                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 200  0001 6f01          	clr	(1,x)
 201                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 203  0003 6f02          	clr	(2,x)
 204                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 206  0005 6f03          	clr	(3,x)
 207                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 209  0007 6f04          	clr	(4,x)
 210                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 212  0009 6f05          	clr	(5,x)
 213                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 215  000b 6f0a          	clr	(10,x)
 216                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 218  000d 6f0b          	clr	(11,x)
 219                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 221  000f 6f0c          	clr	(12,x)
 222                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 224  0011 a602          	ld	a,#2
 225  0013 e70d          	ld	(13,x),a
 226                     ; 153 }
 229  0015 87            	retf	
 440                     .const:	section	.text
 441  0000               L21:
 442  0000 000f4240      	dc.l	1000000
 443  0004               L41:
 444  0004 000186a1      	dc.l	100001
 445  0008               L61:
 446  0008 00000004      	dc.l	4
 447                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 447                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 447                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 447                     ; 187 {
 448                     .text:	section	.text,new
 449  0000               f_I2C_Init:
 451  0000 89            	pushw	x
 452  0001 520c          	subw	sp,#12
 453       0000000c      OFST:	set	12
 456                     ; 188   uint32_t result = 0x0004;
 458  0003 96            	ldw	x,sp
 459  0004 1c0009        	addw	x,#OFST-3
 460  0007 8d000000      	callf	d_ltor
 462                     ; 189   uint16_t tmpval = 0;
 464                     ; 190   uint8_t tmpccrh = 0;
 466  000b 0f07          	clr	(OFST-5,sp)
 467                     ; 191   uint8_t input_clock = 0;
 469                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
 471                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 473                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 475                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 477                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 479                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 481                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 483  000d 8d000000      	callf	f_CLK_GetClockFreq
 485  0011 ae0000        	ldw	x,#L21
 486  0014 8d000000      	callf	d_ludv
 488  0018 b603          	ld	a,c_lreg+3
 489  001a 6b08          	ld	(OFST-4,sp),a
 490                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 492  001c 1e0d          	ldw	x,(OFST+1,sp)
 493  001e e602          	ld	a,(2,x)
 494  0020 a4c0          	and	a,#192
 495  0022 e702          	ld	(2,x),a
 496                     ; 209   I2Cx->FREQR |= input_clock;
 498  0024 e602          	ld	a,(2,x)
 499  0026 1a08          	or	a,(OFST-4,sp)
 500  0028 e702          	ld	(2,x),a
 501                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 503  002a f6            	ld	a,(x)
 504  002b a4fe          	and	a,#254
 505  002d f7            	ld	(x),a
 506                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 508  002e e60c          	ld	a,(12,x)
 509  0030 a430          	and	a,#48
 510  0032 e70c          	ld	(12,x),a
 511                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 513  0034 6f0b          	clr	(11,x)
 514                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 516  0036 96            	ldw	x,sp
 517  0037 1c0012        	addw	x,#OFST+6
 518  003a 8d000000      	callf	d_ltor
 520  003e ae0004        	ldw	x,#L41
 521  0041 8d000000      	callf	d_lcmp
 523  0045 2404ace500e5  	jrult	L742
 524                     ; 223     tmpccrh = I2C_CCRH_FS;
 526  004b a680          	ld	a,#128
 527  004d 6b07          	ld	(OFST-5,sp),a
 528                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 530  004f 0d19          	tnz	(OFST+13,sp)
 531  0051 96            	ldw	x,sp
 532  0052 2634          	jrne	L152
 533                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 535  0054 1c0012        	addw	x,#OFST+6
 536  0057 8d000000      	callf	d_ltor
 538  005b a603          	ld	a,#3
 539  005d 8d000000      	callf	d_smul
 541  0061 96            	ldw	x,sp
 542  0062 5c            	incw	x
 543  0063 8d000000      	callf	d_rtol
 545  0067 7b08          	ld	a,(OFST-4,sp)
 546  0069 b703          	ld	c_lreg+3,a
 547  006b 3f02          	clr	c_lreg+2
 548  006d 3f01          	clr	c_lreg+1
 549  006f 3f00          	clr	c_lreg
 550  0071 ae0000        	ldw	x,#L21
 551  0074 8d000000      	callf	d_lmul
 553  0078 96            	ldw	x,sp
 554  0079 5c            	incw	x
 555  007a 8d000000      	callf	d_ludv
 557  007e 96            	ldw	x,sp
 558  007f 1c0009        	addw	x,#OFST-3
 559  0082 8d000000      	callf	d_rtol
 562  0086 2038          	jra	L352
 563  0088               L152:
 564                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 566  0088 1c0012        	addw	x,#OFST+6
 567  008b 8d000000      	callf	d_ltor
 569  008f a619          	ld	a,#25
 570  0091 8d000000      	callf	d_smul
 572  0095 96            	ldw	x,sp
 573  0096 5c            	incw	x
 574  0097 8d000000      	callf	d_rtol
 576  009b 7b08          	ld	a,(OFST-4,sp)
 577  009d b703          	ld	c_lreg+3,a
 578  009f 3f02          	clr	c_lreg+2
 579  00a1 3f01          	clr	c_lreg+1
 580  00a3 3f00          	clr	c_lreg
 581  00a5 ae0000        	ldw	x,#L21
 582  00a8 8d000000      	callf	d_lmul
 584  00ac 96            	ldw	x,sp
 585  00ad 5c            	incw	x
 586  00ae 8d000000      	callf	d_ludv
 588  00b2 96            	ldw	x,sp
 589  00b3 1c0009        	addw	x,#OFST-3
 590  00b6 8d000000      	callf	d_rtol
 592                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 594  00ba 7b07          	ld	a,(OFST-5,sp)
 595  00bc aa40          	or	a,#64
 596  00be 6b07          	ld	(OFST-5,sp),a
 597  00c0               L352:
 598                     ; 239     if (result < (uint16_t)0x01)
 600  00c0 96            	ldw	x,sp
 601  00c1 1c0009        	addw	x,#OFST-3
 602  00c4 8d000000      	callf	d_lzmp
 604  00c8 2608          	jrne	L552
 605                     ; 242       result = (uint16_t)0x0001;
 607  00ca ae0001        	ldw	x,#1
 608  00cd 1f0b          	ldw	(OFST-1,sp),x
 609  00cf 5f            	clrw	x
 610  00d0 1f09          	ldw	(OFST-3,sp),x
 611  00d2               L552:
 612                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 614  00d2 7b08          	ld	a,(OFST-4,sp)
 615  00d4 97            	ld	xl,a
 616  00d5 a603          	ld	a,#3
 617  00d7 42            	mul	x,a
 618  00d8 a60a          	ld	a,#10
 619  00da 8d000000      	callf	d_sdivx
 621  00de 5c            	incw	x
 622  00df 1f05          	ldw	(OFST-7,sp),x
 623                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 625  00e1 7b06          	ld	a,(OFST-6,sp)
 627  00e3 2057          	jra	L752
 628  00e5               L742:
 629                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 631  00e5 96            	ldw	x,sp
 632  00e6 1c0012        	addw	x,#OFST+6
 633  00e9 8d000000      	callf	d_ltor
 635  00ed 3803          	sll	c_lreg+3
 636  00ef 3902          	rlc	c_lreg+2
 637  00f1 3901          	rlc	c_lreg+1
 638  00f3 3900          	rlc	c_lreg
 639  00f5 96            	ldw	x,sp
 640  00f6 5c            	incw	x
 641  00f7 8d000000      	callf	d_rtol
 643  00fb 7b08          	ld	a,(OFST-4,sp)
 644  00fd b703          	ld	c_lreg+3,a
 645  00ff 3f02          	clr	c_lreg+2
 646  0101 3f01          	clr	c_lreg+1
 647  0103 3f00          	clr	c_lreg
 648  0105 ae0000        	ldw	x,#L21
 649  0108 8d000000      	callf	d_lmul
 651  010c 96            	ldw	x,sp
 652  010d 5c            	incw	x
 653  010e 8d000000      	callf	d_ludv
 655  0112 be02          	ldw	x,c_lreg+2
 656  0114 8d000000      	callf	d_uitolx
 658  0118 96            	ldw	x,sp
 659  0119 1c0009        	addw	x,#OFST-3
 660  011c 8d000000      	callf	d_rtol
 662                     ; 259     if (result < (uint16_t)0x0004)
 664  0120 96            	ldw	x,sp
 665  0121 1c0009        	addw	x,#OFST-3
 666  0124 8d000000      	callf	d_ltor
 668  0128 ae0008        	ldw	x,#L61
 669  012b 8d000000      	callf	d_lcmp
 671  012f 2408          	jruge	L162
 672                     ; 262       result = (uint16_t)0x0004;
 674  0131 ae0004        	ldw	x,#4
 675  0134 1f0b          	ldw	(OFST-1,sp),x
 676  0136 5f            	clrw	x
 677  0137 1f09          	ldw	(OFST-3,sp),x
 678  0139               L162:
 679                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 681  0139 7b08          	ld	a,(OFST-4,sp)
 682  013b 4c            	inc	a
 683  013c               L752:
 684  013c 1e0d          	ldw	x,(OFST+1,sp)
 685  013e e70d          	ld	(13,x),a
 686                     ; 273   I2Cx->CCRL = (uint8_t)result;
 688  0140 7b0c          	ld	a,(OFST+0,sp)
 689  0142 e70b          	ld	(11,x),a
 690                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 692  0144 7b07          	ld	a,(OFST-5,sp)
 693  0146 e70c          	ld	(12,x),a
 694                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 696  0148 7b18          	ld	a,(OFST+12,sp)
 697  014a aa01          	or	a,#1
 698  014c fa            	or	a,(x)
 699  014d f7            	ld	(x),a
 700                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 702  014e e601          	ld	a,(1,x)
 703  0150 1a1a          	or	a,(OFST+14,sp)
 704  0152 e701          	ld	(1,x),a
 705                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 707  0154 7b17          	ld	a,(OFST+11,sp)
 708  0156 e703          	ld	(3,x),a
 709                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 709                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 711  0158 7b16          	ld	a,(OFST+10,sp)
 712  015a a403          	and	a,#3
 713  015c 97            	ld	xl,a
 714  015d 4f            	clr	a
 715  015e 02            	rlwa	x,a
 716  015f a607          	ld	a,#7
 717  0161               L02:
 718  0161 54            	srlw	x
 719  0162 4a            	dec	a
 720  0163 26fc          	jrne	L02
 721  0165 9f            	ld	a,xl
 722  0166 6b04          	ld	(OFST-8,sp),a
 723  0168 7b1b          	ld	a,(OFST+15,sp)
 724  016a aa40          	or	a,#64
 725  016c 1a04          	or	a,(OFST-8,sp)
 726  016e 1e0d          	ldw	x,(OFST+1,sp)
 727  0170 e704          	ld	(4,x),a
 728                     ; 286 }
 731  0172 5b0e          	addw	sp,#14
 732  0174 87            	retf	
 798                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 798                     ; 296 {
 799                     .text:	section	.text,new
 800  0000               f_I2C_Cmd:
 802  0000 89            	pushw	x
 803       00000000      OFST:	set	0
 806                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 808                     ; 301   if (NewState != DISABLE)
 810  0001 7b06          	ld	a,(OFST+6,sp)
 811  0003 2705          	jreq	L713
 812                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 814  0005 f6            	ld	a,(x)
 815  0006 aa01          	or	a,#1
 817  0008 2005          	jra	L123
 818  000a               L713:
 819                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 821  000a 1e01          	ldw	x,(OFST+1,sp)
 822  000c f6            	ld	a,(x)
 823  000d a4fe          	and	a,#254
 824  000f               L123:
 825  000f f7            	ld	(x),a
 826                     ; 311 }
 829  0010 85            	popw	x
 830  0011 87            	retf	
 876                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 876                     ; 321 {
 877                     .text:	section	.text,new
 878  0000               f_I2C_GeneralCallCmd:
 880  0000 89            	pushw	x
 881       00000000      OFST:	set	0
 884                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 886                     ; 326   if (NewState != DISABLE)
 888  0001 7b06          	ld	a,(OFST+6,sp)
 889  0003 2705          	jreq	L743
 890                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 892  0005 f6            	ld	a,(x)
 893  0006 aa40          	or	a,#64
 895  0008 2005          	jra	L153
 896  000a               L743:
 897                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 899  000a 1e01          	ldw	x,(OFST+1,sp)
 900  000c f6            	ld	a,(x)
 901  000d a4bf          	and	a,#191
 902  000f               L153:
 903  000f f7            	ld	(x),a
 904                     ; 336 }
 907  0010 85            	popw	x
 908  0011 87            	retf	
 954                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 954                     ; 348 {
 955                     .text:	section	.text,new
 956  0000               f_I2C_GenerateSTART:
 958  0000 89            	pushw	x
 959       00000000      OFST:	set	0
 962                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 964                     ; 353   if (NewState != DISABLE)
 966  0001 7b06          	ld	a,(OFST+6,sp)
 967  0003 2706          	jreq	L773
 968                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
 970  0005 e601          	ld	a,(1,x)
 971  0007 aa01          	or	a,#1
 973  0009 2006          	jra	L104
 974  000b               L773:
 975                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
 977  000b 1e01          	ldw	x,(OFST+1,sp)
 978  000d e601          	ld	a,(1,x)
 979  000f a4fe          	and	a,#254
 980  0011               L104:
 981  0011 e701          	ld	(1,x),a
 982                     ; 363 }
 985  0013 85            	popw	x
 986  0014 87            	retf	
1032                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1032                     ; 373 {
1033                     .text:	section	.text,new
1034  0000               f_I2C_GenerateSTOP:
1036  0000 89            	pushw	x
1037       00000000      OFST:	set	0
1040                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
1042                     ; 378   if (NewState != DISABLE)
1044  0001 7b06          	ld	a,(OFST+6,sp)
1045  0003 2706          	jreq	L724
1046                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
1048  0005 e601          	ld	a,(1,x)
1049  0007 aa02          	or	a,#2
1051  0009 2006          	jra	L134
1052  000b               L724:
1053                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1055  000b 1e01          	ldw	x,(OFST+1,sp)
1056  000d e601          	ld	a,(1,x)
1057  000f a4fd          	and	a,#253
1058  0011               L134:
1059  0011 e701          	ld	(1,x),a
1060                     ; 388 }
1063  0013 85            	popw	x
1064  0014 87            	retf	
1111                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1111                     ; 398 {
1112                     .text:	section	.text,new
1113  0000               f_I2C_SoftwareResetCmd:
1115  0000 89            	pushw	x
1116       00000000      OFST:	set	0
1119                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
1121                     ; 402   if (NewState != DISABLE)
1123  0001 7b06          	ld	a,(OFST+6,sp)
1124  0003 2706          	jreq	L754
1125                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
1127  0005 e601          	ld	a,(1,x)
1128  0007 aa80          	or	a,#128
1130  0009 2006          	jra	L164
1131  000b               L754:
1132                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1134  000b 1e01          	ldw	x,(OFST+1,sp)
1135  000d e601          	ld	a,(1,x)
1136  000f a47f          	and	a,#127
1137  0011               L164:
1138  0011 e701          	ld	(1,x),a
1139                     ; 412 }
1142  0013 85            	popw	x
1143  0014 87            	retf	
1190                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1190                     ; 422 {
1191                     .text:	section	.text,new
1192  0000               f_I2C_StretchClockCmd:
1194  0000 89            	pushw	x
1195       00000000      OFST:	set	0
1198                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1200                     ; 426   if (NewState != DISABLE)
1202  0001 7b06          	ld	a,(OFST+6,sp)
1203  0003 2705          	jreq	L705
1204                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1206  0005 f6            	ld	a,(x)
1207  0006 a47f          	and	a,#127
1209  0008 2005          	jra	L115
1210  000a               L705:
1211                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1213  000a 1e01          	ldw	x,(OFST+1,sp)
1214  000c f6            	ld	a,(x)
1215  000d aa80          	or	a,#128
1216  000f               L115:
1217  000f f7            	ld	(x),a
1218                     ; 437 }
1221  0010 85            	popw	x
1222  0011 87            	retf	
1268                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1268                     ; 447 {
1269                     .text:	section	.text,new
1270  0000               f_I2C_ARPCmd:
1272  0000 89            	pushw	x
1273       00000000      OFST:	set	0
1276                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1278                     ; 451   if (NewState != DISABLE)
1280  0001 7b06          	ld	a,(OFST+6,sp)
1281  0003 2705          	jreq	L735
1282                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
1284  0005 f6            	ld	a,(x)
1285  0006 aa10          	or	a,#16
1287  0008 2005          	jra	L145
1288  000a               L735:
1289                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1291  000a 1e01          	ldw	x,(OFST+1,sp)
1292  000c f6            	ld	a,(x)
1293  000d a4ef          	and	a,#239
1294  000f               L145:
1295  000f f7            	ld	(x),a
1296                     ; 462 }
1299  0010 85            	popw	x
1300  0011 87            	retf	
1347                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1347                     ; 472 {
1348                     .text:	section	.text,new
1349  0000               f_I2C_AcknowledgeConfig:
1351  0000 89            	pushw	x
1352       00000000      OFST:	set	0
1355                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1357                     ; 476   if (NewState != DISABLE)
1359  0001 7b06          	ld	a,(OFST+6,sp)
1360  0003 2706          	jreq	L765
1361                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
1363  0005 e601          	ld	a,(1,x)
1364  0007 aa04          	or	a,#4
1366  0009 2006          	jra	L175
1367  000b               L765:
1368                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1370  000b 1e01          	ldw	x,(OFST+1,sp)
1371  000d e601          	ld	a,(1,x)
1372  000f a4fb          	and	a,#251
1373  0011               L175:
1374  0011 e701          	ld	(1,x),a
1375                     ; 486 }
1378  0013 85            	popw	x
1379  0014 87            	retf	
1430                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1430                     ; 495 {
1431                     .text:	section	.text,new
1432  0000               f_I2C_OwnAddress2Config:
1434  0000 89            	pushw	x
1435  0001 88            	push	a
1436       00000001      OFST:	set	1
1439                     ; 496   uint8_t tmpreg = 0;
1441  0002 0f01          	clr	(OFST+0,sp)
1442                     ; 499   tmpreg = I2Cx->OAR2;
1444  0004 e605          	ld	a,(5,x)
1445                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1447  0006 a401          	and	a,#1
1448  0008 6b01          	ld	(OFST+0,sp),a
1449                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1451  000a 7b07          	ld	a,(OFST+6,sp)
1452  000c a4fe          	and	a,#254
1453  000e 1a01          	or	a,(OFST+0,sp)
1454  0010 6b01          	ld	(OFST+0,sp),a
1455                     ; 508   I2Cx->OAR2 = tmpreg;
1457  0012 1e02          	ldw	x,(OFST+1,sp)
1458  0014 e705          	ld	(5,x),a
1459                     ; 509 }
1462  0016 5b03          	addw	sp,#3
1463  0018 87            	retf	
1509                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1509                     ; 519 {
1510                     .text:	section	.text,new
1511  0000               f_I2C_DualAddressCmd:
1513  0000 89            	pushw	x
1514       00000000      OFST:	set	0
1517                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
1519                     ; 523   if (NewState != DISABLE)
1521  0001 7b06          	ld	a,(OFST+6,sp)
1522  0003 2706          	jreq	L346
1523                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1525  0005 e605          	ld	a,(5,x)
1526  0007 aa01          	or	a,#1
1528  0009 2006          	jra	L546
1529  000b               L346:
1530                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1532  000b 1e01          	ldw	x,(OFST+1,sp)
1533  000d e605          	ld	a,(5,x)
1534  000f a4fe          	and	a,#254
1535  0011               L546:
1536  0011 e705          	ld	(5,x),a
1537                     ; 533 }
1540  0013 85            	popw	x
1541  0014 87            	retf	
1610                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1610                     ; 546 {
1611                     .text:	section	.text,new
1612  0000               f_I2C_AckPositionConfig:
1614  0000 89            	pushw	x
1615       00000000      OFST:	set	0
1618                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1620                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1622  0001 e601          	ld	a,(1,x)
1623  0003 a4f7          	and	a,#247
1624  0005 e701          	ld	(1,x),a
1625                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1627  0007 e601          	ld	a,(1,x)
1628  0009 1a06          	or	a,(OFST+6,sp)
1629  000b e701          	ld	(1,x),a
1630                     ; 554 }
1633  000d 85            	popw	x
1634  000e 87            	retf	
1702                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1702                     ; 566 {
1703                     .text:	section	.text,new
1704  0000               f_I2C_SMBusAlertConfig:
1706  0000 89            	pushw	x
1707       00000000      OFST:	set	0
1710                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1712                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1714  0001 7b06          	ld	a,(OFST+6,sp)
1715  0003 2706          	jreq	L737
1716                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1718  0005 e601          	ld	a,(1,x)
1719  0007 aa20          	or	a,#32
1721  0009 2006          	jra	L147
1722  000b               L737:
1723                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1725  000b 1e01          	ldw	x,(OFST+1,sp)
1726  000d e601          	ld	a,(1,x)
1727  000f a4df          	and	a,#223
1728  0011               L147:
1729  0011 e701          	ld	(1,x),a
1730                     ; 581 }
1733  0013 85            	popw	x
1734  0014 87            	retf	
1781                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1781                     ; 593 {
1782                     .text:	section	.text,new
1783  0000               f_I2C_FastModeDutyCycleConfig:
1785  0000 89            	pushw	x
1786       00000000      OFST:	set	0
1789                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1791                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1793  0001 7b06          	ld	a,(OFST+6,sp)
1794  0003 a140          	cp	a,#64
1795  0005 2606          	jrne	L767
1796                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
1798  0007 e60c          	ld	a,(12,x)
1799  0009 aa40          	or	a,#64
1801  000b 2006          	jra	L177
1802  000d               L767:
1803                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1805  000d 1e01          	ldw	x,(OFST+1,sp)
1806  000f e60c          	ld	a,(12,x)
1807  0011 a4bf          	and	a,#191
1808  0013               L177:
1809  0013 e70c          	ld	(12,x),a
1810                     ; 608 }
1813  0015 85            	popw	x
1814  0016 87            	retf	
1890                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1890                     ; 622 {
1891                     .text:	section	.text,new
1892  0000               f_I2C_Send7bitAddress:
1894  0000 89            	pushw	x
1895       00000000      OFST:	set	0
1898                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
1900                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1902                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
1904  0001 7b07          	ld	a,(OFST+7,sp)
1905  0003 2706          	jreq	L1301
1906                     ; 631     Address |= OAR1_ADD0_Set;
1908  0005 7b06          	ld	a,(OFST+6,sp)
1909  0007 aa01          	or	a,#1
1911  0009 2004          	jra	L3301
1912  000b               L1301:
1913                     ; 636     Address &= OAR1_ADD0_Reset;
1915  000b 7b06          	ld	a,(OFST+6,sp)
1916  000d a4fe          	and	a,#254
1917  000f               L3301:
1918  000f 6b06          	ld	(OFST+6,sp),a
1919                     ; 639   I2Cx->DR = Address;
1921  0011 1e01          	ldw	x,(OFST+1,sp)
1922  0013 e706          	ld	(6,x),a
1923                     ; 640 }
1926  0015 85            	popw	x
1927  0016 87            	retf	
1970                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
1970                     ; 665 {
1971                     .text:	section	.text,new
1972  0000               f_I2C_SendData:
1974  0000 89            	pushw	x
1975       00000000      OFST:	set	0
1978                     ; 667   I2Cx->DR = Data;
1980  0001 7b06          	ld	a,(OFST+6,sp)
1981  0003 1e01          	ldw	x,(OFST+1,sp)
1982  0005 e706          	ld	(6,x),a
1983                     ; 668 }
1986  0007 85            	popw	x
1987  0008 87            	retf	
2023                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2023                     ; 677 {
2024                     .text:	section	.text,new
2025  0000               f_I2C_ReceiveData:
2029                     ; 679   return ((uint8_t)I2Cx->DR);
2031  0000 e606          	ld	a,(6,x)
2034  0002 87            	retf	
2080                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2080                     ; 706 {
2081                     .text:	section	.text,new
2082  0000               f_I2C_TransmitPEC:
2084  0000 89            	pushw	x
2085       00000000      OFST:	set	0
2088                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
2090                     ; 710   if (NewState != DISABLE)
2092  0001 7b06          	ld	a,(OFST+6,sp)
2093  0003 2706          	jreq	L3211
2094                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
2096  0005 e601          	ld	a,(1,x)
2097  0007 aa10          	or	a,#16
2099  0009 2006          	jra	L5211
2100  000b               L3211:
2101                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2103  000b 1e01          	ldw	x,(OFST+1,sp)
2104  000d e601          	ld	a,(1,x)
2105  000f a4ef          	and	a,#239
2106  0011               L5211:
2107  0011 e701          	ld	(1,x),a
2108                     ; 720 }
2111  0013 85            	popw	x
2112  0014 87            	retf	
2158                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2158                     ; 730 {
2159                     .text:	section	.text,new
2160  0000               f_I2C_CalculatePEC:
2162  0000 89            	pushw	x
2163       00000000      OFST:	set	0
2166                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
2168                     ; 734   if (NewState != DISABLE)
2170  0001 7b06          	ld	a,(OFST+6,sp)
2171  0003 2705          	jreq	L3511
2172                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
2174  0005 f6            	ld	a,(x)
2175  0006 aa20          	or	a,#32
2177  0008 2005          	jra	L5511
2178  000a               L3511:
2179                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2181  000a 1e01          	ldw	x,(OFST+1,sp)
2182  000c f6            	ld	a,(x)
2183  000d a4df          	and	a,#223
2184  000f               L5511:
2185  000f f7            	ld	(x),a
2186                     ; 744 }
2189  0010 85            	popw	x
2190  0011 87            	retf	
2259                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2259                     ; 756 {
2260                     .text:	section	.text,new
2261  0000               f_I2C_PECPositionConfig:
2263  0000 89            	pushw	x
2264       00000000      OFST:	set	0
2267                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2269                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2271  0001 e601          	ld	a,(1,x)
2272  0003 a4f7          	and	a,#247
2273  0005 e701          	ld	(1,x),a
2274                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2276  0007 e601          	ld	a,(1,x)
2277  0009 1a06          	or	a,(OFST+6,sp)
2278  000b e701          	ld	(1,x),a
2279                     ; 764 }
2282  000d 85            	popw	x
2283  000e 87            	retf	
2319                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2319                     ; 773 {
2320                     .text:	section	.text,new
2321  0000               f_I2C_GetPEC:
2325                     ; 775   return (I2Cx->PECR);
2327  0000 e60e          	ld	a,(14,x)
2330  0002 87            	retf	
2376                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2376                     ; 804 {
2377                     .text:	section	.text,new
2378  0000               f_I2C_DMACmd:
2380  0000 89            	pushw	x
2381       00000000      OFST:	set	0
2384                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
2386                     ; 808   if (NewState != DISABLE)
2388  0001 7b06          	ld	a,(OFST+6,sp)
2389  0003 2706          	jreq	L7521
2390                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
2392  0005 e60a          	ld	a,(10,x)
2393  0007 aa08          	or	a,#8
2395  0009 2006          	jra	L1621
2396  000b               L7521:
2397                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2399  000b 1e01          	ldw	x,(OFST+1,sp)
2400  000d e60a          	ld	a,(10,x)
2401  000f a4f7          	and	a,#247
2402  0011               L1621:
2403  0011 e70a          	ld	(10,x),a
2404                     ; 818 }
2407  0013 85            	popw	x
2408  0014 87            	retf	
2455                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2455                     ; 828 {
2456                     .text:	section	.text,new
2457  0000               f_I2C_DMALastTransferCmd:
2459  0000 89            	pushw	x
2460       00000000      OFST:	set	0
2463                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
2465                     ; 832   if (NewState != DISABLE)
2467  0001 7b06          	ld	a,(OFST+6,sp)
2468  0003 2706          	jreq	L7031
2469                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
2471  0005 e60a          	ld	a,(10,x)
2472  0007 aa10          	or	a,#16
2474  0009 2006          	jra	L1131
2475  000b               L7031:
2476                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2478  000b 1e01          	ldw	x,(OFST+1,sp)
2479  000d e60a          	ld	a,(10,x)
2480  000f a4ef          	and	a,#239
2481  0011               L1131:
2482  0011 e70a          	ld	(10,x),a
2483                     ; 842 }
2486  0013 85            	popw	x
2487  0014 87            	retf	
2675                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2675                     ; 955 {
2676                     .text:	section	.text,new
2677  0000               f_I2C_ITConfig:
2679  0000 89            	pushw	x
2680       00000000      OFST:	set	0
2683                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2685                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2687                     ; 960   if (NewState != DISABLE)
2689  0001 7b08          	ld	a,(OFST+8,sp)
2690  0003 2706          	jreq	L3141
2691                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
2693  0005 e60a          	ld	a,(10,x)
2694  0007 1a07          	or	a,(OFST+7,sp)
2696  0009 2007          	jra	L5141
2697  000b               L3141:
2698                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2700  000b 1e01          	ldw	x,(OFST+1,sp)
2701  000d 7b07          	ld	a,(OFST+7,sp)
2702  000f 43            	cpl	a
2703  0010 e40a          	and	a,(10,x)
2704  0012               L5141:
2705  0012 e70a          	ld	(10,x),a
2706                     ; 970 }
2709  0014 85            	popw	x
2710  0015 87            	retf	
2870                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2870                     ; 995 {
2871                     .text:	section	.text,new
2872  0000               f_I2C_ReadRegister:
2874  0000 89            	pushw	x
2875  0001 5204          	subw	sp,#4
2876       00000004      OFST:	set	4
2879                     ; 996   __IO uint16_t tmp = 0;
2881  0003 5f            	clrw	x
2882  0004 1f03          	ldw	(OFST-1,sp),x
2883                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
2885                     ; 1000   tmp = (uint16_t) I2Cx;
2887  0006 1e05          	ldw	x,(OFST+1,sp)
2888  0008 1f03          	ldw	(OFST-1,sp),x
2889                     ; 1001   tmp += I2C_Register;
2891  000a 7b0a          	ld	a,(OFST+6,sp)
2892  000c 5f            	clrw	x
2893  000d 97            	ld	xl,a
2894  000e 1f01          	ldw	(OFST-3,sp),x
2895  0010 1e03          	ldw	x,(OFST-1,sp)
2896  0012 72fb01        	addw	x,(OFST-3,sp)
2897  0015 1f03          	ldw	(OFST-1,sp),x
2898                     ; 1004   return (*(__IO uint8_t *) tmp);
2900  0017 1e03          	ldw	x,(OFST-1,sp)
2901  0019 f6            	ld	a,(x)
2904  001a 5b06          	addw	sp,#6
2905  001c 87            	retf	
3154                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3154                     ; 1045 {
3155                     .text:	section	.text,new
3156  0000               f_I2C_CheckEvent:
3158  0000 89            	pushw	x
3159  0001 5206          	subw	sp,#6
3160       00000006      OFST:	set	6
3163                     ; 1046   __IO uint16_t lastevent = 0x00;
3165  0003 5f            	clrw	x
3166  0004 1f04          	ldw	(OFST-2,sp),x
3167                     ; 1047   uint8_t flag1 = 0x00 ;
3169                     ; 1048   uint8_t flag2 = 0x00;
3171                     ; 1049   ErrorStatus status = ERROR;
3173                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
3175                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3177  0006 1e0c          	ldw	x,(OFST+6,sp)
3178  0008 a30004        	cpw	x,#4
3179  000b 260a          	jrne	L5261
3180                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3182  000d 1e07          	ldw	x,(OFST+1,sp)
3183  000f e608          	ld	a,(8,x)
3184  0011 a404          	and	a,#4
3185  0013 5f            	clrw	x
3186  0014 97            	ld	xl,a
3188  0015 2019          	jra	L7261
3189  0017               L5261:
3190                     ; 1060     flag1 = I2Cx->SR1;
3192  0017 1e07          	ldw	x,(OFST+1,sp)
3193  0019 e607          	ld	a,(7,x)
3194  001b 6b03          	ld	(OFST-3,sp),a
3195                     ; 1061     flag2 = I2Cx->SR3;
3197  001d e609          	ld	a,(9,x)
3198  001f 6b06          	ld	(OFST+0,sp),a
3199                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3201  0021 7b03          	ld	a,(OFST-3,sp)
3202  0023 5f            	clrw	x
3203  0024 97            	ld	xl,a
3204  0025 1f01          	ldw	(OFST-5,sp),x
3205  0027 7b06          	ld	a,(OFST+0,sp)
3206  0029 97            	ld	xl,a
3207  002a 7b02          	ld	a,(OFST-4,sp)
3208  002c 01            	rrwa	x,a
3209  002d 1a01          	or	a,(OFST-5,sp)
3210  002f 01            	rrwa	x,a
3211  0030               L7261:
3212  0030 1f04          	ldw	(OFST-2,sp),x
3213                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3215  0032 1e04          	ldw	x,(OFST-2,sp)
3216  0034 01            	rrwa	x,a
3217  0035 140d          	and	a,(OFST+7,sp)
3218  0037 01            	rrwa	x,a
3219  0038 140c          	and	a,(OFST+6,sp)
3220  003a 01            	rrwa	x,a
3221  003b 130c          	cpw	x,(OFST+6,sp)
3222  003d 2604          	jrne	L1361
3223                     ; 1068     status = SUCCESS;
3225  003f a601          	ld	a,#1
3227  0041 2001          	jra	L3361
3228  0043               L1361:
3229                     ; 1073     status = ERROR;
3231  0043 4f            	clr	a
3232  0044               L3361:
3233                     ; 1077   return status;
3237  0044 5b08          	addw	sp,#8
3238  0046 87            	retf	
3298                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3298                     ; 1096 {
3299                     .text:	section	.text,new
3300  0000               f_I2C_GetLastEvent:
3302  0000 89            	pushw	x
3303  0001 5206          	subw	sp,#6
3304       00000006      OFST:	set	6
3307                     ; 1097   __IO uint16_t lastevent = 0;
3309  0003 5f            	clrw	x
3310  0004 1f05          	ldw	(OFST-1,sp),x
3311                     ; 1098   uint16_t flag1 = 0;
3313                     ; 1099   uint16_t flag2 = 0;
3315                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3317  0006 1e07          	ldw	x,(OFST+1,sp)
3318  0008 e608          	ld	a,(8,x)
3319  000a a504          	bcp	a,#4
3320  000c 2705          	jreq	L5661
3321                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3323  000e ae0004        	ldw	x,#4
3325  0011 2014          	jra	L7661
3326  0013               L5661:
3327                     ; 1108     flag1 = I2Cx->SR1;
3329  0013 e607          	ld	a,(7,x)
3330  0015 5f            	clrw	x
3331  0016 97            	ld	xl,a
3332  0017 1f01          	ldw	(OFST-5,sp),x
3333                     ; 1109     flag2 = I2Cx->SR3;
3335  0019 1e07          	ldw	x,(OFST+1,sp)
3336  001b e609          	ld	a,(9,x)
3337  001d 5f            	clrw	x
3338  001e 97            	ld	xl,a
3339  001f 1f03          	ldw	(OFST-3,sp),x
3340                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3342  0021 7b02          	ld	a,(OFST-4,sp)
3343  0023 01            	rrwa	x,a
3344  0024 1a01          	or	a,(OFST-5,sp)
3345  0026 01            	rrwa	x,a
3346  0027               L7661:
3347  0027 1f05          	ldw	(OFST-1,sp),x
3348                     ; 1115   return (I2C_Event_TypeDef)lastevent;
3350  0029 1e05          	ldw	x,(OFST-1,sp)
3353  002b 5b08          	addw	sp,#8
3354  002d 87            	retf	
3606                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3606                     ; 1153 {
3607                     .text:	section	.text,new
3608  0000               f_I2C_GetFlagStatus:
3610  0000 89            	pushw	x
3611  0001 89            	pushw	x
3612       00000002      OFST:	set	2
3615                     ; 1154   uint8_t tempreg = 0;
3617  0002 4f            	clr	a
3618  0003 6b02          	ld	(OFST+0,sp),a
3619                     ; 1155   uint8_t regindex = 0;
3621                     ; 1156   FlagStatus bitstatus = RESET;
3623  0005 97            	ld	xl,a
3624                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3626                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3628  0006 7b08          	ld	a,(OFST+6,sp)
3629  0008 6b01          	ld	(OFST-1,sp),a
3630                     ; 1164   switch (regindex)
3633                     ; 1181     default:
3633                     ; 1182       break;
3634  000a 4a            	dec	a
3635  000b 2708          	jreq	L1761
3636  000d 4a            	dec	a
3637  000e 270b          	jreq	L3761
3638  0010 4a            	dec	a
3639  0011 270e          	jreq	L5761
3640  0013 2012          	jra	L7202
3641  0015               L1761:
3642                     ; 1167     case 0x01:
3642                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
3644  0015 1e03          	ldw	x,(OFST+1,sp)
3645  0017 e607          	ld	a,(7,x)
3646                     ; 1169       break;
3648  0019 200a          	jpf	LC001
3649  001b               L3761:
3650                     ; 1172     case 0x02:
3650                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
3652  001b 1e03          	ldw	x,(OFST+1,sp)
3653  001d e608          	ld	a,(8,x)
3654                     ; 1174       break;
3656  001f 2004          	jpf	LC001
3657  0021               L5761:
3658                     ; 1177     case 0x03:
3658                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
3660  0021 1e03          	ldw	x,(OFST+1,sp)
3661  0023 e609          	ld	a,(9,x)
3662  0025               LC001:
3663  0025 6b02          	ld	(OFST+0,sp),a
3664                     ; 1179       break;
3666                     ; 1181     default:
3666                     ; 1182       break;
3668  0027               L7202:
3669                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3671  0027 7b09          	ld	a,(OFST+7,sp)
3672  0029 1502          	bcp	a,(OFST+0,sp)
3673  002b 2704          	jreq	L1302
3674                     ; 1189     bitstatus = SET;
3676  002d a601          	ld	a,#1
3678  002f 2001          	jra	L3302
3679  0031               L1302:
3680                     ; 1194     bitstatus = RESET;
3682  0031 4f            	clr	a
3683  0032               L3302:
3684                     ; 1197   return bitstatus;
3688  0032 5b04          	addw	sp,#4
3689  0034 87            	retf	
3742                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3742                     ; 1230 {
3743                     .text:	section	.text,new
3744  0000               f_I2C_ClearFlag:
3746  0000 89            	pushw	x
3747  0001 89            	pushw	x
3748       00000002      OFST:	set	2
3751                     ; 1231   uint16_t flagpos = 0;
3753                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3755                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3757  0002 7b09          	ld	a,(OFST+7,sp)
3758  0004 5f            	clrw	x
3759  0005 02            	rlwa	x,a
3760  0006 1f01          	ldw	(OFST-1,sp),x
3761                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3763  0008 7b02          	ld	a,(OFST+0,sp)
3764  000a 43            	cpl	a
3765  000b 1e03          	ldw	x,(OFST+1,sp)
3766  000d e708          	ld	(8,x),a
3767                     ; 1239 }
3770  000f 5b04          	addw	sp,#4
3771  0011 87            	retf	
3844                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3844                     ; 1265 {
3845                     .text:	section	.text,new
3846  0000               f_I2C_GetITStatus:
3848  0000 89            	pushw	x
3849  0001 5204          	subw	sp,#4
3850       00000004      OFST:	set	4
3853                     ; 1266   ITStatus bitstatus = RESET;
3855                     ; 1267   __IO uint8_t enablestatus = 0;
3857  0003 0f03          	clr	(OFST-1,sp)
3858                     ; 1268   uint16_t tempregister = 0;
3860  0005 1e01          	ldw	x,(OFST-3,sp)
3861                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
3863                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3865  0007 7b0a          	ld	a,(OFST+6,sp)
3866  0009 a407          	and	a,#7
3867  000b 97            	ld	xl,a
3868  000c 4f            	clr	a
3869  000d 02            	rlwa	x,a
3870  000e 4f            	clr	a
3871  000f 01            	rrwa	x,a
3872  0010 9f            	ld	a,xl
3873  0011 5f            	clrw	x
3874  0012 97            	ld	xl,a
3875  0013 1f01          	ldw	(OFST-3,sp),x
3876                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
3878  0015 1e05          	ldw	x,(OFST+1,sp)
3879  0017 e60a          	ld	a,(10,x)
3880  0019 1402          	and	a,(OFST-2,sp)
3881  001b 6b03          	ld	(OFST-1,sp),a
3882                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
3884  001d 7b0a          	ld	a,(OFST+6,sp)
3885  001f a430          	and	a,#48
3886  0021 97            	ld	xl,a
3887  0022 4f            	clr	a
3888  0023 02            	rlwa	x,a
3889  0024 a30100        	cpw	x,#256
3890  0027 260e          	jrne	L1212
3891                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3893  0029 1e05          	ldw	x,(OFST+1,sp)
3894  002b e607          	ld	a,(7,x)
3895  002d 150b          	bcp	a,(OFST+7,sp)
3896  002f 2716          	jreq	L1312
3898  0031 0d03          	tnz	(OFST-1,sp)
3899  0033 2712          	jreq	L1312
3900                     ; 1284       bitstatus = SET;
3902  0035 200c          	jpf	LC003
3903                     ; 1289       bitstatus = RESET;
3904  0037               L1212:
3905                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3907  0037 1e05          	ldw	x,(OFST+1,sp)
3908  0039 e608          	ld	a,(8,x)
3909  003b 150b          	bcp	a,(OFST+7,sp)
3910  003d 2708          	jreq	L1312
3912  003f 0d03          	tnz	(OFST-1,sp)
3913  0041 2704          	jreq	L1312
3914                     ; 1298       bitstatus = SET;
3916  0043               LC003:
3918  0043 a601          	ld	a,#1
3920  0045 2001          	jra	L7212
3921  0047               L1312:
3922                     ; 1303       bitstatus = RESET;
3925  0047 4f            	clr	a
3926  0048               L7212:
3927                     ; 1307   return  bitstatus;
3931  0048 5b06          	addw	sp,#6
3932  004a 87            	retf	
3986                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3986                     ; 1341 {
3987                     .text:	section	.text,new
3988  0000               f_I2C_ClearITPendingBit:
3990  0000 89            	pushw	x
3991  0001 89            	pushw	x
3992       00000002      OFST:	set	2
3995                     ; 1342   uint16_t flagpos = 0;
3997                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
3999                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4001  0002 7b09          	ld	a,(OFST+7,sp)
4002  0004 5f            	clrw	x
4003  0005 02            	rlwa	x,a
4004  0006 1f01          	ldw	(OFST-1,sp),x
4005                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4007  0008 7b02          	ld	a,(OFST+0,sp)
4008  000a 43            	cpl	a
4009  000b 1e03          	ldw	x,(OFST+1,sp)
4010  000d e708          	ld	(8,x),a
4011                     ; 1352 }
4014  000f 5b04          	addw	sp,#4
4015  0011 87            	retf	
4027                     	xdef	f_I2C_ClearITPendingBit
4028                     	xdef	f_I2C_GetITStatus
4029                     	xdef	f_I2C_ClearFlag
4030                     	xdef	f_I2C_GetFlagStatus
4031                     	xdef	f_I2C_GetLastEvent
4032                     	xdef	f_I2C_CheckEvent
4033                     	xdef	f_I2C_ReadRegister
4034                     	xdef	f_I2C_ITConfig
4035                     	xdef	f_I2C_DMALastTransferCmd
4036                     	xdef	f_I2C_DMACmd
4037                     	xdef	f_I2C_CalculatePEC
4038                     	xdef	f_I2C_TransmitPEC
4039                     	xdef	f_I2C_GetPEC
4040                     	xdef	f_I2C_PECPositionConfig
4041                     	xdef	f_I2C_ReceiveData
4042                     	xdef	f_I2C_SendData
4043                     	xdef	f_I2C_Send7bitAddress
4044                     	xdef	f_I2C_SMBusAlertConfig
4045                     	xdef	f_I2C_FastModeDutyCycleConfig
4046                     	xdef	f_I2C_AckPositionConfig
4047                     	xdef	f_I2C_DualAddressCmd
4048                     	xdef	f_I2C_OwnAddress2Config
4049                     	xdef	f_I2C_AcknowledgeConfig
4050                     	xdef	f_I2C_GenerateSTOP
4051                     	xdef	f_I2C_GenerateSTART
4052                     	xdef	f_I2C_ARPCmd
4053                     	xdef	f_I2C_StretchClockCmd
4054                     	xdef	f_I2C_SoftwareResetCmd
4055                     	xdef	f_I2C_GeneralCallCmd
4056                     	xdef	f_I2C_Cmd
4057                     	xdef	f_I2C_Init
4058                     	xdef	f_I2C_DeInit
4059                     	xref	f_CLK_GetClockFreq
4060                     	xref.b	c_lreg
4079                     	xref	d_uitolx
4080                     	xref	d_sdivx
4081                     	xref	d_lzmp
4082                     	xref	d_rtol
4083                     	xref	d_smul
4084                     	xref	d_lmul
4085                     	xref	d_lcmp
4086                     	xref	d_ludv
4087                     	xref	d_ltor
4088                     	end
