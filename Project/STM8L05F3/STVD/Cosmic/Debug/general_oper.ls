   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  51                     ; 5 void UsDelay(uint16 u16MsCount)
  51                     ; 6 {	
  53                     .text:	section	.text,new
  54  0000               _UsDelay:
  56  0000 89            	pushw	x
  57       00000000      OFST:	set	0
  60  0001 200a          	jra	L13
  61  0003               L72:
  62                     ; 9 		u16MsCount--;
  64  0003 5a            	decw	x
  65  0004 1f01          	ldw	(OFST+1,sp),x
  66                     ; 10 		nop();
  69  0006 9d            	nop	
  71                     ; 11 		nop();
  75  0007 9d            	nop	
  77                     ; 12 		nop();
  81  0008 9d            	nop	
  83                     ; 13 		nop();
  87  0009 9d            	nop	
  89                     ; 14 		nop();
  93  000a 9d            	nop	
  95                     ; 15 		nop();
  99  000b 9d            	nop	
 101                     ; 16 		nop();
 105  000c 9d            	nop	
 108  000d               L13:
 109                     ; 7 	while (u16MsCount != 0)
 111  000d 1e01          	ldw	x,(OFST+1,sp)
 112  000f 26f2          	jrne	L72
 113                     ; 18 }
 116  0011 85            	popw	x
 117  0012 81            	ret	
 152                     ; 21 void MsDelay(uint16 u16MsCount)
 152                     ; 22 {
 153                     .text:	section	.text,new
 154  0000               _MsDelay:
 156  0000 89            	pushw	x
 157       00000000      OFST:	set	0
 160  0001 2009          	jra	L55
 161  0003               L35:
 162                     ; 25 		u16MsCount--;
 164  0003 5a            	decw	x
 165  0004 1f01          	ldw	(OFST+1,sp),x
 166                     ; 26 		UsDelay(1190);
 168  0006 ae04a6        	ldw	x,#1190
 169  0009 cd0000        	call	_UsDelay
 171  000c               L55:
 172                     ; 23 	while (u16MsCount != 0)
 174  000c 1e01          	ldw	x,(OFST+1,sp)
 175  000e 26f3          	jrne	L35
 176                     ; 28 }
 179  0010 85            	popw	x
 180  0011 81            	ret	
 251                     ; 48 void U16BubbleSort(uint16 *pu16Data, uint16 u16Num)
 251                     ; 49 {
 252                     .text:	section	.text,new
 253  0000               _U16BubbleSort:
 255  0000 89            	pushw	x
 256  0001 5206          	subw	sp,#6
 257       00000006      OFST:	set	6
 260                     ; 54     for(i = 0; i < u16Num - 1; i ++)
 262  0003 5f            	clrw	x
 264  0004 2041          	jra	L321
 265  0006               L711:
 266                     ; 56         for(j = 0; j < u16Num -i -1; j ++)
 268  0006 5f            	clrw	x
 270  0007 202f          	jra	L331
 271  0009               L721:
 272                     ; 58             if(pu16Data[j + 1] < pu16Data[j])
 274  0009 1e05          	ldw	x,(OFST-1,sp)
 275  000b 58            	sllw	x
 276  000c 72fb07        	addw	x,(OFST+1,sp)
 277  000f 1605          	ldw	y,(OFST-1,sp)
 278  0011 9058          	sllw	y
 279  0013 72f907        	addw	y,(OFST+1,sp)
 280  0016 ee02          	ldw	x,(2,x)
 281  0018 90f3          	cpw	x,(y)
 282  001a 2419          	jruge	L731
 283                     ; 60 				u16Tmp = pu16Data[j + 1];
 285  001c 1e05          	ldw	x,(OFST-1,sp)
 286  001e 58            	sllw	x
 287  001f 72fb07        	addw	x,(OFST+1,sp)
 288  0022 ee02          	ldw	x,(2,x)
 289  0024 1f01          	ldw	(OFST-5,sp),x
 290                     ; 61 				pu16Data[j + 1] = pu16Data[j];
 292  0026 1e05          	ldw	x,(OFST-1,sp)
 293  0028 58            	sllw	x
 294  0029 72fb07        	addw	x,(OFST+1,sp)
 295  002c 9093          	ldw	y,x
 296  002e 90fe          	ldw	y,(y)
 297  0030 ef02          	ldw	(2,x),y
 298                     ; 62 				pu16Data[j] = u16Tmp;
 300  0032 1601          	ldw	y,(OFST-5,sp)
 301  0034 ff            	ldw	(x),y
 302  0035               L731:
 303                     ; 56         for(j = 0; j < u16Num -i -1; j ++)
 305  0035 1e05          	ldw	x,(OFST-1,sp)
 306  0037 5c            	incw	x
 307  0038               L331:
 308  0038 1f05          	ldw	(OFST-1,sp),x
 311  003a 1e0b          	ldw	x,(OFST+5,sp)
 312  003c 72f003        	subw	x,(OFST-3,sp)
 313  003f 5a            	decw	x
 314  0040 1305          	cpw	x,(OFST-1,sp)
 315  0042 22c5          	jrugt	L721
 316                     ; 54     for(i = 0; i < u16Num - 1; i ++)
 318  0044 1e03          	ldw	x,(OFST-3,sp)
 319  0046 5c            	incw	x
 320  0047               L321:
 321  0047 1f03          	ldw	(OFST-3,sp),x
 324  0049 1e0b          	ldw	x,(OFST+5,sp)
 325  004b 5a            	decw	x
 326  004c 1303          	cpw	x,(OFST-3,sp)
 327  004e 22b6          	jrugt	L711
 328                     ; 66 }
 331  0050 5b08          	addw	sp,#8
 332  0052 81            	ret	
 403                     ; 84 void S32BubbleSort(sint32 *ps32Data, uint16 u16Num)
 403                     ; 85 {
 404                     .text:	section	.text,new
 405  0000               _S32BubbleSort:
 407  0000 89            	pushw	x
 408  0001 5208          	subw	sp,#8
 409       00000008      OFST:	set	8
 412                     ; 90     for(i = 0; i < u16Num - 1; i ++)
 414  0003 5f            	clrw	x
 416  0004 2070          	jra	L302
 417  0006               L771:
 418                     ; 92         for(j = 0; j < u16Num -i -1; j ++)
 420  0006 5f            	clrw	x
 422  0007 205e          	jra	L312
 423  0009               L702:
 424                     ; 94             if(ps32Data[j + 1] < ps32Data[j])
 426  0009 1e07          	ldw	x,(OFST-1,sp)
 427  000b 58            	sllw	x
 428  000c 58            	sllw	x
 429  000d 72fb09        	addw	x,(OFST+1,sp)
 430  0010 1c0004        	addw	x,#4
 431  0013 cd0000        	call	c_ltor
 433  0016 1e07          	ldw	x,(OFST-1,sp)
 434  0018 58            	sllw	x
 435  0019 58            	sllw	x
 436  001a 72fb09        	addw	x,(OFST+1,sp)
 437  001d cd0000        	call	c_lcmp
 439  0020 2e42          	jrsge	L712
 440                     ; 96 				s32Tmp = ps32Data[j + 1];
 442  0022 1e07          	ldw	x,(OFST-1,sp)
 443  0024 58            	sllw	x
 444  0025 58            	sllw	x
 445  0026 72fb09        	addw	x,(OFST+1,sp)
 446  0029 e607          	ld	a,(7,x)
 447  002b 6b04          	ld	(OFST-4,sp),a
 448  002d e606          	ld	a,(6,x)
 449  002f 6b03          	ld	(OFST-5,sp),a
 450  0031 e605          	ld	a,(5,x)
 451  0033 6b02          	ld	(OFST-6,sp),a
 452  0035 e604          	ld	a,(4,x)
 453  0037 6b01          	ld	(OFST-7,sp),a
 454                     ; 97 				ps32Data[j + 1] = ps32Data[j];
 456  0039 1607          	ldw	y,(OFST-1,sp)
 457  003b 9058          	sllw	y
 458  003d 9058          	sllw	y
 459  003f 72f909        	addw	y,(OFST+1,sp)
 460  0042 e603          	ld	a,(3,x)
 461  0044 90e707        	ld	(7,y),a
 462  0047 e602          	ld	a,(2,x)
 463  0049 90e706        	ld	(6,y),a
 464  004c e601          	ld	a,(1,x)
 465  004e 90e705        	ld	(5,y),a
 466  0051 f6            	ld	a,(x)
 467  0052 90e704        	ld	(4,y),a
 468                     ; 98 				ps32Data[j] = s32Tmp;
 470  0055 7b04          	ld	a,(OFST-4,sp)
 471  0057 e703          	ld	(3,x),a
 472  0059 7b03          	ld	a,(OFST-5,sp)
 473  005b e702          	ld	(2,x),a
 474  005d 7b02          	ld	a,(OFST-6,sp)
 475  005f e701          	ld	(1,x),a
 476  0061 7b01          	ld	a,(OFST-7,sp)
 477  0063 f7            	ld	(x),a
 478  0064               L712:
 479                     ; 92         for(j = 0; j < u16Num -i -1; j ++)
 481  0064 1e07          	ldw	x,(OFST-1,sp)
 482  0066 5c            	incw	x
 483  0067               L312:
 484  0067 1f07          	ldw	(OFST-1,sp),x
 487  0069 1e0d          	ldw	x,(OFST+5,sp)
 488  006b 72f005        	subw	x,(OFST-3,sp)
 489  006e 5a            	decw	x
 490  006f 1307          	cpw	x,(OFST-1,sp)
 491  0071 2296          	jrugt	L702
 492                     ; 90     for(i = 0; i < u16Num - 1; i ++)
 494  0073 1e05          	ldw	x,(OFST-3,sp)
 495  0075 5c            	incw	x
 496  0076               L302:
 497  0076 1f05          	ldw	(OFST-3,sp),x
 500  0078 1e0d          	ldw	x,(OFST+5,sp)
 501  007a 5a            	decw	x
 502  007b 1305          	cpw	x,(OFST-3,sp)
 503  007d 2287          	jrugt	L771
 504                     ; 102 }
 507  007f 5b0a          	addw	sp,#10
 508  0081 81            	ret	
 579                     ; 120 void fBubbleSort(float *pfData, uint16 u16Num)
 579                     ; 121 {
 580                     .text:	section	.text,new
 581  0000               _fBubbleSort:
 583  0000 89            	pushw	x
 584  0001 5208          	subw	sp,#8
 585       00000008      OFST:	set	8
 588                     ; 126     for(i = 0; i < u16Num - 1; i ++)
 590  0003 5f            	clrw	x
 592  0004 2070          	jra	L362
 593  0006               L752:
 594                     ; 128         for(j = 0; j < u16Num -i -1; j ++)
 596  0006 5f            	clrw	x
 598  0007 205e          	jra	L372
 599  0009               L762:
 600                     ; 130             if(pfData[j + 1] < pfData[j])
 602  0009 1e07          	ldw	x,(OFST-1,sp)
 603  000b 58            	sllw	x
 604  000c 58            	sllw	x
 605  000d 72fb09        	addw	x,(OFST+1,sp)
 606  0010 1c0004        	addw	x,#4
 607  0013 cd0000        	call	c_ltor
 609  0016 1e07          	ldw	x,(OFST-1,sp)
 610  0018 58            	sllw	x
 611  0019 58            	sllw	x
 612  001a 72fb09        	addw	x,(OFST+1,sp)
 613  001d cd0000        	call	c_fcmp
 615  0020 2e42          	jrsge	L772
 616                     ; 132 				fTmp = pfData[j + 1];
 618  0022 1e07          	ldw	x,(OFST-1,sp)
 619  0024 58            	sllw	x
 620  0025 58            	sllw	x
 621  0026 72fb09        	addw	x,(OFST+1,sp)
 622  0029 e607          	ld	a,(7,x)
 623  002b 6b04          	ld	(OFST-4,sp),a
 624  002d e606          	ld	a,(6,x)
 625  002f 6b03          	ld	(OFST-5,sp),a
 626  0031 e605          	ld	a,(5,x)
 627  0033 6b02          	ld	(OFST-6,sp),a
 628  0035 e604          	ld	a,(4,x)
 629  0037 6b01          	ld	(OFST-7,sp),a
 630                     ; 133 				pfData[j + 1] = pfData[j];
 632  0039 1607          	ldw	y,(OFST-1,sp)
 633  003b 9058          	sllw	y
 634  003d 9058          	sllw	y
 635  003f 72f909        	addw	y,(OFST+1,sp)
 636  0042 e603          	ld	a,(3,x)
 637  0044 90e707        	ld	(7,y),a
 638  0047 e602          	ld	a,(2,x)
 639  0049 90e706        	ld	(6,y),a
 640  004c e601          	ld	a,(1,x)
 641  004e 90e705        	ld	(5,y),a
 642  0051 f6            	ld	a,(x)
 643  0052 90e704        	ld	(4,y),a
 644                     ; 134 				pfData[j] = fTmp;
 646  0055 7b04          	ld	a,(OFST-4,sp)
 647  0057 e703          	ld	(3,x),a
 648  0059 7b03          	ld	a,(OFST-5,sp)
 649  005b e702          	ld	(2,x),a
 650  005d 7b02          	ld	a,(OFST-6,sp)
 651  005f e701          	ld	(1,x),a
 652  0061 7b01          	ld	a,(OFST-7,sp)
 653  0063 f7            	ld	(x),a
 654  0064               L772:
 655                     ; 128         for(j = 0; j < u16Num -i -1; j ++)
 657  0064 1e07          	ldw	x,(OFST-1,sp)
 658  0066 5c            	incw	x
 659  0067               L372:
 660  0067 1f07          	ldw	(OFST-1,sp),x
 663  0069 1e0d          	ldw	x,(OFST+5,sp)
 664  006b 72f005        	subw	x,(OFST-3,sp)
 665  006e 5a            	decw	x
 666  006f 1307          	cpw	x,(OFST-1,sp)
 667  0071 2296          	jrugt	L762
 668                     ; 126     for(i = 0; i < u16Num - 1; i ++)
 670  0073 1e05          	ldw	x,(OFST-3,sp)
 671  0075 5c            	incw	x
 672  0076               L362:
 673  0076 1f05          	ldw	(OFST-3,sp),x
 676  0078 1e0d          	ldw	x,(OFST+5,sp)
 677  007a 5a            	decw	x
 678  007b 1305          	cpw	x,(OFST-3,sp)
 679  007d 2287          	jrugt	L752
 680                     ; 138 }
 683  007f 5b0a          	addw	sp,#10
 684  0081 81            	ret	
 746                     ; 157 uint16 U16Average(uint16 arr[], uint16 n)
 746                     ; 158 {
 747                     .text:	section	.text,new
 748  0000               _U16Average:
 750  0000 89            	pushw	x
 751  0001 520a          	subw	sp,#10
 752       0000000a      OFST:	set	10
 755                     ; 162 	u32Tmp = 0;
 757  0003 5f            	clrw	x
 758  0004 1f07          	ldw	(OFST-3,sp),x
 759  0006 1f05          	ldw	(OFST-5,sp),x
 760                     ; 163     for(i = 0; i < n; i ++)
 762  0008 2012          	jra	L733
 763  000a               L333:
 764                     ; 165 		u32Tmp += (uint32)arr[i];
 766  000a 58            	sllw	x
 767  000b 72fb0b        	addw	x,(OFST+1,sp)
 768  000e fe            	ldw	x,(x)
 769  000f cd0000        	call	c_uitolx
 771  0012 96            	ldw	x,sp
 772  0013 1c0005        	addw	x,#OFST-5
 773  0016 cd0000        	call	c_lgadd
 775                     ; 163     for(i = 0; i < n; i ++)
 777  0019 1e09          	ldw	x,(OFST-1,sp)
 778  001b 5c            	incw	x
 779  001c               L733:
 781  001c 1f09          	ldw	(OFST-1,sp),x
 784  001e 130f          	cpw	x,(OFST+5,sp)
 785  0020 25e8          	jrult	L333
 786                     ; 168 	return (uint16)(u32Tmp / n);
 788  0022 1e0f          	ldw	x,(OFST+5,sp)
 789  0024 cd0000        	call	c_uitolx
 791  0027 96            	ldw	x,sp
 792  0028 5c            	incw	x
 793  0029 cd0000        	call	c_rtol
 795  002c 96            	ldw	x,sp
 796  002d 1c0005        	addw	x,#OFST-5
 797  0030 cd0000        	call	c_ltor
 799  0033 96            	ldw	x,sp
 800  0034 5c            	incw	x
 801  0035 cd0000        	call	c_ludv
 803  0038 be02          	ldw	x,c_lreg+2
 806  003a 5b0c          	addw	sp,#12
 807  003c 81            	ret	
 869                     ; 186 sint32 S32Average(sint32 arr[], uint16 n)
 869                     ; 187 {
 870                     .text:	section	.text,new
 871  0000               _S32Average:
 873  0000 89            	pushw	x
 874  0001 520a          	subw	sp,#10
 875       0000000a      OFST:	set	10
 878                     ; 191 	s32Tmp = 0;
 880  0003 5f            	clrw	x
 881  0004 1f07          	ldw	(OFST-3,sp),x
 882  0006 1f05          	ldw	(OFST-5,sp),x
 883                     ; 192     for(i = 0; i < n; i ++)
 885  0008 2012          	jra	L104
 886  000a               L573:
 887                     ; 194 		s32Tmp += arr[i];
 889  000a 58            	sllw	x
 890  000b 58            	sllw	x
 891  000c 72fb0b        	addw	x,(OFST+1,sp)
 892  000f cd0000        	call	c_ltor
 894  0012 96            	ldw	x,sp
 895  0013 1c0005        	addw	x,#OFST-5
 896  0016 cd0000        	call	c_lgadd
 898                     ; 192     for(i = 0; i < n; i ++)
 900  0019 1e09          	ldw	x,(OFST-1,sp)
 901  001b 5c            	incw	x
 902  001c               L104:
 904  001c 1f09          	ldw	(OFST-1,sp),x
 907  001e 130f          	cpw	x,(OFST+5,sp)
 908  0020 25e8          	jrult	L573
 909                     ; 197 	return (s32Tmp / n);
 911  0022 1e0f          	ldw	x,(OFST+5,sp)
 912  0024 cd0000        	call	c_uitolx
 914  0027 96            	ldw	x,sp
 915  0028 5c            	incw	x
 916  0029 cd0000        	call	c_rtol
 918  002c 96            	ldw	x,sp
 919  002d 1c0005        	addw	x,#OFST-5
 920  0030 cd0000        	call	c_ltor
 922  0033 96            	ldw	x,sp
 923  0034 5c            	incw	x
 924  0035 cd0000        	call	c_ldiv
 928  0038 5b0c          	addw	sp,#12
 929  003a 81            	ret	
 991                     ; 217 float fAverage(float arr[], uint16 n)
 991                     ; 218 {
 992                     .text:	section	.text,new
 993  0000               _fAverage:
 995  0000 89            	pushw	x
 996  0001 520a          	subw	sp,#10
 997       0000000a      OFST:	set	10
1000                     ; 222 	fTmp = 0;
1002  0003 5f            	clrw	x
1003  0004 1f07          	ldw	(OFST-3,sp),x
1004  0006 1f05          	ldw	(OFST-5,sp),x
1005                     ; 223     for(i = 0; i < n; i ++)
1007  0008 2012          	jra	L344
1008  000a               L734:
1009                     ; 225 		fTmp += arr[i];
1011  000a 58            	sllw	x
1012  000b 58            	sllw	x
1013  000c 72fb0b        	addw	x,(OFST+1,sp)
1014  000f cd0000        	call	c_ltor
1016  0012 96            	ldw	x,sp
1017  0013 1c0005        	addw	x,#OFST-5
1018  0016 cd0000        	call	c_fgadd
1020                     ; 223     for(i = 0; i < n; i ++)
1022  0019 1e09          	ldw	x,(OFST-1,sp)
1023  001b 5c            	incw	x
1024  001c               L344:
1026  001c 1f09          	ldw	(OFST-1,sp),x
1029  001e 130f          	cpw	x,(OFST+5,sp)
1030  0020 25e8          	jrult	L734
1031                     ; 228 	return (fTmp / n);
1033  0022 1e0f          	ldw	x,(OFST+5,sp)
1034  0024 cd0000        	call	c_uitof
1036  0027 96            	ldw	x,sp
1037  0028 5c            	incw	x
1038  0029 cd0000        	call	c_rtol
1040  002c 96            	ldw	x,sp
1041  002d 1c0005        	addw	x,#OFST-5
1042  0030 cd0000        	call	c_ltor
1044  0033 96            	ldw	x,sp
1045  0034 5c            	incw	x
1046  0035 cd0000        	call	c_fdiv
1050  0038 5b0c          	addw	sp,#12
1051  003a 81            	ret	
1106                     ; 233 uint16 U16Filter(uint16 *pu16Data, uint8 u8Num)
1106                     ; 234 {
1107                     .text:	section	.text,new
1108  0000               _U16Filter:
1110  0000 89            	pushw	x
1111  0001 89            	pushw	x
1112       00000002      OFST:	set	2
1115                     ; 237 	U16BubbleSort(pu16Data, u8Num);
1117  0002 7b07          	ld	a,(OFST+5,sp)
1118  0004 5f            	clrw	x
1119  0005 97            	ld	xl,a
1120  0006 89            	pushw	x
1121  0007 1e05          	ldw	x,(OFST+3,sp)
1122  0009 cd0000        	call	_U16BubbleSort
1124  000c 85            	popw	x
1125                     ; 238 	u16Data = U16Average(pu16Data, (uint16)u8Num);
1127  000d 7b07          	ld	a,(OFST+5,sp)
1128  000f 5f            	clrw	x
1129  0010 97            	ld	xl,a
1130  0011 89            	pushw	x
1131  0012 1e05          	ldw	x,(OFST+3,sp)
1132  0014 cd0000        	call	_U16Average
1134  0017 5b06          	addw	sp,#6
1135                     ; 240 	return u16Data;
1139  0019 81            	ret	
1194                     ; 244 float FloatFilter(float *pf16Data, uint8 u8Num)
1194                     ; 245 {
1195                     .text:	section	.text,new
1196  0000               _FloatFilter:
1198  0000 89            	pushw	x
1199  0001 5204          	subw	sp,#4
1200       00000004      OFST:	set	4
1203                     ; 248 	fBubbleSort(pf16Data, u8Num);
1205  0003 7b09          	ld	a,(OFST+5,sp)
1206  0005 5f            	clrw	x
1207  0006 97            	ld	xl,a
1208  0007 89            	pushw	x
1209  0008 1e07          	ldw	x,(OFST+3,sp)
1210  000a cd0000        	call	_fBubbleSort
1212  000d 85            	popw	x
1213                     ; 249 	fData = fAverage(pf16Data, (uint16)u8Num);
1215  000e 7b09          	ld	a,(OFST+5,sp)
1216  0010 5f            	clrw	x
1217  0011 97            	ld	xl,a
1218  0012 89            	pushw	x
1219  0013 1e07          	ldw	x,(OFST+3,sp)
1220  0015 cd0000        	call	_fAverage
1222  0018 85            	popw	x
1223  0019 96            	ldw	x,sp
1224  001a 5c            	incw	x
1225  001b cd0000        	call	c_rtol
1227                     ; 251 	return fData;
1229  001e 96            	ldw	x,sp
1230  001f 5c            	incw	x
1231  0020 cd0000        	call	c_ltor
1235  0023 5b06          	addw	sp,#6
1236  0025 81            	ret	
1271                     ; 255 uint16 PubGetU16(unsigned char *pu8In)
1271                     ; 256 {
1272                     .text:	section	.text,new
1273  0000               _PubGetU16:
1277                     ; 258 	return *((uint16 *)pu8In);
1279  0000 fe            	ldw	x,(x)
1282  0001 81            	ret	
1326                     ; 261 void PubPutU16(uint8 *pu8Data, uint16 u16Data)
1326                     ; 262 {
1327                     .text:	section	.text,new
1328  0000               _PubPutU16:
1330  0000 89            	pushw	x
1331       00000000      OFST:	set	0
1334                     ; 264 	pu8Data[0] = (u16Data >> 8) & 0x00FF ;
1336  0001 7b05          	ld	a,(OFST+5,sp)
1337  0003 1e01          	ldw	x,(OFST+1,sp)
1338  0005 f7            	ld	(x),a
1339                     ; 265 	pu8Data[1] = u16Data & 0x00FF ;
1341  0006 7b06          	ld	a,(OFST+6,sp)
1342  0008 e701          	ld	(1,x),a
1343                     ; 266 }
1346  000a 85            	popw	x
1347  000b 81            	ret	
1382                     ; 269 sint16 PubGetS16(unsigned char *pu8In)
1382                     ; 270 {
1383                     .text:	section	.text,new
1384  0000               _PubGetS16:
1388                     ; 272 	return *((sint16 *)pu8In);
1390  0000 fe            	ldw	x,(x)
1393  0001 81            	ret	
1437                     ; 275 void PubPutS16(uint8 *pu8Data, sint16 s16Data)
1437                     ; 276 {
1438                     .text:	section	.text,new
1439  0000               _PubPutS16:
1441  0000 89            	pushw	x
1442       00000000      OFST:	set	0
1445                     ; 278 	pu8Data[0] = (s16Data >> 8) & 0x00FF ;
1447  0001 7b05          	ld	a,(OFST+5,sp)
1448  0003 1e01          	ldw	x,(OFST+1,sp)
1449  0005 f7            	ld	(x),a
1450                     ; 279 	pu8Data[1] = s16Data & 0x00FF ;
1452  0006 7b06          	ld	a,(OFST+6,sp)
1453  0008 e701          	ld	(1,x),a
1454                     ; 280 }
1457  000a 85            	popw	x
1458  000b 81            	ret	
1493                     ; 296 uint32 PubGetU32(unsigned char *pu8In)
1493                     ; 297 {
1494                     .text:	section	.text,new
1495  0000               _PubGetU32:
1497  0000 89            	pushw	x
1498  0001 520c          	subw	sp,#12
1499       0000000c      OFST:	set	12
1502                     ; 301 	return ((((uint32)pu8In[0]) << 24) | (((uint32)pu8In[1]) << 16) | (((uint32)pu8In[2]) << 8) | ((uint32)pu8In[3]));
1504  0003 e603          	ld	a,(3,x)
1505  0005 ad4b          	call	LC001
1506  0007 96            	ldw	x,sp
1507  0008 1c0009        	addw	x,#OFST-3
1508  000b cd0000        	call	c_rtol
1510  000e 1e0d          	ldw	x,(OFST+1,sp)
1511  0010 e602          	ld	a,(2,x)
1512  0012 5f            	clrw	x
1513  0013 97            	ld	xl,a
1514  0014 90ae0100      	ldw	y,#256
1515  0018 cd0000        	call	c_umul
1517  001b 96            	ldw	x,sp
1518  001c 1c0005        	addw	x,#OFST-7
1519  001f cd0000        	call	c_rtol
1521  0022 1e0d          	ldw	x,(OFST+1,sp)
1522  0024 e601          	ld	a,(1,x)
1523  0026 ad2a          	call	LC001
1524  0028 a610          	ld	a,#16
1525  002a cd0000        	call	c_llsh
1527  002d 96            	ldw	x,sp
1528  002e 5c            	incw	x
1529  002f cd0000        	call	c_rtol
1531  0032 1e0d          	ldw	x,(OFST+1,sp)
1532  0034 f6            	ld	a,(x)
1533  0035 ad1b          	call	LC001
1534  0037 a618          	ld	a,#24
1535  0039 cd0000        	call	c_llsh
1537  003c 96            	ldw	x,sp
1538  003d 5c            	incw	x
1539  003e cd0000        	call	c_lor
1541  0041 96            	ldw	x,sp
1542  0042 1c0005        	addw	x,#OFST-7
1543  0045 cd0000        	call	c_lor
1545  0048 96            	ldw	x,sp
1546  0049 1c0009        	addw	x,#OFST-3
1547  004c cd0000        	call	c_lor
1551  004f 5b0e          	addw	sp,#14
1552  0051 81            	ret	
1554  0052               LC001:
1555  0052 b703          	ld	c_lreg+3,a
1556  0054 3f02          	clr	c_lreg+2
1557  0056 3f01          	clr	c_lreg+1
1558  0058 3f00          	clr	c_lreg
1559  005a 81            	ret	
1602                     ; 318 void PubPutU32(uint8 *pu8In, uint32 u32Data)
1602                     ; 319 {
1603                     .text:	section	.text,new
1604  0000               _PubPutU32:
1606  0000 89            	pushw	x
1607       00000000      OFST:	set	0
1610                     ; 326 	pu8In[0] = (uint8)((u32Data >> 24) & 0x000000ff);
1612  0001 7b05          	ld	a,(OFST+5,sp)
1613  0003 1e01          	ldw	x,(OFST+1,sp)
1614  0005 f7            	ld	(x),a
1615                     ; 327 	pu8In[1] = (uint8)((u32Data >> 16) & 0x000000ff);
1617  0006 7b06          	ld	a,(OFST+6,sp)
1618  0008 e701          	ld	(1,x),a
1619                     ; 328 	pu8In[2] = (uint8)((u32Data >> 8) & 0x000000ff);
1621  000a 7b07          	ld	a,(OFST+7,sp)
1622  000c e702          	ld	(2,x),a
1623                     ; 329 	pu8In[3] = (uint8)(u32Data & 0x000000ff);
1625  000e 7b08          	ld	a,(OFST+8,sp)
1626  0010 e703          	ld	(3,x),a
1627                     ; 331 }
1630  0012 85            	popw	x
1631  0013 81            	ret	
1700                     ; 348 float PubGetFloat(unsigned char *pu8In)
1700                     ; 349 {
1701                     .text:	section	.text,new
1702  0000               _PubGetFloat:
1704  0000 5204          	subw	sp,#4
1705       00000004      OFST:	set	4
1708                     ; 362 	uData.u8Tmp[0] = pu8In[0];
1710  0002 f6            	ld	a,(x)
1711  0003 6b01          	ld	(OFST-3,sp),a
1712                     ; 363 	uData.u8Tmp[1] = pu8In[1];
1714  0005 e601          	ld	a,(1,x)
1715  0007 6b02          	ld	(OFST-2,sp),a
1716                     ; 364 	uData.u8Tmp[2] = pu8In[2];
1718  0009 e602          	ld	a,(2,x)
1719  000b 6b03          	ld	(OFST-1,sp),a
1720                     ; 365 	uData.u8Tmp[3] = pu8In[3];
1722  000d e603          	ld	a,(3,x)
1723  000f 6b04          	ld	(OFST+0,sp),a
1724                     ; 368 	return uData.fTmp;
1726  0011 96            	ldw	x,sp
1727  0012 5c            	incw	x
1728  0013 cd0000        	call	c_ltor
1732  0016 5b04          	addw	sp,#4
1733  0018 81            	ret	
1811                     ; 372 void PubPutFloat(uint8 *pu8Data, float fData)
1811                     ; 373 {
1812                     .text:	section	.text,new
1813  0000               _PubPutFloat:
1815  0000 89            	pushw	x
1816  0001 5204          	subw	sp,#4
1817       00000004      OFST:	set	4
1820                     ; 380 	uData.fData = fData;
1822  0003 1e0b          	ldw	x,(OFST+7,sp)
1823  0005 1f03          	ldw	(OFST-1,sp),x
1824  0007 1e09          	ldw	x,(OFST+5,sp)
1825  0009 1f01          	ldw	(OFST-3,sp),x
1826                     ; 382 	pu8Data[0] = uData.u8Data[0];
1828  000b 7b01          	ld	a,(OFST-3,sp)
1829  000d 1e05          	ldw	x,(OFST+1,sp)
1830  000f f7            	ld	(x),a
1831                     ; 383 	pu8Data[1] = uData.u8Data[1];
1833  0010 7b02          	ld	a,(OFST-2,sp)
1834  0012 e701          	ld	(1,x),a
1835                     ; 384 	pu8Data[2] = uData.u8Data[2];
1837  0014 7b03          	ld	a,(OFST-1,sp)
1838  0016 e702          	ld	(2,x),a
1839                     ; 385 	pu8Data[3] = uData.u8Data[3];
1841  0018 7b04          	ld	a,(OFST+0,sp)
1842  001a e703          	ld	(3,x),a
1843                     ; 386 }
1846  001c 5b06          	addw	sp,#6
1847  001e 81            	ret	
1889                     ; 390 static void AdcInit(unsigned char u8AdcChan)
1889                     ; 391 {
1890                     .text:	section	.text,new
1891  0000               L757_AdcInit:
1893  0000 88            	push	a
1894       00000000      OFST:	set	0
1897                     ; 393 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
1899  0001 ae0001        	ldw	x,#1
1900  0004 a610          	ld	a,#16
1901  0006 95            	ld	xh,a
1902  0007 cd0000        	call	_CLK_PeripheralClockConfig
1904                     ; 396 	ADC_Init(ADC1, ADC_ConversionMode_Single, ADC_Resolution_12Bit, ADC_Prescaler_2);
1906  000a 4b80          	push	#128
1907  000c 4b00          	push	#0
1908  000e 4b00          	push	#0
1909  0010 ae5340        	ldw	x,#21312
1910  0013 cd0000        	call	_ADC_Init
1912  0016 5b03          	addw	sp,#3
1913                     ; 397 	ADC_SamplingTimeConfig(ADC1, ADC_Group_SlowChannels, ADC_SamplingTime_384Cycles);
1915  0018 4b07          	push	#7
1916  001a 4b00          	push	#0
1917  001c ae5340        	ldw	x,#21312
1918  001f cd0000        	call	_ADC_SamplingTimeConfig
1920  0022 85            	popw	x
1921                     ; 400 	ADC_Cmd(ADC1, ENABLE);
1923  0023 4b01          	push	#1
1924  0025 ae5340        	ldw	x,#21312
1925  0028 cd0000        	call	_ADC_Cmd
1927  002b 84            	pop	a
1928                     ; 402 	if(SETX_ADCIN1 == u8AdcChan)
1930  002c 7b01          	ld	a,(OFST+1,sp)
1931  002e 2607          	jrne	L777
1932                     ; 404 		ADC_ChannelCmd(ADC1, ADC_Channel_18, ENABLE);
1934  0030 4b01          	push	#1
1935  0032 ae0104        	ldw	x,#260
1938  0035 2045          	jp	LC002
1939  0037               L777:
1940                     ; 406 	else if(SETX_ADCIN2 == u8AdcChan)
1942  0037 a101          	cp	a,#1
1943  0039 2607          	jrne	L3001
1944                     ; 408 		ADC_ChannelCmd(ADC1, ADC_Channel_17, ENABLE);
1946  003b 4b01          	push	#1
1947  003d ae0102        	ldw	x,#258
1950  0040 203a          	jp	LC002
1951  0042               L3001:
1952                     ; 410 	else if(SETX_ADCIN3 == u8AdcChan)
1954  0042 a102          	cp	a,#2
1955  0044 2607          	jrne	L7001
1956                     ; 412 		ADC_ChannelCmd(ADC1, ADC_Channel_16, ENABLE);
1958  0046 4b01          	push	#1
1959  0048 ae0101        	ldw	x,#257
1962  004b 202f          	jp	LC002
1963  004d               L7001:
1964                     ; 414 	else if(SETX_ADCIN4 == u8AdcChan)
1966  004d a103          	cp	a,#3
1967  004f 2607          	jrne	L3101
1968                     ; 416 		ADC_ChannelCmd(ADC1, ADC_Channel_14, ENABLE);
1970  0051 4b01          	push	#1
1971  0053 ae0240        	ldw	x,#576
1974  0056 2024          	jp	LC002
1975  0058               L3101:
1976                     ; 418 	else if(SETX_ADCIN_GND == u8AdcChan)
1978  0058 a104          	cp	a,#4
1979  005a 2607          	jrne	L7101
1980                     ; 420 		ADC_ChannelCmd(ADC1, ADC_Channel_15, ENABLE);
1982  005c 4b01          	push	#1
1983  005e ae0280        	ldw	x,#640
1986  0061 2019          	jp	LC002
1987  0063               L7101:
1988                     ; 422 	else if(SETX_ADCIN_REF1V2 == u8AdcChan)
1990  0063 a105          	cp	a,#5
1991  0065 2607          	jrne	L3201
1992                     ; 424 		ADC_ChannelCmd(ADC1, ADC_Channel_13, ENABLE);
1994  0067 4b01          	push	#1
1995  0069 ae0220        	ldw	x,#544
1998  006c 200e          	jp	LC002
1999  006e               L3201:
2000                     ; 426 	else if(SETX_ADCIN_VREFINT == u8AdcChan)
2002  006e a106          	cp	a,#6
2003  0070 2613          	jrne	L1001
2004                     ; 428 		ADC_VrefintCmd(ENABLE);
2006  0072 a601          	ld	a,#1
2007  0074 cd0000        	call	_ADC_VrefintCmd
2009                     ; 429 		ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, ENABLE);
2011  0077 4b01          	push	#1
2012  0079 ae0010        	ldw	x,#16
2014  007c               LC002:
2015  007c 89            	pushw	x
2016  007d ae5340        	ldw	x,#21312
2017  0080 cd0000        	call	_ADC_ChannelCmd
2018  0083 5b03          	addw	sp,#3
2019  0085               L1001:
2020                     ; 432 	UsDelay(0x1000);
2022  0085 ae1000        	ldw	x,#4096
2023  0088 cd0000        	call	_UsDelay
2025                     ; 434 	ADC_SoftwareStartConv(ADC1);
2027  008b ae5340        	ldw	x,#21312
2028  008e cd0000        	call	_ADC_SoftwareStartConv
2030                     ; 435 }
2033  0091 84            	pop	a
2034  0092 81            	ret	
2084                     ; 438 unsigned int AdcGeneralAcq(unsigned char u8AdcChan)
2084                     ; 439 {
2085                     .text:	section	.text,new
2086  0000               _AdcGeneralAcq:
2088  0000 89            	pushw	x
2089       00000002      OFST:	set	2
2092                     ; 442 	AdcInit(u8AdcChan);
2094  0001 cd0000        	call	L757_AdcInit
2097  0004               L5501:
2098                     ; 444     while (ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET);
2100  0004 4b01          	push	#1
2101  0006 ae5340        	ldw	x,#21312
2102  0009 cd0000        	call	_ADC_GetFlagStatus
2104  000c 5b01          	addw	sp,#1
2105  000e 4d            	tnz	a
2106  000f 27f3          	jreq	L5501
2107                     ; 445     u16AdcData = ADC_GetConversionValue(ADC1);
2109  0011 ae5340        	ldw	x,#21312
2110  0014 cd0000        	call	_ADC_GetConversionValue
2112  0017 1f01          	ldw	(OFST-1,sp),x
2113                     ; 446     ADC_ClearFlag(ADC1, ADC_FLAG_EOC);
2115  0019 4b01          	push	#1
2116  001b ae5340        	ldw	x,#21312
2117  001e cd0000        	call	_ADC_ClearFlag
2119  0021 84            	pop	a
2120                     ; 447     ADC_ClearITPendingBit(ADC1, ADC_FLAG_EOC);
2122  0022 4b01          	push	#1
2123  0024 ae5340        	ldw	x,#21312
2124  0027 cd0000        	call	_ADC_ClearITPendingBit
2126  002a 84            	pop	a
2127                     ; 449     ADC_Cmd(ADC1, DISABLE);
2129  002b 4b00          	push	#0
2130  002d ae5340        	ldw	x,#21312
2131  0030 cd0000        	call	_ADC_Cmd
2133  0033 ae5340        	ldw	x,#21312
2134  0036 84            	pop	a
2135                     ; 450     ADC_DeInit(ADC1);
2137  0037 cd0000        	call	_ADC_DeInit
2139                     ; 452     return u16AdcData;
2141  003a 1e01          	ldw	x,(OFST-1,sp)
2144  003c 5b02          	addw	sp,#2
2145  003e 81            	ret	
2158                     	xdef	_fAverage
2159                     	xdef	_S32Average
2160                     	xdef	_U16Average
2161                     	xdef	_fBubbleSort
2162                     	xdef	_S32BubbleSort
2163                     	xdef	_U16BubbleSort
2164                     	xdef	_AdcGeneralAcq
2165                     	xdef	_PubPutFloat
2166                     	xdef	_PubGetFloat
2167                     	xdef	_PubPutU32
2168                     	xdef	_PubGetU32
2169                     	xdef	_PubPutS16
2170                     	xdef	_PubGetS16
2171                     	xdef	_PubPutU16
2172                     	xdef	_PubGetU16
2173                     	xdef	_FloatFilter
2174                     	xdef	_U16Filter
2175                     	xdef	_UsDelay
2176                     	xdef	_MsDelay
2177                     	xref	_CLK_PeripheralClockConfig
2178                     	xref	_ADC_ClearITPendingBit
2179                     	xref	_ADC_ClearFlag
2180                     	xref	_ADC_GetFlagStatus
2181                     	xref	_ADC_GetConversionValue
2182                     	xref	_ADC_SamplingTimeConfig
2183                     	xref	_ADC_ChannelCmd
2184                     	xref	_ADC_VrefintCmd
2185                     	xref	_ADC_SoftwareStartConv
2186                     	xref	_ADC_Cmd
2187                     	xref	_ADC_Init
2188                     	xref	_ADC_DeInit
2189                     	xref.b	c_lreg
2208                     	xref	c_umul
2209                     	xref	c_lor
2210                     	xref	c_llsh
2211                     	xref	c_fdiv
2212                     	xref	c_uitof
2213                     	xref	c_fgadd
2214                     	xref	c_ldiv
2215                     	xref	c_ludv
2216                     	xref	c_rtol
2217                     	xref	c_lgadd
2218                     	xref	c_uitolx
2219                     	xref	c_fcmp
2220                     	xref	c_lcmp
2221                     	xref	c_ltor
2222                     	end
