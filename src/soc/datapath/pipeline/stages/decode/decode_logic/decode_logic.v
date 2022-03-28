/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module decode_logic(
	input [31:0] instruction,

	output reg [1:0] reg_file_ren,
	output reg id_ex_data_input_sel,

	output reg [1:0] ex_mem_data_input_sel,

	output reg main_memory_enable,
	output reg frame_buffer_enable,
	output reg call_stack_enable,
	output reg prog_mem_enable,
	output reg [6:0] mem_ptr_ctl,
	output reg [1:0] sfr_wren,
	output reg mem_wen,

	output reg [1:0] reg_file_wen,

	output reg return_in_pipeline, 			//To the Hazard Unit
	output reg stall_fetch, 			//To the Hazard Unit
	output reg illegal_opcode_exception, 		//To the Interrupt Contorller.
	output reg halt 				//To the Hazard Unit
);

	always @ (*)
	begin
		case(instruction[7:0])
			//NOP DONE
			8'h00 :
			begin
				//All Zeros
				reg_file_ren <= 2'b00;
				id_ex_data_input_sel <= 1'b0;
				ex_mem_data_input_sel <= 2'b00;
				main_memory_enable <= 1'b0;
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;

				reg_file_wen <= 2'b00;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//Add Immeadiate, Increment, Decrement, Sub Immeadiate, Complement, Invert, Compare Immeadiate   DONE
			8'hBC :
			begin
				reg_file_ren <= 2'b01; 			//Load Destination Register Operand. This will be in ID/EX Data Top

				id_ex_data_input_sel <= 1'b1; 		//Select Imemadiate
				ex_mem_data_input_sel <= 2'b10; 	//Select ALU Result Bottom, the bottom bit does not matter in this case
				main_memory_enable <= 1'b0; 		//No memory Accesses, Load Store Architecture.
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//Add, Subtract, Compare   DONE
			8'h80 :
			begin
				reg_file_ren <= 2'b11;

				id_ex_data_input_sel <= 1'b0; 		//Select Register File Output
				ex_mem_data_input_sel <= 2'b10; 	//Select ALU Result Bottom, the bottom bit does not matter in this case
				main_memory_enable <= 1'b0; 		//No memory Accesses, Load Store Architecture.
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//Multiply DONE
			8'h8E :
			begin
				reg_file_ren <= 2'b11;

				id_ex_data_input_sel <= 1'b0; 		//Select Register File Output
				ex_mem_data_input_sel <= 2'b11; 	//Select ALU Result Bottom & Top
				main_memory_enable <= 1'b0; 		//No memory Accesses, Load Store Architecture.
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= instruction[21];

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;

			end
			//Mulitply Immeadiate   DONE
			8'h9E :
			begin
				reg_file_ren <= 2'b01;

				id_ex_data_input_sel <= 1'b1; 		//Select Imemadiate
				ex_mem_data_input_sel <= 2'b11; 	//Select ALU Result Bottom & Top
				main_memory_enable <= 1'b0; 		//No memory Accesses, Load Store Architecture.
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= instruction[21];

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//And, Or   DONE
			8'h97 :
			begin
				reg_file_ren <= 2'b11;

				id_ex_data_input_sel <= 1'b0; 		//Select Register File Output
				ex_mem_data_input_sel <= 2'b10; 	//Select ALU Result Bottom, the bottom bit does not matter in this case
				main_memory_enable <= 1'b0; 		//No memory Accesses, Load Store Architecture.
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//And Immeadiate, Or Immeadiate   DONE
			8'h9B :
			begin
				//Read destination operand from the register file, load it into
				reg_file_ren <= 2'b01;

				id_ex_data_input_sel <= 1'b1; 		//Select Imemadiate
				ex_mem_data_input_sel <= 2'b10; 	//Select ALU Result Bottom, the bottom bit does not matter in this case
				main_memory_enable <= 1'b0; 		//No memory Accesses, Load Store Architecture.
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//Shift Right, Shift Left   DONE
			8'hA5 :
			begin
				reg_file_ren <= 2'b01;

				id_ex_data_input_sel <= 1'b0; 		//Select Register File Output
				ex_mem_data_input_sel <= 2'b10; 	//Select ALU Result Bottom, the bottom bit does not matter in this case
				main_memory_enable <= 1'b0; 		//No memory Accesses, Load Store Architecture.
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//Load, Load Framebuffer, Pop   DONE
			8'hFB :
			begin
				reg_file_ren <= 2'b00;

				id_ex_data_input_sel <= 1'b0;
				ex_mem_data_input_sel <= 2'b00;
				main_memory_enable <= instruction[20];  		//Select Between The correct memory
				frame_buffer_enable <= ~instruction[20];
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;

				case(instruction[19:18])
					//Stack Pointer, i.e. this instruction is a Pop
					2'b00 :
					begin
						mem_ptr_ctl <= 7'b0000010; 				//Stack Pointer Increment
					end
					//X Pointer
					2'b01 :
					begin
						if(instruction[22] == 1'b1)
						begin
							mem_ptr_ctl <= 7'b0010000;  			//X Pointer Post Increment
						end
						else
						begin
							mem_ptr_ctl <= 7'b0000000;
						end
					end
					//Y Pointer
					2'b10 :
					begin
						if(instruction[22] == 1'b1)
						begin
							mem_ptr_ctl <= 7'b0100000;  			//Y Pointer Post Increment
						end
						else
						begin
							mem_ptr_ctl <= 7'b0000000;
						end
					end
					//Z Pointer
					2'b11 :
					begin
						if(instruction[22] == 1'b1)
						begin
							mem_ptr_ctl <= 7'b1000000; 			//Z Pointer Post Increment
						end
						else
						begin
							mem_ptr_ctl <= 7'b0000000;
						end
					end
				endcase

				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;

				reg_file_wen[0] <= instruction[21];  					//Write Load Result Bottom is the Write Result Bit is set in the instruciton word.
				reg_file_wen[1] <= (~instruction[20] & instruction[21]);  		//Write Load Result Top if this is a LDFB and Wrtie Result is set.

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//Store, Store Framebuffer, Push   DONE
			8'hC6 :
			begin
				reg_file_ren[0] <= instruction[21];  					//Read Load Result Bottom is the Write Result Bit is set in the instruciton word.
				reg_file_ren[1] <= (~instruction[20] & instruction[21]);  		//Read Load Result Top if this is a LDFB and Wrtie Result is set.

				id_ex_data_input_sel <= 1'b0;
				ex_mem_data_input_sel <= 2'b00;
				main_memory_enable <= instruction[20];  		//Select Between The correct memory
				frame_buffer_enable <= ~instruction[20];
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;

				case(instruction[19:18])
					//Stack Pointer, i.e. this instruction is a Push
					2'b00 :
					begin
						mem_ptr_ctl <= 7'b0000001; 				//Stack Pointer Decrement
					end
					//X Pointer
					2'b01 :
					begin
						if(instruction[22] == 1'b1)
						begin
							mem_ptr_ctl <= 7'b0010000;  			//X Pointer Post Increment
						end
						else
						begin
							mem_ptr_ctl <= 7'b0000000;
						end
					end
					//Y Pointer
					2'b10 :
					begin
						if(instruction[22] == 1'b1)
						begin
							mem_ptr_ctl <= 7'b0100000;  			//Y Pointer Post Increment
						end
						else
						begin
							mem_ptr_ctl <= 7'b0000000;
						end
					end
					//Z Pointer
					2'b11 :
					begin
						if(instruction[22] == 1'b1)
						begin
							mem_ptr_ctl <= 7'b1000000; 			//Z Pointer Post Increment
						end
						else
						begin
							mem_ptr_ctl <= 7'b0000000;
						end
					end
				endcase

				sfr_wren <= 2'b00;
				mem_wen <= 1'b1;

				reg_file_wen <= 2'b00;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//Load Immeadiate   DONE
			8'hF8 :
			begin
				//This moves the immeadiate data into the destination register.
				reg_file_ren <= 2'b00;

				id_ex_data_input_sel <= 1'b1; 		//Select Imemadiate
				ex_mem_data_input_sel <= 2'b00; 	//Select the two data words in ID/EX to be placed in EX/MEM
				main_memory_enable <= 1'b0; 		//No memory Accesses, Load Store Architecture.
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 1'b0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//Move Register, In, Out   DONE
			8'h9C :
			begin
				//OUT SFR Write Address is the "Top" address, IN SFR Read Addres is "Bottom" Address
				//This block
				if(instruction[19:18] == 2'b00)
				begin
					//Move Register.
					reg_file_ren <= 2'b10; 		//Read Top address from the register file.
					sfr_wren <= 2'b00;
					reg_file_wen <= 2'b01;  		//Write the read value to the bottom address. Data values are flipped coming out of the register file, alu resultss are then reflipped. So, only storage data need to be flipped.
				end
				else if(instruction[19:18] == 2'b01)
				begin
					//IN.
					reg_file_ren <= 2'b00; 		//Read Top address from the register file.
					sfr_wren <= 2'b10;
					reg_file_wen <= 2'b01;  		//Write the read value to the bottom address. Data values are flipped coming out of the register file, alu resultss are then reflipped. So, only storage data need to be flipped.
				end
				else if(instruction[19:18] == 2'b10)
				begin
					//OUT.
					reg_file_ren <= 2'b10; 		//Read Top address from the register file.
					sfr_wren <= 2'b01;
					reg_file_wen <= 2'b00;  		//Write the read value to the bottom address. Data values are flipped coming out of the register file, alu resultss are then reflipped. So, only storage data need to be flipped.
				end
				else
				begin
					//Should Never Happen, but if so do something.
					reg_file_ren <= 2'b00; 		//Read Top address from the register file.
					sfr_wren <= 2'b00;
					reg_file_wen <= 2'b00;  		//Write the read value to the bottom address. Data values are flipped coming out of the register file, alu resultss are then reflipped. So, only storage data need to be flipped.
				end

				id_ex_data_input_sel <= 1'b0; 		//Select the Reg file outputs.
				ex_mem_data_input_sel <= 2'b00; 	//Select the two data words in ID/EX to be placed in EX/MEM
				main_memory_enable <= 1'b0; 		//No memory Accesses, Load Store Architecture.
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				mem_wen <= 1'b0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//Control Flow Instructions
			8'h38 :
			begin
				//All Zeros
				reg_file_ren <= 2'b00;

				id_ex_data_input_sel <= 1'b0;
				ex_mem_data_input_sel <= 2'b00;
				main_memory_enable <= 1'b0;
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;
				reg_file_wen <= 2'b00;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//Call   DONE
			8'h42 :
			begin
				reg_file_ren <= 2'b00;

				id_ex_data_input_sel <= 1'b0;
				ex_mem_data_input_sel <= 2'b00;
				main_memory_enable <= 1'b0;
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b1;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0001000;  			//Call Stack Pointer Increment
				sfr_wren <= 2'b00;
				mem_wen <= 1'b1;
				reg_file_wen <= 2'b00;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b1; 				//This may be unecessary, depends on logic delay and the ratio between memory clock and core clock.
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//Return, Return From Interrupt   DONE
			8'h43 :
			begin
				//Invert instruction[20] signifies whether the instruction is ret or reti
				reg_file_ren <= 2'b00;

				id_ex_data_input_sel <= 1'b0;
				ex_mem_data_input_sel <= 2'b00;
				main_memory_enable <= 1'b0;
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b1;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000100;  			//Call Stack Pointer Decrement
				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;
				reg_file_wen <= 2'b00;

				return_in_pipeline <= 1'b1;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//Load From Program Memory   DONE
			8'hF9 :
			begin
				reg_file_ren <= 2'b00;

				id_ex_data_input_sel <= 1'b0;  			//Select The Register File Outputs. Does, not matter.
				ex_mem_data_input_sel <= 2'b00; 		//Select ID/EX Data, does not matter.
				main_memory_enable <= 1'b0;
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b1;

				//Check for a post increment
				if(instruction[19:18] == 2'b01)
				begin
					if(instruction[22] == 1'b1)
					begin
						mem_ptr_ctl <= 7'b0010000; 		//X Pointer Post Increment
					end
					else
					begin
						mem_ptr_ctl <= 7'b0000000;
					end
				end
				else if(instruction[19:18] == 2'b10)
				begin
					if(instruction[22] == 1'b1)
					begin
						mem_ptr_ctl <= 7'b0100000; 		//Y Pointer Post Increment
					end
					else
					begin
						mem_ptr_ctl <= 7'b0000000;
					end
				end
				else if(instruction[19:18] == 2'b11)
				begin
					if(instruction[22] == 1'b1)
					begin
						mem_ptr_ctl <= 7'b1000000; 		//Z Pointer Post Increment
					end
					else
					begin
						mem_ptr_ctl <= 7'b0000000;
					end
				end
				else
				begin
					if(instruction[22] == 1'b1)
					begin
						mem_ptr_ctl <= 7'b0000000;  		//Do not modify the value of the stack pointer.
					end
					else
					begin
						mem_ptr_ctl <= 7'b0000000;
					end
				end

				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0;
			end
			//Halt   DONE
			8'h1F :
			begin
				//All Zeros
				reg_file_ren <= 2'b00;

				id_ex_data_input_sel <= 1'b0;
				ex_mem_data_input_sel <= 2'b00;
				main_memory_enable <= 1'b0;
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;
				reg_file_wen <= 2'b00;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b1;
			end
			//Default Case   DONE
			default
			begin
				//Illegal Opcode Exception. This is very useful for security. All other control signals are NOP'd
				//All Zeros
				reg_file_ren <= 2'b00;

				id_ex_data_input_sel <= 1'b0;
				ex_mem_data_input_sel <= 2'b00;
				main_memory_enable <= 1'b0;
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				prog_mem_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wen <= 1'b0;
				reg_file_wen <= 2'b00;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b1;
				halt <= 1'b0;
			end
		endcase
	end

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("decode_logic.vcd");
  $dumpvars (0, decode_logic);
  #1;
end
`endif
endmodule
