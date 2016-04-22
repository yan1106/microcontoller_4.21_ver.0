#include "tx3703.inc"


		zero 	EQU 	9D; 	
		Temp_A	EQU     1D;
		Temp_B	EQU     2D;
		Temp_C	EQU     3D;
		
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
	mov		r7,#3
	mov		Temp_A,#1
	mov		Temp_B,#2
	mov		Temp_C,#3
Start: 
		mov p0oe,#11111111b
		mov p2oe,#11111111b
		mov p2,#11111110b
		mov p0,#11111111b

		MOV DPTR,#LED_Table
S1:
		mov r2,#10
s2:
		MOV A,#0				
		MOVC A,@A+DPTR
		
		mov p2,#11111110b
		MOV p0,A
		acall delay_1s		
		inc DPTR				
		djnz r2,s2		
		djnz Temp_A,s3 
		
s3:						
		MOV p0,#11111001b
		MOV p2,#11111101b
		acall delay_slow
		ajmp Start2


Start2: 
		mov p0oe,#11111111b
		mov p2oe,#11111111b
		mov p2,#11111110b
		mov p0,#11111111b

		MOV DPTR,#LED_Table
S1_2:
		mov r2,#10
s2_2:
		MOV A,#0				
		MOVC A,@A+DPTR
		acall time0
		mov p2,#11111110b
		MOV p0,A
		acall delay_1s		
		inc DPTR				
		djnz r2,s2_2				 
		djnz Temp_B,s4_2 

s4_2:						
		MOV p0,#10100100b
		MOV p2,#11111101b		
		acall delay_fast
		ajmp Start3		

Start3: 
		mov p0oe,#11111111b
		mov p2oe,#11111111b
		mov p2,#11111110b
		mov p0,#11111111b

		MOV DPTR,#LED_Table
S1_3:
		mov r2,#10
s2_3:
		MOV A,#0				
		MOVC A,@A+DPTR
		
		mov p2,#11111110b
		MOV p0,A
		acall delay_1s		
		inc DPTR				
		djnz r2,s2_3				 
		djnz Temp_C,s4_3

s4_3:						
		MOV p0,#10110000b
		MOV p2,#11111101b		
		acall delay_fast
		ajmp Start		



time0:
		MOV p0,#11111001b
		MOV p2,#11111101b		
		acall delay_fast
		RET




delay_slow:
	MOV R1,#500
  D0:	
    MOV R2,#250
	DJNZ R2,$
	DJNZ R1,D0
	RET



delay_fast:
	MOV R4,#100
  D1:	
    MOV R3,#25
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


	
	