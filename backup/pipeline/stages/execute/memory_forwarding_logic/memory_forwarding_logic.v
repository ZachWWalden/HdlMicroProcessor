/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module memory_forwarding_logic(
	input clock,
	input [31:0] instruction,
	input [7:0] ex_mem_operation,
	input [4:0] ex_mem_addr_low,
	input [4:0] ex_mem_addr_high,
	input [7:0] mem_wb_operation,
	input [4:0] mem_wb_addr_low,
	input [4:0] mem_wb_addr_high,
	output sfr_input_sel,
	output [3:0] mem_write_data_sel_top,
	output [3:0] mem_write_data_sel_bot
);

	always @ (posedge clock)
	begin

	end

	assign sfr_input_sel = 1'b0;
	assign mem_write_data_sel_top = 4'b0001;
	assign mem_write_data_sel_bot = 4'b0001;


/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("memory_forwarding_logic.vcd");
  $dumpvars (0,memory_forwarding_logic);
  #1;
end
`endif
*/
endmodule
