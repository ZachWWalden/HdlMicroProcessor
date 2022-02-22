TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/adder.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/adder.vhdl
endif

MODULE = adder_tb
TOPLEVEL = adder
include $(shell cocotb-config --makefiles)/Makefile.sim
