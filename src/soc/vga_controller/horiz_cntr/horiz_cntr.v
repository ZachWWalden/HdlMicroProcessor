/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module horiz_cntr(
	input clock,
	input nreset,
	output reg hsync = 1,
	output reg hblank = 0,
	output row_done
);

	reg [8:0] value = 0;

	wire [8:0] value_inc;

	wire set_hblank;
	wire set_hsync;
	wire clear_hsync;

	always @ (posedge clock)
	begin
		if(nreset == 1'b0)
		begin
			value <= 0;
			hblank <= 0;
			hsync <= 1;
		end
		else
		begin
			if(row_done == 1'b1)
			begin
				hblank <= 0;
				value <= 0;
			end
			else
			begin
				value <= value_inc;
			end
			if(set_hblank == 1'b1)
			begin
				hblank <= 1;
			end
			else
			begin
                
			end
			if(set_hsync == 1'b1)
			begin
				hsync <= 0;
			end
			else
			begin
                
			end
			if(clear_hsync == 1'b1)
			begin
				hsync <= 1;
			end
			else
			begin
                
			end
		end
	end

	assign value_inc = value + 1;


	assign set_hblank = value[0] & value[1] & value[2] & value[3] & value[4] & value[5] & ~value[6] & ~value[7] & value[8]; 	//319
//	assign set_hsync = value[0] & value[1] & value[2] & ~value[3] & ~value[4] & ~value[5] & value[6] & ~value[7] & value[8]; 	//327
//	assign clear_hsync = value[0] & value[1] & value[2] & ~value[3] & value[4] & value[5] & value[6] & ~value[7] & value[8]; 	//375
//	assign row_done = value[0] & value[1] & value[2] & value[3] & ~value[4] & ~value[5] & ~value[6] & value[7] & value[8]; 	//399


//	assign set_hblank = ~value[0] & ~value[1] & ~value[2] & ~value[3] & ~value[4] & ~value[5] & value[6] & ~value[7] & value[8]; 	//320
	assign set_hsync = ~value[0] & ~value[1] & ~value[2] & value[3] & ~value[4] & ~value[5] & value[6] & ~value[7] & value[8]; 	//328
	assign clear_hsync = ~value[0] & ~value[1] & ~value[2] & value[3] & value[4] & value[5] & value[6] & ~value[7] & value[8]; 	//376
	assign row_done = ~value[0] & ~value[1] & ~value[2] & ~value[3] & value[4] & ~value[5] & ~value[6] & value[7] & value[8]; 	//400

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("horiz_cntr.vcd");
  $dumpvars (0, horiz_cntr);
  #1;
end
`endif
*/
endmodule
