# HdlMicroProcessor
8-bit Microprocessor with 5-stage RISC Pipeline

## Microarchitecture
![microarch](images/microarchitecture_high_res.jpg)

## Fetch Stage
![fetch](images/fetch.jpg)
The fetch stage is one of the simpler stages. It only has two modules within it. The program counter, and a multiplexor, controlled by the cpu control state machine, selects the next value of the program counter. There are four: the current value incremented, a return address, a branch target address, or an interrupt vector address. The program counter can also be stalled. In this case it simply keeps the same value.
### Functional Units
1. Program Counter Input Selection Multiplexor. This module is controlled by the pipeline hazard control state machine. Effectively, it is used so that the hazard control unit can insert an arbitrary instruction into the pipeline when the need arises in case of control flow instructions (CALL), interrupts (CALL), or pipeline hazards (NOP).
2. Program Counter. This module is used as the address for the fetch port of program memory. TThe value stored in it is the address, in program memory of the next instruction to be put into the pipeline.It outputs the its current value + 1 for propagating down the pipeline for any potential call instructions it may fetch(return address), that value is also sent to the program counter input selection mux, and is the default value to be placed at the output of that multiplexor. It has a stall signal that may be asserted by the hazard control unit in order to keep the value stored in the program counter the same across two cycles, effectively stalling the pipeline.
## Decode Stage
![decode](images/decode.jpg)
This stage translates instruction words into operands and control signals to be propagated through the pipeline. It also checks for data dependencies in relation to arithmetic operations and either stalls, or forwards operands from the execute stage or memory stage by generating control signals based on register addresses in subsequent pipeline registers. It also checks the alu flags when a control flow instruction is encountered to know whether to stall on a taken branch instruction or allow the instruction fetched in the branch’s decode cycle to propagate through the pipeline. Register file reads also occur in this stage. All register reads are clocked on the negative edge of the clock. This allows writes and reads to the same register to occur within the same clock cycle. This ia a hard requirement for a pipelined processor.
### Functional Units
1. Decode Logic. This module looks at the current instruction and generates any control signal for it that has no potential to cause a pipeline hazard. It also looks for special instructions like return, halt, or an illegal opcode, and alerts the hazard unit and interrupt controller of the events.
2. Branch Resolution Logic. This simply looks at the whether the instruction in IF/ID is a Jump or Branch instruction, based on bits [10:8] in the instruction word and the alu result flags from the operation occurring during that same cycle, determines whether to take a branch. If the branch is taken,  It alerts the Hazard Unit incurring a stall.
3. ALU Forwarding Logic. This module Looks at the instructions in IF/ID, ID/EX, and EX/MEM and determines if any data dependencies exist and either stalls to wait for a load result, or simply choose the selection signals for the alu input selection mux.
4. ID/EX Selection Mux. This determines whether immediate data values, or the register file read values are latched into ID/EX on the next clock cycle.
## Execute Stage
![execute](images/execute.jpg)
The execute stage has two major functions. First it has the Arithmetic Logic Unit which performs all the calculations of the CPU. Second it checks for data hazards related to writes to either memory or the special function register file. If a hazard is found, multiplexor control signals are generated that ensure that the sequential model of execution is presented to the programmer.
### Functional Units
1. Alu Input Mux. This mux can send 1 of 5 data values into each operand port of the alu. ID/EX top and bottom to the top and bottom operand respectively. Both operand ports can take both data values stored in EX/MEM, and MEM/WB.
2. ALU. This module contains a multiplier, bit shifter, adder/subtractor, and bitwise logic unit. It uses a common result bus with the low 2-bits of the instruction word effectively encoding a selection signal to generate individual output enable signals to each of the four functional units within the alu, ensuring no bus conflicts occur.
3. Memory forwarding logic. This module looks at the instructions in the ID/EX, EXX/MEM, and MEM/WB pipeline registers and decides whether or not data needs to be forwarded to ensure correct execution.
4. EX/MEM Data Input Selection Multiplexor. This module simply selects between the ID/EX data values and the alu result bytes for latching into the data of EX/MEM.
## Memory Acess Stage
![memaccess](images/memory.jpg)
This stage handles all data related memory accesses This is done by sending the memory write enable signal along with a one hot vector that selects which memory interface is being used. This includes tasks such as ensuring that the correct data is sent to the memory blocks depending on specific streams of instructions and their data dependencies. This is done using three multiplexers in this stage. One to ensure that the data being written to the Special Function Register File is correct. One to ensure the data being written to memory is correct. And, finally a multiplexor to ensure that the correct data is latched into the MEM/WB register on the next positive edge of the clock. IT also contains the Special function register file which is used for controlling I/O operations such as stack pointers, and the three architectural memory pointers, X, Y & Z. A multiplexor controlled by bit in the instruction word will control which of the four pointer options will be presented to the memory blocks. Other values the sfr stores are the LED output register, the 64-bit timer value, a 64-bit value for triggering timer compare matches, PWM?, and registers to control the timer, interrupt controller, and which interrupts are enabled. All forwarding capable multiplexes in this stage are controlled by the memory forwarding logic in the execute stage.
### Functional Units
1. Special Function Register File:32 8-Bit registers. This contains 4 16-bit pointer registers X, Y, Z, and the stack pointer. It also contains the call stack pointer. The two stack pointers will be incrementable as well as decrementable. It will also contain I/O registers (input and output will be separate) along with peripheral control registers to control timers
2. SFR File Input Multiplexer: This mux is used to forward either the bottom data value of the ex/mem pipeline or the current data values in MEM/WB and the previous data Values into MEM/WB.
3. Memory Address Multiplexer: Potential address inputs: X, Y & Z pointers, Stack Pointer. It termines which to use based on bits 18, and 18 in the instruction word stored in EX/MEM.
4. Memory Data Multiplexer: Potential inputs: EX/MEM top & bottom data, MEM/WB top & bottom, MEM/WB Time - 1 Top & Bottom.
5. MEM/WB register data input Multiplexer: Potential inputs: EX/MEM top & bottom data, SFR read data, MEM/WB top & bottom, and MEM/WB Time - 1
## Writeback Stage
![writeback](images/writeback.jpg)
This stage is quite simple relative to the Execute and Memory stages. It simply sends the requisite data, address, and write enable signals to the general purpose register file, along with a return address popped off of the call stack for jumping too upon completion of a return instruction.
