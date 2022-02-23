/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module prog_cntr_input_sel_mux(
	input clock,
	input [2:0] sel_signals,
	input [13:0] next_prog_cntr,
	input [13:0] branch_target_addr,
	input [13:0] ret_addr,
	output [13:0] prog_cntr_load_val
);

	always @ (posedge clock)
	begin

	end

	assign prog_cntr_load_val = next_prog_cntr;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("prog_cntr_input_sel_mux.vcd");
  $dumpvars (0, prog_cntr_input_sel_mux);
  #1;
end
`endif
endmodule
