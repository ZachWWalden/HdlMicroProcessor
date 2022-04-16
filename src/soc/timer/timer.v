/*
Module - Timer
Author - Zach Walden
Last Changed - 4/16/22
Description - 64-Bit Timer with an enable bit along with a clear bit. Synchronous Active Low Reset.
Parameters -
*/

module timer(
	input clock,
	input nreset,
	input [7:0] control_reg, //<7> ,<6> ,<5> ,<4> ,<3> ,<2> ,<1> Clear 1 = Reset, 0 = Normal,<0> Timer Enable 1 = run, 0 = stop
	output reg [63:0] timer_value = 0
);

	wire [63:0] timer_inc;

	always @ (posedge clock)
	begin
		if(nreset == 1'b0 || control_reg[1] == 1'b1)
		begin
			timer_value <= 0;
		end
		else if(control_reg[0] == 1'b1)
		begin
			timer_value <= timer_inc;
		end
	end

	assign timer_inc = timer_value + 1;

// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("timer.vcd");
  $dumpvars (0, timer);
  #1;
end
`endif
endmodule
