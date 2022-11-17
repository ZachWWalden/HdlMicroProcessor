# HdlMicroProcessor
8-bit Microprocessor with 5-stage RISC Pipeline
# Issues

## Microarchitecture
![microarch](images/microarchitecture_high_res.jpg)

### Fetch Stage
![fetch](images/fetch.jpg)
The fetch stage is one of the simpler stages. It only has two modules within it. The program counter, and a multiplexor, controlled by the cpu control state machine, selects the next value of the program counter. There are four: the current value incremented, a return address, a branch target address, or an interrupt vector address. The program counter can also be stalled. In this case it simply keeps the same value.
#### Functional Units
1. Program Counter Input Selection Multiplexor. This module is controlled by the pipeline hazard control state machine. Effectively, it is used so that the hazard control unit can insert an arbitrary instruction into the pipeline when the need arises in case of control flow instructions (CALL), interrupts (CALL), or pipeline hazards (NOP).
2. Program Counter. This module is used as the address for the fetch port of program memory. TThe value stored in it is the address, in program memory of the next instruction to be put into the pipeline.It outputs the its current value + 1 for propagating down the pipeline for any potential call instructions it may fetch(return address), that value is also sent to the program counter input selection mux, and is the default value to be placed at the output of that multiplexor. It has a stall signal that may be asserted by the hazard control unit in order to keep the value stored in the program counter the same across two cycles, effectively stalling the pipeline.
### Decode Stage
![decode](images/decode.jpg)
This stage translates instruction words into operands and control signals to be propagated through the pipeline. It also checks for data dependencies in relation to arithmetic operations and either stalls, or forwards operands from the execute stage or memory stage by generating control signals based on register addresses in subsequent pipeline registers. It also checks the alu flags when a control flow instruction is encountered to know whether to stall on a taken branch instruction or allow the instruction fetched in the branch’s decode cycle to propagate through the pipeline. Register file reads also occur in this stage. All register reads are clocked on the negative edge of the clock. This allows writes and reads to the same register to occur within the same clock cycle. This ia a hard requirement for a pipelined processor.
#### Functional Units
1. Decode Logic. This module looks at the current instruction and generates any control signal for it that has no potential to cause a pipeline hazard. It also looks for special instructions like return, halt, or an illegal opcode, and alerts the hazard unit and interrupt controller of the events.
2. Branch Resolution Logic. This simply looks at the whether the instruction in IF/ID is a Jump or Branch instruction, based on bits [10:8] in the instruction word and the alu result flags from the operation occurring during that same cycle, determines whether to take a branch. If the branch is taken,  It alerts the Hazard Unit incurring a stall.
3. ALU Forwarding Logic. This module Looks at the instructions in IF/ID, ID/EX, and EX/MEM and determines if any data dependencies exist and either stalls to wait for a load result, or simply choose the selection signals for the alu input selection mux.
4. ID/EX Selection Mux. This determines whether immediate data values, or the register file read values are latched into ID/EX on the next clock cycle.
### Execute Stage
![execute](images/execute.jpg)
The execute stage has two major functions. First it has the Arithmetic Logic Unit which performs all the calculations of the CPU. Second it checks for data hazards related to writes to either memory or the special function register file. If a hazard is found, multiplexor control signals are generated that ensure that the sequential model of execution is presented to the programmer.
#### Functional Units
1. Alu Input Mux. This mux can send 1 of 5 data values into each operand port of the alu. ID/EX top and bottom to the top and bottom operand respectively. Both operand ports can take both data values stored in EX/MEM, and MEM/WB.
2. ALU. This module contains a multiplier, bit shifter, adder/subtractor, and bitwise logic unit. It uses a common result bus with the low 2-bits of the instruction word effectively encoding a selection signal to generate individual output enable signals to each of the four functional units within the alu, ensuring no bus conflicts occur.
3. Memory forwarding logic. This module looks at the instructions in the ID/EX, EXX/MEM, and MEM/WB pipeline registers and decides whether or not data needs to be forwarded to ensure correct execution.
4. EX/MEM Data Input Selection Multiplexor. This module simply selects between the ID/EX data values and the alu result bytes for latching into the data of EX/MEM.
### Memory Acess Stage
![memaccess](images/memory.jpg)
This stage handles all data related memory accesses This is done by sending the memory write enable signal along with a one hot vector that selects which memory interface is being used. This includes tasks such as ensuring that the correct data is sent to the memory blocks depending on specific streams of instructions and their data dependencies. This is done using three multiplexers in this stage. One to ensure that the data being written to the Special Function Register File is correct. One to ensure the data being written to memory is correct. And, finally a multiplexor to ensure that the correct data is latched into the MEM/WB register on the next positive edge of the clock. IT also contains the Special function register file which is used for controlling I/O operations such as stack pointers, and the three architectural memory pointers, X, Y & Z. A multiplexor controlled by bit in the instruction word will control which of the four pointer options will be presented to the memory blocks. Other values the sfr stores are the LED output register, the 64-bit timer value, a 64-bit value for triggering timer compare matches, PWM?, and registers to control the timer, interrupt controller, and which interrupts are enabled. All forwarding capable multiplexes in this stage are controlled by the memory forwarding logic in the execute stage.
#### Functional Units
1. Special Function Register File:32 8-Bit registers. This contains 4 16-bit pointer registers X, Y, Z, and the stack pointer. It also contains the call stack pointer. The two stack pointers will be incrementable as well as decrementable. It will also contain I/O registers (input and output will be separate) along with peripheral control registers to control timers
2. SFR File Input Multiplexer: This mux is used to forward either the bottom data value of the ex/mem pipeline or the current data values in MEM/WB and the previous data Values into MEM/WB.
3. Memory Address Multiplexer: Potential address inputs: X, Y & Z pointers, Stack Pointer. It termines which to use based on bits 18, and 18 in the instruction word stored in EX/MEM.
4. Memory Data Multiplexer: Potential inputs: EX/MEM top & bottom data, MEM/WB top & bottom, MEM/WB Time - 1 Top & Bottom.
5. MEM/WB register data input Multiplexer: Potential inputs: EX/MEM top & bottom data, SFR read data, MEM/WB top & bottom, and MEM/WB Time - 1
### Writeback Stage
![writeback](images/writeback.jpg)
This stage is quite simple relative to the Execute and Memory stages. It simply sends the requisite data, address, and write enable signals to the general purpose register file, along with a return address popped off of the call stack for jumping too upon completion of a return instruction.
### Pipeline Registers
1. IF/ID. This module stores the selected instruction word (hazard unit || program memory), and the address of the instruction directly following it in memory.
2. ID/EX. This module stores the instruction word previously in IF/ID, and the address of the instruction directly following it in memory. It also stores all control signals generated in the decode pipeline stage (Alu Top & Bottom Operand Select, Memory Write Enable, Main Memory, Program Memory, Call Stack , and Frame Buffer Enable, Memory Pointer Control Signals, (these are double latched to ensure the increments or decrements occur after the address has been used, Call Stack & Stack Address Sel (Ensure correct values are pushed and popped), EX/MEM Data Input Select, Register File Write Enable, SFR File Write & Read Enable), along with the data operands.
3. EX/MEM. This module stores the instruction word previously in EX/MEM, and the address of the instruction directly following it in memory. It also stores all control signals generated in the decode pipeline stage (Memory Write Enable, Main Memory, Program Memory, Call Stack, and Frame Buffer Enable, Memory Pointer Control Signals, Call Stack & Stack Address Sel (Ensure correct values are pushed and popped), EX/MEM Data Input Select, Register File Write Enable, SFR File Write & Read Enable), along with the data operands.
4. MEM/WB. This module stores the instruction word previously in EX/MEM, and the address read out of the call stack. It also stores the data outputs of the memory stage and the values previously stored in itself.
## Programmers Model
### Instruction Set
1. No Operation - NOP <br>
	Simply wastes 1 instruction cycle. This will be the same number of clock cycles as the quickest instruction that actually does something. The effective cycle latency is 1 Cycle. <br>
2. Increment - INC Rx <br>
	This instruction increments the given register. The effective cycle latency is 1 Cycle. <br>
	Rx <- Rx + 1 <br>
3. Decrement - DEC Rx <br>
	This instruction decrements the given register. The effective cycle latency is 1 Cycle. <br>
	Rx <- Rx - 1 <br>
4. Add - ADD Rx, Ry - ADDI Rx, k <br>
	This instruction either adds two registers or an immediate value to a register. The effective cycle latency is 1 Cycle. <br>
	Rx <- Rx + Ry
	Rx <- Rx + k
5. Subtract - SUB Rx, Ry - SUBI Rx, k
	This instruction subtracts two registers or a register and an immediate value. The effective cycle latency is 1 Cycle.
	Rx <- Rx - Ry
	Rx <- Rx - k
6. Compare - CP Rx, Ry - CPI Rx, k
	This instruction subtracts the second operand from the first, but does not store the result. Thus only relevant flags are produced for any subsequent control flow instruction to make use of. The effective cycle latency is 1 Cycle.
7. Multiply - MUL Rx, Ry - MULI Rx, Rx1,  k
	This instruction multiplies either two registers or a register and an immediate value. The effective cycle latency is 1 Cycle.
	Rx, Ry <- Rx * Ry
	Rx, Ry <- Rx * k
8. And - AND Rx, Ry - ANDI Rx, k
	This instruction performs a bitwise and between either two registers or a register and an immediate value. The effective cycle latency is 1 Cycle.
	Rx <- Rx & Ry
	Rx <- Rx & k
9. Or - OR Rx, Ry - ORI Rx, k
This instruction performs a bitwise or between either two registers or a register and an immediate value. The effective cycle latency is 1 Cycle.
	Rx <- Rx | Ry
	Rx <- Rx | k
10. Shift Right - SHR Rx
	This instruction shifts the source register right by a single bit storing the result in the destination register. A zero is shifted into the high bit, which is not shifted into the carry flag. The effective cycle latency is 1 Cycle.
	Rx <- Rx >> 1
11. Shift Left - SHL Rx
	This instruction shifts the source register left by a single bit storing the result in the destination register. A zero is shifted into the lowbit, which is not shifted into the carry flag. The effective cycle latency is 1 Cycle.
	Rx <- Rx << 1
12. Complement - COM Rx
	This instruction will take the two’s complement of a given register. The effective cycle latency is 1 Cycle.
	Rx <- ~Rx + 1
13. Invert - INV Rx
	This instruction inverts all the bits in a given register. The effective cycle latency is 1 Cycle.
	Rx <- ~Rx
14. Load - LD Rx, (addr) - LDFB Rx, Ry (addr)
	This instruction loads a value from a specific memory address into a register or register pair. The effective cycle latency is 1 Cycle.
	Rx <- (ptr)
	Rx, Ry <- (ptr) (For LDFB 12 bits are loaded, the top byte is zero extended to 16-Bits)
15. Load Immediate - LDI Rx, k
	This instruction stores an 8-Bit immediate data value into the specified register. The effective cycle latency is 1 Cycle.
	Rx <- k
16. Load From Program Memory - LPM Rx, Z
	This instruction loads the contents of program memory pointed by the value in the Z register and writes it to register Rx. The effective cycle latency is 1 Cycle.
	Rx <- (ptr)
17. Store - ST (addr), Rx - STFB (addr) Rx, Ry
	This instruction stores the value in the source register into the destination register. The effective cycle latency is 1 Cycle.
	(addr) <- Rx
	(addr) <- Rx, Ry
18. Move - MOVR Rx, Ry - MOV (addr0), (addr1)
	This instruction moves a value between two addresses in data memory or two registers. The effective cycle latency is 1 Cycle.
	Rx <- Ry
	(addr0) <- (addr1)
19. In - IN Rx, SFRy
	This instruction reads in a value from one of the 32 special function registers into a general purpose register. The effective cycle latency is 1 Cycle.
	Rx <- SFRx
20. Out - OUT SFRx, Rx
	This instruction stores the values in a specified GPR into the specified SFR. The effective cycle latency is 1 Cycle.
	SFRx <- Rx
21. Jump - JMP apma					(absolute program memory address)
	This instruction changes the program counter to the absolute program memory address provided in an immediate fashion. The effective cycle latency is 2 Cycles.
	PC <- apma
22. Branch If Carry Set - BRCS apma
	This instruction sets the program counter to the specified absolute program memory address if the carry flag is set. The effective cycle latency is 2 Cycles.
	Carry flag ? PC <- apma : PC <- PC
23. Branch If Carry Clear - BRCC apma
	This instruction sets the program counter to the specified absolute program memory address if the carry flag is cleared. The effective cycle latency is 2 Cycles.
	Carry flag ? PC <- PC : PC <- apma
24. Branch If Equal - BREQ apma
	This instruction sets the program counter to the specified absolute program memory address if the zero flag is set. The effective cycle latency is 2 Cycles.
	Z flag ? PC <- apma : PC <- PC
25. Branch If Not Equal - BRNE apma
	This instruction sets the program counter to the specified absolute program memory address if the zero flag is cleared. The effective cycle latency is 2 Cycles.
	Z flag ? PC <- PC : PC <- apma
26. Branch If Negative - BRNQ apma
	This instruction sets the program counter to the specified absolute program memory address if the negative flag is set. The effective cycle latency is 2 Cycles.
	Negative flag ? PC <- apma : PC <- PC
27. Branch If Positive - BRPS apma
	This instruction sets the program counter to the specified absolute program memory address if the negative flag is cleared. The effective cycle latency is 2 Cycles.
	Negative flag ? PC <- PC : PC <- apma
28. Call - CALL apma
	This instruction pushes the address of the next instruction onto the stack and then loads the absolute program memory address into the Program Counter. The effective cycle latency is 2 Cycles.
	(CSP) <- PC + 1
	 CSP  <- CSP + 1
	 PC  <- apma
29. Return - RET
	This instruction pops the previously pushed return address into the program counter. The effective cycle latency is 5 Cycles.
	PC <- (CSP)
	CSP <- CSP - 1
30. Return From Interrupt - RETI
	This instruction is identical to return except it alerts the interrupt controller that the program has left its interrupt service routine. This allows for nested interrupts. The effective cycle latency is 5 Cycles.
	PC <- (CSP)
	CSP <- CSP - 1
31. Push - PUSH Rx
	This instruction pushes the contents of register Rx onto the stack. The effective cycle latency is 1 Cycle.
	(SP) <- Rx
	SP <- SP - 1 (8-bit registers)
32. Pop - POP Rx
	This instruction pops the contents of memory pointed to by the stack pointer and places that value in register Rx. The effective cycle latency is 1 Cycle.
	Rx <- (SP)
	SP <- SP + 1
33. Halt - HLT
	This instruction halts the processor. Only a reset or interrupt can restore the cpu to operation. The effective cycle latency is 1 Cycle.

### Register Descriptions
