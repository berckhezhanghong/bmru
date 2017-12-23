   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  47                     ; 16 uint16 GetAppVersion(uint8 *pu8Str)
  47                     ; 17 {
  48                     .text:	section	.text,new
  49  0000               f_GetAppVersion:
  51  0000 89            	pushw	x
  52       00000000      OFST:	set	0
  55                     ; 18 	sprintf((char *)pu8Str, "app ver:%u.%02u-%s %s", (SOFTWARE_VERSION / 0x100), (SOFTWARE_VERSION % 0x100), __DATE__, __TIME__);
  57  0001 ae0023        	ldw	x,#L33
  58  0004 89            	pushw	x
  59  0005 ae002c        	ldw	x,#L13
  60  0008 89            	pushw	x
  61  0009 ae0003        	ldw	x,#3
  62  000c 89            	pushw	x
  63  000d ae0001        	ldw	x,#1
  64  0010 89            	pushw	x
  65  0011 ae0038        	ldw	x,#L72
  66  0014 89            	pushw	x
  67  0015 1e0b          	ldw	x,(OFST+11,sp)
  68  0017 8d000000      	callf	f_sprintf
  70  001b 5b0a          	addw	sp,#10
  71                     ; 20 	return strlen((char *)pu8Str) + 1;
  73  001d 1e01          	ldw	x,(OFST+1,sp)
  74  001f 8d000000      	callf	f_strlen
  76  0023 5c            	incw	x
  79  0024 5b02          	addw	sp,#2
  80  0026 87            	retf	
 116                     ; 24 uint16 GetBootVersion(uint8 *pu8Str)
 116                     ; 25 {
 117                     .text:	section	.text,new
 118  0000               f_GetBootVersion:
 120  0000 89            	pushw	x
 121       00000000      OFST:	set	0
 124                     ; 29 	sprintf((char *)pu8Str, "boot ver:%u.%02u", (BOOT_VERSION / 0x100), (BOOT_VERSION % 0x100));
 126  0001 ae0001        	ldw	x,#1
 127  0004 89            	pushw	x
 128  0005 89            	pushw	x
 129  0006 ae0012        	ldw	x,#L35
 130  0009 89            	pushw	x
 131  000a 1e07          	ldw	x,(OFST+7,sp)
 132  000c 8d000000      	callf	f_sprintf
 134  0010 5b06          	addw	sp,#6
 135                     ; 31 	return strlen((char *)pu8Str) + 1;
 137  0012 1e01          	ldw	x,(OFST+1,sp)
 138  0014 8d000000      	callf	f_strlen
 140  0018 5c            	incw	x
 143  0019 5b02          	addw	sp,#2
 144  001b 87            	retf	
 187                     ; 35 uint16 GetHardwareVersion(uint8 *pu8Str)
 187                     ; 36 {
 188                     .text:	section	.text,new
 189  0000               f_GetHardwareVersion:
 191  0000 89            	pushw	x
 192  0001 88            	push	a
 193       00000001      OFST:	set	1
 196                     ; 39 	u8ver = 0;
 198  0002 0f01          	clr	(OFST+0,sp)
 199                     ; 41 	sprintf((char *)pu8Str, "hardware ver:1.%u", u8ver);
 201  0004 4b00          	push	#0
 202  0006 ae0000        	ldw	x,#L57
 203  0009 89            	pushw	x
 204  000a 1e05          	ldw	x,(OFST+4,sp)
 205  000c 8d000000      	callf	f_sprintf
 207  0010 5b03          	addw	sp,#3
 208                     ; 43 	return strlen((char *)pu8Str) + 1;
 210  0012 1e02          	ldw	x,(OFST+1,sp)
 211  0014 8d000000      	callf	f_strlen
 213  0018 5c            	incw	x
 216  0019 5b03          	addw	sp,#3
 217  001b 87            	retf	
 229                     	xdef	f_GetHardwareVersion
 230                     	xdef	f_GetBootVersion
 231                     	xdef	f_GetAppVersion
 232                     	xref	f_strlen
 233                     	xref	f_sprintf
 234                     .const:	section	.text
 235  0000               L57:
 236  0000 686172647761  	dc.b	"hardware ver:1.%u",0
 237  0012               L35:
 238  0012 626f6f742076  	dc.b	"boot ver:%u.%02u",0
 239  0023               L33:
 240  0023 31373a35323a  	dc.b	"17:52:24",0
 241  002c               L13:
 242  002c 446563203231  	dc.b	"Dec 21 2017",0
 243  0038               L72:
 244  0038 617070207665  	dc.b	"app ver:%u.%02u-%s"
 245  004a 20257300      	dc.b	" %s",0
 265                     	end
