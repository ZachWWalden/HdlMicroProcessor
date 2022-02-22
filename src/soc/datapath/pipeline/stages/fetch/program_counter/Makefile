TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/program_counter.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/program_counter.vhdl
endif

MODULE = program_counter_tb
TOPLEVEL = program_counter
include $(shell cocotb-config --makefiles)/Makefile.sim
