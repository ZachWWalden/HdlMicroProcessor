TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1
PWD = (shell pwd)

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/register_file.v $(shell pwd)/register_byte.v $(shell pwd)/register_short.v $(shell pwd)/reg_file_input_decoder.v $(shell pwd)/reg_file_output_decoder.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/register_file.vhdl
endif

MODULE = register_file_tb
TOPLEVEL = register_file
include $(shell cocotb-config --makefiles)/Makefile.sim
