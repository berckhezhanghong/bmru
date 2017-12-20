   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 12 sint32 Action(void)
  33                     ; 13 {
  35                     .text:	section	.text,new
  36  0000               _Action:
  40                     ; 16 	return 0;
  42  0000 5f            	clrw	x
  43  0001 bf02          	ldw	c_lreg+2,x
  44  0003 bf00          	ldw	c_lreg,x
  47  0005 81            	ret	
  60                     	xdef	_Action
  61                     	xref.b	c_lreg
  80                     	end
