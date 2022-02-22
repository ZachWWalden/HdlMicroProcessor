TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/bit_shifter.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/bit_shifter.vhdl
endif

MODULE = bit_shifter_tb
TOPLEVEL = bit_shifter
include $(shell cocotb-config --makefiles)/Makefile.sim
