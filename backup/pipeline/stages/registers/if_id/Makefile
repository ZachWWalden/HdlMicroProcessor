TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/if_id.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/if_id.vhdl
endif

MODULE = if_id_tb
TOPLEVEL = if_id
include $(shell cocotb-config --makefiles)/Makefile.sim
