;Reset Interrupt Vector
	JMP INIT
;V-Blank Interrupt
	JMP halt_execution
;Illegal Opcode Exception
	JMP MAIN

:INIT
	;Initialize The Stack Pointer
	LDI R0 0xFF
	OUT SPH R0
	OUT SPL R0

	;Initialize The Call Stack Pointer.
	LDI R0 0x00
	OUT CSP R0

	LDI R31 0x00 ;Set up sucess flag
	LDI R30 0x00 ;This register will be used to track which test the program may fail on.

:MAIN
	CALL TEST_INC ;LED = 0x01
	CALL TEST_DEC ;LED = 0x02
	CALL TEST_ADD ;LED = 0x03
	CALL TEST_ADDI ;LED = 0x04
	CALL TEST_SUB ;LED = 0x05
	CALL TEST_SUBI ;LED = 0x06
	CALL TEST_CP ;LED = 0x07
	CALL TEST_CPI ;LED = 0x08
	CALL TEST_MUL ;LED = 0x09
	CALL TEST_MULI ;LED = 0x0A
	CALL TEST_AND ;LED = 0x0B
	CALL TEST_ANDI ;LED = 0x0C
	CALL TEST_OR  ;LED = 0x0D
	CALL TEST_ORI ;LED = 0x0E
	CALL TEST_SHL ;LED = 0x0F
	CALL TEST_SHR ;LED = 0x10
	CALL TEST_COM ;LED = 0x11
	CALL TEST_INV ;LED = 0x12
	CALL TEST_LDI ;LED = 0x13
	CALL TEST_LPM ;LED = 0x14
	CALL TEST_STR_LD ;LED = 0x15
	CALL TEST_STFB_LDFB ;LED = 0x16
	CALL TEST_PUSH_POP ;LED = 0x17
	CALL TEST_MOV ;LED = 0x18
	CALL TEST_MOVR ;LED = 0x19
	CALL TEST_OUT_IN ;LED = 0x1A
	CALL TEST_JMP ;LED = 0x1B
	CALL TEST_BRCS ;LED = 0x1C
	CALL TEST_BRCC ;LED = 0x1D
	CALL TEST_BREQ ;LED = 0x1E
	CALL TEST_BRNE ;LED = 0x1F
	CALL TEST_BRNG ;LED = 0x20
	CALL TEST_BRPS ;LED = 0x21

:vga_out
	OUT LED R30
	OUT LED R30
	CALL WRITE_VGA
:halt_execution
	OUT LED R30
	;Halt
	HLT

;Test Increment Instruction
:TEST_INC
	LDI R0 0x00
	INC R0
	CPI R0 0x01
	BREQ test_inc_ret
	CALL TEST_FAILED
:test_inc_ret
	INC R30
	OUT LED R30
	RET

;Test Decrement Instruction
:TEST_DEC
	LDI R0 0x01
	DEC R0
	BREQ test_dec_ret
	CALL TEST_FAILED
:test_dec_ret
	INC R30
	OUT LED R30
	RET

;Test Addition Instruction.
:TEST_ADD
	LDI R0 0x5A
	LDI R1 0xA5
	NOP ;Prevent Data Hazard Side Effect
	NOP ;Prevent Data Hazard Side Effect
	ADD R1 R0
	CPI R1 0xFF
	BREQ test_add_ret
	CALL TEST_FAILED
:test_add_ret
	INC R30
	OUT LED R30
	RET

;Test Add Immeadiate Instruction
:TEST_ADDI
	LDI R0 0x5A
	ADDI R0 0xA5
	CPI R0 0xFF
	BREQ test_addi_ret
	CALL TEST_FAILED
:test_addi_ret
	INC R30
	OUT LED R30
	RET

;Test Subtract Instruction
:TEST_SUB
	LDI R0 0xFF
	LDI R1 0x0F
	NOP ;Prevent Data Hazard Side Effect
	NOP ;Prevent Data Hazard Side Effect
	SUB R0 R1
	CPI R0 0xF0
	BREQ test_sub_ret
	CALL TEST_FAILED
:test_sub_ret
	INC R30
	OUT LED R30
	RET

;Test Immeadiate Subtraction
:TEST_SUBI
	LDI R0 0xFF
	SUBI R0 0x0F
	CPI R0 0xF0
	BREQ test_subi_ret
	CALL TEST_FAILED
:test_subi_ret
	INC R30
	OUT LED R30
	RET

;Test Register to Register Compare
:TEST_CP
	LDI R0 0xFF
	LDI R1 0xF0
	NOP ;Prevent Data Hazard Side Effect
	NOP ;Prevent Data Hazard Side Effect
	CP R0 R1
	BRNE test_cp_2
	CALL TEST_FAILED
:test_cp_2
	LDI R0 0xFF
	LDI R1 0xFF
	NOP ;Prevent Data Hazard Side Effect
	NOP ;Prevent Data Hazard Side Effect
	CP R0 R1
	BREQ test_cp_ret
	CALL TEST_FAILED
:test_cp_ret
	INC R30
	OUT LED R30
	RET

;Test Compare Immeadiate Instruction
:TEST_CPI
	LDI R0 0xFF
	CPI R0 0xF0
	BRNE test_cpi_2
	CALL TEST_FAILED
:test_cpi_2
	LDI R0 0xFF
	CPI R0 0xFF
	BREQ test_cpi_ret
	CALL TEST_FAILED
:test_cpi_ret
	INC R30
	OUT LED R30
	RET

;Test Multiply Instruction
:TEST_MUL
	LDI R0 0xFF
	LDI R1 0x03
	NOP ;Prevent Data Hazard Side Effect
	NOP ;Prevent Data Hazard Side Effect
	MUL R0 R1
	CPI R0 0xFD
	BREQ test_mul_chk_hb
	CALL TEST_FAILED
:test_mul_chk_hb
	CPI R1 0x02
	BREQ test_mul_ret
	CALL TEST_FAILED
:test_mul_ret
	INC R30
	OUT LED R30
	RET

;Test Multiply Immeadiate Instruction
:TEST_MULI
	LDI R0 0xFF
	MULI R0 R1 0x03
	CPI R0 0xFD
	BREQ test_mul_chk_hb
	CALL TEST_FAILED
:test_mul_chk_hb
	CPI R1 0x02
	BREQ test_mul_ret
	CALL TEST_FAILED
:test_mul_ret
	INC R30
	OUT LED R30
	RET

;Test And Immeadiate Instruction
:TEST_AND
	LDI R0 0xFF
	LDI R1 0x0F
	NOP ;Prevent Data Hazard Side Effect
	NOP ;Prevent Data Hazard Side Effect
	AND R1 R0
	CPI R1 0x0F
	BREQ test_and_ret
	CALL TEST_FAILED
:test_and_ret
	INC R30
	OUT LED R30
	RET

;Test Immeadiate Bitwise And Instruction
:TEST_ANDI
	LDI R0 0xFF
	ANDI R0 0x0F
	CPI R0 0x0F
	BREQ test_andi_ret
	CALL TEST_FAILED
:test_andi_ret
	INC R30
	OUT LED R30
	RET

;Test Or Instruction
:TEST_OR
	LDI R0 0xF0
	LDI R1 0x0F
	NOP ;Prevent Data Hazard Side Effect
	NOP ;Prevent Data Hazard Side Effect
	OR R1 R0
	CPI R1 0xFF
	BREQ test_or_ret
	CALL TEST_FAILED
:test_or_ret
	INC R30
	OUT LED R30
	RET

;Test Or Immeadiate Instruction
:TEST_ORI
	LDI R0 0xF0
	ORI R1 0x0F
	CPI R1 0xFF
	BREQ test_or_ret
	CALL TEST_FAILED
:test_or_ret
	INC R30
	OUT LED R30
	RET

;Test Shift Right Instruction
:TEST_SHR
	LDI R0 0xFF
	SHR R0
	CPI R0 0x7F
	BREQ test_shr_ret
	CALL TEST_FAILED
:test_shr_ret
	INC R30
	OUT LED R30
	RET

;Test Shift Left Instruction
:TEST_SHL
	LDI R0 0xFF
	SHL R0
	CPI R0 0xFE
	BREQ test_shl_ret
	CALL TEST_FAILED
:test_shl_ret
	INC R30
	OUT LED R30
	RET

;Test 2's Complement Instruction
:TEST_COM
	LDI R0 0x01
	COM R0
	CPI R0 0xFF
	BREQ test_com_ret
	CALL TEST_FAILED
:test_com_ret
	INC R30
	OUT LED R30
	RET

;Test Bit Inversion Instruction
:TEST_INV
	LDI R0 0x00
	INV R0
	CPI R0 0xFF
	BREQ test_inv_ret
	CALL TEST_FAILED
:test_inv_ret
	INC R30
	OUT LED R30
	RET

;Load Immeadiate Instruction Test
:TEST_LDI
	LDI R0 0x4B
	NOP ;These two nops are not neccessary for correct execution, but by placing them after the immeadiate load, it will insure that the value of R0 read from the register file is compared to the imemadiate constant in the CPI Instruction.
	NOP
	CPI R0 0x4B
	BREQ test_ldi_ret
	CALL TEST_FAILED
:test_ldi_ret
	INC R30
	OUT LED R30
	RET

:TEST_LPM
	;Initialize Memory Pointer to point at the opcode of the first instruciton of this program (JMP)
	LDI R0 0x00
	OUT ZH R0
	OUT ZL R0
	LPM R1 Z ;This and the next instruction will cause a pipeline stall and then a forwarding of the bottom data word in MEM/WB to the top/primary input of the alu.
	CPI R1 0x38
	BREQ test_lpm_ret
	CALL TEST_FAILED
:test_lpm_ret
	INC R30
	OUT LED R30
	RET

;This Tests LD, STR and each memory Pointer and Its post Increments.
:TEST_STR_LD
	;Initialize Memory Pointers
	LDI R0 0x0F
	OUT XH R0
	OUT XL R0
	LDI R10 0x0D
	OUT YH R0
	OUT YL R10
	LDI R11 0x0B
	OUT ZH R0
	OUT ZL R11
	LDI R1 0x72
	LDI R2 0x71
	LDI R3 0x70
	STR X+ R1
	STR X R1
	STR Y+ R2
	STR Y R2
	STR Z+ R3
	STR Z R3
	;Check Pointer Post Increments
	IN R4 XL
	IN R5 YL
	IN R6 ZL
	CPI R4 0x10
	BREQ yl_inc_test
	CALL TEST_FAILED
:yl_inc_test
	CPI R5 0x0E
	BREQ zl_inc_test
	CALL TEST_FAILED
:zl_inc_test
	CPI R6 0x0C
	BREQ load_test_begin
	CALL TEST_FAILED
:load_test_begin
	;Initialize Memory Pointers
	LDI R0 0x0F
	LDI R11 0x0B
	OUT ZH R0
	OUT ZL R11
	LD R4 Z+
	CP R4 R3
	BREQ test_ld_1
	CALL TEST_FAILED
:test_ld_1
	LD R4 Z+
	CP R4 R3
	BREQ test_ld_2
	CALL TEST_FAILED
:test_ld_2
	LD R4 Z+
	CP R4 R2
	BREQ test_ld_3
	CALL TEST_FAILED
:test_ld_3
	LD R4 Z+
	CP R4 R2
	BREQ test_ld_4
	CALL TEST_FAILED
:test_ld_4
	LD R4 Z+
	CP R4 R1
	BREQ test_ld_5
	CALL TEST_FAILED
:test_ld_5
	LD R4 Z+
	CP R4 R1
	BREQ test_str_ld_ret
	CALL TEST_FAILED
:test_str_ld_ret
	INC R30
	OUT LED R30
	RET

;Test Load & Store to Framebuffer
:TEST_STFB_LDFB
	;Initialize register with a write value.
	LDI R0 0xFF
	LDI R2 0xFF
	;Initialize Memory Pointer
	LDI R1 0x00
	OUT ZH R1
	OUT ZL R1
	;STFB The Data
	STR Z R0 R2
	;LDFB The Data
	LDFB R3 R4 Z
	CP R3 R2
	BREQ test_ldfb_h
	CALL TEST_FAILED
:test_ldfb_h
	CPI R4 0x0F ; Framebuffer is only 12 bits wide thus top nibble get zeroed out when reading in.
	BREQ test_stfb_ldfb_ret
	CALL TEST_FAILED
:test_stfb_ldfb_ret
	INC R30
	OUT LED R30
	RET

;Test Push and Pop
:TEST_PUSH_POP
	;Initialize Stack Pointer
	LDI R0 0xFF
	OUT SPH R0
	OUT SPL R0
	LDI R1 0x56
	PUSH R1
	;Check Stack Pointer Decrement
	NOP ;Nop For safety
	IN R1 SPL
	CPI R1 0xFE
	BREQ test_pop
	CALL TEST_FAILED
:test_pop
	POP R1
	CPI R1 0x56 ;Stall and forward should occur here.
	BREQ test_push_pop_ptr_inc
	CALL TEST_FAILED
:test_push_pop_ptr_inc
	IN R1 SPL
	CPI R1 0xFF
	BREQ test_push_pop_ret
	CALL TEST_FAILED
:test_push_pop_ret
	INC R30
	OUT LED R30
	RET

;Test the move assembler alias this is implemented as a LD R0 ptr1 STR ptr2 R0, thus destroying the contents of R0
:TEST_MOV
	;Initialize Memory Pointers
	LDI R0 0xAA
	OUT ZH R0
	OUT ZL R0
	LDI R1 0xBB
	OUT YH R1
	OUT YL R1
	STR Z R1
	MOV Y Z ;Move the value pointed to by Z to the memory pointed to by Y
	LD R0 Y
	CP R0 R1 ;This should stall then forward.
	BREQ test_mov_ret
	CALL TEST_FAILED
:test_mov_ret
	INC R30
	OUT LED R30
	RET

;Test Moving of a register value
:TEST_MOVR
	LDI R0 0x37
	MOVR R1 R0
	CP R1 R0
	BREQ test_movr_ret
	CALL TEST_FAILED
:test_movr_ret
	INC R30
	OUT LED R30
	RET

;Test in and out instructions
:TEST_OUT_IN
	LDI R0 0xA3
	OUT LED R0
	IN R1 LED
	CP R1 R0
	BREQ test_out_in_ret
	CALL TEST_FAILED
:test_out_in_ret
	INC R30
	OUT LED R30
	RET

;Test jump instruciton
:TEST_JMP
	JMP test_jmp_ret
	CALL TEST_FAILED
:test_jmp_ret
	INC R30
	OUT LED R30
	RET

;Test Branch if Carry Set
:TEST_BRCS
	LDI R0 0x01
	ADDI R0 0xFF
	BRCS test_brcs_1
:brcs_2
	CALL TEST_FAILED
	JMP test_brcs_ret
:test_brcs_1
	LDI R0 0x00
	ADDI R0 0x0A
	BRCS brcs_2
:test_brcs_ret
	INC R30
	OUT LED R30
	RET

;Test Branch if Carry Clear
:TEST_BRCC
	LDI R0 0x00
	ADDI R0 0x0A
	BRCC test_brcc_1
:brcc_2
	CALL TEST_FAILED
	JMP test_brcc_ret
:test_brcc_1
	LDI R0 0x01
	ADDI R0 0xFF
	BRCC brcc_2
:test_brcc_ret
	INC R30
	OUT LED R30
	RET

;Test Branch if Equal i.e. Zero flag = 1 for taken, 0 for not taken.
:TEST_BREQ
	LDI R0 0xFF
	ADDI R0 0x01
	BREQ test_breq_1
:test_breq_2
	CALL TEST_FAILED
	JMP test_breq_ret
:test_breq_1
	LDI R0 0x0A
	ADDI R0 0x01
	BREQ test_breq_2
:test_breq_ret
	INC R30
	OUT LED R30
	RET

;Test Branch if Not Equal i.e. Zero flag = 1 for not taken, 0 for taken.
:TEST_BRNE
	LDI R0 0x0A
	ADDI R0 0x01
	BRNE test_brne_1
:test_brne_2
	CALL TEST_FAILED
	JMP test_brne_ret
:test_brne_1
	LDI R0 0xFF
	ADDI R0 0x01
	BRNE test_brne_2
:test_brne_ret
	INC R30
	OUT LED R30
	RET

;Test Branch if Negative i.e. Negative Flag = 1 for taken, 0 for not taken.
:TEST_BRNG
	LDI R0 0x7F
	ADDI R0 0x01
	BRNG test_brng_1
:test_brng_2
	CALL TEST_FAILED
	JMP test_brng_ret
:test_brng_1
	LDI R0 0x7E
	ADDI R0 0x01
	BRNG test_brng_2
:test_brng_ret
	INC R30
	OUT LED R30
	RET

;Test Branch if Positive i.e. Negative Flag = 0 for taken, 1 for not taken.
:TEST_BRPS
	LDI R0 0x7E
	ADDI R0 0x01
	BRPS test_brps_1
:test_brps_2
	CALL TEST_FAILED
	JMP test_brps_ret
:test_brps_1
	LDI R0 0x7F
	ADDI R0 0x01
	BRPS test_brps_2
:test_brps_ret
	INC R30
	OUT LED R30
	RET

;If any of the tests fails, this subroutine is called and the global fail flag is set thus, when the processor finishes execution, all red will be written to the framebuffer rather than all green.
:TEST_FAILED
	LDI R31 0xFF
	JMP vga_out

;These Do not get their Own tests as the program puts these instructions through their paces.
:TEST_CALL
:TEST_RET
:TEST_RETI
:TEST_HLT

:WRITE_VGA
	CPI R31 0x00
	BRNE green
;Red
	LDI R4 0x00
	LDI R5 0x0F
	JMP write_fb
:green
	LDI R4 0xF0
	LDI R5 0x00
:write_fb
	LDI R0 0x80
:fb_lop_2
	LDI R1 0x96
:fb_lop_1
	STFB Z+ R4 R5
	DEC R1
	BRNE fb_lop_1
	DEC R0
	BRNE fb_lop_2
	RET
