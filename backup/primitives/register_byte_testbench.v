
/*
Module - Testbench for register_byte.v
Author - Zach Walden
Last Modified - 1/21/22
Description - This testbench tests my 8-bit general purpose register module.
*/
`timescale 1ns / 1ps

module register_byte_testbench;
	reg clock = 0;
	reg nreset = 1;
	reg write_enable = 1;
	reg [7:0] data_in = 0;
	wire [7:0] data_out;

	register_byte uut(
		.clock(clock),
		.nreset(nreset),
		.write_enable(write_enable),
		.data_in(data_in),
		.data_out(data_out)
	);

    integer k = 0;

	initial
	begin
	    
	    for(k = 0; k < 256; k = k + 1)
	    
	    #10 clock = ~clock; data_in = data_in + 1;
        #100 nreset = ~nreset;
      
        #5 $finish;
	end

endmodule
