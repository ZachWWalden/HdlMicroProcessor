/*
Module - SOC (System On Chip)
Author - Zach Walden
Last Changed - 3/28/22
Description - This Module is the Top Module for the entire System On chip.
Parameters -
*/

module soc(
	input CLK12MHZ,
	output hsync,
	output vsync,
	output [11:0] pixel
);

	wire nreset = 1;

	//Instantiate Clock Generation Modules
	wire mem_clk;
	wire core_clk;
	wire vga_clk;
	assign mem_clk = CLK12MHZ;
	assign core_clk = CLK12MHZ;
	assign vga_clk = CLK12MHZ;

	//Instantiate Memory Blocks

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
		.call_stk_wen(),
		.call_stk_addr(),
		.call_stk_din(),
		.call_stk_dout(),
		//BEGIN interface with main memory
		.main_mem_wen(),
		.main_mem_addr(),
		.main_mem_din(),
		.main_mem_dout(),
		//BEGIN interface with program memory.
		.prog_mem_addra(),
		.prog_mem_douta(),
		.prog_mem_addrb(),
		.prog_mem_doutb(),
		//BEGIN interface with the framebuffer.
		.frame_buf_wena(),
		.frame_buf_addra(),
		.frame_buf_dina(),
		.frame_buf_douta()
	);

	wire [31:0] sfr_input;
	wire [143:0] sfr_output;

	wire interrupt = 0;
	wire interrupt_vector_address = 0;
	wire [3:0] hazard_control_unit_state;
	wire illegal_opcode_exception;
	//Instantiate Interrupt Controller

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
	vga_controller vga(
		.clock(core_clk),
		.nreset(nreset),
		.pixel_data(),
		.pixel_addr(),
		.pixel(),
		.h_sync(),
		.v_sync(),
		.v_blank_interupt()
	);


// the "macro" to dump signals
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("soc.vcd");
  $dumpvars (0,) soc);
  #1;
end
`endif
endmodule
