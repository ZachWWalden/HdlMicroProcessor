TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/alu_forwarding_logic.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/alu_forwarding_logic.vhdl
endif

MODULE = alu_forwarding_logic_tb
TOPLEVEL = alu_forwarding_logic
include $(shell cocotb-config --makefiles)/Makefile.sim
