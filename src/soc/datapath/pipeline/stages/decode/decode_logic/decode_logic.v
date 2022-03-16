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
	output reg [2:0] id_ex_data_input_sel,

	output reg [1:0] ex_mem_data_input_sel,

	output reg main_memory_enable,
	output reg frame_buffer_enable,
	output reg call_stack_enable,
	output reg [6:0] mem_ptr_ctl,
	output reg [1:0] sfr_wren,
	output reg [1:0] mem_wren,
	output reg [3:0] mem_wb_data_input_sel,

	output reg [1:0] reg_file_wen,

	output reg return_in_pipeline, 			//To the Hazard Unit
	output reg stall_fetch, 			//To the Hazard Unit
	output reg illegal_opcode_exception, 		//To the Interrupt Contorller.
	output reg halt 				//To the Hazard Unit
);

	always @ (*)
	begin
		case(instruction[7:0])
			//NOP
			8'h00 :
			begin
				//All Zeros
				reg_file_ren <= 2'b00;
				id_ex_data_input_sel <= 3'b000;
				ex_mem_data_input_sel <= 2'b00;
				main_memory_enable <= 1'b0;
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wren <= 2'b00;
				mem_wb_data_input_sel <= 4'h0;
				reg_file_wen <= 2'b00;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//Add Immeadiate, Increment, Decrement, Sub Immeadiate, Complement, Invert, Compare Immeadiate
			8'hBC :
			begin
				reg_file_ren <= 2'b01;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//Add, Subtract, Compare
			8'h80 :
			begin
				reg_file_ren <= 2'b11;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//Multiply
			8'h8E :
			begin
				reg_file_ren <= 2'b11;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= instruction[21];

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0

			end
			//Mulitply Immeadiate
			8'h9E :
			begin
				reg_file_ren <= 2'b01;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= instruction[21];

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//And, Or
			8'h97 :
			begin
				reg_file_ren <= 2'b11;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//And Immeadiate, Or Immeadiate
			8'h9B :
			begin
				//Read destination operand from the register file, load it into
				reg_file_ren <= 2'b01;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//Shift Right, Shift Left
			8'hA5 :
			begin
				reg_file_ren <= 2'b01;

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//Load, Load Framebuffer, Pop
			8'hFB :
			begin
				reg_file_ren <= 2'b00

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//Store, Store Framebuffer, Push
			8'hC4 :
			begin

				reg_file_wen <= 2'b00;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//Load Immeadiate
			8'hF8 :
			begin
				//This moves the immeadiate data into the destination register.
				reg_file_ren <= 2'b00

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//Move Register, In, Out
			8'h9C :
			begin

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//Control Flow Instructions
			8'h38 :
			begin
				//All Zeros
				reg_file_ren <= 2'b00;
				id_ex_data_input_sel <= 3'b000;
				ex_mem_data_input_sel <= 2'b00;
				main_memory_enable <= 1'b0;
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wren <= 2'b00;
				mem_wb_data_input_sel <= 4'h0;
				reg_file_wen <= 2'b00;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//Call
			8'h42 :
			begin
				reg_file_ren <= 2'b00

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//Return, Return From Interrupt
			8'h43 :
			begin
				reg_file_ren <= 2'b00

				return_in_pipeline <= 1'b1;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//Load From Program Memory
			8'hF9 :
			begin
				reg_file_ren <= 2'b00

				reg_file_wen[0] <= instruction[21];
				reg_file_wen[1] <= 0;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b0
			end
			//Halt
			8'h1F :
			begin
				//All Zeros
				reg_file_ren <= 2'b00;
				id_ex_data_input_sel <= 3'b000;
				ex_mem_data_input_sel <= 2'b00;
				main_memory_enable <= 1'b0;
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wren <= 2'b00;
				mem_wb_data_input_sel <= 4'h0;
				reg_file_wen <= 2'b00;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b0;
				halt <= 1'b1
			end
			//Default Case
			default
			begin
				//Illegal Opcode Exception. This is very useful for security. All other control signals are NOP'd
				//All Zeros
				reg_file_ren <= 2'b00;
				id_ex_data_input_sel <= 3'b000;
				ex_mem_data_input_sel <= 2'b00;
				main_memory_enable <= 1'b0;
				frame_buffer_enable <= 1'b0;
				call_stack_enable <= 1'b0;
				mem_ptr_ctl <= 7'b0000000;
				sfr_wren <= 2'b00;
				mem_wren <= 2'b00;
				mem_wb_data_input_sel <= 4'h0;
				reg_file_wen <= 2'b00;

				return_in_pipeline <= 1'b0;
				stall_fetch <= 1'b0;
				illegal_opcode_exception <= 1'b1;
				halt <= 1'b0
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
