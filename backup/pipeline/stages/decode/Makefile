TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/decode.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/decode.vhdl
endif

MODULE = decode_tb
TOPLEVEL = decode
include $(shell cocotb-config --makefiles)/Makefile.sim
