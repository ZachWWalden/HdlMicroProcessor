/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module mem_addr_sel_mux(
	input clock,
	input [3:0] sel_signals,
	input [15:0] x_ptr,
	input [15:0] y_ptr,
	input [15:0] z_ptr,
	input [15:0] stack_ptr,
	output [15:0] mem_addr
);
	//sel_signals[0] -> main_mem_addr = x_ptr, sel_signals[1] -> main_mem_addr = y_ptr
	//sel_signals[2] -> main_mem_addr = y_ptr, sel_signals[3] -> main_mem_addr = stack_ptr

	assign mem_addr[0] = (sel_signals[0] & x_ptr[0]) | (sel_signals[1] & y_ptr[0]) | (sel_signals[2] & z_ptr[0]) | (sel_signals[3] & stack_ptr[0]);
	assign mem_addr[1] = (sel_signals[0] & x_ptr[1]) | (sel_signals[1] & y_ptr[1]) | (sel_signals[2] & z_ptr[1]) | (sel_signals[3] & stack_ptr[1]);
	assign mem_addr[2] = (sel_signals[0] & x_ptr[2]) | (sel_signals[1] & y_ptr[2]) | (sel_signals[2] & z_ptr[2]) | (sel_signals[3] & stack_ptr[2]);
	assign mem_addr[3] = (sel_signals[0] & x_ptr[3]) | (sel_signals[1] & y_ptr[3]) | (sel_signals[2] & z_ptr[3]) | (sel_signals[3] & stack_ptr[3]);
	assign mem_addr[4] = (sel_signals[0] & x_ptr[4]) | (sel_signals[1] & y_ptr[4]) | (sel_signals[2] & z_ptr[4]) | (sel_signals[3] & stack_ptr[4]);
	assign mem_addr[5] = (sel_signals[0] & x_ptr[5]) | (sel_signals[1] & y_ptr[5]) | (sel_signals[2] & z_ptr[5]) | (sel_signals[3] & stack_ptr[5]);
	assign mem_addr[6] = (sel_signals[0] & x_ptr[6]) | (sel_signals[1] & y_ptr[6]) | (sel_signals[2] & z_ptr[6]) | (sel_signals[3] & stack_ptr[6]);
	assign mem_addr[7] = (sel_signals[0] & x_ptr[7]) | (sel_signals[1] & y_ptr[7]) | (sel_signals[2] & z_ptr[7]) | (sel_signals[3] & stack_ptr[7]);
	assign mem_addr[8] = (sel_signals[0] & x_ptr[8]) | (sel_signals[1] & y_ptr[8]) | (sel_signals[2] & z_ptr[8]) | (sel_signals[3] & stack_ptr[8]);
	assign mem_addr[9] = (sel_signals[0] & x_ptr[9]) | (sel_signals[1] & y_ptr[9]) | (sel_signals[2] & z_ptr[9]) | (sel_signals[3] & stack_ptr[9]);
	assign mem_addr[10] = (sel_signals[0] & x_ptr[10]) | (sel_signals[1] & y_ptr[10]) | (sel_signals[2] & z_ptr[10]) | (sel_signals[3] & stack_ptr[10]);
	assign mem_addr[11] = (sel_signals[0] & x_ptr[11]) | (sel_signals[1] & y_ptr[11]) | (sel_signals[2] & z_ptr[11]) | (sel_signals[3] & stack_ptr[11]);
	assign mem_addr[12] = (sel_signals[0] & x_ptr[12]) | (sel_signals[1] & y_ptr[12]) | (sel_signals[2] & z_ptr[12]) | (sel_signals[3] & stack_ptr[12]);
	assign mem_addr[13] = (sel_signals[0] & x_ptr[13]) | (sel_signals[1] & y_ptr[13]) | (sel_signals[2] & z_ptr[13]) | (sel_signals[3] & stack_ptr[13]);
	assign mem_addr[14] = (sel_signals[0] & x_ptr[14]) | (sel_signals[1] & y_ptr[14]) | (sel_signals[2] & z_ptr[14]) | (sel_signals[3] & stack_ptr[14]);
	assign mem_addr[15] = (sel_signals[0] & x_ptr[15]) | (sel_signals[1] & y_ptr[15]) | (sel_signals[2] & z_ptr[15]) | (sel_signals[3] & stack_ptr[15]);

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("mem_addr_sel_mux.vcd");
  $dumpvars (0, mem_addr_sel_mux);
  #1;
end
`endif
endmodule
