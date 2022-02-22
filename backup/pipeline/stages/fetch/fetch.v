/*
Module - Fetch Pipeline Stage
Author - Zach Walden
Last Changed - 2/16/22
Description - Thin wrapper around my program_counter module so as to meet code structure conventions.
Parameters -
*/

module fetch(
	input clock,
	input nreset,
	input stall,
	output [13:0] prog_mem_fetch_read_addr,
	//Begin interface definition with the IF/ID pipeline register.
	input take_branch_address,
	input [13:0] branch_target_address
);

	program_counter prog_cntr(
		.clock(clock),
		.nreset(nreset),
		.stall(stall),
		.take_branch_target(take_branch_address),
		.branch_target(branch_target_address),
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
