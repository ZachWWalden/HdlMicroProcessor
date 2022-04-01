/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module mem_addr_sel_mux(
	//input clock,
	input [1:0] sel_signals,
	input [15:0] x_ptr,
	input [15:0] y_ptr,
	input [15:0] z_ptr,
	input [15:0] stack_ptr,
	output reg [15:0] mem_addr
);

	always @(*)
	begin
		if(sel_signals == 2'b00)
		begin
			mem_addr <= stack_ptr;
		end
		else if(sel_signals == 2'b01)
		begin
			mem_addr <= x_ptr;
		end
		else if(sel_signals == 2'b10)
		begin
			mem_addr <= y_ptr;
		end
		else
		begin
			mem_addr <= z_ptr;
		end
	end

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("mem_addr_sel_mux.vcd");
  $dumpvars (0, mem_addr_sel_mux);
  #1;
end
`endif
*/
endmodule
