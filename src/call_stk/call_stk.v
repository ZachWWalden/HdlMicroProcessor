/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module call_stk(
	input clock,
	input nreset,
	input wea,
	input [7:0] addra,
	input [13:0] dina,
	output reg [13:0] douta
);

	integer i = 0;

    reg [13:0] call_stk_array [0:255];

	initial
	begin
		for(i=0;i<256;i=i+1)
		begin
			call_stk_array[i] = 0;
		end
	end

	always @ (negedge clock)
	begin
		if(nreset == 1'b0)
		begin
			for(i=0;i<256;i=i+1)
			begin
				call_stk_array[i] <= 0;
			end
		end
		else
		begin
			if(wea == 1'b1)
			begin
				call_stk_array[addra] <= dina;
				douta <= 0;
			end
			else
			begin
				douta <= call_stk_array[addra];
			end
		end
	end

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("call_stk.vcd");
  $dumpvars (0, call_stk);
  #1;
end
`endif
*/
endmodule
