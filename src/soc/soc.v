/*
Module - SOC (System On Chip)
Author - Zach Walden
Last Changed - 3/28/22
Description - This Module is the Top Module for the entire System On chip.
Parameters -
*/

module soc(
	input clk,
	input clk100M,
	input nreset,
	output hsync,
	output vsync,
	output [3:0] red,
	output [3:0] green,
	output [3:0] blue
);

	//Instantiate Clock Generation Modules
	wire mem_clk;
	wire core_clk;
	wire vga_clk;

	clk_gen sys_clk_gen(
        	// Clock out ports
        	.core_clk(core_clk),     // output core_clk
        	.mem_clk(mem_clk),     // output mem_clk
        	// Clock in ports
        	.clk_in1(clk100M)
    	);      	// input clk_in1

    	vga_pix_clk_gen vga_clk_gen(
        	// Clock out ports
        	.vga_clk(vga_clk),     // output vga_clk
        	// Clock in ports
        	.clk_in1(clk)
    	);

	//Instantiate Memory Blocks
	wire [13:0] prog_mem_addra;
	wire [31:0] prog_mem_douta;
	wire [15:0] prog_mem_addrb;
	wire [7:0] prog_mem_doutb;
    	program_memory prog_mem(
        	.clka(mem_clk),    // input wire clka
        	.addra(prog_mem_addra),  // input wire [13 : 0] addra
        	.douta(prog_mem_douta),  // output wire [31 : 0] douta
        	.clkb(mem_clk),    // input wire clkb
        	.addrb(prog_mem_addrb),  // input wire [15 : 0] addrb
        	.doutb(prog_mem_doutb)  // output wire [7 : 0] doutb
    	);

	wire fb_wena;
	wire [16:0] fb_addra;
	wire [11:0] fb_dina;
	wire [11:0] fb_douta;
	wire fb_wenb = 0;
	wire [16:0] fb_addrb;
	wire [11:0] fb_dinb = 0;
	wire [11:0] fb_doutb;
    	frame_buffer frame_buf(
        	.clka(mem_clk),    // input wire clka
        	.wea(fb_wena),      // input wire [0 : 0] wea
        	.addra(fb_addra),  // input wire [16 : 0] addra
        	.dina(fb_dina),    // input wire [11 : 0] dina
        	.douta(fb_douta),  // output wire [11 : 0] douta
        	.clkb(mem_clk),    // input wire clkb
        	.web(fb_wenb),      // input wire [0 : 0] web
        	.addrb(fb_addrb),  // input wire [16 : 0] addrb
        	.dinb(fb_dinb),    // input wire [11 : 0] dinb
        	.doutb(fb_doutb)  // output wire [11 : 0] doutb
    	);

    	wire call_stk_wen;
    	wire [7:0] call_stk_addr;
    	wire [13:0] call_stk_din;
   	wire [13:0] call_stk_dout;
    	call_stack call_stk(
        	.clka(mem_clk),    // input wire clka
        	.wea(call_stk_wen),      // input wire [0 : 0] wea
        	.addra(call_stk_addr),  // input wire [7 : 0] addra
        	.dina(call_stk_din),    // input wire [13 : 0] dina
    		.douta(call_stk_dout)  // output wire [13 : 0] douta
    	);

    	wire main_mem_wen;
    	wire [15:0] main_mem_addr;
    	wire [7:0] main_mem_din;
    	wire [7:0] main_mem_dout;
    	main_memory main_mem(
        	.clka(mem_clk),    // input wire clka
        	.wea(main_mem_wen),      // input wire [0 : 0] wea
        	.addra(main_mem_addr),  // input wire [15 : 0] addra
        	.dina(main_mem_din),    // input wire [7 : 0] dina
        	.douta(main_mem_dout)  // output wire [7 : 0] douta
    	);

	wire [13:0] prog_cntr_val;
	wire [31:0] prog_mem_instruction;

	wire call_stk_en;
	wire main_mem_en;
	wire fb_en;
	wire mem_wen;
	wire [16:0] addr_in;
	wire [7:0] call_stk_addr_in;
	wire [11:0] data_in;
	wire [13:0] call_stk_data_in;
	wire [11:0] data_out;
	wire [13:0] call_stk_data_out;
	//Instantiate Memory I/O Buffer
	memory_io mem_buffer(
		.clock(core_clk),
		//BEGIN interface with the fetch pipeline stage.
		.prog_mem_addr_fetch(prog_cntr_val),
		.prog_mem_instruction(prog_mem_instruction),
		//BEGIN interface with memory pipeline stage.
		.call_stk_en(call_stk_en),
		.main_mem_en(main_mem_en),
		.prog_mem_en(prog_mem_en),
		.fb_en(fb_en),
		.mem_wen(mem_wen),
		.addr_in(addr_in),
		.call_stk_addr_in(call_stk_addr_in),
		.data_in(data_in),
		.call_stk_data_in(call_stk_data_in),
		.data_out(data_out),
		.call_stk_data_out(call_stk_data_out),
		//BEGIN Interface with the call stack.
		.call_stk_wen(call_stk_wen),
		.call_stk_addr(call_stk_addr),
		.call_stk_din(call_stk_din),
		.call_stk_dout(call_stk_dout),
		//BEGIN interface with main memory
		.main_mem_wen(main_mem_wen),
		.main_mem_addr(main_mem_addr),
		.main_mem_din(main_mem_din),
		.main_mem_dout(main_mem_dout),
		//BEGIN interface with program memory.
		.prog_mem_addra(prog_mem_addra),
		.prog_mem_douta(prog_mem_douta),
		.prog_mem_addrb(prog_mem_addrb),
		.prog_mem_doutb(prog_mem_doutb),
		//BEGIN interface with the framebuffer.
		.frame_buf_wena(fb_wena),
		.frame_buf_addra(fb_addra),
		.frame_buf_dina(fb_dina),
		.frame_buf_douta(fb_douta)
	);

	wire [31:0] sfr_input;
	wire [143:0] sfr_output;

	wire interrupt;
	wire [13:0] interrupt_vector_address;
	wire [3:0] hazard_control_unit_state;
	wire illegal_opcode_exception;
	wire vblank_int;
	//Instantiate Interrupt Controller
	interrupt_controller int_controller(
		.clock(core_clk),
		.nreset(nreset),
		//BEIGN Interupt Signals
		.vblank_int(vblank_int),
		.illegal_opcode_exception(illegal_opcode_exception),
		//BEIGN Interface with Hazard Control Unit
		.hazard_unit_state(hazard_control_unit_state),
		.interrupt(interrupt),
		.int_vec_addr(interrupt_vector_address),
		//BEGIN Interface with SFR Conntrol Registers
		.sfr_output(sfr_output)
	);

	wire return;
	wire halt;
	wire fetch_stl_req;
	wire dec_stl_req;

	wire stall_fetch;
	wire stall_decode;
	wire [2:0] prog_cntr_load_sel;
	wire inst_word_sel;
	wire [31:0] hazard_instruction;
	wire [13:0] hazard_int_addr;

	//Instantiate Hazard Control Unit
	hazard_control_unit hazard_unit(
		.clock(core_clk),
		//Inputs
		.return(return),
		.halt(halt),
		.fetch_stl_req(fetch_stl_req),
		.dec_stl_req(dec_stl_req),
		.interrupt(interrupt),
		.interrupt_vector_address(interrupt_vector_address),
		//Outputs
		.stall_fetch(stall_fetch),
		.stall_decode(stall_decode),
		.prog_cntr_load_sel(prog_cntr_load_sel),
		.inst_word_sel(inst_word_sel),
		.new_inst_word(hazard_instruction),
		.prog_cntr_int_addr(hazard_int_addr),
		//State
		.state(hazard_control_unit_state)
	);

	//Instantiate Data Path
	datapath pipeline(
		.clock(core_clk),
		.nreset(nreset),
		//Memory Interface
		.prog_cntr_val(prog_cntr_val),
		.mem_fetch_instruction(prog_mem_instruction),
		.main_mem_en(main_mem_en),
		.prog_mem_en(prog_mem_en),
		.fb_en(fb_en),
		.call_stk_en(call_stk_en),
		.mem_wen(mem_wen),
		.mem_addr(addr_in),
		.call_stk_addr(call_stk_addr_in),
		.write_data(data_in),
		.read_data(data_out),
		.call_stk_write_data(call_stk_data_in),
		.call_stk_read_data(call_stk_data_out),
		//Hazard Unit Interface
		.stall_fetch(stall_fetch),
		.stall_decode(stall_decode),
		.hazard_prog_cntr_sel(prog_cntr_load_sel),
		.inst_word_sel(inst_word_sel),
		.hazard_inst_word(hazard_instruction),
		.prog_cntr_int_addr(prog_cntr_int_addr),
		.stall_fetch_req(fetch_stl_req),
		.stall_decode_req(dec_stl_req),
		.halt(halt),
		.illegal_opcode_exception(illegal_opcode_exception),  			//To Interrupt Controller
		.return_in_pipeline(return),
		//SFR I/O Interface
		.sfr_file_in(sfr_input),
		.sfr_file_out(sfr_output)
	);
	//Instantiate VGA Controller
	wire [11:0] pixel_switch;
	vga_controller vga(
		.clock(vga_clk),
		.nreset(nreset),
		.pixel_data(fb_doutb),
		.pixel_addr(fb_addrb),
		.pixel(pixel_switch),
		.h_sync(hsync),
		.v_sync(vsync),
		.v_blank_interupt(vblank_int)
	);

    assign red = pixel_switch[11:8];
    assign blue = pixel_switch[7:4];
    assign green = pixel_switch[3:0];

/*
// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("soc.vcd");
  $dumpvars (0,) soc);
  #1;
end
`endif
*/
endmodule
