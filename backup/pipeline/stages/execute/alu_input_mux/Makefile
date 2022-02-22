TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/alu_input_mux.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/decode.vhdl
endif

MODULE = alu_input_mux_tb
TOPLEVEL = alu_input_mux
include $(shell cocotb-config --makefiles)/Makefile.sim
