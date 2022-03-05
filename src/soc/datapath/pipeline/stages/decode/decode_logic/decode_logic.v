/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module decode_logic(

);

	always @ (*)
	begin

	end

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("decode_logic.vcd");
  $dumpvars (0, decode_logic);
  #1;
end
`endif
endmodule
