:INIT
	LDI R1 0xFF
	OUT SPH R1
	OUT SPL R1

	LDI R1 0x00
	OUT ZH R1
	OUT ZL R1

	LDI R29 0x00
	LDI R30 0x00
	LDI R31 0x00
:MAIN
	INC R29
	INC R30
	INC R31
	CALL WRITE_PIXEL

	JMP MAIN


:WRITE_PIXEL
	;Three Registers, Red R29, Green R30, Blue R31
	;Shift green left four times
	SHL R30
	SHL R30
	SHL R30
	SHL R30
	;Or Blue and Green into One register.
	OR R30 R31
	;Store to the framebuffer
	STFB Z+ R30 R29

	RET
