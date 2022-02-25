TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/mem_str_data_sel_mux.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/mem_str_data_sel_mux.vhdl
endif

MODULE = mem_str_data_sel_mux_tb
TOPLEVEL = mem_str_data_sel_mux
include $(shell cocotb-config --makefiles)/Makefile.sim
