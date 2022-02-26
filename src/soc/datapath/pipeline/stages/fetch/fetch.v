/*
Module - Fetch Pipeline Stage
Author - Zach Walden
Last Changed - 2/21/22
Description - Thin wrapper around my program_counter module so as to meet code structure conventions.
Parameters -
*/

module fetch(
	input clock,
	input nreset,
	input stall,
	output [13:0] prog_mem_fetch_read_addr,
	input [3:0] prog_cntr_input_sel,   		//This signal will come from the hazard unit.
	//Begin interface definition with the IF/ID pipeline register.
	input [13:0] branch_target_address,
	input [13:0] interrupt_branch_addr,
	input [13:0] ret_addr_mem,
	output [13:0] ret_addr_out
);

	wire [13:0] next_prog_cntr;
	wire [13:0] prog_cntr_load_val;
	//instantiate prog_cntr_load_sel_mux
	prog_cntr_input_sel_mux	input_mux(
		.clock(clock),
		.sel_signals(prog_cntr_input_sel),
		.next_prog_cntr(next_prog_cntr),
		.branch_target_addr(branch_target_address),
		.int_branch_addr(interrupt_branch_addr),
		.ret_addr(ret_addr_mem),
		.prog_cntr_load_val(prog_cntr_load_val)
	);

	//Instantiate program_counter
	program_counter prog_cntr(
		.clock(clock),
		.nreset(nreset),
		.stall(stall),
		.load_value(prog_cntr_load_val),
		.next_prog_cntr(next_prog_cntr),
		.prog_mem_addr_fetch(prog_mem_fetch_read_addr)
	);

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("fetch.vcd");
  $dumpvars (0, fetch);
  #1;
end
`endif
endmodule
