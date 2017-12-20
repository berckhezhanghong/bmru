   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  47                     ; 16 uint16 GetAppVersion(uint8 *pu8Str)
  47                     ; 17 {
  49                     .text:	section	.text,new
  50  0000               _GetAppVersion:
  52  0000 89            	pushw	x
  53       00000000      OFST:	set	0
  56                     ; 18 	sprintf((char *)pu8Str, "app ver:%u.%02u-%s %s", (SOFTWARE_VERSION / 0x100), (SOFTWARE_VERSION % 0x100), __DATE__, __TIME__);
  58  0001 ae0023        	ldw	x,#L33
  59  0004 89            	pushw	x
  60  0005 ae002c        	ldw	x,#L13
  61  0008 89            	pushw	x
  62  0009 ae0003        	ldw	x,#3
  63  000c 89            	pushw	x
  64  000d ae0001        	ldw	x,#1
  65  0010 89            	pushw	x
  66  0011 ae0038        	ldw	x,#L72
  67  0014 89            	pushw	x
  68  0015 1e0b          	ldw	x,(OFST+11,sp)
  69  0017 cd0000        	call	_sprintf
  71  001a 5b0a          	addw	sp,#10
  72                     ; 20 	return strlen((char *)pu8Str) + 1;
  74  001c 1e01          	ldw	x,(OFST+1,sp)
  75  001e cd0000        	call	_strlen
  77  0021 5c            	incw	x
  80  0022 5b02          	addw	sp,#2
  81  0024 81            	ret	
 118                     ; 24 uint16 GetBootVersion(uint8 *pu8Str)
 118                     ; 25 {
 119                     .text:	section	.text,new
 120  0000               _GetBootVersion:
 122  0000 89            	pushw	x
 123       00000000      OFST:	set	0
 126                     ; 29 	sprintf((char *)pu8Str, "boot ver:%u.%02u", (BOOT_VERSION / 0x100), (BOOT_VERSION % 0x100));
 128  0001 ae0001        	ldw	x,#1
 129  0004 89            	pushw	x
 130  0005 89            	pushw	x
 131  0006 ae0012        	ldw	x,#L35
 132  0009 89            	pushw	x
 133  000a 1e07          	ldw	x,(OFST+7,sp)
 134  000c cd0000        	call	_sprintf
 136  000f 5b06          	addw	sp,#6
 137                     ; 31 	return strlen((char *)pu8Str) + 1;
 139  0011 1e01          	ldw	x,(OFST+1,sp)
 140  0013 cd0000        	call	_strlen
 142  0016 5c            	incw	x
 145  0017 5b02          	addw	sp,#2
 146  0019 81            	ret	
 192                     ; 35 uint16 GetHardwareVersion(uint8 *pu8Str)
 192                     ; 36 {
 193                     .text:	section	.text,new
 194  0000               _GetHardwareVersion:
 196  0000 89            	pushw	x
 197  0001 88            	push	a
 198       00000001      OFST:	set	1
 201                     ; 39 	u8ver = 0;
 203  0002 0f01          	clr	(OFST+0,sp)
 204                     ; 41 	sprintf((char *)pu8Str, "hardware ver:1.%u", u8ver);
 206  0004 4b00          	push	#0
 207  0006 ae0000        	ldw	x,#L77
 208  0009 89            	pushw	x
 209  000a 1e05          	ldw	x,(OFST+4,sp)
 210  000c cd0000        	call	_sprintf
 212  000f 5b03          	addw	sp,#3
 213                     ; 43 	return strlen((char *)pu8Str) + 1;
 215  0011 1e02          	ldw	x,(OFST+1,sp)
 216  0013 cd0000        	call	_strlen
 218  0016 5c            	incw	x
 221  0017 5b03          	addw	sp,#3
 222  0019 81            	ret	
 235                     	xdef	_GetHardwareVersion
 236                     	xdef	_GetBootVersion
 237                     	xdef	_GetAppVersion
 238                     	xref	_strlen
 239                     	xref	_sprintf
 240                     .const:	section	.text
 241  0000               L77:
 242  0000 686172647761  	dc.b	"hardware ver:1.%u",0
 243  0012               L35:
 244  0012 626f6f742076  	dc.b	"boot ver:%u.%02u",0
 245  0023               L33:
 246  0023 31333a33353a  	dc.b	"13:35:55",0
 247  002c               L13:
 248  002c 446563203136  	dc.b	"Dec 16 2017",0
 249  0038               L72:
 250  0038 617070207665  	dc.b	"app ver:%u.%02u-%s"
 251  004a 20257300      	dc.b	" %s",0
 271                     	end
