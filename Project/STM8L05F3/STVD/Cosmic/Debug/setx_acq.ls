   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  36                     ; 14 sint8 AcqInit(void)
  36                     ; 15 {
  37                     .text:	section	.text,new
  38  0000               f_AcqInit:
  42                     ; 16 	memset(&tVolSampleCtrl, 0, sizeof(tVolSampleCtrlDef));
  44  0000 ae0034        	ldw	x,#52
  45  0003               L6:
  46  0003 724fffff      	clr	(_tVolSampleCtrl-1,x)
  47  0007 5a            	decw	x
  48  0008 26f9          	jrne	L6
  49                     ; 17 	InitMsTimeout(&tVolSampleCtrl.tVolSampleTimeout, VOLT_SAMPLE_INTERVAL_INIT);
  51  000a ae0bb8        	ldw	x,#3000
  52  000d 89            	pushw	x
  53  000e 5f            	clrw	x
  54  000f 89            	pushw	x
  55  0010 ae0001        	ldw	x,#_tVolSampleCtrl+1
  56  0013 8d000000      	callf	f_InitMsTimeout
  58  0017 5b04          	addw	sp,#4
  59                     ; 18 }
  62  0019 87            	retf	
  91                     ; 22 sint8 AcqDoJob(void)
  91                     ; 23 {
  92                     .text:	section	.text,new
  93  0000               f_AcqDoJob:
  97                     ; 26 	if(IsMsTimeout(&tVolSampleCtrl.tVolSampleTimeout) || 
  97                     ; 27 	   tVolSampleCtrl.u8SampleFlag)
  99  0000 ae0001        	ldw	x,#_tVolSampleCtrl+1
 100  0003 8d000000      	callf	f_IsMsTimeout
 102  0007 8d000000      	callf	d_lrzmp
 104  000b 2605          	jrne	L34
 106  000d c6000e        	ld	a,_tVolSampleCtrl+14
 107  0010 2717          	jreq	L14
 108  0012               L34:
 109                     ; 29 		InitMsTimeout(&tVolSampleCtrl.tVolSampleTimeout, VOLT_SAMPLE_INTERVAL);
 111  0012 ae0bb8        	ldw	x,#3000
 112  0015 89            	pushw	x
 113  0016 5f            	clrw	x
 114  0017 89            	pushw	x
 115  0018 ae0001        	ldw	x,#_tVolSampleCtrl+1
 116  001b 8d000000      	callf	f_InitMsTimeout
 118  001f 5b04          	addw	sp,#4
 119                     ; 30 		tVolSampleCtrl.u8SampleFlag = 0;
 121  0021 725f000e      	clr	_tVolSampleCtrl+14
 122                     ; 31 		tVolSampleCtrl.u8SampleSta = 1;
 124  0025 35010000      	mov	_tVolSampleCtrl,#1
 125  0029               L14:
 126                     ; 34 	switch(tVolSampleCtrl.u8SampleSta)
 128  0029 c60000        	ld	a,_tVolSampleCtrl
 130                     ; 66 		default:
 130                     ; 67 		break;
 131  002c 4a            	dec	a
 132  002d 2707          	jreq	L32
 133  002f 4a            	dec	a
 134  0030 2738          	jreq	L52
 135  0032 acb600b6      	jra	L74
 136                     ; 36 		case 0:
 136                     ; 37 		break;
 138  0036               L32:
 139                     ; 39 		case 1:
 139                     ; 40 		tVolSampleCtrl.u16Voltage[0] = AdcGeneralAcq(CHAN_BAT1_VOLT);
 141  0036 4c            	inc	a
 142  0037 8d000000      	callf	f_AdcGeneralAcq
 144  003b cf000f        	ldw	_tVolSampleCtrl+15,x
 145                     ; 41 		tVolSampleCtrl.u8SampleSta ++;
 147  003e 725c0000      	inc	_tVolSampleCtrl
 148                     ; 43 		tVolSampleCtrl.u32SampleCnt[0] ++;
 150  0042 ae0013        	ldw	x,#_tVolSampleCtrl+19
 151  0045 a601          	ld	a,#1
 152  0047 8d000000      	callf	d_lgadc
 154                     ; 44 		tVolSampleCtrl.u32FailCnt[0] = 0;
 156  004b 5f            	clrw	x
 157  004c cf001d        	ldw	_tVolSampleCtrl+29,x
 158  004f cf001b        	ldw	_tVolSampleCtrl+27,x
 159                     ; 47 		sprintf(DebugBuf, "bat1 volt: %u.%uV\r\n", tVolSampleCtrl.u16Voltage[0] / 1000, tVolSampleCtrl.u16Voltage[0] % 1000);
 161  0052 ce000f        	ldw	x,_tVolSampleCtrl+15
 162  0055 90ae03e8      	ldw	y,#1000
 163  0059 65            	divw	x,y
 164  005a 9089          	pushw	y
 165  005c ce000f        	ldw	x,_tVolSampleCtrl+15
 166  005f 90ae03e8      	ldw	y,#1000
 167  0063 65            	divw	x,y
 168  0064 89            	pushw	x
 169  0065 ae0014        	ldw	x,#L15
 171                     ; 48 		DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);
 173                     ; 50 		break;
 175  0068 2037          	jpf	LC001
 176  006a               L52:
 177                     ; 52 		case 2:
 177                     ; 53 		tVolSampleCtrl.u16Voltage[1] = AdcGeneralAcq(CHAN_BAT2_VOLT);
 179  006a a602          	ld	a,#2
 180  006c 8d000000      	callf	f_AdcGeneralAcq
 182  0070 cf0011        	ldw	_tVolSampleCtrl+17,x
 183                     ; 54 		tVolSampleCtrl.u8SampleSta = 0;
 185  0073 725f0000      	clr	_tVolSampleCtrl
 186                     ; 56 		tVolSampleCtrl.u32SampleCnt[1] ++;
 188  0077 ae0017        	ldw	x,#_tVolSampleCtrl+23
 189  007a a601          	ld	a,#1
 190  007c 8d000000      	callf	d_lgadc
 192                     ; 57 		tVolSampleCtrl.u32FailCnt[1] = 0;
 194  0080 5f            	clrw	x
 195  0081 cf0021        	ldw	_tVolSampleCtrl+33,x
 196  0084 cf001f        	ldw	_tVolSampleCtrl+31,x
 197                     ; 58 		tVolSampleCtrl.u8VoltOk = 1;
 199  0087 35010027      	mov	_tVolSampleCtrl+39,#1
 200                     ; 61 		sprintf(DebugBuf, "bat2 volt: %u.%uV\r\n", tVolSampleCtrl.u16Voltage[1] / 1000, tVolSampleCtrl.u16Voltage[1] % 1000);
 202  008b ce0011        	ldw	x,_tVolSampleCtrl+17
 203  008e 90ae03e8      	ldw	y,#1000
 204  0092 65            	divw	x,y
 205  0093 9089          	pushw	y
 206  0095 ce0011        	ldw	x,_tVolSampleCtrl+17
 207  0098 90ae03e8      	ldw	y,#1000
 208  009c 65            	divw	x,y
 209  009d 89            	pushw	x
 210  009e ae0000        	ldw	x,#L35
 212                     ; 62 		DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);
 215  00a1               LC001:
 216  00a1 89            	pushw	x
 217  00a2 ae0000        	ldw	x,#_DebugBuf
 218  00a5 8d000000      	callf	f_sprintf
 219  00a9 5b06          	addw	sp,#6
 221  00ab ae0000        	ldw	x,#_DebugBuf
 222  00ae 89            	pushw	x
 223  00af a603          	ld	a,#3
 224  00b1 8d000000      	callf	f_DebugStrOutput
 225  00b5 85            	popw	x
 226                     ; 64 		break;
 228                     ; 66 		default:
 228                     ; 67 		break;
 230  00b6               L74:
 231                     ; 70 	return 0;
 233  00b6 4f            	clr	a
 236  00b7 87            	retf	
 423                     	switch	.bss
 424  0000               _tVolSampleCtrl:
 425  0000 000000000000  	ds.b	52
 426                     	xdef	_tVolSampleCtrl
 427                     	xdef	f_AcqDoJob
 428                     	xdef	f_AcqInit
 429                     	xref	f_AdcGeneralAcq
 430                     	xref	f_DebugStrOutput
 431                     	xref	_DebugBuf
 432                     	xref	f_IsMsTimeout
 433                     	xref	f_InitMsTimeout
 434                     	xref	f_memset
 435                     	xref	f_sprintf
 436                     .const:	section	.text
 437  0000               L35:
 438  0000 626174322076  	dc.b	"bat2 volt: %u.%uV",13
 439  0012 0a00          	dc.b	10,0
 440  0014               L15:
 441  0014 626174312076  	dc.b	"bat1 volt: %u.%uV",13
 442  0026 0a00          	dc.b	10,0
 462                     	xref	d_lgadc
 463                     	xref	d_lrzmp
 464                     	end
