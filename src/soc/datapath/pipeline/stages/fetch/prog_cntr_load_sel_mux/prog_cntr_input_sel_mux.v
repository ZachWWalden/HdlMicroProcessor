/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module prog_cntr_input_sel_mux(
	//input clock,
	input [3:0] sel_signals,
	input [13:0] next_prog_cntr,
	input [13:0] branch_target_addr,
	input [13:0] int_branch_addr,
	input [13:0] ret_addr,
	output reg [13:0] prog_cntr_load_val
);

	always @ (*)
	begin
		if(sel_signals == 4'b0001)
		begin
			prog_cntr_load_val <= branch_target_addr;
		end
		else if(sel_signals == 4'b0010)
		begin
			prog_cntr_load_val <= next_prog_cntr;
		end
		else if(sel_signals == 4'b0100)
		begin
			prog_cntr_load_val <= int_branch_addr;
		end
		else if(sel_signals == 4'b1000)
		begin
			prog_cntr_load_val <= ret_addr;
		end
		else
		begin
			prog_cntr_load_val <= next_prog_cntr;
		end
	end

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
