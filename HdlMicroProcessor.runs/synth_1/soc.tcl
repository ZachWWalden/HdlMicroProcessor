# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "/home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.runs/synth_1/soc.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7s50csga324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.cache/wt [current_project]
set_property parent.project_path /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:arty-s7-50:part0:1.0 [current_project]
set_property ip_output_repo /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
add_files /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/assembler/frameBufferWrite.coe
add_files /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/vga_controller/f22.coe
add_files /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/demos/firstProgram/firstProgram.coe
read_verilog -library xil_defaultlib {
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/execute/alu/bit_shifter/bit_shifter.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/register_file/register_file.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/decode/decode_logic/decode_logic.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/memory/sfr_sel_mux/sfr_sel_mux.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/soc.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/execute/alu/alu.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/decode/branch_resolution_logic/branch_resolution_logic.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/decode/id_ex_data_input_mux/id_ex_data_input_mux.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/vga_controller/vga_controller.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/interrupt_controller/interrupt_controller.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/memory/mem_wb_data_input_mux/mem_wb_data_input_mux.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/memory/mem_str_data_sel_mux/mem_str_data_sel_mux.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/execute/alu/bitwise_logic_unit/bitwise_logic_unit.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/memory_io/memory_io.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/execute/alu/multiplier/multiplier.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/registers/id_ex/id_ex.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/execute/flags_register/flags_register.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/hazard_control_unit/hazard_control_unit.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/decode/decode.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/fetch/fetch.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/execute/memory_forwarding_logic/memory_forwarding_logic.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/registers/if_id/if_id.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/fetch/prog_cntr_load_sel_mux/prog_cntr_input_sel_mux.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/execute/alu/adder/adder.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/execute/alu_input_mux/alu_input_mux.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/memory/memory.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/registers/mem_wb/mem_wb.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/vga_controller/vert_cntr/vert_cntr.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/datapath.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/fetch/program_counter/program_counter.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/execute/ex_mem_data_input_mux/ex_mem_data_input_mux.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/decode/alu_forwarding_logic/alu_forwarding_logic.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/memory/sfr_file/sfr_file.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/execute/execute.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/registers/ex_mem/ex_mem.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/memory/mem_addr_sel_mux/mem_addr_sel_mux.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/vga_controller/horiz_cntr/horiz_cntr.v
  /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/src/soc/datapath/pipeline/stages/fetch/inst_word_sel_mux/inst_word_sel_mux.v
}
read_ip -quiet /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.srcs/sources_1/ip/call_stack/call_stack.xci
set_property used_in_implementation false [get_files -all /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/call_stack/call_stack_ooc.xdc]

read_ip -quiet /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.srcs/sources_1/ip/frame_buffer/frame_buffer.xci
set_property used_in_implementation false [get_files -all /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/frame_buffer/frame_buffer_ooc.xdc]

read_ip -quiet /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.srcs/sources_1/ip/vga_pix_clk_gen/vga_pix_clk_gen.xci
set_property used_in_implementation false [get_files -all /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/vga_pix_clk_gen/vga_pix_clk_gen_board.xdc]
set_property used_in_implementation false [get_files -all /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/vga_pix_clk_gen/vga_pix_clk_gen.xdc]
set_property used_in_implementation false [get_files -all /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/vga_pix_clk_gen/vga_pix_clk_gen_ooc.xdc]

read_ip -quiet /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.srcs/sources_1/ip/main_memory/main_memory.xci
set_property used_in_implementation false [get_files -all /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/main_memory/main_memory_ooc.xdc]

read_ip -quiet /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.srcs/sources_1/ip/clk_gen/clk_gen.xci
set_property used_in_implementation false [get_files -all /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/clk_gen/clk_gen_board.xdc]
set_property used_in_implementation false [get_files -all /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/clk_gen/clk_gen.xdc]
set_property used_in_implementation false [get_files -all /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/clk_gen/clk_gen_ooc.xdc]

read_ip -quiet /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.srcs/sources_1/ip/program_memory/program_memory.xci
set_property used_in_implementation false [get_files -all /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.gen/sources_1/ip/program_memory/program_memory_ooc.xdc]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.srcs/constrs_1/imports/HdlMicroProcessor.constraints/Arty-S7-50-Master.xdc
set_property used_in_implementation false [get_files /home/zww/Documents/College/2022SP/HDL/HdlMicroProcessor/HdlMicroProcessor.srcs/constrs_1/imports/HdlMicroProcessor.constraints/Arty-S7-50-Master.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top soc -part xc7s50csga324-1 -flatten_hierarchy none -keep_equivalent_registers
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef soc.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file soc_utilization_synth.rpt -pb soc_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
