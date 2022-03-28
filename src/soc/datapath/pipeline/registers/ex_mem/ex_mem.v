/*
Module - Execution/Memory Pipeline Register
Author - Zach Walden
Last Changed - 2/12/22, 3/27/22
Description - This register holds the necessary data to ensure that the correct results exit the memory pipeline stage.
*/

module ex_mem(
	input clock, 				//System Clock
	input nreset, 				//System Reset Signal
	input [31:0] mem_wb_instruction_in, 	//passthrough for the instruction stored in the MEM/WB pipeline register.
	output [31:0] mem_wb_instruction_out,
	input [7:0] data_top_in, 		//I/O for the top register file operand read.
	output reg [7:0] data_top_out = 0,
	input [7:0] data_bot_in, 		//I/O for the bottom register file operand read.
	output reg [7:0] data_bot_out = 0,
	input [31:0] instruction_in, 		//I/O for the instruction word.
	output reg [31:0] instruction_out = 0,
	input mem_wen_in,
	output reg mem_wen_out,
	input main_memory_enable_in, 		//BEGIN These Signals Are to be sent to the memory i/o unit rather than the memory stage.//Consumed in memory.
	output reg main_memory_enable_out = 0,
	input frame_buffer_enable_in, 		//Consumed in memory.
	output reg frame_buffer_enable_out = 0,
	input call_stack_enable_in, 		//Consumed in memory.
	output reg call_stack_enable_out = 0,  		//END MEM/IO Signals
	input prog_mem_enable_in, 		//Consumed in memory.
	output reg prog_mem_enable_out = 0,
	input [6:0] mem_ptr_ctl_in, 			//Consumed in memory
	output reg [6:0] mem_ptr_ctl_out = 0,
	input [3:0] mem_wb_data_sel_top_in, 	//Consumed in memory.
	output reg [3:0] mem_wb_data_sel_top_out = 0,
	input [6:0] mem_wb_data_sel_bot_in, 	//Consumed in memory.
	output reg [6:0] mem_wb_data_sel_bot_out = 0,
	input [4:0] sfr_file_input_sel_in, 		//Consumed in memory.
	output reg [4:0] sfr_file_input_sel_out = 0,
	input [3:0] mem_str_data_sel_top_in,  	//this will only be used when writing to the frame buffer.//Consumed in memory.
	output reg [3:0] mem_str_data_sel_top_out = 0,
	input [3:0] mem_str_data_sel_bot_in, 	//Memory data in multiplexor selion signals, as well as the comemnt above.//Consumed in memory.
	output reg [3:0] mem_str_data_sel_bot_out = 0,
	input [1:0] reg_file_wen_in, 			//Consumed in writeback
	output reg [1:0] reg_file_wen_out = 0,
	input [1:0] sfr_file_wren_in, 			//Consumed in memory.
	output reg [1:0] sfr_file_wren_out = 0,
	input [13:0] call_addr_in, 		//This Signal goes directly to the call stack. //Consumed in memory.
	output reg [13:0] call_addr_out = 0
);

	always @ (posedge clock)
	begin
		if(nreset == 1'b0)
		begin
			data_top_out <= 0;
			data_bot_out <= 0;

			instruction_out <= 0;

			mem_wen_out <= 0;

			main_memory_enable_out <= 0;
			frame_buffer_enable_out <= 0;
			call_stack_enable_out <= 0;
			prog_mem_enable_out <= 0;

			mem_ptr_ctl_out <= 0;

			mem_wb_data_sel_top_out <= 0;
			mem_wb_data_sel_bot_out <= 0;

			mem_str_data_sel_top_out <= 0;
			mem_str_data_sel_bot_out <= 0;

			sfr_file_input_sel_out <= 0;
			sfr_file_wren_out <= 0;

			reg_file_wen_out <= 0;

			call_addr_out <= 0;
		end
		else
		begin
			data_top_out <= data_top_in;
			data_bot_out <= data_bot_in;

			instruction_out <= instruction_in;

			mem_wen_out <= mem_wen_in;

			main_memory_enable_out <= main_memory_enable_in;
			frame_buffer_enable_out <= frame_buffer_enable_in;
			call_stack_enable_out <= call_stack_enable_in;
			prog_mem_enable_out <= prog_mem_enable_in;

			mem_ptr_ctl_out <= mem_ptr_ctl_in;

			mem_wb_data_sel_top_out <= mem_wb_data_sel_top_in;
			mem_wb_data_sel_bot_out <= mem_wb_data_sel_bot_in;

			mem_str_data_sel_top_out <= mem_str_data_sel_top_in;
			mem_str_data_sel_bot_out <= mem_str_data_sel_bot_in;

			sfr_file_input_sel_out <= sfr_file_input_sel_in;
			sfr_file_wren_out <= sfr_file_wren_in;

			reg_file_wen_out <= reg_file_wen_in;

			call_addr_out <= call_addr_in;
		end
	end

	assign mem_wb_instruction_out = mem_wb_instruction_in;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("ex_mem.vcd");
  $dumpvars (0, ex_mem);
  #1;
end
`endif
endmodule
