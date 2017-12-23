   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  43                     ; 25 static sint8 BatSelect(uint8 u8Chan)
  43                     ; 26 {
  44                     .text:	section	.text,new
  45  0000               L3f_BatSelect:
  49                     ; 27 	switch(u8Chan)
  52                     ; 37 		default:
  52                     ; 38 		break;
  53  0000 4d            	tnz	a
  54  0001 2704          	jreq	L5
  55  0003 4a            	dec	a
  56  0004 2705          	jreq	L7
  58  0006 87            	retf	
  59  0007               L5:
  60                     ; 29 		case 0: // bat1
  60                     ; 30 		GPIO_WriteBit(SW_CTRL_GPIO_PORT, SW_CTRL_GPIO_PIN, 0);
  62  0007 4b00          	push	#0
  64                     ; 31 		break;
  66  0009 2002          	jpf	LC001
  67  000b               L7:
  68                     ; 33 		case 1: // bat2
  68                     ; 34 		GPIO_WriteBit(SW_CTRL_GPIO_PORT, SW_CTRL_GPIO_PIN, 1);
  70  000b 4b01          	push	#1
  72  000d               LC001:
  73  000d 4b04          	push	#4
  74  000f ae5000        	ldw	x,#20480
  75  0012 8d000000      	callf	f_GPIO_WriteBit
  76  0016 85            	popw	x
  77                     ; 35 		break;
  79                     ; 37 		default:
  79                     ; 38 		break;
  81                     ; 40 }
  84  0017 87            	retf	
 172                     .const:	section	.text
 173  0000               L24:
 174  0000 000186a0      	dc.l	100000
 175  0004               L64:
 176  0004 000003e8      	dc.l	1000
 177                     ; 47 static sint8 InrsMesureAct(void)
 177                     ; 48 {
 178                     .text:	section	.text,new
 179  0000               L14f_InrsMesureAct:
 181  0000 52ff          	subw	sp,#255
 182  0002 522a          	subw	sp,#42
 183       00000129      OFST:	set	297
 186                     ; 56 	for(j = 0; j < FRAME1_KPULSE_NUM; j ++)
 188  0004 96            	ldw	x,sp
 189  0005 1c0129        	addw	x,#OFST+0
 190  0008 7f            	clr	(x)
 191  0009               L77:
 192                     ; 58 		GPIO_ToggleBits(KPULSE_GPIO_PORT, KPULSE_GPIO_PIN);
 194  0009 4b80          	push	#128
 195  000b ae5005        	ldw	x,#20485
 196  000e 8d000000      	callf	f_GPIO_ToggleBits
 198  0012 ae000d        	ldw	x,#13
 199  0015 84            	pop	a
 200                     ; 59 		MsDelay(13);
 202  0016 8d000000      	callf	f_MsDelay
 204                     ; 56 	for(j = 0; j < FRAME1_KPULSE_NUM; j ++)
 206  001a 96            	ldw	x,sp
 207  001b 1c0129        	addw	x,#OFST+0
 208  001e 7c            	inc	(x)
 211  001f f6            	ld	a,(x)
 212  0020 a164          	cp	a,#100
 213  0022 25e5          	jrult	L77
 214                     ; 64 	for(i = 0; i < BATTERY_MAX_NUM; i ++)
 216  0024 5a            	decw	x
 217  0025 7f            	clr	(x)
 218  0026               L501:
 219                     ; 66 		BatSelect(i);
 221  0026 96            	ldw	x,sp
 222  0027 1c0128        	addw	x,#OFST-1
 223  002a f6            	ld	a,(x)
 224  002b 8d000000      	callf	L3f_BatSelect
 226                     ; 67 		for(j = 0; j < FRAME2_KPULSE_NUM; j ++)
 228  002f 96            	ldw	x,sp
 229  0030 1c0129        	addw	x,#OFST+0
 230  0033 7f            	clr	(x)
 231  0034               L311:
 232                     ; 69 			GPIO_ToggleBits(KPULSE_GPIO_PORT, KPULSE_GPIO_PIN);
 234  0034 4b80          	push	#128
 235  0036 ae5005        	ldw	x,#20485
 236  0039 8d000000      	callf	f_GPIO_ToggleBits
 238  003d ae0003        	ldw	x,#3
 239  0040 84            	pop	a
 240                     ; 70 			MsDelay(3);
 242  0041 8d000000      	callf	f_MsDelay
 244                     ; 72 			for(k = 0; k < FRAME2_ADC_ACQ_NUM; k ++)
 246  0045 0f87          	clr	(OFST-162,sp)
 247  0047               L121:
 248                     ; 75 				u16VoltAd[0][k] = AdcGeneralAcq(CHAN_REBACK_CURRENT);
 250  0047 a603          	ld	a,#3
 251  0049 8d000000      	callf	f_AdcGeneralAcq
 253  004d 9096          	ldw	y,sp
 254  004f 72a9001f      	addw	y,#OFST-266
 255  0053 171d          	ldw	(OFST-268,sp),y
 256  0055 7b87          	ld	a,(OFST-162,sp)
 257  0057 905f          	clrw	y
 258  0059 9097          	ld	yl,a
 259  005b 9058          	sllw	y
 260  005d 72f91d        	addw	y,(OFST-268,sp)
 261  0060 90ff          	ldw	(y),x
 262                     ; 77 				u16VoltAd[1][k] = AdcGeneralAcq(CHAN_REBACK_VOLT);
 264  0062 4f            	clr	a
 265  0063 8d000000      	callf	f_AdcGeneralAcq
 267  0067 9096          	ldw	y,sp
 268  0069 72a9003f      	addw	y,#OFST-234
 269  006d 171d          	ldw	(OFST-268,sp),y
 270  006f 7b87          	ld	a,(OFST-162,sp)
 271  0071 905f          	clrw	y
 272  0073 9097          	ld	yl,a
 273  0075 9058          	sllw	y
 274  0077 72f91d        	addw	y,(OFST-268,sp)
 275  007a 90ff          	ldw	(y),x
 276                     ; 78 				UsDelay(400);
 278  007c ae0190        	ldw	x,#400
 279  007f 8d000000      	callf	f_UsDelay
 281                     ; 72 			for(k = 0; k < FRAME2_ADC_ACQ_NUM; k ++)
 283  0083 0c87          	inc	(OFST-162,sp)
 286  0085 7b87          	ld	a,(OFST-162,sp)
 287  0087 a110          	cp	a,#16
 288  0089 25bc          	jrult	L121
 289                     ; 80 			u16AdData[i][j % 2][0][j / 2] = U16Filter(&u16VoltAd[0][0], FRAME2_ADC_ACQ_NUM);
 291  008b 4b10          	push	#16
 292  008d 96            	ldw	x,sp
 293  008e 1c0020        	addw	x,#OFST-265
 294  0091 8d000000      	callf	f_U16Filter
 296  0095 84            	pop	a
 297  0096 1f1d          	ldw	(OFST-268,sp),x
 298  0098 96            	ldw	x,sp
 299  0099 1c0129        	addw	x,#OFST+0
 300  009c f6            	ld	a,(x)
 301  009d 44            	srl	a
 302  009e 5f            	clrw	x
 303  009f 97            	ld	xl,a
 304  00a0 58            	sllw	x
 305  00a1 1f1b          	ldw	(OFST-270,sp),x
 306  00a3 96            	ldw	x,sp
 307  00a4 1c0129        	addw	x,#OFST+0
 308  00a7 f6            	ld	a,(x)
 309  00a8 a401          	and	a,#1
 310  00aa 97            	ld	xl,a
 311  00ab a628          	ld	a,#40
 312  00ad 42            	mul	x,a
 313  00ae 1f19          	ldw	(OFST-272,sp),x
 314  00b0 96            	ldw	x,sp
 315  00b1 1c0088        	addw	x,#OFST-161
 316  00b4 1f17          	ldw	(OFST-274,sp),x
 317  00b6 1c00a0        	addw	x,#160
 318  00b9 f6            	ld	a,(x)
 319  00ba 97            	ld	xl,a
 320  00bb a650          	ld	a,#80
 321  00bd 42            	mul	x,a
 322  00be 72fb17        	addw	x,(OFST-274,sp)
 323  00c1 72fb19        	addw	x,(OFST-272,sp)
 324  00c4 72fb1b        	addw	x,(OFST-270,sp)
 325  00c7 161d          	ldw	y,(OFST-268,sp)
 326  00c9 ff            	ldw	(x),y
 327                     ; 81 			u16AdData[i][j % 2][1][j / 2] = U16Filter(&u16VoltAd[1][0], FRAME2_ADC_ACQ_NUM);
 329  00ca 4b10          	push	#16
 330  00cc 96            	ldw	x,sp
 331  00cd 1c0040        	addw	x,#OFST-233
 332  00d0 8d000000      	callf	f_U16Filter
 334  00d4 84            	pop	a
 335  00d5 1f1d          	ldw	(OFST-268,sp),x
 336  00d7 96            	ldw	x,sp
 337  00d8 1c0129        	addw	x,#OFST+0
 338  00db f6            	ld	a,(x)
 339  00dc 44            	srl	a
 340  00dd 5f            	clrw	x
 341  00de 97            	ld	xl,a
 342  00df 58            	sllw	x
 343  00e0 1f1b          	ldw	(OFST-270,sp),x
 344  00e2 96            	ldw	x,sp
 345  00e3 1c0129        	addw	x,#OFST+0
 346  00e6 f6            	ld	a,(x)
 347  00e7 a401          	and	a,#1
 348  00e9 97            	ld	xl,a
 349  00ea a628          	ld	a,#40
 350  00ec 42            	mul	x,a
 351  00ed 1f19          	ldw	(OFST-272,sp),x
 352  00ef 96            	ldw	x,sp
 353  00f0 1c009c        	addw	x,#OFST-141
 354  00f3 1f17          	ldw	(OFST-274,sp),x
 355  00f5 1c008c        	addw	x,#140
 356  00f8 f6            	ld	a,(x)
 357  00f9 97            	ld	xl,a
 358  00fa a650          	ld	a,#80
 359  00fc 42            	mul	x,a
 360  00fd 72fb17        	addw	x,(OFST-274,sp)
 361  0100 72fb19        	addw	x,(OFST-272,sp)
 362  0103 72fb1b        	addw	x,(OFST-270,sp)
 363  0106 161d          	ldw	y,(OFST-268,sp)
 364  0108 ff            	ldw	(x),y
 365                     ; 67 		for(j = 0; j < FRAME2_KPULSE_NUM; j ++)
 367  0109 96            	ldw	x,sp
 368  010a 1c0129        	addw	x,#OFST+0
 369  010d 7c            	inc	(x)
 372  010e f6            	ld	a,(x)
 373  010f a114          	cp	a,#20
 374  0111 2404ac340034  	jrult	L311
 375                     ; 64 	for(i = 0; i < BATTERY_MAX_NUM; i ++)
 377  0117 5a            	decw	x
 378  0118 7c            	inc	(x)
 381  0119 f6            	ld	a,(x)
 382  011a a102          	cp	a,#2
 383  011c 2404ac260026  	jrult	L501
 384                     ; 88 	BatSelect(0);
 386  0122 4f            	clr	a
 387  0123 8d000000      	callf	L3f_BatSelect
 389                     ; 91 	for(i = 0; i < BATTERY_MAX_NUM; i ++)
 391  0127 96            	ldw	x,sp
 392  0128 1c0128        	addw	x,#OFST-1
 393  012b 7f            	clr	(x)
 394  012c               L721:
 395                     ; 93 		for(j = 0; j < (FRAME2_KPULSE_NUM / 2); j ++)
 397  012c 96            	ldw	x,sp
 398  012d 1c0129        	addw	x,#OFST+0
 399  0130 7f            	clr	(x)
 400  0131               L531:
 401                     ; 95 			s32InRs[j] = ((((sint32)u16AdData[i][0][1][j] - (sint32)u16AdData[i][1][1][j]) * INRS_VREF_RS_12V) / \
 401                     ; 96 								((sint32)u16AdData[i][0][0][j] - (sint32)u16AdData[i][1][0][j]));
 403  0131 96            	ldw	x,sp
 404  0132 1c0129        	addw	x,#OFST+0
 405  0135 f6            	ld	a,(x)
 406  0136 5f            	clrw	x
 407  0137 97            	ld	xl,a
 408  0138 58            	sllw	x
 409  0139 1f1d          	ldw	(OFST-268,sp),x
 410  013b 96            	ldw	x,sp
 411  013c 1c00b0        	addw	x,#OFST-121
 412  013f 1f1b          	ldw	(OFST-270,sp),x
 413  0141 1c0078        	addw	x,#120
 414  0144 f6            	ld	a,(x)
 415  0145 97            	ld	xl,a
 416  0146 a650          	ld	a,#80
 417  0148 42            	mul	x,a
 418  0149 72fb1b        	addw	x,(OFST-270,sp)
 419  014c 72fb1d        	addw	x,(OFST-268,sp)
 420  014f fe            	ldw	x,(x)
 421  0150 8d000000      	callf	d_uitolx
 423  0154 96            	ldw	x,sp
 424  0155 1c0017        	addw	x,#OFST-274
 425  0158 8d000000      	callf	d_rtol
 427  015c 96            	ldw	x,sp
 428  015d 1c0129        	addw	x,#OFST+0
 429  0160 f6            	ld	a,(x)
 430  0161 5f            	clrw	x
 431  0162 97            	ld	xl,a
 432  0163 58            	sllw	x
 433  0164 1f15          	ldw	(OFST-276,sp),x
 434  0166 96            	ldw	x,sp
 435  0167 1c0088        	addw	x,#OFST-161
 436  016a 1f13          	ldw	(OFST-278,sp),x
 437  016c 1c00a0        	addw	x,#160
 438  016f f6            	ld	a,(x)
 439  0170 97            	ld	xl,a
 440  0171 a650          	ld	a,#80
 441  0173 42            	mul	x,a
 442  0174 72fb13        	addw	x,(OFST-278,sp)
 443  0177 72fb15        	addw	x,(OFST-276,sp)
 444  017a fe            	ldw	x,(x)
 445  017b 8d000000      	callf	d_uitolx
 447  017f 96            	ldw	x,sp
 448  0180 1c0017        	addw	x,#OFST-274
 449  0183 8d000000      	callf	d_lsub
 451  0187 96            	ldw	x,sp
 452  0188 1c000f        	addw	x,#OFST-282
 453  018b 8d000000      	callf	d_rtol
 455  018f 96            	ldw	x,sp
 456  0190 1c0129        	addw	x,#OFST+0
 457  0193 f6            	ld	a,(x)
 458  0194 5f            	clrw	x
 459  0195 97            	ld	xl,a
 460  0196 58            	sllw	x
 461  0197 1f0d          	ldw	(OFST-284,sp),x
 462  0199 96            	ldw	x,sp
 463  019a 1c00c4        	addw	x,#OFST-101
 464  019d 1f0b          	ldw	(OFST-286,sp),x
 465  019f 1c0064        	addw	x,#100
 466  01a2 f6            	ld	a,(x)
 467  01a3 97            	ld	xl,a
 468  01a4 a650          	ld	a,#80
 469  01a6 42            	mul	x,a
 470  01a7 72fb0b        	addw	x,(OFST-286,sp)
 471  01aa 72fb0d        	addw	x,(OFST-284,sp)
 472  01ad fe            	ldw	x,(x)
 473  01ae 8d000000      	callf	d_uitolx
 475  01b2 96            	ldw	x,sp
 476  01b3 1c0007        	addw	x,#OFST-290
 477  01b6 8d000000      	callf	d_rtol
 479  01ba 96            	ldw	x,sp
 480  01bb 1c0129        	addw	x,#OFST+0
 481  01be f6            	ld	a,(x)
 482  01bf 5f            	clrw	x
 483  01c0 97            	ld	xl,a
 484  01c1 58            	sllw	x
 485  01c2 1f05          	ldw	(OFST-292,sp),x
 486  01c4 96            	ldw	x,sp
 487  01c5 1c009c        	addw	x,#OFST-141
 488  01c8 1f03          	ldw	(OFST-294,sp),x
 489  01ca 1c008c        	addw	x,#140
 490  01cd f6            	ld	a,(x)
 491  01ce 97            	ld	xl,a
 492  01cf a650          	ld	a,#80
 493  01d1 42            	mul	x,a
 494  01d2 72fb03        	addw	x,(OFST-294,sp)
 495  01d5 72fb05        	addw	x,(OFST-292,sp)
 496  01d8 fe            	ldw	x,(x)
 497  01d9 8d000000      	callf	d_uitolx
 499  01dd 96            	ldw	x,sp
 500  01de 1c0007        	addw	x,#OFST-290
 501  01e1 8d000000      	callf	d_lsub
 503  01e5 ae0000        	ldw	x,#L24
 504  01e8 8d000000      	callf	d_lmul
 506  01ec 96            	ldw	x,sp
 507  01ed 1c000f        	addw	x,#OFST-282
 508  01f0 8d000000      	callf	d_ldiv
 510  01f4 96            	ldw	x,sp
 511  01f5 1c005f        	addw	x,#OFST-202
 512  01f8 1f01          	ldw	(OFST-296,sp),x
 513  01fa 1c00ca        	addw	x,#202
 514  01fd f6            	ld	a,(x)
 515  01fe 97            	ld	xl,a
 516  01ff a604          	ld	a,#4
 517  0201 42            	mul	x,a
 518  0202 72fb01        	addw	x,(OFST-296,sp)
 519  0205 8d000000      	callf	d_rtol
 521                     ; 98 			if(0 > s32InRs[j])
 523  0209 96            	ldw	x,sp
 524  020a 1c005f        	addw	x,#OFST-202
 525  020d 1f1d          	ldw	(OFST-268,sp),x
 526  020f 1c00ca        	addw	x,#202
 527  0212 f6            	ld	a,(x)
 528  0213 97            	ld	xl,a
 529  0214 a604          	ld	a,#4
 530  0216 42            	mul	x,a
 531  0217 72fb1d        	addw	x,(OFST-268,sp)
 532  021a f6            	ld	a,(x)
 533  021b 2e04          	jrsge	L341
 534                     ; 100 				s32InRs[j] = -s32InRs[j];
 536  021d 8d000000      	callf	d_lgneg
 538  0221               L341:
 539                     ; 104 			sprintf((char *)DebugBuf, "bat%u+:%u,%u,%ld\r\n", (uint16)(i+1), u16AdData[i][0][1][j], u16AdData[i][0][0][j], s32InRs[j] / 1000);
 541  0221 96            	ldw	x,sp
 542  0222 1c005f        	addw	x,#OFST-202
 543  0225 1f1d          	ldw	(OFST-268,sp),x
 544  0227 1c00ca        	addw	x,#202
 545  022a f6            	ld	a,(x)
 546  022b 97            	ld	xl,a
 547  022c a604          	ld	a,#4
 548  022e 42            	mul	x,a
 549  022f 72fb1d        	addw	x,(OFST-268,sp)
 550  0232 8d000000      	callf	d_ltor
 552  0236 ae0004        	ldw	x,#L64
 553  0239 8d000000      	callf	d_ldiv
 555  023d be02          	ldw	x,c_lreg+2
 556  023f 89            	pushw	x
 557  0240 be00          	ldw	x,c_lreg
 558  0242 89            	pushw	x
 559  0243 96            	ldw	x,sp
 560  0244 1c012d        	addw	x,#OFST+4
 561  0247 f6            	ld	a,(x)
 562  0248 5f            	clrw	x
 563  0249 97            	ld	xl,a
 564  024a 58            	sllw	x
 565  024b 1f1f          	ldw	(OFST-266,sp),x
 566  024d 96            	ldw	x,sp
 567  024e 1c008c        	addw	x,#OFST-157
 568  0251 1f1d          	ldw	(OFST-268,sp),x
 569  0253 1c00a0        	addw	x,#160
 570  0256 f6            	ld	a,(x)
 571  0257 97            	ld	xl,a
 572  0258 a650          	ld	a,#80
 573  025a 42            	mul	x,a
 574  025b 72fb1d        	addw	x,(OFST-268,sp)
 575  025e 72fb1f        	addw	x,(OFST-266,sp)
 576  0261 fe            	ldw	x,(x)
 577  0262 89            	pushw	x
 578  0263 96            	ldw	x,sp
 579  0264 1c012f        	addw	x,#OFST+6
 580  0267 f6            	ld	a,(x)
 581  0268 5f            	clrw	x
 582  0269 97            	ld	xl,a
 583  026a 58            	sllw	x
 584  026b 1f1d          	ldw	(OFST-268,sp),x
 585  026d 96            	ldw	x,sp
 586  026e 1c00a2        	addw	x,#OFST-135
 587  0271 1f1b          	ldw	(OFST-270,sp),x
 588  0273 1c008c        	addw	x,#140
 589  0276 f6            	ld	a,(x)
 590  0277 97            	ld	xl,a
 591  0278 a650          	ld	a,#80
 592  027a 42            	mul	x,a
 593  027b 72fb1b        	addw	x,(OFST-270,sp)
 594  027e 72fb1d        	addw	x,(OFST-268,sp)
 595  0281 fe            	ldw	x,(x)
 596  0282 89            	pushw	x
 597  0283 96            	ldw	x,sp
 598  0284 1c0130        	addw	x,#OFST+7
 599  0287 f6            	ld	a,(x)
 600  0288 5f            	clrw	x
 601  0289 97            	ld	xl,a
 602  028a 5c            	incw	x
 603  028b 89            	pushw	x
 604  028c ae001b        	ldw	x,#L541
 605  028f 89            	pushw	x
 606  0290 ae0000        	ldw	x,#_DebugBuf
 607  0293 8d000000      	callf	f_sprintf
 609  0297 5b0c          	addw	sp,#12
 610                     ; 105 			DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);
 612  0299 ae0000        	ldw	x,#_DebugBuf
 613  029c 89            	pushw	x
 614  029d a603          	ld	a,#3
 615  029f 8d000000      	callf	f_DebugStrOutput
 617  02a3 85            	popw	x
 618                     ; 107 			sprintf((char *)DebugBuf, "bat%u-:%u,%u,%ld\r\n", (uint16)(i+1), u16AdData[i][1][1][j], u16AdData[i][1][0][j], s32InRs[j] / 1000);
 620  02a4 96            	ldw	x,sp
 621  02a5 1c005f        	addw	x,#OFST-202
 622  02a8 1f1d          	ldw	(OFST-268,sp),x
 623  02aa 1c00ca        	addw	x,#202
 624  02ad f6            	ld	a,(x)
 625  02ae 97            	ld	xl,a
 626  02af a604          	ld	a,#4
 627  02b1 42            	mul	x,a
 628  02b2 72fb1d        	addw	x,(OFST-268,sp)
 629  02b5 8d000000      	callf	d_ltor
 631  02b9 ae0004        	ldw	x,#L64
 632  02bc 8d000000      	callf	d_ldiv
 634  02c0 be02          	ldw	x,c_lreg+2
 635  02c2 89            	pushw	x
 636  02c3 be00          	ldw	x,c_lreg
 637  02c5 89            	pushw	x
 638  02c6 96            	ldw	x,sp
 639  02c7 1c012d        	addw	x,#OFST+4
 640  02ca f6            	ld	a,(x)
 641  02cb 5f            	clrw	x
 642  02cc 97            	ld	xl,a
 643  02cd 58            	sllw	x
 644  02ce 1f1f          	ldw	(OFST-266,sp),x
 645  02d0 96            	ldw	x,sp
 646  02d1 1c00b4        	addw	x,#OFST-117
 647  02d4 1f1d          	ldw	(OFST-268,sp),x
 648  02d6 1c0078        	addw	x,#120
 649  02d9 f6            	ld	a,(x)
 650  02da 97            	ld	xl,a
 651  02db a650          	ld	a,#80
 652  02dd 42            	mul	x,a
 653  02de 72fb1d        	addw	x,(OFST-268,sp)
 654  02e1 72fb1f        	addw	x,(OFST-266,sp)
 655  02e4 fe            	ldw	x,(x)
 656  02e5 89            	pushw	x
 657  02e6 96            	ldw	x,sp
 658  02e7 1c012f        	addw	x,#OFST+6
 659  02ea f6            	ld	a,(x)
 660  02eb 5f            	clrw	x
 661  02ec 97            	ld	xl,a
 662  02ed 58            	sllw	x
 663  02ee 1f1d          	ldw	(OFST-268,sp),x
 664  02f0 96            	ldw	x,sp
 665  02f1 1c00ca        	addw	x,#OFST-95
 666  02f4 1f1b          	ldw	(OFST-270,sp),x
 667  02f6 1c0064        	addw	x,#100
 668  02f9 f6            	ld	a,(x)
 669  02fa 97            	ld	xl,a
 670  02fb a650          	ld	a,#80
 671  02fd 42            	mul	x,a
 672  02fe 72fb1b        	addw	x,(OFST-270,sp)
 673  0301 72fb1d        	addw	x,(OFST-268,sp)
 674  0304 fe            	ldw	x,(x)
 675  0305 89            	pushw	x
 676  0306 96            	ldw	x,sp
 677  0307 1c0130        	addw	x,#OFST+7
 678  030a f6            	ld	a,(x)
 679  030b 5f            	clrw	x
 680  030c 97            	ld	xl,a
 681  030d 5c            	incw	x
 682  030e 89            	pushw	x
 683  030f ae0008        	ldw	x,#L741
 684  0312 89            	pushw	x
 685  0313 ae0000        	ldw	x,#_DebugBuf
 686  0316 8d000000      	callf	f_sprintf
 688  031a 5b0c          	addw	sp,#12
 689                     ; 108 			DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);
 691  031c ae0000        	ldw	x,#_DebugBuf
 692  031f 89            	pushw	x
 693  0320 a603          	ld	a,#3
 694  0322 8d000000      	callf	f_DebugStrOutput
 696  0326 85            	popw	x
 697                     ; 93 		for(j = 0; j < (FRAME2_KPULSE_NUM / 2); j ++)
 699  0327 96            	ldw	x,sp
 700  0328 1c0129        	addw	x,#OFST+0
 701  032b 7c            	inc	(x)
 704  032c f6            	ld	a,(x)
 705  032d a10a          	cp	a,#10
 706  032f 2404ac310131  	jrult	L531
 707                     ; 91 	for(i = 0; i < BATTERY_MAX_NUM; i ++)
 709  0335 5a            	decw	x
 710  0336 7c            	inc	(x)
 713  0337 f6            	ld	a,(x)
 714  0338 a102          	cp	a,#2
 715  033a 2404ac2c012c  	jrult	L721
 716                     ; 121 	return 0;
 718  0340 4f            	clr	a
 721  0341 5bff          	addw	sp,#255
 722  0343 5b2a          	addw	sp,#42
 723  0345 87            	retf	
 747                     ; 125 sint8 InrsMesurejob(void)
 747                     ; 126 {
 748                     .text:	section	.text,new
 749  0000               f_InrsMesurejob:
 753                     ; 130 	if(tInRsCtrl.u8InRsSampleFlag)
 755  0000 c60008        	ld	a,_tInRsCtrl+8
 756  0003 2708          	jreq	L161
 757                     ; 132 		tInRsCtrl.u8InRsSampleFlag = 0;
 759  0005 725f0008      	clr	_tInRsCtrl+8
 760                     ; 133 		InrsMesureAct();
 762  0009 8d000000      	callf	L14f_InrsMesureAct
 764  000d               L161:
 765                     ; 136 	return 0;
 767  000d 4f            	clr	a
 770  000e 87            	retf	
 794                     ; 140 sint8 InrsMesureInit(void)
 794                     ; 141 {
 795                     .text:	section	.text,new
 796  0000               f_InrsMesureInit:
 800                     ; 142 	tInRsCtrl.u8InRsSampleFlag = 1;
 802  0000 35010008      	mov	_tInRsCtrl+8,#1
 803                     ; 144 	GPIO_Init(KPULSE_GPIO_PORT, KPULSE_GPIO_PIN, GPIO_Mode_Out_PP_High_Fast);
 805  0004 4bf0          	push	#240
 806  0006 4b80          	push	#128
 807  0008 ae5005        	ldw	x,#20485
 808  000b 8d000000      	callf	f_GPIO_Init
 810  000f 85            	popw	x
 811                     ; 145 	GPIO_Init(SW_CTRL_GPIO_PORT, SW_CTRL_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
 813  0010 4be0          	push	#224
 814  0012 4b04          	push	#4
 815  0014 ae5000        	ldw	x,#20480
 816  0017 8d000000      	callf	f_GPIO_Init
 818  001b 85            	popw	x
 819                     ; 146 }
 822  001c 87            	retf	
 979                     	switch	.bss
 980  0000               _tInRsCtrl:
 981  0000 000000000000  	ds.b	43
 982                     	xdef	_tInRsCtrl
 983                     	xref	f_DebugStrOutput
 984                     	xref	_DebugBuf
 985                     	xdef	f_InrsMesureInit
 986                     	xdef	f_InrsMesurejob
 987                     	xref	f_AdcGeneralAcq
 988                     	xref	f_U16Filter
 989                     	xref	f_UsDelay
 990                     	xref	f_MsDelay
 991                     	xref	f_GPIO_ToggleBits
 992                     	xref	f_GPIO_WriteBit
 993                     	xref	f_GPIO_Init
 994                     	xref	f_sprintf
 995                     	switch	.const
 996  0008               L741:
 997  0008 62617425752d  	dc.b	"bat%u-:%u,%u,%ld",13
 998  0019 0a00          	dc.b	10,0
 999  001b               L541:
1000  001b 62617425752b  	dc.b	"bat%u+:%u,%u,%ld",13
1001  002c 0a00          	dc.b	10,0
1002                     	xref.b	c_lreg
1022                     	xref	d_ltor
1023                     	xref	d_lgneg
1024                     	xref	d_ldiv
1025                     	xref	d_lmul
1026                     	xref	d_lsub
1027                     	xref	d_rtol
1028                     	xref	d_uitolx
1029                     	end
