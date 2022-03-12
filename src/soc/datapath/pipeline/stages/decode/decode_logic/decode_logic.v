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

	output reg main_memory_enable,
	output reg frame_buffer_enable,
	output reg call_stack_enable,
	output reg [1:0] mem_wren,

	output reg [3:0] ex_mem_data_input_sel,
	output reg [3:0] mem_wb_data_input_sel,

	output reg [1:0] reg_file_wen,

	output reg return_in_pipeline,
	output reg illegal_opcode_exception,
);

	always @ (*)
	begin
		case(instruction[7:0])
			//NOP
			8'h00 :
			begin
				//All Zeros
				reg_file_ren <= 2'b00;
			end
			//Add Immeadiate, Increment, Decrement, Sub Immeadiate, Complement, Invert, Compare Immeadiate
			8'hBC :
			begin
				reg_file_ren <= 2'b01;
			end
			//Add, Subtract, Compare
			8'h80 :
			begin
				reg_file_ren <= 2'b11;
			end
			//Multiply
			8'h8E :
			begin
				reg_file_ren <= 2'b11;
			end
			//Mulitply Immeadiate
			8'h9E :
			begin
				reg_file_ren <= 2'b01;
			end
			//And, Or
			8'h97 :
			begin
				reg_file_ren <= 2'b11;
			end
			//And Immeadiate, Or Immeadiate
			8'h9B :
			begin
				reg_file_ren <= 2'b01;
			end
			//Shift Right, Shift Left
			8'hA5 :
			begin
				reg_file_ren <= 2'b01;
			end
			//Load, Load Framebuffer, Pop
			8'hFB :
			begin
				reg_file_ren <= 2'b00
			end
			//Store, Store Framebuffer, Push
			8'hC4 :
			begin

			end
			//Load Immeadiate
			8'hF8 :
			begin
				reg_file_ren <= 2'b00
			end
			//Move Register, In, Out
			8'h9C :
			begin

			end
			//Control Flow Instructions
			8'h38 :
			begin
				reg_file_ren <= 2'b00
			end
			//Call
			8'h42 :
			begin
				reg_file_ren <= 2'b00
			end
			//Return, Return From Interrupt
			8'h43 :
			begin
				reg_file_ren <= 2'b00
			end
			//Load From Program Memory
			8'hF9 :
			begin
				reg_file_ren <= 2'b00
			end
			//Halt
			8'h1F :
			begin
				reg_file_ren <= 2'b00
			end
			//Default Case
			default
			begin
				//Illegal Opcode Exception. This is very useful for security. All other control signals are NOP'd
				reg_file_ren <= 2'b00
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
