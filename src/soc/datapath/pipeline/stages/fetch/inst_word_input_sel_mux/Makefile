TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/inst_word_input_sel_mux.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/inst_word_input_sel_mux.vhdl
endif

MODULE = inst_word_input_sel_mux_tb
TOPLEVEL = inst_word_input_sel_mux
include $(shell cocotb-config --makefiles)/Makefile.sim
