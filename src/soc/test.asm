;Reset Interrupt Vector
	JMP INIT
;V Blank Interrupt
	JMP MAIN
;Illegal Opcode Exception
	JMP MAIN

:INIT
	;Initialize the stack Pointer.
	LDI R0 0xFF
	;Both of these instructions will result in a forward.
	OUT SPH R0
	OUT SPL R0

	LDI R16 0x00

:MAIN
	;JMP DELAY
:delay_ret
	CPI R16 0x00
	BREQ multest_call
	CPI R16 0x01
	BREQ add_sub_test_call
	CPI R16 0x02
	BREQ shift_test_call
	CPI R16 0x03
	BREQ bitwise_test_call

:multest_call
	JMP MULT_TEST
:mulltest_ret
	JMP bitwise_test_ret
:add_sub_test_call
	JMP ADD_TEST
:add_sub_test_ret
	JMP bitwise_test_ret
:shift_test_call
	JMP SHIFT_TEST
:shift_test_ret
	JMP bitwise_test_ret
:bitwise_test_call
	LDI R16 0x00
	JMP BITWISE_TEST
:bitwise_test_ret
	INC R16
	JMP MAIN

:MULT_TEST
	;Load in a few immeadiate values, multiply them and write the result to the sfr that handles
	LDI R17 0x02
	LDI R18 0x03
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	;The Next three instructions will use bypassed data.
	MUL R18 R17
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	MULI R18 R17 0x02
	;Should be 0x0C
	OUT LED R18
	JMP mulltest_ret

:ADD_TEST
	LDI R17 0x0F
	LDI R18 0x0F
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	ADD R17 R18
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	SUB R17 R18
	;Should be 0x0F
	OUT LED R17
	JMP add_sub_test_ret

:SHIFT_TEST
	LDI R17 0x0F
	SHR R17
	SHR R17
	SHR R17
	SHL R17
	SHL R17
	;Should be 0x04
	OUT LED R17
	JMP shift_test_ret

:BITWISE_TEST
	LDI R17 0xFF
	LDI R18 0x09
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	NOP ;Prevent incorrect execution due to oversight in forwarding logic... SIM SIM SIM
	AND R17 R18
	;Should be 0x09
	OUT LED R17
	JMP bitwise_test_ret

;Triple Nested Delay Loop ~3 Seconds
:DELAY
	LDI R1 0x03
:lop1
	LDI R2 0x03
:lop2
	LDI R3 0x03
:lop3
	NOP
	DEC R3
	BRNE lop3
	DEC R2
	BRNE lop2
	DEC R1
	BRNE lop1

	JMP delay_ret
