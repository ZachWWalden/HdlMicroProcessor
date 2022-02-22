TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/execute.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/execute.vhdl
endif

MODULE = execute_tb
TOPLEVEL = execute
include $(shell cocotb-config --makefiles)/Makefile.sim
