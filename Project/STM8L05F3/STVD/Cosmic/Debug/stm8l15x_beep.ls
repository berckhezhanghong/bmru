   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 92 void BEEP_DeInit(void)
  33                     ; 93 {
  35                     .text:	section	.text,new
  36  0000               _BEEP_DeInit:
  40                     ; 94   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  42  0000 725f50f0      	clr	20720
  43                     ; 95   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  45  0004 351f50f3      	mov	20723,#31
  46                     ; 96 }
  49  0008 81            	ret	
 114                     ; 105 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 114                     ; 106 {
 115                     .text:	section	.text,new
 116  0000               _BEEP_Init:
 118  0000 88            	push	a
 119       00000000      OFST:	set	0
 122                     ; 109   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 124                     ; 112   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
 126  0001 c650f3        	ld	a,20723
 127  0004 a41f          	and	a,#31
 128  0006 a11f          	cp	a,#31
 129  0008 260c          	jrne	L15
 130                     ; 114     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 132  000a c650f3        	ld	a,20723
 133  000d a4e0          	and	a,#224
 134  000f c750f3        	ld	20723,a
 135                     ; 115     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
 137  0012 721050f3      	bset	20723,#0
 138  0016               L15:
 139                     ; 119   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
 141  0016 c650f3        	ld	a,20723
 142  0019 a43f          	and	a,#63
 143  001b c750f3        	ld	20723,a
 144                     ; 120   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
 146  001e c650f3        	ld	a,20723
 147  0021 1a01          	or	a,(OFST+1,sp)
 148  0023 c750f3        	ld	20723,a
 149                     ; 122 }
 152  0026 84            	pop	a
 153  0027 81            	ret	
 208                     ; 130 void BEEP_Cmd(FunctionalState NewState)
 208                     ; 131 {
 209                     .text:	section	.text,new
 210  0000               _BEEP_Cmd:
 214                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 216                     ; 135   if (NewState != DISABLE)
 218  0000 4d            	tnz	a
 219  0001 2705          	jreq	L101
 220                     ; 138     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
 222  0003 721a50f3      	bset	20723,#5
 225  0007 81            	ret	
 226  0008               L101:
 227                     ; 143     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
 229  0008 721b50f3      	bres	20723,#5
 230                     ; 145 }
 233  000c 81            	ret	
 269                     ; 178 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
 269                     ; 179 {
 270                     .text:	section	.text,new
 271  0000               _BEEP_LSClockToTIMConnectCmd:
 275                     ; 181   assert_param(IS_FUNCTIONAL_STATE(NewState));
 277                     ; 183   if (NewState != DISABLE)
 279  0000 4d            	tnz	a
 280  0001 2705          	jreq	L321
 281                     ; 186     BEEP->CSR1 |= BEEP_CSR1_MSR;
 283  0003 721050f0      	bset	20720,#0
 286  0007 81            	ret	
 287  0008               L321:
 288                     ; 191     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
 290  0008 721150f0      	bres	20720,#0
 291                     ; 193 }
 294  000c 81            	ret	
 347                     .const:	section	.text
 348  0000               L61:
 349  0000 000003e8      	dc.l	1000
 350                     ; 207 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 350                     ; 208 {
 351                     .text:	section	.text,new
 352  0000               _BEEP_LSICalibrationConfig:
 354  0000 5206          	subw	sp,#6
 355       00000006      OFST:	set	6
 358                     ; 213   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 360                     ; 215   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 362  0002 96            	ldw	x,sp
 363  0003 1c0009        	addw	x,#OFST+3
 364  0006 cd0000        	call	c_ltor
 366  0009 ae0000        	ldw	x,#L61
 367  000c cd0000        	call	c_ludv
 369  000f be02          	ldw	x,c_lreg+2
 370  0011 1f03          	ldw	(OFST-3,sp),x
 371                     ; 219   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 373  0013 c650f3        	ld	a,20723
 374  0016 a4e0          	and	a,#224
 375  0018 c750f3        	ld	20723,a
 376                     ; 221   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 378  001b 54            	srlw	x
 379  001c 54            	srlw	x
 380  001d 54            	srlw	x
 381  001e 1f05          	ldw	(OFST-1,sp),x
 382                     ; 223   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 384  0020 58            	sllw	x
 385  0021 58            	sllw	x
 386  0022 58            	sllw	x
 387  0023 1f01          	ldw	(OFST-5,sp),x
 388  0025 1e03          	ldw	x,(OFST-3,sp)
 389  0027 72f001        	subw	x,(OFST-5,sp)
 390  002a 1605          	ldw	y,(OFST-1,sp)
 391  002c 9058          	sllw	y
 392  002e 905c          	incw	y
 393  0030 cd0000        	call	c_imul
 395  0033 1605          	ldw	y,(OFST-1,sp)
 396  0035 9058          	sllw	y
 397  0037 9058          	sllw	y
 398  0039 9058          	sllw	y
 399  003b bf01          	ldw	c_x+1,x
 400  003d 90b301        	cpw	y,c_x+1
 401  0040 7b06          	ld	a,(OFST+0,sp)
 402  0042 2504          	jrult	L551
 403                     ; 225     BEEP->CSR2 |= (uint8_t)(A - 2U);
 405  0044 a002          	sub	a,#2
 407  0046 2001          	jra	L751
 408  0048               L551:
 409                     ; 229     BEEP->CSR2 |= (uint8_t)(A - 1U);
 411  0048 4a            	dec	a
 412  0049               L751:
 413  0049 ca50f3        	or	a,20723
 414  004c c750f3        	ld	20723,a
 415                     ; 231 }
 418  004f 5b06          	addw	sp,#6
 419  0051 81            	ret	
 432                     	xdef	_BEEP_LSICalibrationConfig
 433                     	xdef	_BEEP_LSClockToTIMConnectCmd
 434                     	xdef	_BEEP_Cmd
 435                     	xdef	_BEEP_Init
 436                     	xdef	_BEEP_DeInit
 437                     	xref.b	c_lreg
 438                     	xref.b	c_x
 457                     	xref	c_imul
 458                     	xref	c_ludv
 459                     	xref	c_ltor
 460                     	end
