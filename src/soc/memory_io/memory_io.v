/*
Module - Memory I/O
Author - Zach Walden
Last Changed - 2/28/22, 4/2/22
Description - Multiplexes the memory interfaces onto a single bus for the memory pipeline stage. Abstracts
Parameters -
*/

module memory_io(
	//input clock,
	//BEGIN interface with memory pipeline stage.
	input call_stk_en,
	input main_mem_en,
	input prog_mem_en,
	input fb_en,
	input mem_wen,
	output reg [11:0] data_out,
	//BEGIN Interface with the call stack.
	output call_stk_wen,
	//BEGIN interface with main memory
	output main_mem_wen,
	input [7:0] main_mem_dout,
	//BEGIN interface with program memory.
	input [7:0] prog_mem_doutb, 	//Read Only
	//BEGIN interface with the framebuffer.
	output frame_buf_wena,
	input [11:0] frame_buf_douta
);

	assign call_stk_wen = mem_wen & call_stk_en;

	assign main_mem_wen = mem_wen & main_mem_en;
	assign frame_buf_wena = mem_wen & fb_en;

	always @ (*)
	begin
		if(main_mem_en == 1'b1)
		begin
			data_out[7:0] <= main_mem_dout;
		end
		else if(prog_mem_en == 1'b1)
		begin
			data_out[7:0] <= prog_mem_doutb;
		end
		else if(fb_en == 1'b1)
		begin
			data_out[7:0] <= frame_buf_douta[7:0];
		end
		else
		begin
			data_out[7:0] <= 8'h00;
		end
	end

	always @ (*)
	begin
		if(fb_en == 1'b1)
		begin
			data_out[11:8] <= frame_buf_douta[11:8];
		end
		else
		begin
        		data_out[11:8] <= 4'h0;
		end
	end

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("memory_io.vcd");
  $dumpvars (0, memory_io);
  #1;
end
`endif
*/
endmodule
