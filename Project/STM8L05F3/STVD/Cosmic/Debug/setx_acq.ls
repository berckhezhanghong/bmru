   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  36                     ; 14 sint8 AcqInit(void)
  36                     ; 15 {
  38                     .text:	section	.text,new
  39  0000               _AcqInit:
  43                     ; 16 	memset(&tVolSampleCtrl, 0, sizeof(tVolSampleCtrlDef));
  45  0000 ae0034        	ldw	x,#52
  46  0003               L6:
  47  0003 6fff          	clr	(_tVolSampleCtrl-1,x)
  48  0005 5a            	decw	x
  49  0006 26fb          	jrne	L6
  50                     ; 17 	InitMsTimeout(&tVolSampleCtrl.tVolSampleTimeout, VOLT_SAMPLE_INTERVAL_INIT);
  52  0008 ae0bb8        	ldw	x,#3000
  53  000b 89            	pushw	x
  54  000c 5f            	clrw	x
  55  000d 89            	pushw	x
  56  000e ae0001        	ldw	x,#_tVolSampleCtrl+1
  57  0011 cd0000        	call	_InitMsTimeout
  59  0014 5b04          	addw	sp,#4
  60                     ; 18 }
  63  0016 81            	ret	
  93                     ; 22 sint8 AcqDoJob(void)
  93                     ; 23 {
  94                     .text:	section	.text,new
  95  0000               _AcqDoJob:
  99                     ; 26 	if(IsMsTimeout(&tVolSampleCtrl.tVolSampleTimeout) || 
  99                     ; 27 	   tVolSampleCtrl.u8SampleFlag)
 101  0000 ae0001        	ldw	x,#_tVolSampleCtrl+1
 102  0003 cd0000        	call	_IsMsTimeout
 104  0006 cd0000        	call	c_lrzmp
 106  0009 2604          	jrne	L34
 108  000b b60e          	ld	a,_tVolSampleCtrl+14
 109  000d 2714          	jreq	L14
 110  000f               L34:
 111                     ; 29 		InitMsTimeout(&tVolSampleCtrl.tVolSampleTimeout, VOLT_SAMPLE_INTERVAL);
 113  000f ae0bb8        	ldw	x,#3000
 114  0012 89            	pushw	x
 115  0013 5f            	clrw	x
 116  0014 89            	pushw	x
 117  0015 ae0001        	ldw	x,#_tVolSampleCtrl+1
 118  0018 cd0000        	call	_InitMsTimeout
 120  001b 5b04          	addw	sp,#4
 121                     ; 30 		tVolSampleCtrl.u8SampleFlag = 0;
 123  001d 3f0e          	clr	_tVolSampleCtrl+14
 124                     ; 31 		tVolSampleCtrl.u8SampleSta = 1;
 126  001f 35010000      	mov	_tVolSampleCtrl,#1
 127  0023               L14:
 128                     ; 34 	switch(tVolSampleCtrl.u8SampleSta)
 130  0023 b600          	ld	a,_tVolSampleCtrl
 132                     ; 62 		default:
 132                     ; 63 		break;
 133  0025 4a            	dec	a
 134  0026 2705          	jreq	L32
 135  0028 4a            	dec	a
 136  0029 272d          	jreq	L52
 137  002b 206c          	jra	L74
 138                     ; 36 		case 0:
 138                     ; 37 		break;
 140  002d               L32:
 141                     ; 39 		case 1:
 141                     ; 40 		tVolSampleCtrl.u16Voltage[0] = AdcGeneralAcq(CHAN_BAT1_VOLT);
 143  002d 4c            	inc	a
 144  002e cd0000        	call	_AdcGeneralAcq
 146  0031 bf0f          	ldw	_tVolSampleCtrl+15,x
 147                     ; 41 		tVolSampleCtrl.u8SampleSta ++;
 149  0033 3c00          	inc	_tVolSampleCtrl
 150                     ; 43 		tVolSampleCtrl.u32SampleCnt[0] ++;
 152  0035 ae0013        	ldw	x,#_tVolSampleCtrl+19
 153  0038 a601          	ld	a,#1
 154  003a cd0000        	call	c_lgadc
 156                     ; 44 		tVolSampleCtrl.u32FailCnt[0] = 0;
 158  003d 5f            	clrw	x
 159  003e bf1d          	ldw	_tVolSampleCtrl+29,x
 160  0040 bf1b          	ldw	_tVolSampleCtrl+27,x
 161                     ; 46 		sprintf(DebugBuf, "bat1 volt: %u.%uV\r\n", tVolSampleCtrl.u16Voltage[0] / 1000, tVolSampleCtrl.u16Voltage[0] % 1000);
 163  0042 be0f          	ldw	x,_tVolSampleCtrl+15
 164  0044 90ae03e8      	ldw	y,#1000
 165  0048 65            	divw	x,y
 166  0049 9089          	pushw	y
 167  004b be0f          	ldw	x,_tVolSampleCtrl+15
 168  004d 90ae03e8      	ldw	y,#1000
 169  0051 65            	divw	x,y
 170  0052 89            	pushw	x
 171  0053 ae0014        	ldw	x,#L15
 173                     ; 47 		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);
 175                     ; 48 		break;
 177  0056 202e          	jp	LC001
 178  0058               L52:
 179                     ; 50 		case 2:
 179                     ; 51 		tVolSampleCtrl.u16Voltage[1] = AdcGeneralAcq(CHAN_BAT2_VOLT);
 181  0058 a602          	ld	a,#2
 182  005a cd0000        	call	_AdcGeneralAcq
 184  005d bf11          	ldw	_tVolSampleCtrl+17,x
 185                     ; 52 		tVolSampleCtrl.u8SampleSta = 0;
 187  005f 3f00          	clr	_tVolSampleCtrl
 188                     ; 54 		tVolSampleCtrl.u32SampleCnt[1] ++;
 190  0061 ae0017        	ldw	x,#_tVolSampleCtrl+23
 191  0064 a601          	ld	a,#1
 192  0066 cd0000        	call	c_lgadc
 194                     ; 55 		tVolSampleCtrl.u32FailCnt[1] = 0;
 196  0069 5f            	clrw	x
 197  006a bf21          	ldw	_tVolSampleCtrl+33,x
 198  006c bf1f          	ldw	_tVolSampleCtrl+31,x
 199                     ; 56 		tVolSampleCtrl.u8VoltOk = 1;
 201  006e 35010027      	mov	_tVolSampleCtrl+39,#1
 202                     ; 58 		sprintf(DebugBuf, "bat2 volt: %u.%uV\r\n", tVolSampleCtrl.u16Voltage[1] / 1000, tVolSampleCtrl.u16Voltage[1] % 1000);
 204  0072 be11          	ldw	x,_tVolSampleCtrl+17
 205  0074 90ae03e8      	ldw	y,#1000
 206  0078 65            	divw	x,y
 207  0079 9089          	pushw	y
 208  007b be11          	ldw	x,_tVolSampleCtrl+17
 209  007d 90ae03e8      	ldw	y,#1000
 210  0081 65            	divw	x,y
 211  0082 89            	pushw	x
 212  0083 ae0000        	ldw	x,#L35
 214                     ; 59 		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);
 217  0086               LC001:
 218  0086 89            	pushw	x
 219  0087 ae0000        	ldw	x,#_DebugBuf
 220  008a cd0000        	call	_sprintf
 221  008d 5b06          	addw	sp,#6
 223  008f ae0000        	ldw	x,#_DebugBuf
 224  0092 89            	pushw	x
 225  0093 a603          	ld	a,#3
 226  0095 cd0000        	call	_DebugStrOutput
 227  0098 85            	popw	x
 228                     ; 60 		break;
 230                     ; 62 		default:
 230                     ; 63 		break;
 232  0099               L74:
 233                     ; 66 	return 0;
 235  0099 4f            	clr	a
 238  009a 81            	ret	
 426                     	switch	.ubsct
 427  0000               _tVolSampleCtrl:
 428  0000 000000000000  	ds.b	52
 429                     	xdef	_tVolSampleCtrl
 430                     	xdef	_AcqDoJob
 431                     	xdef	_AcqInit
 432                     	xref	_AdcGeneralAcq
 433                     	xref	_DebugStrOutput
 434                     	xref.b	_DebugBuf
 435                     	xref	_IsMsTimeout
 436                     	xref	_InitMsTimeout
 437                     	xref	_memset
 438                     	xref	_sprintf
 439                     .const:	section	.text
 440  0000               L35:
 441  0000 626174322076  	dc.b	"bat2 volt: %u.%uV",13
 442  0012 0a00          	dc.b	10,0
 443  0014               L15:
 444  0014 626174312076  	dc.b	"bat1 volt: %u.%uV",13
 445  0026 0a00          	dc.b	10,0
 465                     	xref	c_lgadc
 466                     	xref	c_lrzmp
 467                     	end
