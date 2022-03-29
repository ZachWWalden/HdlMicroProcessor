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

	//Instantiate Memory I/O Buffer
	memory_io mem_buffer(
		.clock(core_clk),
		//BEGIN interface with the fetch pipeline stage.
		.prog_mem_addr_fetch(),
		.prog_mem_instruction(),
		//BEGIN interface with memory pipeline stage.
		.call_stk_en(),
		.main_mem_en(),
		.prog_mem_en(),
		.fb_en(),
		.mem_wen(),
		.addr_in(),
		.call_stk_addr_in(),
		.data_in(),
		.call_stk_data_in(),
		.data_out(),
		.call_stk_data_out(),
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

	wire interrupt = 0;
	wire interrupt_vector_address = 0;
	wire [3:0] hazard_control_unit_state;
	//Instantiate Interrupt Controller

	wire return;
	wire halt;
	wire fetch_stl_req;
	wire dec_stl_req;

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
		.stall_fetch(),
		.stall_decode(),
		.prog_cntr_load_sel(),
		.inst_word_sel(),
		.new_inst_word(),
		.prog_cntr_int_addr(),
		//State
		.state(hazard_control_unit_state)
	);

	//Instantiate Data Path
	datapath pipeline(
		.clock(core_clk),
		.nreset(),
		//Memory Interface
		.prog_cntr_val(),
		.mem_fetch_instruction(),
		.main_mem_en(),
		.prog_mem_en(),
		.fb_en(),
		.call_stk_en(),
		.mem_wen(),
		.mem_addr(),
		.call_stk_addr(),
		.write_data(),
		.read_data(),
		.call_stk_write_data(),
		.call_stk_read_data(),
		//Hazard Unit Interface
		.stall_fetch(),
		.stall_decode(),
		.hazard_prog_cntr_sel(),
		.inst_word_sel(),
		.hazard_inst_word(),
		.prog_cntr_int_addr(),
		.stall_fetch(),
		.stall_decode(),
		.halt(),
		.illegal_opcode_exception(),
		.return_in_pipeline(),
		//SFR I/O Interface
		.sfr_file_in(),
		.sfr_file_out()
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
