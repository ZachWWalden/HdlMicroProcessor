;This program will not trigger any interlocks.

	LDI R5 0x00
	LDI R0 0xFF
	LDI R1 0xFE
	LDI R2 0xFD
	LDI R3 0xFC
	LDI R4 0xFB

	OUT ZH R5
	OUT ZL R5
	OUT YH R5
	OUT YL R5
	OUT XH R5
	OUT XL R5
	OUT SPH R0
	OUT SPL R0

	;Write The registers out to ram
	STR Z+ R0
	STFB X+ R5 R1
	STR Z+ R2
	STFB X+ R5 R3
	STR Z+ R4
