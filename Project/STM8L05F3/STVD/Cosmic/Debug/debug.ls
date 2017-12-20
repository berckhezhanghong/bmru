   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  58                     ; 50 tDebugParaDef *GetDebugPara(void)
  58                     ; 51 {
  60                     .text:	section	.text,new
  61  0000               _GetDebugPara:
  65                     ; 52 	return &tDebugPara;
  67  0000 ae0000        	ldw	x,#_tDebugPara
  70  0003 81            	ret	
  94                     ; 71 sint8 DebugInit(void)
  94                     ; 72 {
  95                     .text:	section	.text,new
  96  0000               _DebugInit:
 100                     ; 73 	tDebugPara.u8DebugSwitch = DEBUG_SWITCH_ON; // 代码调试时ON,发行版本为OFF
 102  0000 35010000      	mov	_tDebugPara,#1
 103                     ; 74 	tDebugPara.u8DebugLevel = DEBUG_LEVEL_4;  // 默认调试输出数据
 105  0004 35040001      	mov	_tDebugPara+1,#4
 106                     ; 88     return 0;
 109  0008 4f            	clr	a
 112  0009 81            	ret	
 159                     ; 106 sint8 DebugStrOutput(uint8 u8DebugLevel, const uint8 *pu8Str)
 159                     ; 107 {
 160                     .text:	section	.text,new
 161  0000               _DebugStrOutput:
 163  0000 88            	push	a
 164       00000000      OFST:	set	0
 167                     ; 108     if(NULL == pu8Str)
 169  0001 1e04          	ldw	x,(OFST+4,sp)
 170  0003 2605          	jrne	L56
 171                     ; 110         return -1;
 173  0005 a6ff          	ld	a,#255
 176  0007 5b01          	addw	sp,#1
 177  0009 81            	ret	
 178  000a               L56:
 179                     ; 113 	if(!tDebugPara.u8DebugSwitch)
 181  000a b600          	ld	a,_tDebugPara
 182  000c 2603          	jrne	L76
 183                     ; 116 		return 0;
 187  000e 5b01          	addw	sp,#1
 188  0010 81            	ret	
 189  0011               L76:
 190                     ; 119 	if(tDebugPara.u8DebugLevel < u8DebugLevel)
 192  0011 b601          	ld	a,_tDebugPara+1
 193  0013 1101          	cp	a,(OFST+1,sp)
 194  0015 2404          	jruge	L17
 195                     ; 122 		return 0;
 197  0017 4f            	clr	a
 200  0018 5b01          	addw	sp,#1
 201  001a 81            	ret	
 202  001b               L17:
 203                     ; 127 		UpUartSendStr(pu8Str, strlen(pu8Str));
 205  001b cd0000        	call	_strlen
 207  001e 89            	pushw	x
 208  001f 1e06          	ldw	x,(OFST+6,sp)
 209  0021 cd0000        	call	_UpUartSendStr
 211  0024 4f            	clr	a
 212  0025 85            	popw	x
 213                     ; 134 	return 0;
 217  0026 5b01          	addw	sp,#1
 218  0028 81            	ret	
 253                     	switch	.ubsct
 254  0000               _tDebugPara:
 255  0000 0000          	ds.b	2
 256                     	xdef	_tDebugPara
 257                     	xref	_UpUartSendStr
 258                     	xdef	_DebugStrOutput
 259                     	xdef	_DebugInit
 260                     	xdef	_GetDebugPara
 261  0002               _DebugBuf:
 262  0002 000000000000  	ds.b	60
 263                     	xdef	_DebugBuf
 264                     	xref	_strlen
 284                     	end
