   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  56                     ; 20 void main(void)
  56                     ; 21 {
  58                     .text:	section	.text,new
  59  0000               _main:
  61  0000 89            	pushw	x
  62       00000002      OFST:	set	2
  65                     ; 24 	McuInit();
  67  0001 cd0000        	call	_McuInit
  69                     ; 26 	TimeoutInit();
  71  0004 cd0000        	call	_TimeoutInit
  73                     ; 27 	UpUartInit();
  75  0007 cd0000        	call	_UpUartInit
  77                     ; 28 	DebugInit();
  79  000a cd0000        	call	_DebugInit
  81                     ; 30 	TemperTaskInit();
  83  000d cd0000        	call	_TemperTaskInit
  85                     ; 31 	InrsMesureInit();
  87  0010 cd0000        	call	_InrsMesureInit
  89                     ; 33 	TimeoutMsDelay(3000);
  91  0013 ae0bb8        	ldw	x,#3000
  92  0016 89            	pushw	x
  93  0017 5f            	clrw	x
  94  0018 89            	pushw	x
  95  0019 cd0000        	call	_TimeoutMsDelay
  97  001c 5b04          	addw	sp,#4
  98                     ; 35 	InrsMesurejob();
 100  001e cd0000        	call	_InrsMesurejob
 102  0021               L72:
 103                     ; 52 		u16Data = VREFINT_Factory_CONV;
 105  0021 c64910        	ld	a,18704
 106  0024 5f            	clrw	x
 107  0025 97            	ld	xl,a
 108  0026 1f01          	ldw	(OFST-1,sp),x
 109                     ; 53 		sprintf(DebugBuf, "vvx volt: %u.%uV\r\n", u16Data / 1000, u16Data % 1000);
 111  0028 90ae03e8      	ldw	y,#1000
 112  002c 65            	divw	x,y
 113  002d 9089          	pushw	y
 114  002f 1e03          	ldw	x,(OFST+1,sp)
 115  0031 90ae03e8      	ldw	y,#1000
 116  0035 65            	divw	x,y
 117  0036 89            	pushw	x
 118  0037 ae0050        	ldw	x,#L33
 119  003a 89            	pushw	x
 120  003b ae0000        	ldw	x,#_DebugBuf
 121  003e cd0000        	call	_sprintf
 123  0041 5b06          	addw	sp,#6
 124                     ; 54 		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);
 126  0043 ae0000        	ldw	x,#_DebugBuf
 127  0046 89            	pushw	x
 128  0047 a603          	ld	a,#3
 129  0049 cd0000        	call	_DebugStrOutput
 131  004c a605          	ld	a,#5
 132  004e 85            	popw	x
 133                     ; 56 		u16Data = AdcGeneralAcq(SETX_ADCIN_REF1V2);
 135  004f cd0000        	call	_AdcGeneralAcq
 137  0052 1f01          	ldw	(OFST-1,sp),x
 138                     ; 57 		sprintf(DebugBuf, "vv0 volt: %u.%uV\r\n", u16Data / 1000, u16Data % 1000);
 140  0054 90ae03e8      	ldw	y,#1000
 141  0058 65            	divw	x,y
 142  0059 9089          	pushw	y
 143  005b 1e03          	ldw	x,(OFST+1,sp)
 144  005d 90ae03e8      	ldw	y,#1000
 145  0061 65            	divw	x,y
 146  0062 89            	pushw	x
 147  0063 ae003d        	ldw	x,#L53
 148  0066 89            	pushw	x
 149  0067 ae0000        	ldw	x,#_DebugBuf
 150  006a cd0000        	call	_sprintf
 152  006d 5b06          	addw	sp,#6
 153                     ; 58 		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);
 155  006f ae0000        	ldw	x,#_DebugBuf
 156  0072 89            	pushw	x
 157  0073 a603          	ld	a,#3
 158  0075 cd0000        	call	_DebugStrOutput
 160  0078 a601          	ld	a,#1
 161  007a 85            	popw	x
 162                     ; 63 		u16Data = AdcGeneralAcq(SETX_ADCIN2);
 164  007b cd0000        	call	_AdcGeneralAcq
 166  007e 1f01          	ldw	(OFST-1,sp),x
 167                     ; 64 		sprintf(DebugBuf, "vv1 volt: %u.%uV\r\n", u16Data / 1000, u16Data % 1000);
 169  0080 90ae03e8      	ldw	y,#1000
 170  0084 65            	divw	x,y
 171  0085 9089          	pushw	y
 172  0087 1e03          	ldw	x,(OFST+1,sp)
 173  0089 90ae03e8      	ldw	y,#1000
 174  008d 65            	divw	x,y
 175  008e 89            	pushw	x
 176  008f ae002a        	ldw	x,#L73
 177  0092 89            	pushw	x
 178  0093 ae0000        	ldw	x,#_DebugBuf
 179  0096 cd0000        	call	_sprintf
 181  0099 5b06          	addw	sp,#6
 182                     ; 65 		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);
 184  009b ae0000        	ldw	x,#_DebugBuf
 185  009e 89            	pushw	x
 186  009f a603          	ld	a,#3
 187  00a1 cd0000        	call	_DebugStrOutput
 189  00a4 a602          	ld	a,#2
 190  00a6 85            	popw	x
 191                     ; 70 		u16Data = AdcGeneralAcq(SETX_ADCIN3);
 193  00a7 cd0000        	call	_AdcGeneralAcq
 195  00aa 1f01          	ldw	(OFST-1,sp),x
 196                     ; 71 		sprintf(DebugBuf, "vv2 volt: %u.%uV\r\n", u16Data / 1000, u16Data % 1000);
 198  00ac 90ae03e8      	ldw	y,#1000
 199  00b0 65            	divw	x,y
 200  00b1 9089          	pushw	y
 201  00b3 1e03          	ldw	x,(OFST+1,sp)
 202  00b5 90ae03e8      	ldw	y,#1000
 203  00b9 65            	divw	x,y
 204  00ba 89            	pushw	x
 205  00bb ae0017        	ldw	x,#L14
 206  00be 89            	pushw	x
 207  00bf ae0000        	ldw	x,#_DebugBuf
 208  00c2 cd0000        	call	_sprintf
 210  00c5 5b06          	addw	sp,#6
 211                     ; 72 		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);
 213  00c7 ae0000        	ldw	x,#_DebugBuf
 214  00ca 89            	pushw	x
 215  00cb a603          	ld	a,#3
 216  00cd cd0000        	call	_DebugStrOutput
 218  00d0 a606          	ld	a,#6
 219  00d2 85            	popw	x
 220                     ; 76 		u16Data = AdcGeneralAcq(SETX_ADCIN_VREFINT);
 222  00d3 cd0000        	call	_AdcGeneralAcq
 224  00d6 1f01          	ldw	(OFST-1,sp),x
 225                     ; 77 		sprintf(DebugBuf, "vv3 volt: %u.%uV\r\n\r\n\r\n", u16Data / 1000, u16Data % 1000);
 227  00d8 90ae03e8      	ldw	y,#1000
 228  00dc 65            	divw	x,y
 229  00dd 9089          	pushw	y
 230  00df 1e03          	ldw	x,(OFST+1,sp)
 231  00e1 90ae03e8      	ldw	y,#1000
 232  00e5 65            	divw	x,y
 233  00e6 89            	pushw	x
 234  00e7 ae0000        	ldw	x,#L34
 235  00ea 89            	pushw	x
 236  00eb ae0000        	ldw	x,#_DebugBuf
 237  00ee cd0000        	call	_sprintf
 239  00f1 5b06          	addw	sp,#6
 240                     ; 78 		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);
 242  00f3 ae0000        	ldw	x,#_DebugBuf
 243  00f6 89            	pushw	x
 244  00f7 a603          	ld	a,#3
 245  00f9 cd0000        	call	_DebugStrOutput
 247  00fc 85            	popw	x
 249  00fd cc0021        	jra	L72
 262                     	xdef	_main
 263                     	xref	_UpUartInit
 264                     	xref	_InrsMesureInit
 265                     	xref	_InrsMesurejob
 266                     	xref	_TemperTaskInit
 267                     	xref	_DebugStrOutput
 268                     	xref	_DebugInit
 269                     	xref.b	_DebugBuf
 270                     	xref	_AdcGeneralAcq
 271                     	xref	_McuInit
 272                     	xref	_TimeoutMsDelay
 273                     	xref	_TimeoutInit
 274                     	xref	_sprintf
 275                     .const:	section	.text
 276  0000               L34:
 277  0000 76763320766f  	dc.b	"vv3 volt: %u.%uV",13
 278  0011 0a0d0a0d0a00  	dc.b	10,13,10,13,10,0
 279  0017               L14:
 280  0017 76763220766f  	dc.b	"vv2 volt: %u.%uV",13
 281  0028 0a00          	dc.b	10,0
 282  002a               L73:
 283  002a 76763120766f  	dc.b	"vv1 volt: %u.%uV",13
 284  003b 0a00          	dc.b	10,0
 285  003d               L53:
 286  003d 76763020766f  	dc.b	"vv0 volt: %u.%uV",13
 287  004e 0a00          	dc.b	10,0
 288  0050               L33:
 289  0050 76767820766f  	dc.b	"vvx volt: %u.%uV",13
 290  0061 0a00          	dc.b	10,0
 310                     	end
