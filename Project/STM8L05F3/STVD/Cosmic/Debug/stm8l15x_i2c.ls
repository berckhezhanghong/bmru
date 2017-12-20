   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
 189                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
 189                     ; 142 {
 191                     .text:	section	.text,new
 192  0000               _I2C_DeInit:
 196                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 198  0000 7f            	clr	(x)
 199                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 201  0001 6f01          	clr	(1,x)
 202                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 204  0003 6f02          	clr	(2,x)
 205                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 207  0005 6f03          	clr	(3,x)
 208                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 210  0007 6f04          	clr	(4,x)
 211                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 213  0009 6f05          	clr	(5,x)
 214                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 216  000b 6f0a          	clr	(10,x)
 217                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 219  000d 6f0b          	clr	(11,x)
 220                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 222  000f 6f0c          	clr	(12,x)
 223                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 225  0011 a602          	ld	a,#2
 226  0013 e70d          	ld	(13,x),a
 227                     ; 153 }
 230  0015 81            	ret	
 454                     .const:	section	.text
 455  0000               L21:
 456  0000 000f4240      	dc.l	1000000
 457  0004               L41:
 458  0004 000186a1      	dc.l	100001
 459  0008               L61:
 460  0008 00000004      	dc.l	4
 461                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 461                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 461                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 461                     ; 187 {
 462                     .text:	section	.text,new
 463  0000               _I2C_Init:
 465  0000 89            	pushw	x
 466  0001 520c          	subw	sp,#12
 467       0000000c      OFST:	set	12
 470                     ; 188   uint32_t result = 0x0004;
 472  0003 96            	ldw	x,sp
 473  0004 1c0009        	addw	x,#OFST-3
 474  0007 cd0000        	call	c_ltor
 476                     ; 189   uint16_t tmpval = 0;
 478                     ; 190   uint8_t tmpccrh = 0;
 480  000a 0f07          	clr	(OFST-5,sp)
 481                     ; 191   uint8_t input_clock = 0;
 483                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
 485                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 487                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 489                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 491                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 493                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 495                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 497  000c cd0000        	call	_CLK_GetClockFreq
 499  000f ae0000        	ldw	x,#L21
 500  0012 cd0000        	call	c_ludv
 502  0015 b603          	ld	a,c_lreg+3
 503  0017 6b08          	ld	(OFST-4,sp),a
 504                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 506  0019 1e0d          	ldw	x,(OFST+1,sp)
 507  001b e602          	ld	a,(2,x)
 508  001d a4c0          	and	a,#192
 509  001f e702          	ld	(2,x),a
 510                     ; 209   I2Cx->FREQR |= input_clock;
 512  0021 e602          	ld	a,(2,x)
 513  0023 1a08          	or	a,(OFST-4,sp)
 514  0025 e702          	ld	(2,x),a
 515                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 517  0027 f6            	ld	a,(x)
 518  0028 a4fe          	and	a,#254
 519  002a f7            	ld	(x),a
 520                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 522  002b e60c          	ld	a,(12,x)
 523  002d a430          	and	a,#48
 524  002f e70c          	ld	(12,x),a
 525                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 527  0031 6f0b          	clr	(11,x)
 528                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 530  0033 96            	ldw	x,sp
 531  0034 1c0011        	addw	x,#OFST+5
 532  0037 cd0000        	call	c_ltor
 534  003a ae0004        	ldw	x,#L41
 535  003d cd0000        	call	c_lcmp
 537  0040 2576          	jrult	L362
 538                     ; 223     tmpccrh = I2C_CCRH_FS;
 540  0042 a680          	ld	a,#128
 541  0044 6b07          	ld	(OFST-5,sp),a
 542                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 544  0046 0d18          	tnz	(OFST+12,sp)
 545  0048 96            	ldw	x,sp
 546  0049 2623          	jrne	L562
 547                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 549  004b 1c0011        	addw	x,#OFST+5
 550  004e cd0000        	call	c_ltor
 552  0051 a603          	ld	a,#3
 553  0053 cd0000        	call	c_smul
 555  0056 96            	ldw	x,sp
 556  0057 5c            	incw	x
 557  0058 cd0000        	call	c_rtol
 559  005b 7b08          	ld	a,(OFST-4,sp)
 560  005d cd0134        	call	LC001
 562  0060 96            	ldw	x,sp
 563  0061 5c            	incw	x
 564  0062 cd0000        	call	c_ludv
 566  0065 96            	ldw	x,sp
 567  0066 1c0009        	addw	x,#OFST-3
 568  0069 cd0000        	call	c_rtol
 571  006c 2027          	jra	L762
 572  006e               L562:
 573                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 575  006e 1c0011        	addw	x,#OFST+5
 576  0071 cd0000        	call	c_ltor
 578  0074 a619          	ld	a,#25
 579  0076 cd0000        	call	c_smul
 581  0079 96            	ldw	x,sp
 582  007a 5c            	incw	x
 583  007b cd0000        	call	c_rtol
 585  007e 7b08          	ld	a,(OFST-4,sp)
 586  0080 cd0134        	call	LC001
 588  0083 96            	ldw	x,sp
 589  0084 5c            	incw	x
 590  0085 cd0000        	call	c_ludv
 592  0088 96            	ldw	x,sp
 593  0089 1c0009        	addw	x,#OFST-3
 594  008c cd0000        	call	c_rtol
 596                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 598  008f 7b07          	ld	a,(OFST-5,sp)
 599  0091 aa40          	or	a,#64
 600  0093 6b07          	ld	(OFST-5,sp),a
 601  0095               L762:
 602                     ; 239     if (result < (uint16_t)0x01)
 604  0095 96            	ldw	x,sp
 605  0096 1c0009        	addw	x,#OFST-3
 606  0099 cd0000        	call	c_lzmp
 608  009c 2608          	jrne	L172
 609                     ; 242       result = (uint16_t)0x0001;
 611  009e ae0001        	ldw	x,#1
 612  00a1 1f0b          	ldw	(OFST-1,sp),x
 613  00a3 5f            	clrw	x
 614  00a4 1f09          	ldw	(OFST-3,sp),x
 615  00a6               L172:
 616                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 618  00a6 7b08          	ld	a,(OFST-4,sp)
 619  00a8 97            	ld	xl,a
 620  00a9 a603          	ld	a,#3
 621  00ab 42            	mul	x,a
 622  00ac a60a          	ld	a,#10
 623  00ae cd0000        	call	c_sdivx
 625  00b1 5c            	incw	x
 626  00b2 1f05          	ldw	(OFST-7,sp),x
 627                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 629  00b4 7b06          	ld	a,(OFST-6,sp)
 631  00b6 2043          	jra	L372
 632  00b8               L362:
 633                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 635  00b8 96            	ldw	x,sp
 636  00b9 1c0011        	addw	x,#OFST+5
 637  00bc cd0000        	call	c_ltor
 639  00bf 3803          	sll	c_lreg+3
 640  00c1 3902          	rlc	c_lreg+2
 641  00c3 3901          	rlc	c_lreg+1
 642  00c5 3900          	rlc	c_lreg
 643  00c7 96            	ldw	x,sp
 644  00c8 5c            	incw	x
 645  00c9 cd0000        	call	c_rtol
 647  00cc 7b08          	ld	a,(OFST-4,sp)
 648  00ce ad64          	call	LC001
 650  00d0 96            	ldw	x,sp
 651  00d1 5c            	incw	x
 652  00d2 cd0000        	call	c_ludv
 654  00d5 be02          	ldw	x,c_lreg+2
 655  00d7 cd0000        	call	c_uitolx
 657  00da 96            	ldw	x,sp
 658  00db 1c0009        	addw	x,#OFST-3
 659  00de cd0000        	call	c_rtol
 661                     ; 259     if (result < (uint16_t)0x0004)
 663  00e1 96            	ldw	x,sp
 664  00e2 1c0009        	addw	x,#OFST-3
 665  00e5 cd0000        	call	c_ltor
 667  00e8 ae0008        	ldw	x,#L61
 668  00eb cd0000        	call	c_lcmp
 670  00ee 2408          	jruge	L572
 671                     ; 262       result = (uint16_t)0x0004;
 673  00f0 ae0004        	ldw	x,#4
 674  00f3 1f0b          	ldw	(OFST-1,sp),x
 675  00f5 5f            	clrw	x
 676  00f6 1f09          	ldw	(OFST-3,sp),x
 677  00f8               L572:
 678                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 680  00f8 7b08          	ld	a,(OFST-4,sp)
 681  00fa 4c            	inc	a
 682  00fb               L372:
 683  00fb 1e0d          	ldw	x,(OFST+1,sp)
 684  00fd e70d          	ld	(13,x),a
 685                     ; 273   I2Cx->CCRL = (uint8_t)result;
 687  00ff 7b0c          	ld	a,(OFST+0,sp)
 688  0101 e70b          	ld	(11,x),a
 689                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 691  0103 7b07          	ld	a,(OFST-5,sp)
 692  0105 e70c          	ld	(12,x),a
 693                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 695  0107 7b17          	ld	a,(OFST+11,sp)
 696  0109 aa01          	or	a,#1
 697  010b fa            	or	a,(x)
 698  010c f7            	ld	(x),a
 699                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 701  010d e601          	ld	a,(1,x)
 702  010f 1a19          	or	a,(OFST+13,sp)
 703  0111 e701          	ld	(1,x),a
 704                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 706  0113 7b16          	ld	a,(OFST+10,sp)
 707  0115 e703          	ld	(3,x),a
 708                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 708                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 710  0117 7b15          	ld	a,(OFST+9,sp)
 711  0119 a403          	and	a,#3
 712  011b 97            	ld	xl,a
 713  011c 4f            	clr	a
 714  011d 02            	rlwa	x,a
 715  011e a607          	ld	a,#7
 716  0120               L02:
 717  0120 54            	srlw	x
 718  0121 4a            	dec	a
 719  0122 26fc          	jrne	L02
 720  0124 9f            	ld	a,xl
 721  0125 6b04          	ld	(OFST-8,sp),a
 722  0127 7b1a          	ld	a,(OFST+14,sp)
 723  0129 aa40          	or	a,#64
 724  012b 1a04          	or	a,(OFST-8,sp)
 725  012d 1e0d          	ldw	x,(OFST+1,sp)
 726  012f e704          	ld	(4,x),a
 727                     ; 286 }
 730  0131 5b0e          	addw	sp,#14
 731  0133 81            	ret	
 733  0134               LC001:
 734  0134 b703          	ld	c_lreg+3,a
 735  0136 3f02          	clr	c_lreg+2
 736  0138 3f01          	clr	c_lreg+1
 737  013a 3f00          	clr	c_lreg
 738  013c ae0000        	ldw	x,#L21
 739  013f cc0000        	jp	c_lmul
 805                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 805                     ; 296 {
 806                     .text:	section	.text,new
 807  0000               _I2C_Cmd:
 809  0000 89            	pushw	x
 810       00000000      OFST:	set	0
 813                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 815                     ; 301   if (NewState != DISABLE)
 817  0001 7b05          	ld	a,(OFST+5,sp)
 818  0003 2705          	jreq	L333
 819                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 821  0005 f6            	ld	a,(x)
 822  0006 aa01          	or	a,#1
 824  0008 2005          	jra	L533
 825  000a               L333:
 826                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 828  000a 1e01          	ldw	x,(OFST+1,sp)
 829  000c f6            	ld	a,(x)
 830  000d a4fe          	and	a,#254
 831  000f               L533:
 832  000f f7            	ld	(x),a
 833                     ; 311 }
 836  0010 85            	popw	x
 837  0011 81            	ret	
 884                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 884                     ; 321 {
 885                     .text:	section	.text,new
 886  0000               _I2C_GeneralCallCmd:
 888  0000 89            	pushw	x
 889       00000000      OFST:	set	0
 892                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 894                     ; 326   if (NewState != DISABLE)
 896  0001 7b05          	ld	a,(OFST+5,sp)
 897  0003 2705          	jreq	L363
 898                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 900  0005 f6            	ld	a,(x)
 901  0006 aa40          	or	a,#64
 903  0008 2005          	jra	L563
 904  000a               L363:
 905                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 907  000a 1e01          	ldw	x,(OFST+1,sp)
 908  000c f6            	ld	a,(x)
 909  000d a4bf          	and	a,#191
 910  000f               L563:
 911  000f f7            	ld	(x),a
 912                     ; 336 }
 915  0010 85            	popw	x
 916  0011 81            	ret	
 963                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 963                     ; 348 {
 964                     .text:	section	.text,new
 965  0000               _I2C_GenerateSTART:
 967  0000 89            	pushw	x
 968       00000000      OFST:	set	0
 971                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 973                     ; 353   if (NewState != DISABLE)
 975  0001 7b05          	ld	a,(OFST+5,sp)
 976  0003 2706          	jreq	L314
 977                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
 979  0005 e601          	ld	a,(1,x)
 980  0007 aa01          	or	a,#1
 982  0009 2006          	jra	L514
 983  000b               L314:
 984                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
 986  000b 1e01          	ldw	x,(OFST+1,sp)
 987  000d e601          	ld	a,(1,x)
 988  000f a4fe          	and	a,#254
 989  0011               L514:
 990  0011 e701          	ld	(1,x),a
 991                     ; 363 }
 994  0013 85            	popw	x
 995  0014 81            	ret	
1042                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1042                     ; 373 {
1043                     .text:	section	.text,new
1044  0000               _I2C_GenerateSTOP:
1046  0000 89            	pushw	x
1047       00000000      OFST:	set	0
1050                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
1052                     ; 378   if (NewState != DISABLE)
1054  0001 7b05          	ld	a,(OFST+5,sp)
1055  0003 2706          	jreq	L344
1056                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
1058  0005 e601          	ld	a,(1,x)
1059  0007 aa02          	or	a,#2
1061  0009 2006          	jra	L544
1062  000b               L344:
1063                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1065  000b 1e01          	ldw	x,(OFST+1,sp)
1066  000d e601          	ld	a,(1,x)
1067  000f a4fd          	and	a,#253
1068  0011               L544:
1069  0011 e701          	ld	(1,x),a
1070                     ; 388 }
1073  0013 85            	popw	x
1074  0014 81            	ret	
1122                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1122                     ; 398 {
1123                     .text:	section	.text,new
1124  0000               _I2C_SoftwareResetCmd:
1126  0000 89            	pushw	x
1127       00000000      OFST:	set	0
1130                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
1132                     ; 402   if (NewState != DISABLE)
1134  0001 7b05          	ld	a,(OFST+5,sp)
1135  0003 2706          	jreq	L374
1136                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
1138  0005 e601          	ld	a,(1,x)
1139  0007 aa80          	or	a,#128
1141  0009 2006          	jra	L574
1142  000b               L374:
1143                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1145  000b 1e01          	ldw	x,(OFST+1,sp)
1146  000d e601          	ld	a,(1,x)
1147  000f a47f          	and	a,#127
1148  0011               L574:
1149  0011 e701          	ld	(1,x),a
1150                     ; 412 }
1153  0013 85            	popw	x
1154  0014 81            	ret	
1202                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1202                     ; 422 {
1203                     .text:	section	.text,new
1204  0000               _I2C_StretchClockCmd:
1206  0000 89            	pushw	x
1207       00000000      OFST:	set	0
1210                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1212                     ; 426   if (NewState != DISABLE)
1214  0001 7b05          	ld	a,(OFST+5,sp)
1215  0003 2705          	jreq	L325
1216                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1218  0005 f6            	ld	a,(x)
1219  0006 a47f          	and	a,#127
1221  0008 2005          	jra	L525
1222  000a               L325:
1223                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1225  000a 1e01          	ldw	x,(OFST+1,sp)
1226  000c f6            	ld	a,(x)
1227  000d aa80          	or	a,#128
1228  000f               L525:
1229  000f f7            	ld	(x),a
1230                     ; 437 }
1233  0010 85            	popw	x
1234  0011 81            	ret	
1281                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1281                     ; 447 {
1282                     .text:	section	.text,new
1283  0000               _I2C_ARPCmd:
1285  0000 89            	pushw	x
1286       00000000      OFST:	set	0
1289                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1291                     ; 451   if (NewState != DISABLE)
1293  0001 7b05          	ld	a,(OFST+5,sp)
1294  0003 2705          	jreq	L355
1295                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
1297  0005 f6            	ld	a,(x)
1298  0006 aa10          	or	a,#16
1300  0008 2005          	jra	L555
1301  000a               L355:
1302                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1304  000a 1e01          	ldw	x,(OFST+1,sp)
1305  000c f6            	ld	a,(x)
1306  000d a4ef          	and	a,#239
1307  000f               L555:
1308  000f f7            	ld	(x),a
1309                     ; 462 }
1312  0010 85            	popw	x
1313  0011 81            	ret	
1361                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1361                     ; 472 {
1362                     .text:	section	.text,new
1363  0000               _I2C_AcknowledgeConfig:
1365  0000 89            	pushw	x
1366       00000000      OFST:	set	0
1369                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1371                     ; 476   if (NewState != DISABLE)
1373  0001 7b05          	ld	a,(OFST+5,sp)
1374  0003 2706          	jreq	L306
1375                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
1377  0005 e601          	ld	a,(1,x)
1378  0007 aa04          	or	a,#4
1380  0009 2006          	jra	L506
1381  000b               L306:
1382                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1384  000b 1e01          	ldw	x,(OFST+1,sp)
1385  000d e601          	ld	a,(1,x)
1386  000f a4fb          	and	a,#251
1387  0011               L506:
1388  0011 e701          	ld	(1,x),a
1389                     ; 486 }
1392  0013 85            	popw	x
1393  0014 81            	ret	
1449                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1449                     ; 495 {
1450                     .text:	section	.text,new
1451  0000               _I2C_OwnAddress2Config:
1453  0000 89            	pushw	x
1454  0001 88            	push	a
1455       00000001      OFST:	set	1
1458                     ; 496   uint8_t tmpreg = 0;
1460  0002 0f01          	clr	(OFST+0,sp)
1461                     ; 499   tmpreg = I2Cx->OAR2;
1463  0004 e605          	ld	a,(5,x)
1464                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1466  0006 a401          	and	a,#1
1467  0008 6b01          	ld	(OFST+0,sp),a
1468                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1470  000a 7b06          	ld	a,(OFST+5,sp)
1471  000c a4fe          	and	a,#254
1472  000e 1a01          	or	a,(OFST+0,sp)
1473  0010 6b01          	ld	(OFST+0,sp),a
1474                     ; 508   I2Cx->OAR2 = tmpreg;
1476  0012 1e02          	ldw	x,(OFST+1,sp)
1477  0014 e705          	ld	(5,x),a
1478                     ; 509 }
1481  0016 5b03          	addw	sp,#3
1482  0018 81            	ret	
1529                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1529                     ; 519 {
1530                     .text:	section	.text,new
1531  0000               _I2C_DualAddressCmd:
1533  0000 89            	pushw	x
1534       00000000      OFST:	set	0
1537                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
1539                     ; 523   if (NewState != DISABLE)
1541  0001 7b05          	ld	a,(OFST+5,sp)
1542  0003 2706          	jreq	L366
1543                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1545  0005 e605          	ld	a,(5,x)
1546  0007 aa01          	or	a,#1
1548  0009 2006          	jra	L566
1549  000b               L366:
1550                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1552  000b 1e01          	ldw	x,(OFST+1,sp)
1553  000d e605          	ld	a,(5,x)
1554  000f a4fe          	and	a,#254
1555  0011               L566:
1556  0011 e705          	ld	(5,x),a
1557                     ; 533 }
1560  0013 85            	popw	x
1561  0014 81            	ret	
1631                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1631                     ; 546 {
1632                     .text:	section	.text,new
1633  0000               _I2C_AckPositionConfig:
1635  0000 89            	pushw	x
1636       00000000      OFST:	set	0
1639                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1641                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1643  0001 e601          	ld	a,(1,x)
1644  0003 a4f7          	and	a,#247
1645  0005 e701          	ld	(1,x),a
1646                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1648  0007 e601          	ld	a,(1,x)
1649  0009 1a05          	or	a,(OFST+5,sp)
1650  000b e701          	ld	(1,x),a
1651                     ; 554 }
1654  000d 85            	popw	x
1655  000e 81            	ret	
1724                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1724                     ; 566 {
1725                     .text:	section	.text,new
1726  0000               _I2C_SMBusAlertConfig:
1728  0000 89            	pushw	x
1729       00000000      OFST:	set	0
1732                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1734                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1736  0001 7b05          	ld	a,(OFST+5,sp)
1737  0003 2706          	jreq	L757
1738                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1740  0005 e601          	ld	a,(1,x)
1741  0007 aa20          	or	a,#32
1743  0009 2006          	jra	L167
1744  000b               L757:
1745                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1747  000b 1e01          	ldw	x,(OFST+1,sp)
1748  000d e601          	ld	a,(1,x)
1749  000f a4df          	and	a,#223
1750  0011               L167:
1751  0011 e701          	ld	(1,x),a
1752                     ; 581 }
1755  0013 85            	popw	x
1756  0014 81            	ret	
1804                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1804                     ; 593 {
1805                     .text:	section	.text,new
1806  0000               _I2C_FastModeDutyCycleConfig:
1808  0000 89            	pushw	x
1809       00000000      OFST:	set	0
1812                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1814                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1816  0001 7b05          	ld	a,(OFST+5,sp)
1817  0003 a140          	cp	a,#64
1818  0005 2606          	jrne	L7001
1819                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
1821  0007 e60c          	ld	a,(12,x)
1822  0009 aa40          	or	a,#64
1824  000b 2006          	jra	L1101
1825  000d               L7001:
1826                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1828  000d 1e01          	ldw	x,(OFST+1,sp)
1829  000f e60c          	ld	a,(12,x)
1830  0011 a4bf          	and	a,#191
1831  0013               L1101:
1832  0013 e70c          	ld	(12,x),a
1833                     ; 608 }
1836  0015 85            	popw	x
1837  0016 81            	ret	
1916                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1916                     ; 622 {
1917                     .text:	section	.text,new
1918  0000               _I2C_Send7bitAddress:
1920  0000 89            	pushw	x
1921       00000000      OFST:	set	0
1924                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
1926                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1928                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
1930  0001 7b06          	ld	a,(OFST+6,sp)
1931  0003 2706          	jreq	L3501
1932                     ; 631     Address |= OAR1_ADD0_Set;
1934  0005 7b05          	ld	a,(OFST+5,sp)
1935  0007 aa01          	or	a,#1
1937  0009 2004          	jra	L5501
1938  000b               L3501:
1939                     ; 636     Address &= OAR1_ADD0_Reset;
1941  000b 7b05          	ld	a,(OFST+5,sp)
1942  000d a4fe          	and	a,#254
1943  000f               L5501:
1944  000f 6b05          	ld	(OFST+5,sp),a
1945                     ; 639   I2Cx->DR = Address;
1947  0011 1e01          	ldw	x,(OFST+1,sp)
1948  0013 e706          	ld	(6,x),a
1949                     ; 640 }
1952  0015 85            	popw	x
1953  0016 81            	ret	
1999                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
1999                     ; 665 {
2000                     .text:	section	.text,new
2001  0000               _I2C_SendData:
2003  0000 89            	pushw	x
2004       00000000      OFST:	set	0
2007                     ; 667   I2Cx->DR = Data;
2009  0001 7b05          	ld	a,(OFST+5,sp)
2010  0003 1e01          	ldw	x,(OFST+1,sp)
2011  0005 e706          	ld	(6,x),a
2012                     ; 668 }
2015  0007 85            	popw	x
2016  0008 81            	ret	
2053                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2053                     ; 677 {
2054                     .text:	section	.text,new
2055  0000               _I2C_ReceiveData:
2059                     ; 679   return ((uint8_t)I2Cx->DR);
2061  0000 e606          	ld	a,(6,x)
2064  0002 81            	ret	
2111                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2111                     ; 706 {
2112                     .text:	section	.text,new
2113  0000               _I2C_TransmitPEC:
2115  0000 89            	pushw	x
2116       00000000      OFST:	set	0
2119                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
2121                     ; 710   if (NewState != DISABLE)
2123  0001 7b05          	ld	a,(OFST+5,sp)
2124  0003 2706          	jreq	L7411
2125                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
2127  0005 e601          	ld	a,(1,x)
2128  0007 aa10          	or	a,#16
2130  0009 2006          	jra	L1511
2131  000b               L7411:
2132                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2134  000b 1e01          	ldw	x,(OFST+1,sp)
2135  000d e601          	ld	a,(1,x)
2136  000f a4ef          	and	a,#239
2137  0011               L1511:
2138  0011 e701          	ld	(1,x),a
2139                     ; 720 }
2142  0013 85            	popw	x
2143  0014 81            	ret	
2190                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2190                     ; 730 {
2191                     .text:	section	.text,new
2192  0000               _I2C_CalculatePEC:
2194  0000 89            	pushw	x
2195       00000000      OFST:	set	0
2198                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
2200                     ; 734   if (NewState != DISABLE)
2202  0001 7b05          	ld	a,(OFST+5,sp)
2203  0003 2705          	jreq	L7711
2204                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
2206  0005 f6            	ld	a,(x)
2207  0006 aa20          	or	a,#32
2209  0008 2005          	jra	L1021
2210  000a               L7711:
2211                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2213  000a 1e01          	ldw	x,(OFST+1,sp)
2214  000c f6            	ld	a,(x)
2215  000d a4df          	and	a,#223
2216  000f               L1021:
2217  000f f7            	ld	(x),a
2218                     ; 744 }
2221  0010 85            	popw	x
2222  0011 81            	ret	
2292                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2292                     ; 756 {
2293                     .text:	section	.text,new
2294  0000               _I2C_PECPositionConfig:
2296  0000 89            	pushw	x
2297       00000000      OFST:	set	0
2300                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2302                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2304  0001 e601          	ld	a,(1,x)
2305  0003 a4f7          	and	a,#247
2306  0005 e701          	ld	(1,x),a
2307                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2309  0007 e601          	ld	a,(1,x)
2310  0009 1a05          	or	a,(OFST+5,sp)
2311  000b e701          	ld	(1,x),a
2312                     ; 764 }
2315  000d 85            	popw	x
2316  000e 81            	ret	
2353                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2353                     ; 773 {
2354                     .text:	section	.text,new
2355  0000               _I2C_GetPEC:
2359                     ; 775   return (I2Cx->PECR);
2361  0000 e60e          	ld	a,(14,x)
2364  0002 81            	ret	
2411                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2411                     ; 804 {
2412                     .text:	section	.text,new
2413  0000               _I2C_DMACmd:
2415  0000 89            	pushw	x
2416       00000000      OFST:	set	0
2419                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
2421                     ; 808   if (NewState != DISABLE)
2423  0001 7b05          	ld	a,(OFST+5,sp)
2424  0003 2706          	jreq	L3031
2425                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
2427  0005 e60a          	ld	a,(10,x)
2428  0007 aa08          	or	a,#8
2430  0009 2006          	jra	L5031
2431  000b               L3031:
2432                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2434  000b 1e01          	ldw	x,(OFST+1,sp)
2435  000d e60a          	ld	a,(10,x)
2436  000f a4f7          	and	a,#247
2437  0011               L5031:
2438  0011 e70a          	ld	(10,x),a
2439                     ; 818 }
2442  0013 85            	popw	x
2443  0014 81            	ret	
2491                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2491                     ; 828 {
2492                     .text:	section	.text,new
2493  0000               _I2C_DMALastTransferCmd:
2495  0000 89            	pushw	x
2496       00000000      OFST:	set	0
2499                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
2501                     ; 832   if (NewState != DISABLE)
2503  0001 7b05          	ld	a,(OFST+5,sp)
2504  0003 2706          	jreq	L3331
2505                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
2507  0005 e60a          	ld	a,(10,x)
2508  0007 aa10          	or	a,#16
2510  0009 2006          	jra	L5331
2511  000b               L3331:
2512                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2514  000b 1e01          	ldw	x,(OFST+1,sp)
2515  000d e60a          	ld	a,(10,x)
2516  000f a4ef          	and	a,#239
2517  0011               L5331:
2518  0011 e70a          	ld	(10,x),a
2519                     ; 842 }
2522  0013 85            	popw	x
2523  0014 81            	ret	
2712                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2712                     ; 955 {
2713                     .text:	section	.text,new
2714  0000               _I2C_ITConfig:
2716  0000 89            	pushw	x
2717       00000000      OFST:	set	0
2720                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2722                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2724                     ; 960   if (NewState != DISABLE)
2726  0001 7b07          	ld	a,(OFST+7,sp)
2727  0003 2706          	jreq	L7341
2728                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
2730  0005 e60a          	ld	a,(10,x)
2731  0007 1a06          	or	a,(OFST+6,sp)
2733  0009 2007          	jra	L1441
2734  000b               L7341:
2735                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2737  000b 1e01          	ldw	x,(OFST+1,sp)
2738  000d 7b06          	ld	a,(OFST+6,sp)
2739  000f 43            	cpl	a
2740  0010 e40a          	and	a,(10,x)
2741  0012               L1441:
2742  0012 e70a          	ld	(10,x),a
2743                     ; 970 }
2746  0014 85            	popw	x
2747  0015 81            	ret	
2908                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2908                     ; 995 {
2909                     .text:	section	.text,new
2910  0000               _I2C_ReadRegister:
2912  0000 89            	pushw	x
2913  0001 5204          	subw	sp,#4
2914       00000004      OFST:	set	4
2917                     ; 996   __IO uint16_t tmp = 0;
2919  0003 5f            	clrw	x
2920  0004 1f03          	ldw	(OFST-1,sp),x
2921                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
2923                     ; 1000   tmp = (uint16_t) I2Cx;
2925  0006 1e05          	ldw	x,(OFST+1,sp)
2926  0008 1f03          	ldw	(OFST-1,sp),x
2927                     ; 1001   tmp += I2C_Register;
2929  000a 7b09          	ld	a,(OFST+5,sp)
2930  000c 5f            	clrw	x
2931  000d 97            	ld	xl,a
2932  000e 1f01          	ldw	(OFST-3,sp),x
2933  0010 1e03          	ldw	x,(OFST-1,sp)
2934  0012 72fb01        	addw	x,(OFST-3,sp)
2935  0015 1f03          	ldw	(OFST-1,sp),x
2936                     ; 1004   return (*(__IO uint8_t *) tmp);
2938  0017 1e03          	ldw	x,(OFST-1,sp)
2939  0019 f6            	ld	a,(x)
2942  001a 5b06          	addw	sp,#6
2943  001c 81            	ret	
3197                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3197                     ; 1045 {
3198                     .text:	section	.text,new
3199  0000               _I2C_CheckEvent:
3201  0000 89            	pushw	x
3202  0001 5206          	subw	sp,#6
3203       00000006      OFST:	set	6
3206                     ; 1046   __IO uint16_t lastevent = 0x00;
3208  0003 5f            	clrw	x
3209  0004 1f04          	ldw	(OFST-2,sp),x
3210                     ; 1047   uint8_t flag1 = 0x00 ;
3212                     ; 1048   uint8_t flag2 = 0x00;
3214                     ; 1049   ErrorStatus status = ERROR;
3216                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
3218                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3220  0006 1e0b          	ldw	x,(OFST+5,sp)
3221  0008 a30004        	cpw	x,#4
3222  000b 260a          	jrne	L5561
3223                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3225  000d 1e07          	ldw	x,(OFST+1,sp)
3226  000f e608          	ld	a,(8,x)
3227  0011 a404          	and	a,#4
3228  0013 5f            	clrw	x
3229  0014 97            	ld	xl,a
3231  0015 2019          	jra	L7561
3232  0017               L5561:
3233                     ; 1060     flag1 = I2Cx->SR1;
3235  0017 1e07          	ldw	x,(OFST+1,sp)
3236  0019 e607          	ld	a,(7,x)
3237  001b 6b03          	ld	(OFST-3,sp),a
3238                     ; 1061     flag2 = I2Cx->SR3;
3240  001d e609          	ld	a,(9,x)
3241  001f 6b06          	ld	(OFST+0,sp),a
3242                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3244  0021 7b03          	ld	a,(OFST-3,sp)
3245  0023 5f            	clrw	x
3246  0024 97            	ld	xl,a
3247  0025 1f01          	ldw	(OFST-5,sp),x
3248  0027 7b06          	ld	a,(OFST+0,sp)
3249  0029 97            	ld	xl,a
3250  002a 7b02          	ld	a,(OFST-4,sp)
3251  002c 01            	rrwa	x,a
3252  002d 1a01          	or	a,(OFST-5,sp)
3253  002f 01            	rrwa	x,a
3254  0030               L7561:
3255  0030 1f04          	ldw	(OFST-2,sp),x
3256                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3258  0032 1e04          	ldw	x,(OFST-2,sp)
3259  0034 01            	rrwa	x,a
3260  0035 140c          	and	a,(OFST+6,sp)
3261  0037 01            	rrwa	x,a
3262  0038 140b          	and	a,(OFST+5,sp)
3263  003a 01            	rrwa	x,a
3264  003b 130b          	cpw	x,(OFST+5,sp)
3265  003d 2604          	jrne	L1661
3266                     ; 1068     status = SUCCESS;
3268  003f a601          	ld	a,#1
3270  0041 2001          	jra	L3661
3271  0043               L1661:
3272                     ; 1073     status = ERROR;
3274  0043 4f            	clr	a
3275  0044               L3661:
3276                     ; 1077   return status;
3280  0044 5b08          	addw	sp,#8
3281  0046 81            	ret	
3346                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3346                     ; 1096 {
3347                     .text:	section	.text,new
3348  0000               _I2C_GetLastEvent:
3350  0000 89            	pushw	x
3351  0001 5206          	subw	sp,#6
3352       00000006      OFST:	set	6
3355                     ; 1097   __IO uint16_t lastevent = 0;
3357  0003 5f            	clrw	x
3358  0004 1f05          	ldw	(OFST-1,sp),x
3359                     ; 1098   uint16_t flag1 = 0;
3361                     ; 1099   uint16_t flag2 = 0;
3363                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3365  0006 1e07          	ldw	x,(OFST+1,sp)
3366  0008 e608          	ld	a,(8,x)
3367  000a a504          	bcp	a,#4
3368  000c 2705          	jreq	L1271
3369                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3371  000e ae0004        	ldw	x,#4
3373  0011 2014          	jra	L3271
3374  0013               L1271:
3375                     ; 1108     flag1 = I2Cx->SR1;
3377  0013 e607          	ld	a,(7,x)
3378  0015 5f            	clrw	x
3379  0016 97            	ld	xl,a
3380  0017 1f01          	ldw	(OFST-5,sp),x
3381                     ; 1109     flag2 = I2Cx->SR3;
3383  0019 1e07          	ldw	x,(OFST+1,sp)
3384  001b e609          	ld	a,(9,x)
3385  001d 5f            	clrw	x
3386  001e 97            	ld	xl,a
3387  001f 1f03          	ldw	(OFST-3,sp),x
3388                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3390  0021 7b02          	ld	a,(OFST-4,sp)
3391  0023 01            	rrwa	x,a
3392  0024 1a01          	or	a,(OFST-5,sp)
3393  0026 01            	rrwa	x,a
3394  0027               L3271:
3395  0027 1f05          	ldw	(OFST-1,sp),x
3396                     ; 1115   return (I2C_Event_TypeDef)lastevent;
3398  0029 1e05          	ldw	x,(OFST-1,sp)
3401  002b 5b08          	addw	sp,#8
3402  002d 81            	ret	
3659                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3659                     ; 1153 {
3660                     .text:	section	.text,new
3661  0000               _I2C_GetFlagStatus:
3663  0000 89            	pushw	x
3664  0001 89            	pushw	x
3665       00000002      OFST:	set	2
3668                     ; 1154   uint8_t tempreg = 0;
3670  0002 4f            	clr	a
3671  0003 6b02          	ld	(OFST+0,sp),a
3672                     ; 1155   uint8_t regindex = 0;
3674                     ; 1156   FlagStatus bitstatus = RESET;
3676  0005 97            	ld	xl,a
3677                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3679                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3681  0006 7b07          	ld	a,(OFST+5,sp)
3682  0008 6b01          	ld	(OFST-1,sp),a
3683                     ; 1164   switch (regindex)
3686                     ; 1181     default:
3686                     ; 1182       break;
3687  000a 4a            	dec	a
3688  000b 2708          	jreq	L5271
3689  000d 4a            	dec	a
3690  000e 270b          	jreq	L7271
3691  0010 4a            	dec	a
3692  0011 270e          	jreq	L1371
3693  0013 2012          	jra	L7602
3694  0015               L5271:
3695                     ; 1167     case 0x01:
3695                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
3697  0015 1e03          	ldw	x,(OFST+1,sp)
3698  0017 e607          	ld	a,(7,x)
3699                     ; 1169       break;
3701  0019 200a          	jp	LC002
3702  001b               L7271:
3703                     ; 1172     case 0x02:
3703                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
3705  001b 1e03          	ldw	x,(OFST+1,sp)
3706  001d e608          	ld	a,(8,x)
3707                     ; 1174       break;
3709  001f 2004          	jp	LC002
3710  0021               L1371:
3711                     ; 1177     case 0x03:
3711                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
3713  0021 1e03          	ldw	x,(OFST+1,sp)
3714  0023 e609          	ld	a,(9,x)
3715  0025               LC002:
3716  0025 6b02          	ld	(OFST+0,sp),a
3717                     ; 1179       break;
3719                     ; 1181     default:
3719                     ; 1182       break;
3721  0027               L7602:
3722                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3724  0027 7b08          	ld	a,(OFST+6,sp)
3725  0029 1502          	bcp	a,(OFST+0,sp)
3726  002b 2704          	jreq	L1702
3727                     ; 1189     bitstatus = SET;
3729  002d a601          	ld	a,#1
3731  002f 2001          	jra	L3702
3732  0031               L1702:
3733                     ; 1194     bitstatus = RESET;
3735  0031 4f            	clr	a
3736  0032               L3702:
3737                     ; 1197   return bitstatus;
3741  0032 5b04          	addw	sp,#4
3742  0034 81            	ret	
3798                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3798                     ; 1230 {
3799                     .text:	section	.text,new
3800  0000               _I2C_ClearFlag:
3802  0000 89            	pushw	x
3803  0001 89            	pushw	x
3804       00000002      OFST:	set	2
3807                     ; 1231   uint16_t flagpos = 0;
3809                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3811                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3813  0002 7b08          	ld	a,(OFST+6,sp)
3814  0004 5f            	clrw	x
3815  0005 02            	rlwa	x,a
3816  0006 1f01          	ldw	(OFST-1,sp),x
3817                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3819  0008 7b02          	ld	a,(OFST+0,sp)
3820  000a 43            	cpl	a
3821  000b 1e03          	ldw	x,(OFST+1,sp)
3822  000d e708          	ld	(8,x),a
3823                     ; 1239 }
3826  000f 5b04          	addw	sp,#4
3827  0011 81            	ret	
3903                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3903                     ; 1265 {
3904                     .text:	section	.text,new
3905  0000               _I2C_GetITStatus:
3907  0000 89            	pushw	x
3908  0001 5204          	subw	sp,#4
3909       00000004      OFST:	set	4
3912                     ; 1266   ITStatus bitstatus = RESET;
3914                     ; 1267   __IO uint8_t enablestatus = 0;
3916  0003 0f03          	clr	(OFST-1,sp)
3917                     ; 1268   uint16_t tempregister = 0;
3919  0005 1e01          	ldw	x,(OFST-3,sp)
3920                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
3922                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3924  0007 7b09          	ld	a,(OFST+5,sp)
3925  0009 a407          	and	a,#7
3926  000b 97            	ld	xl,a
3927  000c 4f            	clr	a
3928  000d 02            	rlwa	x,a
3929  000e 4f            	clr	a
3930  000f 01            	rrwa	x,a
3931  0010 9f            	ld	a,xl
3932  0011 5f            	clrw	x
3933  0012 97            	ld	xl,a
3934  0013 1f01          	ldw	(OFST-3,sp),x
3935                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
3937  0015 1e05          	ldw	x,(OFST+1,sp)
3938  0017 e60a          	ld	a,(10,x)
3939  0019 1402          	and	a,(OFST-2,sp)
3940  001b 6b03          	ld	(OFST-1,sp),a
3941                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
3943  001d 7b09          	ld	a,(OFST+5,sp)
3944  001f a430          	and	a,#48
3945  0021 97            	ld	xl,a
3946  0022 4f            	clr	a
3947  0023 02            	rlwa	x,a
3948  0024 a30100        	cpw	x,#256
3949  0027 260e          	jrne	L5612
3950                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3952  0029 1e05          	ldw	x,(OFST+1,sp)
3953  002b e607          	ld	a,(7,x)
3954  002d 150a          	bcp	a,(OFST+6,sp)
3955  002f 2716          	jreq	L5712
3957  0031 0d03          	tnz	(OFST-1,sp)
3958  0033 2712          	jreq	L5712
3959                     ; 1284       bitstatus = SET;
3961  0035 200c          	jp	LC004
3962                     ; 1289       bitstatus = RESET;
3963  0037               L5612:
3964                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3966  0037 1e05          	ldw	x,(OFST+1,sp)
3967  0039 e608          	ld	a,(8,x)
3968  003b 150a          	bcp	a,(OFST+6,sp)
3969  003d 2708          	jreq	L5712
3971  003f 0d03          	tnz	(OFST-1,sp)
3972  0041 2704          	jreq	L5712
3973                     ; 1298       bitstatus = SET;
3975  0043               LC004:
3977  0043 a601          	ld	a,#1
3979  0045 2001          	jra	L3712
3980  0047               L5712:
3981                     ; 1303       bitstatus = RESET;
3984  0047 4f            	clr	a
3985  0048               L3712:
3986                     ; 1307   return  bitstatus;
3990  0048 5b06          	addw	sp,#6
3991  004a 81            	ret	
4048                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4048                     ; 1341 {
4049                     .text:	section	.text,new
4050  0000               _I2C_ClearITPendingBit:
4052  0000 89            	pushw	x
4053  0001 89            	pushw	x
4054       00000002      OFST:	set	2
4057                     ; 1342   uint16_t flagpos = 0;
4059                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4061                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4063  0002 7b08          	ld	a,(OFST+6,sp)
4064  0004 5f            	clrw	x
4065  0005 02            	rlwa	x,a
4066  0006 1f01          	ldw	(OFST-1,sp),x
4067                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4069  0008 7b02          	ld	a,(OFST+0,sp)
4070  000a 43            	cpl	a
4071  000b 1e03          	ldw	x,(OFST+1,sp)
4072  000d e708          	ld	(8,x),a
4073                     ; 1352 }
4076  000f 5b04          	addw	sp,#4
4077  0011 81            	ret	
4090                     	xdef	_I2C_ClearITPendingBit
4091                     	xdef	_I2C_GetITStatus
4092                     	xdef	_I2C_ClearFlag
4093                     	xdef	_I2C_GetFlagStatus
4094                     	xdef	_I2C_GetLastEvent
4095                     	xdef	_I2C_CheckEvent
4096                     	xdef	_I2C_ReadRegister
4097                     	xdef	_I2C_ITConfig
4098                     	xdef	_I2C_DMALastTransferCmd
4099                     	xdef	_I2C_DMACmd
4100                     	xdef	_I2C_CalculatePEC
4101                     	xdef	_I2C_TransmitPEC
4102                     	xdef	_I2C_GetPEC
4103                     	xdef	_I2C_PECPositionConfig
4104                     	xdef	_I2C_ReceiveData
4105                     	xdef	_I2C_SendData
4106                     	xdef	_I2C_Send7bitAddress
4107                     	xdef	_I2C_SMBusAlertConfig
4108                     	xdef	_I2C_FastModeDutyCycleConfig
4109                     	xdef	_I2C_AckPositionConfig
4110                     	xdef	_I2C_DualAddressCmd
4111                     	xdef	_I2C_OwnAddress2Config
4112                     	xdef	_I2C_AcknowledgeConfig
4113                     	xdef	_I2C_GenerateSTOP
4114                     	xdef	_I2C_GenerateSTART
4115                     	xdef	_I2C_ARPCmd
4116                     	xdef	_I2C_StretchClockCmd
4117                     	xdef	_I2C_SoftwareResetCmd
4118                     	xdef	_I2C_GeneralCallCmd
4119                     	xdef	_I2C_Cmd
4120                     	xdef	_I2C_Init
4121                     	xdef	_I2C_DeInit
4122                     	xref	_CLK_GetClockFreq
4123                     	xref.b	c_lreg
4142                     	xref	c_uitolx
4143                     	xref	c_sdivx
4144                     	xref	c_lzmp
4145                     	xref	c_rtol
4146                     	xref	c_smul
4147                     	xref	c_lmul
4148                     	xref	c_lcmp
4149                     	xref	c_ludv
4150                     	xref	c_ltor
4151                     	end
