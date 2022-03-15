/*
Module - VGA Controller
Author - Zach Walden
Last Changed - 3/13/22
Description - This Module reads through each value in the frame buffer and displays them using proper vga signalling.
Parameters -
*/

module vga_controller(
	input clock,
	input [11:0] pixel_data, 		//Output of the framebuffer unit port b.
	output [16:0] pixel_addr, 		//Framebuffer Port B address.
	output reg [11:0] pixel = 0,
	output h_sync,
	output v_sync,
	output v_blank_interupt
);
    reg nreset = 1;
    
    reg vblankint = 1;
    
	reg [16:0] memory_addr = 0;

	reg [16:0] row_addr_cache = 0;

	reg row_cnt = 0;

	wire [16:0] mem_addr_inc;

	wire hblank;
	wire hsync;
	wire row_done;
	//Instantiate Horizontal Counter
	horiz_cntr horizontal_cntr(
		.clock(clock),
		.nreset(nreset),
		.hsync(hsync),
		.hblank(hblank),
		.row_done(row_done)
	);

	wire vblank;
	wire vsync;
	wire frame_done;
	//Instantiate Vertical Counter
	vert_cntr vertical_cnter(
		.row_done(row_done),
		.nreset(nreset),
		.vsync(vsync),
		.vblank(vblank),
		.frm_done(frame_done)
	);

	always @ (posedge clock)
	begin
		if(vblank == 1'b1 || frame_done == 1'b1)
		begin
			memory_addr <= 0;
			row_addr_cache <= 0;
		end
		else if(row_done == 1'b1 && vblank == 1'b0)
		begin
			row_cnt = ~row_cnt;
			if(row_cnt == 1'b1)
			begin
				memory_addr <= row_addr_cache;
			end
			else
			begin
				row_addr_cache <= memory_addr;
			end
		end
		else if(hblank == 1'b1)
		begin
                
		end
		else
		begin
			memory_addr <= mem_addr_inc;
		end
		
		if(hblank == 1'b0 && vblank == 1'b0)
		begin
			pixel <= pixel_data;
		end
		else
		begin
			pixel <= 12'h000;
		end
		if(frame_done == 1'b1)
		begin
		      vblankint <= 0;
		end
		else
		begin
		      vblankint <= 1;
		end
	end
	
	assign v_blank_interupt = vblankint;

	assign mem_addr_inc = memory_addr + 1;
	
	assign pixel_addr = memory_addr;
	assign h_sync = hsync;
	assign v_sync = vsync;

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("vga_controller.vcd");
  $dumpvars (0, vga_controller);
  #1;
end
`endif
*/
endmodule
