/*
Module -
Author - Zach Walden
Last Changed -
Description -
Parameters -
*/

module vert_cntr(
	input row_done,
	input nreset,
	output reg vsync = 1,
	output reg vblank = 0,
	output frm_done
);

	reg [9:0] value = 0;

	wire [9:0] value_inc;

	wire set_vblank;
	wire set_vsync;
	wire clear_vsync;
	wire frame_done;

	always @ (negedge row_done)
	begin
		if(nreset == 1'b0)
		begin
			value <= 0;
			vblank <= 0;
			vsync <= 1;
		end
		else
		begin
			if(frame_done == 1'b1)
			begin
				vblank <= 0;
				value <= 0;
			end
			else
			begin
				value <= value_inc;
			end
			if(set_vblank == 1'b1)
			begin
				vblank <= 1;
			end
			else
			begin
                
			end
			if(set_vsync == 1'b1)
			begin
				vsync <= 0;
			end
			else
			begin
                
			end
			if(clear_vsync == 1'b1)
			begin
				vsync <= 1;
			end
			else
			begin
                
			end
		end
	end

	assign frm_done = frame_done;

	assign value_inc = value + 1;

	assign set_vblank = value[0] & value[1] & value[2] & value[3] & value[4] & ~value[5] & value[6] & value[7] & value[8] & ~value[9]; 		//479
//	assign set_vsync = value[0] & ~value[1] & ~value[2] & value[3] & ~value[4] & value[5] & value[6] & value[7] & value[8] & ~value[9];  		//489
//	assign clear_vsync = value[0] & value[1] & ~value[2] & value[3] & ~value[4] & value[5] & value[6] & value[7] & value[8] & ~value[9]; 		//491
//	assign frame_done = ~value[0] & ~value[1] & value[2] & value[3] & ~value[4] & ~value[5] & ~value[6] & ~value[7] & ~value[8] & value[9]; 	//524

//	assign set_vblank = ~value[0] & ~value[1] & ~value[2] & ~value[3] & ~value[4] & value[5] & value[6] & value[7] & value[8] & ~value[9]; 		//480
	assign set_vsync = ~value[0] & value[1] & ~value[2] & value[3] & ~value[4] & value[5] & value[6] & value[7] & value[8] & ~value[9];  		//490
	assign clear_vsync = ~value[0] & ~value[1] & value[2] & value[3] & ~value[4] & value[5] & value[6] & value[7] & value[8] & ~value[9]; 		//492
	assign frame_done = value[0] & ~value[1] & value[2] & value[3] & ~value[4] & ~value[5] & ~value[6] & ~value[7] & ~value[8] & value[9]; 	//525

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("vert_cntr.vcd");
  $dumpvars (0, vert_cntr);
  #1;
end
`endif
*/
endmodule
