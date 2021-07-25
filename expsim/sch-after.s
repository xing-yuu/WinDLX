;-------------------------------------------------------------------
; Example to illustrate instruction scheduling - reordered instructions
;-------------------------------------------------------------------
		.data
		.global		ONE
ONE:	.word		1
		.text
		.global	main
main:
		lf          f1,ONE		;turn divf into a move
		cvti2f		f7,f1		;by storing in f7 1 in
		nop                     ;floating-point format
		divf		f1,f8,f7	;move Y=(f8) into f1
		divf		f2,f9,f7	;move Z=(f9) into f2
		divf		f4,f11,f7	;move B=(f11) into f4
		divf		f5,f12,f7	;move C=(f12) into f5
		addf		f3,f1,f2
		multf		f6,f4,f5
		divf		f10,f3,f7	;move f3 into X=(f10)
		divf		f13,f6,f7	;move f6 into A=(f13)
Finish: 	
		trap		0
