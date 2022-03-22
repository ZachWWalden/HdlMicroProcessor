.ORG 0x0
:INIT
	;Set up the stack pointer
	LDI R0 0xFF
	;This Causes a forward
	OUT SPH R0
	;This causes a forward
	OUT SPL R0

:MAIN
	;This Cause a stall
	LD R0 Z
	ADD R0 R1
	;This Cause a stall
	LDFB R0 R1 Z+
	ADD R0 R1
	;This Cause a stall
	LPM R0 Y
	ADDI R0 0x3F
	;This Cause a stall
	IN R0 SPH
	INC R0
	;This Cause a stall
	LD R0 Y+
	ADDI R0 0x00
	;This Cause a stall
	LDFB R0 R1 X
	ADDI R0 0x00
	;This Cause a stall
	LPM R0 X+
	ADDI R0 0x3F
	;This Cause a stall
	IN R0 SPH
	INC R0
	;This causes a forward

	JMP MAIN
