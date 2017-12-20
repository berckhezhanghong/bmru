   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 97 void IRTIM_DeInit(void)
  33                     ; 98 {
  35                     .text:	section	.text,new
  36  0000               _IRTIM_DeInit:
  40                     ; 99   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  42  0000 725f52ff      	clr	21247
  43                     ; 100 }
  46  0004 81            	ret	
 101                     ; 108 void IRTIM_Cmd(FunctionalState NewState)
 101                     ; 109 {
 102                     .text:	section	.text,new
 103  0000               _IRTIM_Cmd:
 107                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
 109                     ; 114   if (NewState ==   DISABLE)
 111  0000 4d            	tnz	a
 112  0001 2605          	jrne	L74
 113                     ; 116     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
 115  0003 721152ff      	bres	21247,#0
 118  0007 81            	ret	
 119  0008               L74:
 120                     ; 120     IRTIM->CR |= IRTIM_CR_EN ;
 122  0008 721052ff      	bset	21247,#0
 123                     ; 122 }
 126  000c 81            	ret	
 162                     ; 130 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 162                     ; 131 {
 163                     .text:	section	.text,new
 164  0000               _IRTIM_HighSinkODCmd:
 168                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 170                     ; 136   if (NewState == DISABLE)
 172  0000 4d            	tnz	a
 173  0001 2605          	jrne	L17
 174                     ; 138     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
 176  0003 721352ff      	bres	21247,#1
 179  0007 81            	ret	
 180  0008               L17:
 181                     ; 142     IRTIM->CR |= IRTIM_CR_HSEN ;
 183  0008 721252ff      	bset	21247,#1
 184                     ; 144 }
 187  000c 81            	ret	
 211                     ; 168 FunctionalState IRTIM_GetStatus(void)
 211                     ; 169 {
 212                     .text:	section	.text,new
 213  0000               _IRTIM_GetStatus:
 217                     ; 170   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
 219  0000 c652ff        	ld	a,21247
 220  0003 a401          	and	a,#1
 223  0005 81            	ret	
 248                     ; 178 FunctionalState IRTIM_GetHighSinkODStatus(void)
 248                     ; 179 {
 249                     .text:	section	.text,new
 250  0000               _IRTIM_GetHighSinkODStatus:
 254                     ; 180   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 256  0000 c652ff        	ld	a,21247
 257  0003 a402          	and	a,#2
 260  0005 81            	ret	
 273                     	xdef	_IRTIM_GetHighSinkODStatus
 274                     	xdef	_IRTIM_GetStatus
 275                     	xdef	_IRTIM_HighSinkODCmd
 276                     	xdef	_IRTIM_Cmd
 277                     	xdef	_IRTIM_DeInit
 296                     	end
