#include "tx3703.inc"


		zero 	EQU 	9D; 	

        org 00h                 
        ajmp Start
        org 400h
LED_Table:
	db 11000000b
	db 11111001b
	db 10100100b
	db 10110000b	
	db 10011001b
	db 10010010b
	db 10000011b	
	db 11011000b
	db 10000000b
	db 10011000b


	
    MOV		DPTR,#LED_Table
Start: 

		mov p0oe,#11111111b
		mov p2oe,#11111111b
		mov p2,#11111110b
		mov p0,#11111111b
		;MOV r5,#10
;s2:	
		mov p0,#11000000b
		mov p2,#11111110b
		acall  delay_solw
		
		mov p0,#11111001b
		mov p2,#11111101b
		acall  delay_solw


		mov p0,#10100100b
		mov p2,#11111011b
		acall  delay_solw

		mov p0,#10110000b
		mov p2,#11110111b
		acall  delay_solw
		;DJNZ r5,s2
		;acall delay_1s
		
		ajmp Start

delay_solw:
	MOV R4,#10
  D1:	
    MOV R3,#5
	DJNZ R3,$
	DJNZ R4,D1
	RET
	





delay_1s:
	MOV R5,#100
  D2:	
    MOV R6,#25
	DJNZ R6,$
	DJNZ R5,D2
	RET
	END