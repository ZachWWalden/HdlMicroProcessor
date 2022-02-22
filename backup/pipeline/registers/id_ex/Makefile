TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/id_ex.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/id_ex.vhdl
endif

MODULE = id_ex_tb
TOPLEVEL = id_ex
include $(shell cocotb-config --makefiles)/Makefile.sim
