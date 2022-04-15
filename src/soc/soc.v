/*
Module - SOC (System On Chip)
Author - Zach Walden
Last Changed - 3/28/22
Description - This Module is the Top Module for the entire System On chip.
Parameters -
*/

module soc(
	input clk100M,
	output [3:0] led,
	output hsync,
	output vsync,
	output [3:0] red,
	output [3:0] green,
	output [3:0] blue

);

    reg nreset = 1;

	//Instantiate Clock Generation Modules
	wire mem_clk;
	wire core_clk;
	wire vga_clk;
	wire vga_mem_clk;
	wire ila_clk;

	clk_gen sys_clk_gen(
        	// Clock out ports
        	.core_clk(core_clk),     // output core_clk
        	.mem_clk(mem_clk),     // output mem_clk
        	.ila_clk(ila_clk),
        	// Clock in ports
        	.clk_in1(clk100M)
    	);      	// input clk_in1

    	vga_pix_clk_gen vga_clk_gen(
        	// Clock out ports
        	.vga_clk(vga_clk),     // output vga_clk
        	.vga_mem_clk(vga_mem_clk),     // output vga_mem_clk
        	// Clock in ports
        	.clk_in1(ila_clk)
    	);


    wire [11:0] data_in;
    wire [15:0] addr_in;
    
	//Instantiate Memory Blocks
	wire [13:0] prog_mem_addra;
	wire [31:0] prog_mem_douta;
	wire [7:0] prog_mem_doutb;
    	program_memory prog_mem(
        	.clka(mem_clk),    // input wire clka
        	.addra(prog_mem_addra),  // input wire [13 : 0] addra
        	.douta(prog_mem_douta),  // output wire [31 : 0] douta
        	.clkb(mem_clk),    // input wire clkb
        	.addrb(addr_in),  // input wire [15 : 0] addrb
        	.doutb(prog_mem_doutb)  // output wire [7 : 0] doutb
    	);

	wire fb_wena;
	wire [11:0] fb_douta;
	wire fb_wenb = 0;
	wire [14:0] fb_addrb;
	wire [11:0] fb_dinb = 0;
	wire [11:0] fb_doutb;

    	frame_buffer frame_buf(
        	.clka(mem_clk),    // input wire clka
        	.wea(fb_wena),      // input wire [0 : 0] wea
        	.addra(addr_in[14:0]),  // input wire [14 : 0] addra
        	.dina(data_in),    // input wire [11 : 0] dina
        	.douta(fb_douta),  // output wire [11 : 0] douta
        	.clkb(vga_mem_clk),   // input wire clkb
        	.web(fb_wenb),      // input wire [0 : 0] web
        	.addrb(fb_addrb),  // input wire [14 : 0] addrb
        	.dinb(fb_dinb),    // input wire [11 : 0] dinb
        	.doutb(fb_doutb)  // output wire [11 : 0] doutb
    	);

    	wire call_stk_wen;
    	wire [7:0] call_stk_addr;
    	wire [13:0] call_stk_din;
   	    wire [13:0] call_stk_dout;
   	    
    	call_stack call_stk(
            //.clock(mem_clk),    // input wire clka
            //.nreset(nreset),
            .clka(mem_clk),
            .wea(call_stk_wen),      // input wire [0 : 0] wea
            .addra(call_stk_addr),  // input wire [7 : 0] addra
            .dina(call_stk_din),    // input wire [13 : 0] dina
            .douta(call_stk_dout)  // output wire [13 : 0] douta
        );
        
    	wire main_mem_wen;
    	wire [7:0] main_mem_dout;
    	main_memory main_mem(
        	.clka(mem_clk),    // input wire clka
        	.wea(main_mem_wen),      // input wire [0 : 0] wea
        	.addra(addr_in),  // input wire [15 : 0] addra
        	.dina(data_in[7:0]),    // input wire [7 : 0] dina
        	.douta(main_mem_dout)  // output wire [7 : 0] douta
    	);

	wire call_stk_en;
	wire main_mem_en;
	wire fb_en;
	wire prog_mem_en;
	wire mem_wen;
	//wire [13:0] call_stk_data_in;
	wire [11:0] data_out;
	//Instantiate Memory I/O Buffer
	memory_io mem_buffer(
		//BEGIN interface with memory pipeline stage.
		.call_stk_en(call_stk_en),
		.main_mem_en(main_mem_en),
		.prog_mem_en(prog_mem_en),
		.fb_en(fb_en),
		.mem_wen(mem_wen),
		.data_out(data_out),
		//BEGIN Interface with the call stack.
		.call_stk_wen(call_stk_wen),
		//BEGIN interface with main memory
		.main_mem_wen(main_mem_wen),
		.main_mem_dout(main_mem_dout),
		//BEGIN interface with program memory.
		.prog_mem_doutb(prog_mem_doutb),
		//BEGIN interface with the framebuffer.
		.frame_buf_wena(fb_wena),
		.frame_buf_douta(fb_douta)
	);

	wire [31:0] sfr_input;
	wire [143:0] sfr_output;

	wire interrupt;
	wire [13:0] interrupt_vector_address ;

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

	wire ret;
	wire halt;
	wire fetch_stl_req;
	wire dec_stl_req;
	wire take_branch_target;

	wire stall_fetch;
	wire stall_decode;
	wire [3:0] prog_cntr_load_sel;
	wire inst_word_sel;
	wire [31:0] hazard_instruction;
	wire [13:0] hazard_int_addr;
	
	//Instantiate Hazard Control Unit
	hazard_control_unit hazard_unit(
		.clock(core_clk),
		.nreset(nreset),
		//Inputs
		.ret(ret),
		.halt(halt),
		.fetch_stl_req(fetch_stl_req),
		.dec_stl_req(dec_stl_req),
		.take_branch_target(take_branch_target),
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
		.control_state(hazard_control_unit_state)
	);

    wire [15:0] memwb_data;
    wire [31:0] decode_instruction;
	//Instantiate Data Path
	datapath pipeline(
		.clock(core_clk),
		.nreset(nreset),
		//ila interface
		.ifid_instruction_out(decode_instruction),
		.memwb_data(memwb_data),
		//Memory Interface
		.prog_cntr_val(prog_mem_addra),
		.mem_fetch_instruction(prog_mem_douta),
		.main_mem_en(main_mem_en),
		.prog_mem_en(prog_mem_en),
		.fb_en(fb_en),
		.call_stk_en(call_stk_en),
		.mem_wen(mem_wen),
		.mem_addr(addr_in),
		.call_stk_addr(call_stk_addr),
		.write_data(data_in),
		.read_data(data_out),
		.call_stk_write_data(call_stk_din),
		.call_stk_read_data(call_stk_dout),
		//Hazard Unit Interface
		.stall_fetch(stall_fetch),
		.stall_decode(stall_decode),
		.hazard_prog_cntr_sel(prog_cntr_load_sel),
		.inst_word_sel(inst_word_sel),
		.hazard_inst_word(hazard_instruction),
		.prog_cntr_int_addr(hazard_int_addr),
		.stall_fetch_req(fetch_stl_req),
		.stall_decode_req(dec_stl_req),
		.halt(halt),
		.take_branch_target(take_branch_target),
		.illegal_opcode_exception(illegal_opcode_exception),  			//To Interrupt Controller
		.return_in_pipeline(ret),
		//SFR I/O Interface
		.sfr_file_in(sfr_input),
		.sfr_file_out(sfr_output)
	);
	
	assign led = sfr_output[3:0];
/*
ila_0 ila(
	.clk(ila_clk), // input wire clk


	.probe0(prog_cntr_load_sel), // input wire [3:0]  probe0  
	.probe1(prog_mem_addra), // input wire [13:0]  probe1 
	.probe2(prog_mem_douta[10:0]),
	.probe3(decode_instruction),
	.probe4(memwb_data),
	.probe5(take_branch_target), // input wire [0:0]  probe2 
	.probe6(core_clk) // input wire [0:0]  probe3
);
*/

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
