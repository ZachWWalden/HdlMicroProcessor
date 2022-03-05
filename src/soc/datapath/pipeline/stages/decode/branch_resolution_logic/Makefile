TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/branch_resolution_logic.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/branch_resolution_logic.vhdl
endif

MODULE = branch_resolution_logic_tb
TOPLEVEL = branch_resolution_logic
include $(shell cocotb-config --makefiles)/Makefile.sim
