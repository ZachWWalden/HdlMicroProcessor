TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/fetch.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/fetch.vhdl
endif

MODULE = fetch_tb
TOPLEVEL = fetch
include $(shell cocotb-config --makefiles)/Makefile.sim
