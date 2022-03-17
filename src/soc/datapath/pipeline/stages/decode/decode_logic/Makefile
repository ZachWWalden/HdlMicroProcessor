TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/decode_logic.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/decode_logic.vhdl
endif

MODULE = decode_logic_tb
TOPLEVEL = decode_logic
include $(shell cocotb-config --makefiles)/Makefile.sim
