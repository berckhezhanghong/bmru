   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 97 void IRTIM_DeInit(void)
  33                     ; 98 {
  34                     .text:	section	.text,new
  35  0000               f_IRTIM_DeInit:
  39                     ; 99   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  41  0000 725f52ff      	clr	21247
  42                     ; 100 }
  45  0004 87            	retf	
  99                     ; 108 void IRTIM_Cmd(FunctionalState NewState)
  99                     ; 109 {
 100                     .text:	section	.text,new
 101  0000               f_IRTIM_Cmd:
 105                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
 107                     ; 114   if (NewState ==   DISABLE)
 109  0000 4d            	tnz	a
 110  0001 2605          	jrne	L74
 111                     ; 116     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
 113  0003 721152ff      	bres	21247,#0
 116  0007 87            	retf	
 117  0008               L74:
 118                     ; 120     IRTIM->CR |= IRTIM_CR_EN ;
 120  0008 721052ff      	bset	21247,#0
 121                     ; 122 }
 124  000c 87            	retf	
 159                     ; 130 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 159                     ; 131 {
 160                     .text:	section	.text,new
 161  0000               f_IRTIM_HighSinkODCmd:
 165                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 167                     ; 136   if (NewState == DISABLE)
 169  0000 4d            	tnz	a
 170  0001 2605          	jrne	L17
 171                     ; 138     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
 173  0003 721352ff      	bres	21247,#1
 176  0007 87            	retf	
 177  0008               L17:
 178                     ; 142     IRTIM->CR |= IRTIM_CR_HSEN ;
 180  0008 721252ff      	bset	21247,#1
 181                     ; 144 }
 184  000c 87            	retf	
 207                     ; 168 FunctionalState IRTIM_GetStatus(void)
 207                     ; 169 {
 208                     .text:	section	.text,new
 209  0000               f_IRTIM_GetStatus:
 213                     ; 170   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
 215  0000 c652ff        	ld	a,21247
 216  0003 a401          	and	a,#1
 219  0005 87            	retf	
 243                     ; 178 FunctionalState IRTIM_GetHighSinkODStatus(void)
 243                     ; 179 {
 244                     .text:	section	.text,new
 245  0000               f_IRTIM_GetHighSinkODStatus:
 249                     ; 180   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 251  0000 c652ff        	ld	a,21247
 252  0003 a402          	and	a,#2
 255  0005 87            	retf	
 267                     	xdef	f_IRTIM_GetHighSinkODStatus
 268                     	xdef	f_IRTIM_GetStatus
 269                     	xdef	f_IRTIM_HighSinkODCmd
 270                     	xdef	f_IRTIM_Cmd
 271                     	xdef	f_IRTIM_DeInit
 290                     	end
