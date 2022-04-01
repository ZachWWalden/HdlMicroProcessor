/*
Module - Memory I/O
Author - Zach Walden
Last Changed - 2/28/22
Description - Multiplexes the memory interfaces onto a single bus for the memory pipeline stage. Abstracts
Parameters -
*/

module memory_io(
	//input clock,
	//BEGIN interface with the fetch pipeline stage.
	input [13:0] prog_mem_addr_fetch,
	output [31:0] prog_mem_instruction,
	//BEGIN interface with memory pipeline stage.
	input call_stk_en,
	input main_mem_en,
	input prog_mem_en,
	input fb_en,
	input mem_wen,
	input [16:0] addr_in,
	input [7:0] call_stk_addr_in,
	input [11:0] data_in,
	input [13:0] call_stk_data_in,
	output [11:0] data_out,
	output [13:0] call_stk_data_out,
	//BEGIN Interface with the call stack.
	output call_stk_wen,
	output [7:0] call_stk_addr,
	output [13:0] call_stk_din,
	input [13:0] call_stk_dout,
	//BEGIN interface with main memory
	output main_mem_wen,
	output [15:0] main_mem_addr,
	output [7:0] main_mem_din,
	input [7:0] main_mem_dout,
	//BEGIN interface with program memory.
	output [13:0] prog_mem_addra, 	//Fetch Stage
	input [31:0] prog_mem_douta,
	output [15:0] prog_mem_addrb, 	//Memory Stage
	input [7:0] prog_mem_doutb, 	//Read Only
	//BEGIN interface with the framebuffer.
	output frame_buf_wena,
	output [16:0] frame_buf_addra,
	output [11:0] frame_buf_dina,
	input [11:0] frame_buf_douta
);

	assign prog_mem_addra = prog_mem_addr_fetch;
	assign prog_mem_instruction = prog_mem_douta;

	assign call_stk_wen = mem_wen & call_stk_en;
	assign call_stk_addr = call_stk_addr_in;
	assign call_stk_din = call_stk_data_in;
	assign call_stk_data_out = call_stk_dout;

	assign main_mem_wen = mem_wen & main_mem_en;
	assign frame_buf_wena = mem_wen & fb_en;

	assign main_mem_addr = addr_in[15:0];
	assign prog_mem_addrb = addr_in[15:0];
	assign frame_buf_addra = addr_in;

	assign main_mem_din = data_in[7:0];
	assign frame_buf_dina = data_in;

	//BEGIN Data Out Multiplexing.
	assign data_out[0] = (main_mem_en & main_mem_dout[0]) | (prog_mem_en & prog_mem_doutb[0]) | (fb_en & frame_buf_douta[0]);
	assign data_out[1] = (main_mem_en & main_mem_dout[1]) | (prog_mem_en & prog_mem_doutb[1]) | (fb_en & frame_buf_douta[1]);
	assign data_out[2] = (main_mem_en & main_mem_dout[2]) | (prog_mem_en & prog_mem_doutb[2]) | (fb_en & frame_buf_douta[2]);
	assign data_out[3] = (main_mem_en & main_mem_dout[3]) | (prog_mem_en & prog_mem_doutb[3]) | (fb_en & frame_buf_douta[3]);
	assign data_out[4] = (main_mem_en & main_mem_dout[4]) | (prog_mem_en & prog_mem_doutb[4]) | (fb_en & frame_buf_douta[4]);
	assign data_out[5] = (main_mem_en & main_mem_dout[5]) | (prog_mem_en & prog_mem_doutb[5]) | (fb_en & frame_buf_douta[5]);
	assign data_out[6] = (main_mem_en & main_mem_dout[6]) | (prog_mem_en & prog_mem_doutb[6]) | (fb_en & frame_buf_douta[6]);
	assign data_out[7] = (main_mem_en & main_mem_dout[7]) | (prog_mem_en & prog_mem_doutb[7]) | (fb_en & frame_buf_douta[7]);

	assign data_out[8] = fb_en & frame_buf_douta[8];
	assign data_out[9] = fb_en & frame_buf_douta[9];
	assign data_out[10] = fb_en & frame_buf_douta[10];
	assign data_out[11] = fb_en & frame_buf_douta[11];


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
