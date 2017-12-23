   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     	switch	.data
   6  0000               L3_u16ReferAdcValue:
   7  0000 05f0          	dc.w	1520
  52                     ; 10 void UsDelay(uint16 u16MsCount)
  52                     ; 11 {	
  53                     .text:	section	.text,new
  54  0000               f_UsDelay:
  56  0000 89            	pushw	x
  57       00000000      OFST:	set	0
  60  0001 200a          	jra	L13
  61  0003               L72:
  62                     ; 14 		u16MsCount--;
  64  0003 5a            	decw	x
  65  0004 1f01          	ldw	(OFST+1,sp),x
  66                     ; 15 		nop();
  69  0006 9d            	nop	
  71                     ; 16 		nop();
  75  0007 9d            	nop	
  77                     ; 17 		nop();
  81  0008 9d            	nop	
  83                     ; 18 		nop();
  87  0009 9d            	nop	
  89                     ; 19 		nop();
  93  000a 9d            	nop	
  95                     ; 20 		nop();
  99  000b 9d            	nop	
 101                     ; 21 		nop();
 105  000c 9d            	nop	
 108  000d               L13:
 109                     ; 12 	while (u16MsCount != 0)
 111  000d 1e01          	ldw	x,(OFST+1,sp)
 112  000f 26f2          	jrne	L72
 113                     ; 23 }
 116  0011 85            	popw	x
 117  0012 87            	retf	
 149                     ; 26 void MsDelay(uint16 u16MsCount)
 149                     ; 27 {
 150                     .text:	section	.text,new
 151  0000               f_MsDelay:
 153  0000 89            	pushw	x
 154       00000000      OFST:	set	0
 157  0001 200a          	jra	L35
 158  0003               L15:
 159                     ; 30 		u16MsCount--;
 161  0003 5a            	decw	x
 162  0004 1f01          	ldw	(OFST+1,sp),x
 163                     ; 31 		UsDelay(1190);
 165  0006 ae04a6        	ldw	x,#1190
 166  0009 8d000000      	callf	f_UsDelay
 168  000d               L35:
 169                     ; 28 	while (u16MsCount != 0)
 171  000d 1e01          	ldw	x,(OFST+1,sp)
 172  000f 26f2          	jrne	L15
 173                     ; 33 }
 176  0011 85            	popw	x
 177  0012 87            	retf	
 239                     ; 53 void U16BubbleSort(uint16 *pu16Data, uint16 u16Num)
 239                     ; 54 {
 240                     .text:	section	.text,new
 241  0000               f_U16BubbleSort:
 243  0000 89            	pushw	x
 244  0001 5206          	subw	sp,#6
 245       00000006      OFST:	set	6
 248                     ; 59     for(i = 0; i < u16Num - 1; i ++)
 250  0003 5f            	clrw	x
 252  0004 2041          	jra	L111
 253  0006               L501:
 254                     ; 61         for(j = 0; j < u16Num -i -1; j ++)
 256  0006 5f            	clrw	x
 258  0007 202f          	jra	L121
 259  0009               L511:
 260                     ; 63             if(pu16Data[j + 1] < pu16Data[j])
 262  0009 1e05          	ldw	x,(OFST-1,sp)
 263  000b 58            	sllw	x
 264  000c 72fb07        	addw	x,(OFST+1,sp)
 265  000f 1605          	ldw	y,(OFST-1,sp)
 266  0011 9058          	sllw	y
 267  0013 72f907        	addw	y,(OFST+1,sp)
 268  0016 ee02          	ldw	x,(2,x)
 269  0018 90f3          	cpw	x,(y)
 270  001a 2419          	jruge	L521
 271                     ; 65 				u16Tmp = pu16Data[j + 1];
 273  001c 1e05          	ldw	x,(OFST-1,sp)
 274  001e 58            	sllw	x
 275  001f 72fb07        	addw	x,(OFST+1,sp)
 276  0022 ee02          	ldw	x,(2,x)
 277  0024 1f01          	ldw	(OFST-5,sp),x
 278                     ; 66 				pu16Data[j + 1] = pu16Data[j];
 280  0026 1e05          	ldw	x,(OFST-1,sp)
 281  0028 58            	sllw	x
 282  0029 72fb07        	addw	x,(OFST+1,sp)
 283  002c 9093          	ldw	y,x
 284  002e 90fe          	ldw	y,(y)
 285  0030 ef02          	ldw	(2,x),y
 286                     ; 67 				pu16Data[j] = u16Tmp;
 288  0032 1601          	ldw	y,(OFST-5,sp)
 289  0034 ff            	ldw	(x),y
 290  0035               L521:
 291                     ; 61         for(j = 0; j < u16Num -i -1; j ++)
 293  0035 1e05          	ldw	x,(OFST-1,sp)
 294  0037 5c            	incw	x
 295  0038               L121:
 296  0038 1f05          	ldw	(OFST-1,sp),x
 299  003a 1e0c          	ldw	x,(OFST+6,sp)
 300  003c 72f003        	subw	x,(OFST-3,sp)
 301  003f 5a            	decw	x
 302  0040 1305          	cpw	x,(OFST-1,sp)
 303  0042 22c5          	jrugt	L511
 304                     ; 59     for(i = 0; i < u16Num - 1; i ++)
 306  0044 1e03          	ldw	x,(OFST-3,sp)
 307  0046 5c            	incw	x
 308  0047               L111:
 309  0047 1f03          	ldw	(OFST-3,sp),x
 312  0049 1e0c          	ldw	x,(OFST+6,sp)
 313  004b 5a            	decw	x
 314  004c 1303          	cpw	x,(OFST-3,sp)
 315  004e 22b6          	jrugt	L501
 316                     ; 71 }
 319  0050 5b08          	addw	sp,#8
 320  0052 87            	retf	
 382                     ; 89 void S32BubbleSort(sint32 *ps32Data, uint16 u16Num)
 382                     ; 90 {
 383                     .text:	section	.text,new
 384  0000               f_S32BubbleSort:
 386  0000 89            	pushw	x
 387  0001 5208          	subw	sp,#8
 388       00000008      OFST:	set	8
 391                     ; 95     for(i = 0; i < u16Num - 1; i ++)
 393  0003 5f            	clrw	x
 395  0004 2072          	jra	L161
 396  0006               L551:
 397                     ; 97         for(j = 0; j < u16Num -i -1; j ++)
 399  0006 5f            	clrw	x
 401  0007 2060          	jra	L171
 402  0009               L561:
 403                     ; 99             if(ps32Data[j + 1] < ps32Data[j])
 405  0009 1e07          	ldw	x,(OFST-1,sp)
 406  000b 58            	sllw	x
 407  000c 58            	sllw	x
 408  000d 72fb09        	addw	x,(OFST+1,sp)
 409  0010 1c0004        	addw	x,#4
 410  0013 8d000000      	callf	d_ltor
 412  0017 1e07          	ldw	x,(OFST-1,sp)
 413  0019 58            	sllw	x
 414  001a 58            	sllw	x
 415  001b 72fb09        	addw	x,(OFST+1,sp)
 416  001e 8d000000      	callf	d_lcmp
 418  0022 2e42          	jrsge	L571
 419                     ; 101 				s32Tmp = ps32Data[j + 1];
 421  0024 1e07          	ldw	x,(OFST-1,sp)
 422  0026 58            	sllw	x
 423  0027 58            	sllw	x
 424  0028 72fb09        	addw	x,(OFST+1,sp)
 425  002b e607          	ld	a,(7,x)
 426  002d 6b04          	ld	(OFST-4,sp),a
 427  002f e606          	ld	a,(6,x)
 428  0031 6b03          	ld	(OFST-5,sp),a
 429  0033 e605          	ld	a,(5,x)
 430  0035 6b02          	ld	(OFST-6,sp),a
 431  0037 e604          	ld	a,(4,x)
 432  0039 6b01          	ld	(OFST-7,sp),a
 433                     ; 102 				ps32Data[j + 1] = ps32Data[j];
 435  003b 1607          	ldw	y,(OFST-1,sp)
 436  003d 9058          	sllw	y
 437  003f 9058          	sllw	y
 438  0041 72f909        	addw	y,(OFST+1,sp)
 439  0044 e603          	ld	a,(3,x)
 440  0046 90e707        	ld	(7,y),a
 441  0049 e602          	ld	a,(2,x)
 442  004b 90e706        	ld	(6,y),a
 443  004e e601          	ld	a,(1,x)
 444  0050 90e705        	ld	(5,y),a
 445  0053 f6            	ld	a,(x)
 446  0054 90e704        	ld	(4,y),a
 447                     ; 103 				ps32Data[j] = s32Tmp;
 449  0057 7b04          	ld	a,(OFST-4,sp)
 450  0059 e703          	ld	(3,x),a
 451  005b 7b03          	ld	a,(OFST-5,sp)
 452  005d e702          	ld	(2,x),a
 453  005f 7b02          	ld	a,(OFST-6,sp)
 454  0061 e701          	ld	(1,x),a
 455  0063 7b01          	ld	a,(OFST-7,sp)
 456  0065 f7            	ld	(x),a
 457  0066               L571:
 458                     ; 97         for(j = 0; j < u16Num -i -1; j ++)
 460  0066 1e07          	ldw	x,(OFST-1,sp)
 461  0068 5c            	incw	x
 462  0069               L171:
 463  0069 1f07          	ldw	(OFST-1,sp),x
 466  006b 1e0e          	ldw	x,(OFST+6,sp)
 467  006d 72f005        	subw	x,(OFST-3,sp)
 468  0070 5a            	decw	x
 469  0071 1307          	cpw	x,(OFST-1,sp)
 470  0073 2294          	jrugt	L561
 471                     ; 95     for(i = 0; i < u16Num - 1; i ++)
 473  0075 1e05          	ldw	x,(OFST-3,sp)
 474  0077 5c            	incw	x
 475  0078               L161:
 476  0078 1f05          	ldw	(OFST-3,sp),x
 479  007a 1e0e          	ldw	x,(OFST+6,sp)
 480  007c 5a            	decw	x
 481  007d 1305          	cpw	x,(OFST-3,sp)
 482  007f 2285          	jrugt	L551
 483                     ; 107 }
 486  0081 5b0a          	addw	sp,#10
 487  0083 87            	retf	
 549                     ; 125 void fBubbleSort(float *pfData, uint16 u16Num)
 549                     ; 126 {
 550                     .text:	section	.text,new
 551  0000               f_fBubbleSort:
 553  0000 89            	pushw	x
 554  0001 5208          	subw	sp,#8
 555       00000008      OFST:	set	8
 558                     ; 131     for(i = 0; i < u16Num - 1; i ++)
 560  0003 5f            	clrw	x
 562  0004 2072          	jra	L132
 563  0006               L522:
 564                     ; 133         for(j = 0; j < u16Num -i -1; j ++)
 566  0006 5f            	clrw	x
 568  0007 2060          	jra	L142
 569  0009               L532:
 570                     ; 135             if(pfData[j + 1] < pfData[j])
 572  0009 1e07          	ldw	x,(OFST-1,sp)
 573  000b 58            	sllw	x
 574  000c 58            	sllw	x
 575  000d 72fb09        	addw	x,(OFST+1,sp)
 576  0010 1c0004        	addw	x,#4
 577  0013 8d000000      	callf	d_ltor
 579  0017 1e07          	ldw	x,(OFST-1,sp)
 580  0019 58            	sllw	x
 581  001a 58            	sllw	x
 582  001b 72fb09        	addw	x,(OFST+1,sp)
 583  001e 8d000000      	callf	d_fcmp
 585  0022 2e42          	jrsge	L542
 586                     ; 137 				fTmp = pfData[j + 1];
 588  0024 1e07          	ldw	x,(OFST-1,sp)
 589  0026 58            	sllw	x
 590  0027 58            	sllw	x
 591  0028 72fb09        	addw	x,(OFST+1,sp)
 592  002b e607          	ld	a,(7,x)
 593  002d 6b04          	ld	(OFST-4,sp),a
 594  002f e606          	ld	a,(6,x)
 595  0031 6b03          	ld	(OFST-5,sp),a
 596  0033 e605          	ld	a,(5,x)
 597  0035 6b02          	ld	(OFST-6,sp),a
 598  0037 e604          	ld	a,(4,x)
 599  0039 6b01          	ld	(OFST-7,sp),a
 600                     ; 138 				pfData[j + 1] = pfData[j];
 602  003b 1607          	ldw	y,(OFST-1,sp)
 603  003d 9058          	sllw	y
 604  003f 9058          	sllw	y
 605  0041 72f909        	addw	y,(OFST+1,sp)
 606  0044 e603          	ld	a,(3,x)
 607  0046 90e707        	ld	(7,y),a
 608  0049 e602          	ld	a,(2,x)
 609  004b 90e706        	ld	(6,y),a
 610  004e e601          	ld	a,(1,x)
 611  0050 90e705        	ld	(5,y),a
 612  0053 f6            	ld	a,(x)
 613  0054 90e704        	ld	(4,y),a
 614                     ; 139 				pfData[j] = fTmp;
 616  0057 7b04          	ld	a,(OFST-4,sp)
 617  0059 e703          	ld	(3,x),a
 618  005b 7b03          	ld	a,(OFST-5,sp)
 619  005d e702          	ld	(2,x),a
 620  005f 7b02          	ld	a,(OFST-6,sp)
 621  0061 e701          	ld	(1,x),a
 622  0063 7b01          	ld	a,(OFST-7,sp)
 623  0065 f7            	ld	(x),a
 624  0066               L542:
 625                     ; 133         for(j = 0; j < u16Num -i -1; j ++)
 627  0066 1e07          	ldw	x,(OFST-1,sp)
 628  0068 5c            	incw	x
 629  0069               L142:
 630  0069 1f07          	ldw	(OFST-1,sp),x
 633  006b 1e0e          	ldw	x,(OFST+6,sp)
 634  006d 72f005        	subw	x,(OFST-3,sp)
 635  0070 5a            	decw	x
 636  0071 1307          	cpw	x,(OFST-1,sp)
 637  0073 2294          	jrugt	L532
 638                     ; 131     for(i = 0; i < u16Num - 1; i ++)
 640  0075 1e05          	ldw	x,(OFST-3,sp)
 641  0077 5c            	incw	x
 642  0078               L132:
 643  0078 1f05          	ldw	(OFST-3,sp),x
 646  007a 1e0e          	ldw	x,(OFST+6,sp)
 647  007c 5a            	decw	x
 648  007d 1305          	cpw	x,(OFST-3,sp)
 649  007f 2285          	jrugt	L522
 650                     ; 143 }
 653  0081 5b0a          	addw	sp,#10
 654  0083 87            	retf	
 709                     ; 162 uint16 U16Average(uint16 arr[], uint16 n)
 709                     ; 163 {
 710                     .text:	section	.text,new
 711  0000               f_U16Average:
 713  0000 89            	pushw	x
 714  0001 520a          	subw	sp,#10
 715       0000000a      OFST:	set	10
 718                     ; 167 	u32Tmp = 0;
 720  0003 5f            	clrw	x
 721  0004 1f07          	ldw	(OFST-3,sp),x
 722  0006 1f05          	ldw	(OFST-5,sp),x
 723                     ; 168     for(i = 0; i < n; i ++)
 725  0008 2014          	jra	L772
 726  000a               L372:
 727                     ; 170 		u32Tmp += (uint32)arr[i];
 729  000a 58            	sllw	x
 730  000b 72fb0b        	addw	x,(OFST+1,sp)
 731  000e fe            	ldw	x,(x)
 732  000f 8d000000      	callf	d_uitolx
 734  0013 96            	ldw	x,sp
 735  0014 1c0005        	addw	x,#OFST-5
 736  0017 8d000000      	callf	d_lgadd
 738                     ; 168     for(i = 0; i < n; i ++)
 740  001b 1e09          	ldw	x,(OFST-1,sp)
 741  001d 5c            	incw	x
 742  001e               L772:
 744  001e 1f09          	ldw	(OFST-1,sp),x
 747  0020 1310          	cpw	x,(OFST+6,sp)
 748  0022 25e6          	jrult	L372
 749                     ; 173 	return (uint16)(u32Tmp / n);
 751  0024 1e10          	ldw	x,(OFST+6,sp)
 752  0026 8d000000      	callf	d_uitolx
 754  002a 96            	ldw	x,sp
 755  002b 5c            	incw	x
 756  002c 8d000000      	callf	d_rtol
 758  0030 96            	ldw	x,sp
 759  0031 1c0005        	addw	x,#OFST-5
 760  0034 8d000000      	callf	d_ltor
 762  0038 96            	ldw	x,sp
 763  0039 5c            	incw	x
 764  003a 8d000000      	callf	d_ludv
 766  003e be02          	ldw	x,c_lreg+2
 769  0040 5b0c          	addw	sp,#12
 770  0042 87            	retf	
 825                     ; 191 sint32 S32Average(sint32 arr[], uint16 n)
 825                     ; 192 {
 826                     .text:	section	.text,new
 827  0000               f_S32Average:
 829  0000 89            	pushw	x
 830  0001 520a          	subw	sp,#10
 831       0000000a      OFST:	set	10
 834                     ; 196 	s32Tmp = 0;
 836  0003 5f            	clrw	x
 837  0004 1f07          	ldw	(OFST-3,sp),x
 838  0006 1f05          	ldw	(OFST-5,sp),x
 839                     ; 197     for(i = 0; i < n; i ++)
 841  0008 2014          	jra	L333
 842  000a               L723:
 843                     ; 199 		s32Tmp += arr[i];
 845  000a 58            	sllw	x
 846  000b 58            	sllw	x
 847  000c 72fb0b        	addw	x,(OFST+1,sp)
 848  000f 8d000000      	callf	d_ltor
 850  0013 96            	ldw	x,sp
 851  0014 1c0005        	addw	x,#OFST-5
 852  0017 8d000000      	callf	d_lgadd
 854                     ; 197     for(i = 0; i < n; i ++)
 856  001b 1e09          	ldw	x,(OFST-1,sp)
 857  001d 5c            	incw	x
 858  001e               L333:
 860  001e 1f09          	ldw	(OFST-1,sp),x
 863  0020 1310          	cpw	x,(OFST+6,sp)
 864  0022 25e6          	jrult	L723
 865                     ; 202 	return (s32Tmp / n);
 867  0024 1e10          	ldw	x,(OFST+6,sp)
 868  0026 8d000000      	callf	d_uitolx
 870  002a 96            	ldw	x,sp
 871  002b 5c            	incw	x
 872  002c 8d000000      	callf	d_rtol
 874  0030 96            	ldw	x,sp
 875  0031 1c0005        	addw	x,#OFST-5
 876  0034 8d000000      	callf	d_ltor
 878  0038 96            	ldw	x,sp
 879  0039 5c            	incw	x
 880  003a 8d000000      	callf	d_ldiv
 884  003e 5b0c          	addw	sp,#12
 885  0040 87            	retf	
 940                     ; 222 float fAverage(float arr[], uint16 n)
 940                     ; 223 {
 941                     .text:	section	.text,new
 942  0000               f_fAverage:
 944  0000 89            	pushw	x
 945  0001 520a          	subw	sp,#10
 946       0000000a      OFST:	set	10
 949                     ; 227 	fTmp = 0;
 951  0003 5f            	clrw	x
 952  0004 1f07          	ldw	(OFST-3,sp),x
 953  0006 1f05          	ldw	(OFST-5,sp),x
 954                     ; 228     for(i = 0; i < n; i ++)
 956  0008 2014          	jra	L763
 957  000a               L363:
 958                     ; 230 		fTmp += arr[i];
 960  000a 58            	sllw	x
 961  000b 58            	sllw	x
 962  000c 72fb0b        	addw	x,(OFST+1,sp)
 963  000f 8d000000      	callf	d_ltor
 965  0013 96            	ldw	x,sp
 966  0014 1c0005        	addw	x,#OFST-5
 967  0017 8d000000      	callf	d_fgadd
 969                     ; 228     for(i = 0; i < n; i ++)
 971  001b 1e09          	ldw	x,(OFST-1,sp)
 972  001d 5c            	incw	x
 973  001e               L763:
 975  001e 1f09          	ldw	(OFST-1,sp),x
 978  0020 1310          	cpw	x,(OFST+6,sp)
 979  0022 25e6          	jrult	L363
 980                     ; 233 	return (fTmp / n);
 982  0024 1e10          	ldw	x,(OFST+6,sp)
 983  0026 8d000000      	callf	d_uitof
 985  002a 96            	ldw	x,sp
 986  002b 5c            	incw	x
 987  002c 8d000000      	callf	d_rtol
 989  0030 96            	ldw	x,sp
 990  0031 1c0005        	addw	x,#OFST-5
 991  0034 8d000000      	callf	d_ltor
 993  0038 96            	ldw	x,sp
 994  0039 5c            	incw	x
 995  003a 8d000000      	callf	d_fdiv
 999  003e 5b0c          	addw	sp,#12
1000  0040 87            	retf	
1050                     ; 238 uint16 U16Filter(uint16 *pu16Data, uint8 u8Num)
1050                     ; 239 {
1051                     .text:	section	.text,new
1052  0000               f_U16Filter:
1054  0000 89            	pushw	x
1055  0001 89            	pushw	x
1056       00000002      OFST:	set	2
1059                     ; 242 	U16BubbleSort(pu16Data, u8Num);
1061  0002 7b08          	ld	a,(OFST+6,sp)
1062  0004 5f            	clrw	x
1063  0005 97            	ld	xl,a
1064  0006 89            	pushw	x
1065  0007 1e05          	ldw	x,(OFST+3,sp)
1066  0009 8d000000      	callf	f_U16BubbleSort
1068  000d 85            	popw	x
1069                     ; 243 	u16Data = U16Average((pu16Data + (uint16)u8Num / 4), (uint16)(u8Num / 2));
1071  000e 7b08          	ld	a,(OFST+6,sp)
1072  0010 44            	srl	a
1073  0011 5f            	clrw	x
1074  0012 97            	ld	xl,a
1075  0013 89            	pushw	x
1076  0014 7b0a          	ld	a,(OFST+8,sp)
1077  0016 5f            	clrw	x
1078  0017 97            	ld	xl,a
1079  0018 54            	srlw	x
1080  0019 54            	srlw	x
1081  001a 58            	sllw	x
1082  001b 72fb05        	addw	x,(OFST+3,sp)
1083  001e 8d000000      	callf	f_U16Average
1085  0022 5b06          	addw	sp,#6
1086                     ; 245 	return u16Data;
1090  0024 87            	retf	
1140                     ; 249 float FloatFilter(float *pfData, uint8 u8Num)
1140                     ; 250 {
1141                     .text:	section	.text,new
1142  0000               f_FloatFilter:
1144  0000 89            	pushw	x
1145  0001 5204          	subw	sp,#4
1146       00000004      OFST:	set	4
1149                     ; 253 	fBubbleSort(pfData, u8Num);
1151  0003 7b0a          	ld	a,(OFST+6,sp)
1152  0005 5f            	clrw	x
1153  0006 97            	ld	xl,a
1154  0007 89            	pushw	x
1155  0008 1e07          	ldw	x,(OFST+3,sp)
1156  000a 8d000000      	callf	f_fBubbleSort
1158  000e 85            	popw	x
1159                     ; 254 	fData = fAverage((pfData + (uint16)u8Num / 4), (uint16)(u8Num / 2));
1161  000f 7b0a          	ld	a,(OFST+6,sp)
1162  0011 44            	srl	a
1163  0012 5f            	clrw	x
1164  0013 97            	ld	xl,a
1165  0014 89            	pushw	x
1166  0015 7b0c          	ld	a,(OFST+8,sp)
1167  0017 5f            	clrw	x
1168  0018 97            	ld	xl,a
1169  0019 54            	srlw	x
1170  001a 54            	srlw	x
1171  001b 58            	sllw	x
1172  001c 58            	sllw	x
1173  001d 72fb07        	addw	x,(OFST+3,sp)
1174  0020 8d000000      	callf	f_fAverage
1176  0024 85            	popw	x
1177  0025 96            	ldw	x,sp
1178  0026 5c            	incw	x
1179  0027 8d000000      	callf	d_rtol
1181                     ; 256 	return fData;
1183  002b 96            	ldw	x,sp
1184  002c 5c            	incw	x
1185  002d 8d000000      	callf	d_ltor
1189  0031 5b06          	addw	sp,#6
1190  0033 87            	retf	
1224                     ; 260 uint16 PubGetU16(unsigned char *pu8In)
1224                     ; 261 {
1225                     .text:	section	.text,new
1226  0000               f_PubGetU16:
1230                     ; 263 	return *((uint16 *)pu8In);
1232  0000 fe            	ldw	x,(x)
1235  0001 87            	retf	
1276                     ; 266 void PubPutU16(uint8 *pu8Data, uint16 u16Data)
1276                     ; 267 {
1277                     .text:	section	.text,new
1278  0000               f_PubPutU16:
1280  0000 89            	pushw	x
1281       00000000      OFST:	set	0
1284                     ; 269 	pu8Data[0] = (u16Data >> 8) & 0x00FF ;
1286  0001 7b06          	ld	a,(OFST+6,sp)
1287  0003 1e01          	ldw	x,(OFST+1,sp)
1288  0005 f7            	ld	(x),a
1289                     ; 270 	pu8Data[1] = u16Data & 0x00FF ;
1291  0006 7b07          	ld	a,(OFST+7,sp)
1292  0008 e701          	ld	(1,x),a
1293                     ; 271 }
1296  000a 85            	popw	x
1297  000b 87            	retf	
1331                     ; 274 sint16 PubGetS16(unsigned char *pu8In)
1331                     ; 275 {
1332                     .text:	section	.text,new
1333  0000               f_PubGetS16:
1337                     ; 277 	return *((sint16 *)pu8In);
1339  0000 fe            	ldw	x,(x)
1342  0001 87            	retf	
1383                     ; 280 void PubPutS16(uint8 *pu8Data, sint16 s16Data)
1383                     ; 281 {
1384                     .text:	section	.text,new
1385  0000               f_PubPutS16:
1387  0000 89            	pushw	x
1388       00000000      OFST:	set	0
1391                     ; 283 	pu8Data[0] = (s16Data >> 8) & 0x00FF ;
1393  0001 7b06          	ld	a,(OFST+6,sp)
1394  0003 1e01          	ldw	x,(OFST+1,sp)
1395  0005 f7            	ld	(x),a
1396                     ; 284 	pu8Data[1] = s16Data & 0x00FF ;
1398  0006 7b07          	ld	a,(OFST+7,sp)
1399  0008 e701          	ld	(1,x),a
1400                     ; 285 }
1403  000a 85            	popw	x
1404  000b 87            	retf	
1438                     ; 301 uint32 PubGetU32(unsigned char *pu8In)
1438                     ; 302 {
1439                     .text:	section	.text,new
1440  0000               f_PubGetU32:
1442  0000 89            	pushw	x
1443  0001 520c          	subw	sp,#12
1444       0000000c      OFST:	set	12
1447                     ; 306 	return ((((uint32)pu8In[0]) << 24) | (((uint32)pu8In[1]) << 16) | (((uint32)pu8In[2]) << 8) | ((uint32)pu8In[3]));
1449  0003 e603          	ld	a,(3,x)
1450  0005 b703          	ld	c_lreg+3,a
1451  0007 3f02          	clr	c_lreg+2
1452  0009 3f01          	clr	c_lreg+1
1453  000b 3f00          	clr	c_lreg
1454  000d 96            	ldw	x,sp
1455  000e 1c0009        	addw	x,#OFST-3
1456  0011 8d000000      	callf	d_rtol
1458  0015 1e0d          	ldw	x,(OFST+1,sp)
1459  0017 e602          	ld	a,(2,x)
1460  0019 5f            	clrw	x
1461  001a 97            	ld	xl,a
1462  001b 90ae0100      	ldw	y,#256
1463  001f 8d000000      	callf	d_umul
1465  0023 96            	ldw	x,sp
1466  0024 1c0005        	addw	x,#OFST-7
1467  0027 8d000000      	callf	d_rtol
1469  002b 1e0d          	ldw	x,(OFST+1,sp)
1470  002d e601          	ld	a,(1,x)
1471  002f b703          	ld	c_lreg+3,a
1472  0031 3f02          	clr	c_lreg+2
1473  0033 3f01          	clr	c_lreg+1
1474  0035 3f00          	clr	c_lreg
1475  0037 a610          	ld	a,#16
1476  0039 8d000000      	callf	d_llsh
1478  003d 96            	ldw	x,sp
1479  003e 5c            	incw	x
1480  003f 8d000000      	callf	d_rtol
1482  0043 1e0d          	ldw	x,(OFST+1,sp)
1483  0045 f6            	ld	a,(x)
1484  0046 b703          	ld	c_lreg+3,a
1485  0048 3f02          	clr	c_lreg+2
1486  004a 3f01          	clr	c_lreg+1
1487  004c 3f00          	clr	c_lreg
1488  004e a618          	ld	a,#24
1489  0050 8d000000      	callf	d_llsh
1491  0054 96            	ldw	x,sp
1492  0055 5c            	incw	x
1493  0056 8d000000      	callf	d_lor
1495  005a 96            	ldw	x,sp
1496  005b 1c0005        	addw	x,#OFST-7
1497  005e 8d000000      	callf	d_lor
1499  0062 96            	ldw	x,sp
1500  0063 1c0009        	addw	x,#OFST-3
1501  0066 8d000000      	callf	d_lor
1505  006a 5b0e          	addw	sp,#14
1506  006c 87            	retf	
1547                     ; 323 void PubPutU32(uint8 *pu8In, uint32 u32Data)
1547                     ; 324 {
1548                     .text:	section	.text,new
1549  0000               f_PubPutU32:
1551  0000 89            	pushw	x
1552       00000000      OFST:	set	0
1555                     ; 331 	pu8In[0] = (uint8)((u32Data >> 24) & 0x000000ff);
1557  0001 7b06          	ld	a,(OFST+6,sp)
1558  0003 1e01          	ldw	x,(OFST+1,sp)
1559  0005 f7            	ld	(x),a
1560                     ; 332 	pu8In[1] = (uint8)((u32Data >> 16) & 0x000000ff);
1562  0006 7b07          	ld	a,(OFST+7,sp)
1563  0008 e701          	ld	(1,x),a
1564                     ; 333 	pu8In[2] = (uint8)((u32Data >> 8) & 0x000000ff);
1566  000a 7b08          	ld	a,(OFST+8,sp)
1567  000c e702          	ld	(2,x),a
1568                     ; 334 	pu8In[3] = (uint8)(u32Data & 0x000000ff);
1570  000e 7b09          	ld	a,(OFST+9,sp)
1571  0010 e703          	ld	(3,x),a
1572                     ; 336 }
1575  0012 85            	popw	x
1576  0013 87            	retf	
1644                     ; 353 float PubGetFloat(unsigned char *pu8In)
1644                     ; 354 {
1645                     .text:	section	.text,new
1646  0000               f_PubGetFloat:
1648  0000 5204          	subw	sp,#4
1649       00000004      OFST:	set	4
1652                     ; 367 	uData.u8Tmp[0] = pu8In[0];
1654  0002 f6            	ld	a,(x)
1655  0003 6b01          	ld	(OFST-3,sp),a
1656                     ; 368 	uData.u8Tmp[1] = pu8In[1];
1658  0005 e601          	ld	a,(1,x)
1659  0007 6b02          	ld	(OFST-2,sp),a
1660                     ; 369 	uData.u8Tmp[2] = pu8In[2];
1662  0009 e602          	ld	a,(2,x)
1663  000b 6b03          	ld	(OFST-1,sp),a
1664                     ; 370 	uData.u8Tmp[3] = pu8In[3];
1666  000d e603          	ld	a,(3,x)
1667  000f 6b04          	ld	(OFST+0,sp),a
1668                     ; 373 	return uData.fTmp;
1670  0011 96            	ldw	x,sp
1671  0012 5c            	incw	x
1672  0013 8d000000      	callf	d_ltor
1676  0017 5b04          	addw	sp,#4
1677  0019 87            	retf	
1752                     ; 377 void PubPutFloat(uint8 *pu8Data, float fData)
1752                     ; 378 {
1753                     .text:	section	.text,new
1754  0000               f_PubPutFloat:
1756  0000 89            	pushw	x
1757  0001 5204          	subw	sp,#4
1758       00000004      OFST:	set	4
1761                     ; 385 	uData.fData = fData;
1763  0003 1e0c          	ldw	x,(OFST+8,sp)
1764  0005 1f03          	ldw	(OFST-1,sp),x
1765  0007 1e0a          	ldw	x,(OFST+6,sp)
1766  0009 1f01          	ldw	(OFST-3,sp),x
1767                     ; 387 	pu8Data[0] = uData.u8Data[0];
1769  000b 7b01          	ld	a,(OFST-3,sp)
1770  000d 1e05          	ldw	x,(OFST+1,sp)
1771  000f f7            	ld	(x),a
1772                     ; 388 	pu8Data[1] = uData.u8Data[1];
1774  0010 7b02          	ld	a,(OFST-2,sp)
1775  0012 e701          	ld	(1,x),a
1776                     ; 389 	pu8Data[2] = uData.u8Data[2];
1778  0014 7b03          	ld	a,(OFST-1,sp)
1779  0016 e702          	ld	(2,x),a
1780                     ; 390 	pu8Data[3] = uData.u8Data[3];
1782  0018 7b04          	ld	a,(OFST+0,sp)
1783  001a e703          	ld	(3,x),a
1784                     ; 391 }
1787  001c 5b06          	addw	sp,#6
1788  001e 87            	retf	
1827                     ; 395 static void AdcInit(unsigned char u8AdcChan)
1827                     ; 396 {
1828                     .text:	section	.text,new
1829  0000               L366f_AdcInit:
1831  0000 88            	push	a
1832       00000000      OFST:	set	0
1835                     ; 398 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
1837  0001 ae0001        	ldw	x,#1
1838  0004 a610          	ld	a,#16
1839  0006 95            	ld	xh,a
1840  0007 8d000000      	callf	f_CLK_PeripheralClockConfig
1842                     ; 401 	ADC_Init(ADC1, ADC_ConversionMode_Single, ADC_Resolution_12Bit, ADC_Prescaler_2);
1844  000b 4b80          	push	#128
1845  000d 4b00          	push	#0
1846  000f 4b00          	push	#0
1847  0011 ae5340        	ldw	x,#21312
1848  0014 8d000000      	callf	f_ADC_Init
1850  0018 5b03          	addw	sp,#3
1851                     ; 402 	ADC_SamplingTimeConfig(ADC1, ADC_Group_SlowChannels, ADC_SamplingTime_384Cycles);
1853  001a 4b07          	push	#7
1854  001c 4b00          	push	#0
1855  001e ae5340        	ldw	x,#21312
1856  0021 8d000000      	callf	f_ADC_SamplingTimeConfig
1858  0025 85            	popw	x
1859                     ; 405 	ADC_Cmd(ADC1, ENABLE);
1861  0026 4b01          	push	#1
1862  0028 ae5340        	ldw	x,#21312
1863  002b 8d000000      	callf	f_ADC_Cmd
1865  002f 84            	pop	a
1866                     ; 407 	if(SETX_ADCIN1 == u8AdcChan)
1868  0030 7b01          	ld	a,(OFST+1,sp)
1869  0032 2607          	jrne	L107
1870                     ; 409 		ADC_ChannelCmd(ADC1, ADC_Channel_18, ENABLE);
1872  0034 4b01          	push	#1
1873  0036 ae0104        	ldw	x,#260
1876  0039 2046          	jpf	LC001
1877  003b               L107:
1878                     ; 411 	else if(SETX_ADCIN2 == u8AdcChan)
1880  003b a101          	cp	a,#1
1881  003d 2607          	jrne	L507
1882                     ; 413 		ADC_ChannelCmd(ADC1, ADC_Channel_17, ENABLE);
1884  003f 4b01          	push	#1
1885  0041 ae0102        	ldw	x,#258
1888  0044 203b          	jpf	LC001
1889  0046               L507:
1890                     ; 415 	else if(SETX_ADCIN3 == u8AdcChan)
1892  0046 a102          	cp	a,#2
1893  0048 2607          	jrne	L117
1894                     ; 417 		ADC_ChannelCmd(ADC1, ADC_Channel_16, ENABLE);
1896  004a 4b01          	push	#1
1897  004c ae0101        	ldw	x,#257
1900  004f 2030          	jpf	LC001
1901  0051               L117:
1902                     ; 419 	else if(SETX_ADCIN4 == u8AdcChan)
1904  0051 a103          	cp	a,#3
1905  0053 2607          	jrne	L517
1906                     ; 421 		ADC_ChannelCmd(ADC1, ADC_Channel_14, ENABLE);
1908  0055 4b01          	push	#1
1909  0057 ae0240        	ldw	x,#576
1912  005a 2025          	jpf	LC001
1913  005c               L517:
1914                     ; 423 	else if(SETX_ADCIN_GND == u8AdcChan)
1916  005c a104          	cp	a,#4
1917  005e 2607          	jrne	L127
1918                     ; 425 		ADC_ChannelCmd(ADC1, ADC_Channel_15, ENABLE);
1920  0060 4b01          	push	#1
1921  0062 ae0280        	ldw	x,#640
1924  0065 201a          	jpf	LC001
1925  0067               L127:
1926                     ; 427 	else if(SETX_ADCIN_REF1V2 == u8AdcChan)
1928  0067 a105          	cp	a,#5
1929  0069 2607          	jrne	L527
1930                     ; 429 		ADC_ChannelCmd(ADC1, ADC_Channel_13, ENABLE);
1932  006b 4b01          	push	#1
1933  006d ae0220        	ldw	x,#544
1936  0070 200f          	jpf	LC001
1937  0072               L527:
1938                     ; 431 	else if(SETX_ADCIN_VREFINT == u8AdcChan)
1940  0072 a106          	cp	a,#6
1941  0074 2615          	jrne	L307
1942                     ; 433 		ADC_VrefintCmd(ENABLE);
1944  0076 a601          	ld	a,#1
1945  0078 8d000000      	callf	f_ADC_VrefintCmd
1947                     ; 434 		ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, ENABLE);
1949  007c 4b01          	push	#1
1950  007e ae0010        	ldw	x,#16
1952  0081               LC001:
1953  0081 89            	pushw	x
1954  0082 ae5340        	ldw	x,#21312
1955  0085 8d000000      	callf	f_ADC_ChannelCmd
1956  0089 5b03          	addw	sp,#3
1957  008b               L307:
1958                     ; 437 	UsDelay(16);
1960  008b ae0010        	ldw	x,#16
1961  008e 8d000000      	callf	f_UsDelay
1963                     ; 439 	ADC_SoftwareStartConv(ADC1);
1965  0092 ae5340        	ldw	x,#21312
1966  0095 8d000000      	callf	f_ADC_SoftwareStartConv
1968                     ; 440 }
1971  0099 84            	pop	a
1972  009a 87            	retf	
2025                     ; 443 uint16 AdcGeneralAcq(uint8 u8AdcChan)
2025                     ; 444 {
2026                     .text:	section	.text,new
2027  0000               f_AdcGeneralAcq:
2029  0000 520a          	subw	sp,#10
2030       0000000a      OFST:	set	10
2033                     ; 448 	AdcInit(u8AdcChan);
2035  0002 8d000000      	callf	L366f_AdcInit
2038  0006               L557:
2039                     ; 450     while (ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET);
2041  0006 4b01          	push	#1
2042  0008 ae5340        	ldw	x,#21312
2043  000b 8d000000      	callf	f_ADC_GetFlagStatus
2045  000f 5b01          	addw	sp,#1
2046  0011 4d            	tnz	a
2047  0012 27f2          	jreq	L557
2048                     ; 451     u16AdcData = ADC_GetConversionValue(ADC1);
2050  0014 ae5340        	ldw	x,#21312
2051  0017 8d000000      	callf	f_ADC_GetConversionValue
2053  001b 1f05          	ldw	(OFST-5,sp),x
2054                     ; 452     ADC_ClearFlag(ADC1, ADC_FLAG_EOC);
2056  001d 4b01          	push	#1
2057  001f ae5340        	ldw	x,#21312
2058  0022 8d000000      	callf	f_ADC_ClearFlag
2060  0026 84            	pop	a
2061                     ; 453     ADC_ClearITPendingBit(ADC1, ADC_FLAG_EOC);
2063  0027 4b01          	push	#1
2064  0029 ae5340        	ldw	x,#21312
2065  002c 8d000000      	callf	f_ADC_ClearITPendingBit
2067  0030 84            	pop	a
2068                     ; 455     ADC_Cmd(ADC1, DISABLE);
2070  0031 4b00          	push	#0
2071  0033 ae5340        	ldw	x,#21312
2072  0036 8d000000      	callf	f_ADC_Cmd
2074  003a ae5340        	ldw	x,#21312
2075  003d 84            	pop	a
2076                     ; 456     ADC_DeInit(ADC1);
2078  003e 8d000000      	callf	f_ADC_DeInit
2080                     ; 458 	if(4095 < u16AdcData)
2082  0042 1e05          	ldw	x,(OFST-5,sp)
2083  0044 a31000        	cpw	x,#4096
2084  0047 2503          	jrult	L167
2085                     ; 460 		u16AdcData = 0;
2087  0049 5f            	clrw	x
2088  004a 1f05          	ldw	(OFST-5,sp),x
2089  004c               L167:
2090                     ; 463 	u32VoltData = u16AdcData;
2092  004c 8d000000      	callf	d_uitolx
2094  0050 96            	ldw	x,sp
2095  0051 1c0007        	addw	x,#OFST-3
2096  0054 8d000000      	callf	d_rtol
2098                     ; 464     u32VoltData = u32VoltData * CALI_ADC_REF_VOLT;
2100  0058 ae04c9        	ldw	x,#1225
2101  005b bf02          	ldw	c_lreg+2,x
2102  005d 5f            	clrw	x
2103  005e bf00          	ldw	c_lreg,x
2104  0060 96            	ldw	x,sp
2105  0061 1c0007        	addw	x,#OFST-3
2106  0064 8d000000      	callf	d_lgmul
2108                     ; 465 	u32VoltData = u32VoltData / u16ReferAdcValue;
2110  0068 ce0000        	ldw	x,L3_u16ReferAdcValue
2111  006b 8d000000      	callf	d_uitolx
2113  006f 96            	ldw	x,sp
2114  0070 5c            	incw	x
2115  0071 8d000000      	callf	d_rtol
2117  0075 96            	ldw	x,sp
2118  0076 1c0007        	addw	x,#OFST-3
2119  0079 8d000000      	callf	d_ltor
2121  007d 96            	ldw	x,sp
2122  007e 5c            	incw	x
2123  007f 8d000000      	callf	d_ludv
2125  0083 96            	ldw	x,sp
2126  0084 1c0007        	addw	x,#OFST-3
2127  0087 8d000000      	callf	d_rtol
2129                     ; 467     return (uint16)u32VoltData;
2131  008b 1e09          	ldw	x,(OFST-1,sp)
2134  008d 5b0a          	addw	sp,#10
2135  008f 87            	retf	
2170                     ; 473 void AdcCaliInit(void)
2170                     ; 474 {
2171                     .text:	section	.text,new
2172  0000               f_AdcCaliInit:
2174  0000 88            	push	a
2175       00000001      OFST:	set	1
2178                     ; 478 	for(i = 0; i < CALI_ADC_ACQ_NUM; i ++)
2180  0001 0f01          	clr	(OFST+0,sp)
2181  0003               L777:
2184  0003 0c01          	inc	(OFST+0,sp)
2187  0005 7b01          	ld	a,(OFST+0,sp)
2188  0007 a110          	cp	a,#16
2189  0009 25f8          	jrult	L777
2190                     ; 485 	u16ReferAdcValue = 1520;
2192  000b ae05f0        	ldw	x,#1520
2193  000e cf0000        	ldw	L3_u16ReferAdcValue,x
2194                     ; 488 	sprintf(DebugBuf, "1V2 reference ad value = %u\r\n", u16ReferAdcValue);
2196  0011 89            	pushw	x
2197  0012 ae0000        	ldw	x,#L5001
2198  0015 89            	pushw	x
2199  0016 ae0000        	ldw	x,#_DebugBuf
2200  0019 8d000000      	callf	f_sprintf
2202  001d 5b04          	addw	sp,#4
2203                     ; 489 	DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);
2205  001f ae0000        	ldw	x,#_DebugBuf
2206  0022 89            	pushw	x
2207  0023 a603          	ld	a,#3
2208  0025 8d000000      	callf	f_DebugStrOutput
2210  0029 85            	popw	x
2211                     ; 491 }
2214  002a 84            	pop	a
2215  002b 87            	retf	
2236                     	xdef	f_fAverage
2237                     	xdef	f_S32Average
2238                     	xdef	f_U16Average
2239                     	xdef	f_fBubbleSort
2240                     	xdef	f_S32BubbleSort
2241                     	xdef	f_U16BubbleSort
2242                     	xref	f_DebugStrOutput
2243                     	xref	_DebugBuf
2244                     	xdef	f_AdcCaliInit
2245                     	xdef	f_AdcGeneralAcq
2246                     	xdef	f_PubPutFloat
2247                     	xdef	f_PubGetFloat
2248                     	xdef	f_PubPutU32
2249                     	xdef	f_PubGetU32
2250                     	xdef	f_PubPutS16
2251                     	xdef	f_PubGetS16
2252                     	xdef	f_PubPutU16
2253                     	xdef	f_PubGetU16
2254                     	xdef	f_FloatFilter
2255                     	xdef	f_U16Filter
2256                     	xdef	f_UsDelay
2257                     	xdef	f_MsDelay
2258                     	xref	f_CLK_PeripheralClockConfig
2259                     	xref	f_ADC_ClearITPendingBit
2260                     	xref	f_ADC_ClearFlag
2261                     	xref	f_ADC_GetFlagStatus
2262                     	xref	f_ADC_GetConversionValue
2263                     	xref	f_ADC_SamplingTimeConfig
2264                     	xref	f_ADC_ChannelCmd
2265                     	xref	f_ADC_VrefintCmd
2266                     	xref	f_ADC_SoftwareStartConv
2267                     	xref	f_ADC_Cmd
2268                     	xref	f_ADC_Init
2269                     	xref	f_ADC_DeInit
2270                     	xref	f_sprintf
2271                     .const:	section	.text
2272  0000               L5001:
2273  0000 315632207265  	dc.b	"1V2 reference ad v"
2274  0012 616c7565203d  	dc.b	"alue = %u",13
2275  001c 0a00          	dc.b	10,0
2276                     	xref.b	c_lreg
2296                     	xref	d_lgmul
2297                     	xref	d_umul
2298                     	xref	d_lor
2299                     	xref	d_llsh
2300                     	xref	d_fdiv
2301                     	xref	d_uitof
2302                     	xref	d_fgadd
2303                     	xref	d_ldiv
2304                     	xref	d_ludv
2305                     	xref	d_rtol
2306                     	xref	d_lgadd
2307                     	xref	d_uitolx
2308                     	xref	d_fcmp
2309                     	xref	d_lcmp
2310                     	xref	d_ltor
2311                     	end
