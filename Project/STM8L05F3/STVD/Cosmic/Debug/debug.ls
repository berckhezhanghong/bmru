   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  58                     ; 50 tDebugParaDef *GetDebugPara(void)
  58                     ; 51 {
  59                     .text:	section	.text,new
  60  0000               f_GetDebugPara:
  64                     ; 52 	return &tDebugPara;
  66  0000 ae0000        	ldw	x,#_tDebugPara
  69  0003 87            	retf	
  92                     ; 71 sint8 DebugInit(void)
  92                     ; 72 {
  93                     .text:	section	.text,new
  94  0000               f_DebugInit:
  98                     ; 73 	tDebugPara.u8DebugSwitch = DEBUG_SWITCH_ON; // 代码调试时ON,发行版本为OFF
 100  0000 35010000      	mov	_tDebugPara,#1
 101                     ; 74 	tDebugPara.u8DebugLevel = DEBUG_LEVEL_DEBUG;  // 
 103  0004 35040001      	mov	_tDebugPara+1,#4
 104                     ; 88     return 0;
 107  0008 4f            	clr	a
 110  0009 87            	retf	
 154                     ; 106 sint8 DebugStrOutput(uint8 u8DebugLevel, const uint8 *pu8Str)
 154                     ; 107 {
 155                     .text:	section	.text,new
 156  0000               f_DebugStrOutput:
 158  0000 88            	push	a
 159       00000000      OFST:	set	0
 162                     ; 108     if(NULL == pu8Str)
 164  0001 1e05          	ldw	x,(OFST+5,sp)
 165  0003 2605          	jrne	L36
 166                     ; 110         return -1;
 168  0005 a6ff          	ld	a,#255
 171  0007 5b01          	addw	sp,#1
 172  0009 87            	retf	
 173  000a               L36:
 174                     ; 113 	if(!tDebugPara.u8DebugSwitch)
 176  000a c60000        	ld	a,_tDebugPara
 177  000d 2603          	jrne	L56
 178                     ; 116 		return 0;
 182  000f 5b01          	addw	sp,#1
 183  0011 87            	retf	
 184  0012               L56:
 185                     ; 119 	if(tDebugPara.u8DebugLevel < u8DebugLevel)
 187  0012 c60001        	ld	a,_tDebugPara+1
 188  0015 1101          	cp	a,(OFST+1,sp)
 189  0017 2404          	jruge	L76
 190                     ; 122 		return 0;
 192  0019 4f            	clr	a
 195  001a 5b01          	addw	sp,#1
 196  001c 87            	retf	
 197  001d               L76:
 198                     ; 127 		UpUartSendStr(pu8Str, strlen(pu8Str));
 200  001d 8d000000      	callf	f_strlen
 202  0021 89            	pushw	x
 203  0022 1e07          	ldw	x,(OFST+7,sp)
 204  0024 8d000000      	callf	f_UpUartSendStr
 206  0028 4f            	clr	a
 207  0029 85            	popw	x
 208                     ; 134 	return 0;
 212  002a 5b01          	addw	sp,#1
 213  002c 87            	retf	
 247                     	switch	.bss
 248  0000               _tDebugPara:
 249  0000 0000          	ds.b	2
 250                     	xdef	_tDebugPara
 251                     	xref	f_UpUartSendStr
 252                     	xdef	f_DebugStrOutput
 253                     	xdef	f_DebugInit
 254                     	xdef	f_GetDebugPara
 255  0002               _DebugBuf:
 256  0002 000000000000  	ds.b	60
 257                     	xdef	_DebugBuf
 258                     	xref	f_strlen
 278                     	end
