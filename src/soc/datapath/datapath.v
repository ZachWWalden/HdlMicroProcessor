/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module datapath(

);

	always @ (posedge clock)
	begin

	end

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("datapath.vcd");
  $dumpvars (0, datapath);
  #1;
end
`endif
endmodule
