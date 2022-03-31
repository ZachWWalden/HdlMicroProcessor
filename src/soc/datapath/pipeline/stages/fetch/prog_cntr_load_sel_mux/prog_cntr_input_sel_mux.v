/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module prog_cntr_input_sel_mux(
	input clock,
	input [3:0] sel_signals,
	input [13:0] next_prog_cntr,
	input [13:0] branch_target_addr,
	input [13:0] int_branch_addr,
	input [13:0] ret_addr,
	output [13:0] prog_cntr_load_val
);

	assign prog_cntr_load_val[0] = (sel_signals[1] & next_prog_cntr[0]) | (sel_signals[0] & branch_target_addr[0]) | (sel_signals[2] & int_branch_addr[0]) | (sel_signals[3] & ret_addr[0]);
	assign prog_cntr_load_val[1] = (sel_signals[1] & next_prog_cntr[1]) | (sel_signals[0] & branch_target_addr[1]) | (sel_signals[2] & int_branch_addr[1]) | (sel_signals[3] & ret_addr[1]);
	assign prog_cntr_load_val[2] = (sel_signals[1] & next_prog_cntr[2]) | (sel_signals[0] & branch_target_addr[2]) | (sel_signals[2] & int_branch_addr[2]) | (sel_signals[3] & ret_addr[2]);
	assign prog_cntr_load_val[3] = (sel_signals[1] & next_prog_cntr[3]) | (sel_signals[0] & branch_target_addr[3]) | (sel_signals[2] & int_branch_addr[3]) | (sel_signals[3] & ret_addr[3]);
	assign prog_cntr_load_val[4] = (sel_signals[1] & next_prog_cntr[4]) | (sel_signals[0] & branch_target_addr[4]) | (sel_signals[2] & int_branch_addr[4]) | (sel_signals[3] & ret_addr[4]);
	assign prog_cntr_load_val[5] = (sel_signals[1] & next_prog_cntr[5]) | (sel_signals[0] & branch_target_addr[5]) | (sel_signals[2] & int_branch_addr[5]) | (sel_signals[3] & ret_addr[5]);
	assign prog_cntr_load_val[6] = (sel_signals[1] & next_prog_cntr[6]) | (sel_signals[0] & branch_target_addr[6]) | (sel_signals[2] & int_branch_addr[6]) | (sel_signals[3] & ret_addr[6]);
	assign prog_cntr_load_val[7] = (sel_signals[1] & next_prog_cntr[7]) | (sel_signals[0] & branch_target_addr[7]) | (sel_signals[2] & int_branch_addr[7]) | (sel_signals[3] & ret_addr[7]);
	assign prog_cntr_load_val[8] = (sel_signals[1] & next_prog_cntr[8]) | (sel_signals[0] & branch_target_addr[8]) | (sel_signals[2] & int_branch_addr[8]) | (sel_signals[3] & ret_addr[8]);
	assign prog_cntr_load_val[9] = (sel_signals[1] & next_prog_cntr[9]) | (sel_signals[0] & branch_target_addr[9]) | (sel_signals[2] & int_branch_addr[9]) | (sel_signals[3] & ret_addr[9]);
	assign prog_cntr_load_val[10] = (sel_signals[1] & next_prog_cntr[10]) | (sel_signals[0] & branch_target_addr[10]) | (sel_signals[2] & int_branch_addr[10]) | (sel_signals[3] & ret_addr[10]);
	assign prog_cntr_load_val[11] = (sel_signals[1] & next_prog_cntr[11]) | (sel_signals[0] & branch_target_addr[11]) | (sel_signals[2] & int_branch_addr[11]) | (sel_signals[3] & ret_addr[11]);
	assign prog_cntr_load_val[12] = (sel_signals[1] & next_prog_cntr[12]) | (sel_signals[0] & branch_target_addr[12]) | (sel_signals[2] & int_branch_addr[12]) | (sel_signals[3] & ret_addr[12]);
	assign prog_cntr_load_val[13] = (sel_signals[1] & next_prog_cntr[13]) | (sel_signals[0] & branch_target_addr[13]) | (sel_signals[2] & int_branch_addr[13]) | (sel_signals[3] & ret_addr[13]);

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("prog_cntr_input_sel_mux.vcd");
  $dumpvars (0, prog_cntr_input_sel_mux);
  #1;
end
`endif
*/
endmodule
