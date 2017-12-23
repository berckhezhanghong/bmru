   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
 114                     ; 99 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 114                     ; 100 {
 115                     .text:	section	.text,new
 116  0000               f_RST_GetFlagStatus:
 120                     ; 102   assert_param(IS_RST_FLAG(RST_Flag));
 122                     ; 105   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 124  0000 c450b1        	and	a,20657
 125  0003 2702          	jreq	L01
 126  0005 a601          	ld	a,#1
 127  0007               L01:
 130  0007 87            	retf	
 164                     ; 120 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 164                     ; 121 {
 165                     .text:	section	.text,new
 166  0000               f_RST_ClearFlag:
 170                     ; 123   assert_param(IS_RST_FLAG(RST_Flag));
 172                     ; 125   RST->SR = (uint8_t)RST_Flag;
 174  0000 c750b1        	ld	20657,a
 175                     ; 126 }
 178  0003 87            	retf	
 200                     ; 149 void RST_GPOutputEnable(void)
 200                     ; 150 {
 201                     .text:	section	.text,new
 202  0000               f_RST_GPOutputEnable:
 206                     ; 152   RST->CR = RST_CR_MASK;
 208  0000 35d050b0      	mov	20656,#208
 209                     ; 153 }
 212  0004 87            	retf	
 224                     	xdef	f_RST_GPOutputEnable
 225                     	xdef	f_RST_ClearFlag
 226                     	xdef	f_RST_GetFlagStatus
 245                     	end
