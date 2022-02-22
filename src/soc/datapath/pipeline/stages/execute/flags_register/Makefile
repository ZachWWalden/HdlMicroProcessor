TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/flags_register.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/flags_register.vhdl
endif

MODULE = flags_register_tb
TOPLEVEL = flags_register
include $(shell cocotb-config --makefiles)/Makefile.sim
