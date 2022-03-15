TOPLEVEL_LANG ?= verilog
WAVES=1
GUI=1

ifeq ($(TOPLEVEL_LANG),verilog)
	VERILOG_SOURCES = $(shell pwd)/vga_controller.v $(shell pwd)/horiz_cntr/horiz_cntr.v $(shell pwd)/vert_cntr/vert_cntr.v
else ifeq ($(TOPLEVEL_LANG), vhdl)
	VHDL_SOURCES = $(shell pwd)/vga_controller.vhdl
endif

MODULE = vga_controller_tb
TOPLEVEL = vga_controller
include $(shell cocotb-config --makefiles)/Makefile.sim
