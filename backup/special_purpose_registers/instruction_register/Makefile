TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/instruction_register.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/instruction_register.vhdl
endif

MODULE = instruction_register_tb
TOPLEVEL = instruction_register

include $(shell cocotb-config --makefiles)/Makefile.sim
