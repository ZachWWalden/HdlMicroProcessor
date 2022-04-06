TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/call_stk.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/call_stk.vhdl
endif

MODULE = call_stk_tb
TOPLEVEL = call_stk
include $(shell cocotb-config --makefiles)/Makefile.sim
