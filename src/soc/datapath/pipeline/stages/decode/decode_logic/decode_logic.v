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

	output reg [1:0] reg_file_wen
);

	always @ (*)
	begin
		case(instruction[7:0])
			//NOP
			8'h00 :
			begin

			end
			//Add Immeadiate, Increment, Decrement, Sub Immeadiate, Complement, Invert
			8'hBC :
			begin

			end
			//Add
			8'h80 :
			begin

			end
			//Subtract
			8'

			default
			begin

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
