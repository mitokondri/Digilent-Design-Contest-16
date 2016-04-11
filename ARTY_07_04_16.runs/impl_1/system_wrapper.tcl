proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7a35ticsg324-1L
  set_property board_part digilentinc.com:arty:part0:1.1 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir C:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.cache/wt [current_project]
  set_property parent.project_path C:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.xpr [current_project]
  set_property ip_repo_paths {
  c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.cache/ip
  C:/Users/Emre/Desktop/vivado-library-master
} [current_project]
  set_property ip_output_repo c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.cache/ip [current_project]
  add_files -quiet C:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.runs/synth_1/system_wrapper.dcp
  add_files C:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/system.bmm
  set_property SCOPED_TO_REF system [get_files -all C:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/system.bmm]
  set_property SCOPED_TO_CELLS {} [get_files -all C:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/system.bmm]
  add_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_microblaze_0_0/data/mb_bootloop_le.elf
  set_property SCOPED_TO_REF system [get_files -all c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_microblaze_0_0/data/mb_bootloop_le.elf]
  set_property SCOPED_TO_CELLS microblaze_0 [get_files -all c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_microblaze_0_0/data/mb_bootloop_le.elf]
  read_xdc -prop_thru_buffers -ref system_clk_wiz_0_0 -cells inst c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_clk_wiz_0_0/system_clk_wiz_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_clk_wiz_0_0/system_clk_wiz_0_0_board.xdc]
  read_xdc -ref system_clk_wiz_0_0 -cells inst c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_clk_wiz_0_0/system_clk_wiz_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_clk_wiz_0_0/system_clk_wiz_0_0.xdc]
  read_xdc -ref system_mig_7series_0_0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_mig_7series_0_0/system_mig_7series_0_0/user_design/constraints/system_mig_7series_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_mig_7series_0_0/system_mig_7series_0_0/user_design/constraints/system_mig_7series_0_0.xdc]
  read_xdc -prop_thru_buffers -ref system_mig_7series_0_0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_mig_7series_0_0/system_mig_7series_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_mig_7series_0_0/system_mig_7series_0_0_board.xdc]
  read_xdc -ref system_microblaze_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_microblaze_0_0/system_microblaze_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_microblaze_0_0/system_microblaze_0_0.xdc]
  read_xdc -ref system_dlmb_v10_1 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_dlmb_v10_1/system_dlmb_v10_1.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_dlmb_v10_1/system_dlmb_v10_1.xdc]
  read_xdc -ref system_ilmb_v10_1 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_ilmb_v10_1/system_ilmb_v10_1.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_ilmb_v10_1/system_ilmb_v10_1.xdc]
  read_xdc -ref system_mdm_1_1 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_mdm_1_1/system_mdm_1_1.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_mdm_1_1/system_mdm_1_1.xdc]
  read_xdc -prop_thru_buffers -ref system_rst_mig_7series_0_83M_1 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_rst_mig_7series_0_83M_1/system_rst_mig_7series_0_83M_1_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_rst_mig_7series_0_83M_1/system_rst_mig_7series_0_83M_1_board.xdc]
  read_xdc -ref system_rst_mig_7series_0_83M_1 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_rst_mig_7series_0_83M_1/system_rst_mig_7series_0_83M_1.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_rst_mig_7series_0_83M_1/system_rst_mig_7series_0_83M_1.xdc]
  read_xdc -prop_thru_buffers -ref system_axi_quad_spi_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_quad_spi_0_0/system_axi_quad_spi_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_quad_spi_0_0/system_axi_quad_spi_0_0_board.xdc]
  read_xdc -ref system_axi_quad_spi_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_quad_spi_0_0/system_axi_quad_spi_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_quad_spi_0_0/system_axi_quad_spi_0_0.xdc]
  read_xdc -prop_thru_buffers -ref system_axi_iic_0_0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_iic_0_0/system_axi_iic_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_iic_0_0/system_axi_iic_0_0_board.xdc]
  read_xdc -prop_thru_buffers -ref system_axi_gpio_0_1 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_0_1/system_axi_gpio_0_1_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_0_1/system_axi_gpio_0_1_board.xdc]
  read_xdc -ref system_axi_gpio_0_1 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_0_1/system_axi_gpio_0_1.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_0_1/system_axi_gpio_0_1.xdc]
  read_xdc -prop_thru_buffers -ref system_axi_gpio_1_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_1_0/system_axi_gpio_1_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_1_0/system_axi_gpio_1_0_board.xdc]
  read_xdc -ref system_axi_gpio_1_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_1_0/system_axi_gpio_1_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_1_0/system_axi_gpio_1_0.xdc]
  read_xdc -prop_thru_buffers -ref system_axi_gpio_2_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_2_0/system_axi_gpio_2_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_2_0/system_axi_gpio_2_0_board.xdc]
  read_xdc -ref system_axi_gpio_2_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_2_0/system_axi_gpio_2_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_2_0/system_axi_gpio_2_0.xdc]
  read_xdc -prop_thru_buffers -ref system_axi_gpio_3_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_3_0/system_axi_gpio_3_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_3_0/system_axi_gpio_3_0_board.xdc]
  read_xdc -ref system_axi_gpio_3_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_3_0/system_axi_gpio_3_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_gpio_3_0/system_axi_gpio_3_0.xdc]
  read_xdc -prop_thru_buffers -ref system_axi_quad_spi_1_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_quad_spi_1_0/system_axi_quad_spi_1_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_quad_spi_1_0/system_axi_quad_spi_1_0_board.xdc]
  read_xdc -ref system_axi_quad_spi_1_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_quad_spi_1_0/system_axi_quad_spi_1_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_quad_spi_1_0/system_axi_quad_spi_1_0.xdc]
  read_xdc -prop_thru_buffers -ref system_PmodACL_0_0 -cells inst c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_0_0/system_PmodACL_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_0_0/system_PmodACL_0_0_board.xdc]
  read_xdc -prop_thru_buffers -ref PmodACL_pmod_bridge_0_0 -cells inst c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_0_0/src/PmodACL_pmod_bridge_0_0/PmodACL_pmod_bridge_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_0_0/src/PmodACL_pmod_bridge_0_0/PmodACL_pmod_bridge_0_0_board.xdc]
  read_xdc -prop_thru_buffers -ref PmodACL_axi_quad_spi_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_0_0/src/PmodACL_axi_quad_spi_0_0/PmodACL_axi_quad_spi_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_0_0/src/PmodACL_axi_quad_spi_0_0/PmodACL_axi_quad_spi_0_0_board.xdc]
  read_xdc -ref PmodACL_axi_quad_spi_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_0_0/src/PmodACL_axi_quad_spi_0_0/PmodACL_axi_quad_spi_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_0_0/src/PmodACL_axi_quad_spi_0_0/PmodACL_axi_quad_spi_0_0.xdc]
  read_xdc -prop_thru_buffers -ref PmodACL_axi_gpio_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_0_0/src/PmodACL_axi_gpio_0_0/PmodACL_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_0_0/src/PmodACL_axi_gpio_0_0/PmodACL_axi_gpio_0_0_board.xdc]
  read_xdc -ref PmodACL_axi_gpio_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_0_0/src/PmodACL_axi_gpio_0_0/PmodACL_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_0_0/src/PmodACL_axi_gpio_0_0/PmodACL_axi_gpio_0_0.xdc]
  read_xdc -prop_thru_buffers -ref system_PmodGPS_0_0 -cells inst c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodGPS_0_0/system_PmodGPS_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodGPS_0_0/system_PmodGPS_0_0_board.xdc]
  read_xdc -prop_thru_buffers -ref PmodGPS_axi_uartlite_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodGPS_0_0/ip/PmodGPS_axi_uartlite_0_0/PmodGPS_axi_uartlite_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodGPS_0_0/ip/PmodGPS_axi_uartlite_0_0/PmodGPS_axi_uartlite_0_0_board.xdc]
  read_xdc -ref PmodGPS_axi_uartlite_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodGPS_0_0/ip/PmodGPS_axi_uartlite_0_0/PmodGPS_axi_uartlite_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodGPS_0_0/ip/PmodGPS_axi_uartlite_0_0/PmodGPS_axi_uartlite_0_0.xdc]
  read_xdc -prop_thru_buffers -ref PmodGPS_pmod_bridge_0_0 -cells inst c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodGPS_0_0/ip/PmodGPS_pmod_bridge_0_0/PmodGPS_pmod_bridge_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodGPS_0_0/ip/PmodGPS_pmod_bridge_0_0/PmodGPS_pmod_bridge_0_0_board.xdc]
  read_xdc -prop_thru_buffers -ref PmodGPS_axi_gpio_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodGPS_0_0/ip/PmodGPS_axi_gpio_0_0/PmodGPS_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodGPS_0_0/ip/PmodGPS_axi_gpio_0_0/PmodGPS_axi_gpio_0_0_board.xdc]
  read_xdc -ref PmodGPS_axi_gpio_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodGPS_0_0/ip/PmodGPS_axi_gpio_0_0/PmodGPS_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodGPS_0_0/ip/PmodGPS_axi_gpio_0_0/PmodGPS_axi_gpio_0_0.xdc]
  read_xdc -prop_thru_buffers -ref system_PmodOLEDrgb_0_0 -cells inst c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodOLEDrgb_0_0/system_PmodOLEDrgb_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodOLEDrgb_0_0/system_PmodOLEDrgb_0_0_board.xdc]
  read_xdc -prop_thru_buffers -ref PmodOLEDrgb_axi_quad_spi_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/PmodOLEDrgb_axi_quad_spi_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/PmodOLEDrgb_axi_quad_spi_0_0_board.xdc]
  read_xdc -ref PmodOLEDrgb_axi_quad_spi_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/PmodOLEDrgb_axi_quad_spi_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/PmodOLEDrgb_axi_quad_spi_0_0.xdc]
  read_xdc -prop_thru_buffers -ref PmodOLEDrgb_axi_gpio_0_1 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_gpio_0_1/PmodOLEDrgb_axi_gpio_0_1_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_gpio_0_1/PmodOLEDrgb_axi_gpio_0_1_board.xdc]
  read_xdc -ref PmodOLEDrgb_axi_gpio_0_1 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_gpio_0_1/PmodOLEDrgb_axi_gpio_0_1.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_gpio_0_1/PmodOLEDrgb_axi_gpio_0_1.xdc]
  read_xdc -prop_thru_buffers -ref PmodOLEDrgb_pmod_bridge_0_0 -cells inst c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_pmod_bridge_0_0/PmodOLEDrgb_pmod_bridge_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_pmod_bridge_0_0/PmodOLEDrgb_pmod_bridge_0_0_board.xdc]
  read_xdc -prop_thru_buffers -ref system_PmodACL_1_0 -cells inst c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_1_0/system_PmodACL_1_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_1_0/system_PmodACL_1_0_board.xdc]
  read_xdc -prop_thru_buffers -ref PmodACL_pmod_bridge_0_0 -cells inst c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_1_0/src/PmodACL_pmod_bridge_0_0/PmodACL_pmod_bridge_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_1_0/src/PmodACL_pmod_bridge_0_0/PmodACL_pmod_bridge_0_0_board.xdc]
  read_xdc -prop_thru_buffers -ref PmodACL_axi_quad_spi_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_1_0/src/PmodACL_axi_quad_spi_0_0/PmodACL_axi_quad_spi_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_1_0/src/PmodACL_axi_quad_spi_0_0/PmodACL_axi_quad_spi_0_0_board.xdc]
  read_xdc -ref PmodACL_axi_quad_spi_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_1_0/src/PmodACL_axi_quad_spi_0_0/PmodACL_axi_quad_spi_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_1_0/src/PmodACL_axi_quad_spi_0_0/PmodACL_axi_quad_spi_0_0.xdc]
  read_xdc -prop_thru_buffers -ref PmodACL_axi_gpio_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_1_0/src/PmodACL_axi_gpio_0_0/PmodACL_axi_gpio_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_1_0/src/PmodACL_axi_gpio_0_0/PmodACL_axi_gpio_0_0_board.xdc]
  read_xdc -ref PmodACL_axi_gpio_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_1_0/src/PmodACL_axi_gpio_0_0/PmodACL_axi_gpio_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_1_0/src/PmodACL_axi_gpio_0_0/PmodACL_axi_gpio_0_0.xdc]
  read_xdc -ref system_axi_timer_0_0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_timer_0_0/system_axi_timer_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_timer_0_0/system_axi_timer_0_0.xdc]
  read_xdc -prop_thru_buffers -ref system_axi_uartlite_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_uartlite_0_0/system_axi_uartlite_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_uartlite_0_0/system_axi_uartlite_0_0_board.xdc]
  read_xdc -ref system_axi_uartlite_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_uartlite_0_0/system_axi_uartlite_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_uartlite_0_0/system_axi_uartlite_0_0.xdc]
  read_xdc -ref system_axi_intc_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_intc_0_0/system_axi_intc_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_intc_0_0/system_axi_intc_0_0.xdc]
  read_xdc -ref system_axi_quad_spi_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_quad_spi_0_0/system_axi_quad_spi_0_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_quad_spi_0_0/system_axi_quad_spi_0_0_clocks.xdc]
  read_xdc -ref system_axi_quad_spi_1_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_quad_spi_1_0/system_axi_quad_spi_1_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_quad_spi_1_0/system_axi_quad_spi_1_0_clocks.xdc]
  read_xdc -ref PmodACL_axi_quad_spi_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_0_0/src/PmodACL_axi_quad_spi_0_0/PmodACL_axi_quad_spi_0_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_0_0/src/PmodACL_axi_quad_spi_0_0/PmodACL_axi_quad_spi_0_0_clocks.xdc]
  read_xdc -ref PmodOLEDrgb_axi_quad_spi_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/PmodOLEDrgb_axi_quad_spi_0_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/PmodOLEDrgb_axi_quad_spi_0_0_clocks.xdc]
  read_xdc -ref PmodACL_axi_quad_spi_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_1_0/src/PmodACL_axi_quad_spi_0_0/PmodACL_axi_quad_spi_0_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_PmodACL_1_0/src/PmodACL_axi_quad_spi_0_0/PmodACL_axi_quad_spi_0_0_clocks.xdc]
  read_xdc -ref system_axi_intc_0_0 -cells U0 c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_intc_0_0/system_axi_intc_0_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_axi_intc_0_0/system_axi_intc_0_0_clocks.xdc]
  read_xdc -ref system_auto_us_0 -cells inst c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_auto_us_0/system_auto_us_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_auto_us_0/system_auto_us_0_clocks.xdc]
  read_xdc -ref system_auto_us_1 -cells inst c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_auto_us_1/system_auto_us_1_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/Emre/Documents/Vivado/ARTY_07_04_16/ARTY_07_04_16.srcs/sources_1/bd/system/ip/system_auto_us_1/system_auto_us_1_clocks.xdc]
  link_design -top system_wrapper -part xc7a35ticsg324-1L
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force system_wrapper_opt.dcp
  report_drc -file system_wrapper_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file system_wrapper.hwdef}
  place_design 
  write_checkpoint -force system_wrapper_placed.dcp
  report_io -file system_wrapper_io_placed.rpt
  report_utilization -file system_wrapper_utilization_placed.rpt -pb system_wrapper_utilization_placed.pb
  report_control_sets -verbose -file system_wrapper_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force system_wrapper_routed.dcp
  report_drc -file system_wrapper_drc_routed.rpt -pb system_wrapper_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file system_wrapper_timing_summary_routed.rpt -rpx system_wrapper_timing_summary_routed.rpx
  report_power -file system_wrapper_power_routed.rpt -pb system_wrapper_power_summary_routed.pb
  report_route_status -file system_wrapper_route_status.rpt -pb system_wrapper_route_status.pb
  report_clock_utilization -file system_wrapper_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force system_wrapper.mmi }
  catch { write_bmm -force system_wrapper_bd.bmm }
  write_bitstream -force system_wrapper.bit 
  catch { write_sysdef -hwdef system_wrapper.hwdef -bitfile system_wrapper.bit -meminfo system_wrapper.mmi -file system_wrapper.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

