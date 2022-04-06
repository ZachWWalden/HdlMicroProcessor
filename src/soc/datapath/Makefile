TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/datapath.v $(shell pwd)/pipeline/stages/fetch/fetch.v $(shell pwd)/pipeline/stages/fetch/program_counter/program_counter.v $(shell pwd)/pipeline/stages/fetch/prog_cntr_load_sel_mux/prog_cntr_input_sel_mux.v $(shell pwd)/pipeline/stages/fetch/inst_word_sel_mux/inst_word_sel_mux.v $(shell pwd)/pipeline/stages/decode/alu_forwarding_logic/alu_forwarding_logic.v $(shell pwd)/pipeline/stages/decode/branch_resolution_logic/branch_resolution_logic.v $(shell pwd)/pipeline/stages/decode/decode_logic/decode_logic.v $(shell pwd)/pipeline/stages/decode/id_ex_data_input_mux/id_ex_data_input_mux.v $(shell pwd)/pipeline/stages/decode/decode.v $(shell pwd)/pipeline/stages/execute/alu/adder/adder.v $(shell pwd)/pipeline/stages/execute/alu/bit_shifter/bit_shifter.v $(shell pwd)/pipeline/stages/execute/alu/bitwise_logic_unit/bitwise_logic_unit.v $(shell pwd)/pipeline/stages/execute/alu/multiplier/multiplier.v $(shell pwd)/pipeline/stages/execute/alu/alu.v $(shell pwd)/pipeline/stages/execute/alu_input_mux/alu_input_mux.v $(shell pwd)/pipeline/stages/execute/ex_mem_data_input_mux/ex_mem_data_input_mux.v $(shell pwd)/pipeline/stages/execute/flags_register/flags_register.v $(shell pwd)/pipeline/stages/execute/memory_forwarding_logic/memory_forwarding_logic.v $(shell pwd)/pipeline/stages/execute/execute.v $(shell pwd)/pipeline/stages/memory/mem_addr_sel_mux/mem_addr_sel_mux.v $(shell pwd)/pipeline/stages/memory/mem_str_data_sel_mux/mem_str_data_sel_mux.v $(shell pwd)/pipeline/stages/memory/mem_wb_data_input_mux/mem_wb_data_input_mux.v $(shell pwd)/pipeline/stages/memory/sfr_file/sfr_file.v $(shell pwd)/pipeline/stages/memory/sfr_sel_mux/sfr_sel_mux.v $(shell pwd)/pipeline/stages/memory/memory.v $(shell pwd)/pipeline/registers/if_id/if_id.v $(shell pwd)/pipeline/registers/id_ex/id_ex.v $(shell pwd)/pipeline/registers/ex_mem/ex_mem.v $(shell pwd)/pipeline/registers/mem_wb/mem_wb.v $(shell pwd)/inst_word_input_sel_mux/inst_word_input_sel_mux.v $(shell pwd)/register_file/register_file.v

else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/datapath.vhdl
endif

MODULE = datapath_tb
TOPLEVEL = datapath
include $(shell cocotb-config --makefiles)/Makefile.sim
