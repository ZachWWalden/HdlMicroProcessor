TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/reg_file_output_decoder.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/reg_file_output_decoder.vhdl
endif

MODULE = reg_file_output_decoder_tb
TOPLEVEL = reg_file_output_decoder
include $(shell cocotb-config --makefiles)/Makefile.sim
