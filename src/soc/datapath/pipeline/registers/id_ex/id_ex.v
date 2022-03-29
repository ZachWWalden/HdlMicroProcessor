/*
Module - Instruction Decode/Execution Pipeline Register
Author - Zach Walden
Last Changed - 2/12/22, 3/27/22
Description - This register holds the necessary data to ensure that the correct results exit the ALU
*/

module id_ex(
	input clock, 				//System Clock
	input nreset, 				//System Reset Signal
	input [4:0] alu_top_select_in,  	//I/O for the alu top input multiplexor selection signals. Consumed in execute
	output reg [4:0] alu_top_select_out = 0,
	input [4:0] alu_bot_select_in, 		//I/O for the alu bottom input multiplexor selection signals. Consumed in execute
	output reg [4:0] alu_bot_select_out = 0,
	input [7:0] id_ex_top_in, 		//I/O for the top register file operand read.
	output reg [7:0] id_ex_top_out = 0,
	input [7:0] id_ex_bot_in, 		//I/O for the bottom register file operand read.
	output reg [7:0] id_ex_bot_out = 0,
	input [31:0] instruction_in, 		//I/O for the instruction word.
	output reg [31:0] instruction_out = 0,
	input mem_wen_in, 					//Consumed in memory
	output reg mem_wen_out = 0,
	input main_memory_enable_in, 				//Consumed in memory
	output reg main_memory_enable_out = 0,
	input frame_buffer_enable_in, 				//Consumed in memory
	output reg frame_buffer_enable_out = 0,
	input call_stack_enable_in, 				//Consumed in memory
	output reg call_stack_enable_out = 0,
	input prog_mem_enable_in, 				//Consumed in memory
	output reg prog_mem_enable_out = 0,
	input [6:0] mem_ptr_ctl_in, 				//Consumed in memory
	output reg [6:0] mem_ptr_ctl_out = 0,
	input [1:0] ex_mem_data_input_sel_in, 			//Consumed in execute
	output reg [1:0] ex_mem_data_input_sel_out = 0,
	input [1:0] reg_file_wen_in, 				//Consumed in memory
	output reg [1:0] reg_file_wen_out = 0,
	input [1:0] sfr_file_wren_in, 				//Consumed in memory
	output reg [1:0] sfr_file_wren_out = 0,
	input [13:0] call_addr_in, 				///Consumed in memory.
	output reg [13:0] call_addr_out = 0
);

	always @ (posedge clock)
	begin
		if(nreset == 1'b0 || stall == 1'b1)
		begin
			ex_mem_data_input_sel_out <= 0;

			alu_top_select_out <= 0;
			alu_bot_select_out <= 0;

			id_ex_top_out <= 0;
			id_ex_bot_out <= 0;

			instruction_out <= 0;

			alu_enable_out <= 0;

			mem_wen_out <= 0;

			main_memory_enable_out <= 0;

			frame_buffer_enable_out <= 0;

			call_stack_enable_out <= 0;

			prog_mem_enable_out_out <= 0;

			mem_ptr_ctl_out <= 0;

			reg_file_wen_out <= 0;

			sfr_file_wren_out <= 0;

			call_addr_out <= 0;
		end
		else
		begin
			ex_mem_data_input_sel_out <= ex_mem_data_input_sel_in;

			alu_top_select_out <= alu_top_select_in;
			alu_bot_select_out <= alu_bot_select_in;

			id_ex_top_out <= id_ex_top_in;
			id_ex_bot_out <= id_ex_bot_in;

			instruction_out <= instruction_in;

			alu_enable_out <= alu_enable_in;

			mem_wen_out <= mem_wen_in;

			main_memory_enable_out <= main_memory_enable_in;

			frame_buffer_enable_out <= frame_buffer_enable_in;

			call_stack_enable_out <= call_stack_enable_in;

			prog_mem_enable_out <= prog_mem_enable_in;

			mem_ptr_ctl_out <= mem_ptr_ctl_in;

			reg_file_wen_out <= reg_file_wen_in;

			sfr_file_wren_out <= sfr_file_wren_in;

			call_addr_out <= call_addr_in;
		end
	end


/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("id_ex.vcd");
  $dumpvars (0, id_ex);
  #1;
end
`endif
*/
endmodule
