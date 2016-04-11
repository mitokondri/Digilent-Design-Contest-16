
################################################################
# This is a generated script based on design: system
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source system_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a35ticsg324-1L
#    set_property BOARD_PART digilentinc.com:arty:part0:1.1 [current_project]

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name system

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  if { $parentCell eq "" || $nameHier eq "" } {
     puts "ERROR: create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB

  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -from 0 -to 0 -type rst SYS_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_ECC {0} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_ECC {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram ]
  set_property -dict [ list \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set ddr3_sdram [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 ddr3_sdram ]
  set dip_switches_4bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 dip_switches_4bits ]
  set i2c [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 i2c ]
  set i2c_pullups [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 i2c_pullups ]
  set ja [ create_bd_intf_port -mode Master -vlnv digilentinc.com:interface:pmod_rtl:1.0 ja ]
  set jb [ create_bd_intf_port -mode Master -vlnv digilentinc.com:interface:pmod_rtl:1.0 jb ]
  set jc [ create_bd_intf_port -mode Master -vlnv digilentinc.com:interface:pmod_rtl:1.0 jc ]
  set jd [ create_bd_intf_port -mode Master -vlnv digilentinc.com:interface:pmod_rtl:1.0 jd ]
  set led_4bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 led_4bits ]
  set push_buttons_4bits [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 push_buttons_4bits ]
  set qspi_flash [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 qspi_flash ]
  set rgb_led [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 rgb_led ]
  set shield_dp0_dp19 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 shield_dp0_dp19 ]
  set shield_dp26_dp41 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 shield_dp26_dp41 ]
  set spi [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 spi ]
  set usb_uart [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 usb_uart ]

  # Create ports
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
CONFIG.POLARITY {ACTIVE_LOW} \
 ] $reset
  set sys_clock [ create_bd_port -dir I -type clk sys_clock ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {100000000} \
CONFIG.PHASE {0.000} \
 ] $sys_clock

  # Create instance: PmodACL_0, and set properties
  set PmodACL_0 [ create_bd_cell -type ip -vlnv digilentinc.com:IP:PmodACL:1.0 PmodACL_0 ]
  set_property -dict [ list \
CONFIG.PMOD {ja} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $PmodACL_0

  # Create instance: PmodACL_1, and set properties
  set PmodACL_1 [ create_bd_cell -type ip -vlnv digilentinc.com:IP:PmodACL:1.0 PmodACL_1 ]
  set_property -dict [ list \
CONFIG.PMOD {jd} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $PmodACL_1

  # Create instance: PmodGPS_0, and set properties
  set PmodGPS_0 [ create_bd_cell -type ip -vlnv digilentinc.com:IP:PmodGPS:1.0 PmodGPS_0 ]
  set_property -dict [ list \
CONFIG.PMOD {jb} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $PmodGPS_0

  # Create instance: PmodOLEDrgb_0, and set properties
  set PmodOLEDrgb_0 [ create_bd_cell -type ip -vlnv digilentinc.com:IP:PmodOLEDrgb:1.0 PmodOLEDrgb_0 ]
  set_property -dict [ list \
CONFIG.PMOD {jc} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $PmodOLEDrgb_0

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
CONFIG.C_ALL_INPUTS {1} \
CONFIG.C_ALL_OUTPUTS {0} \
CONFIG.GPIO2_BOARD_INTERFACE {led_4bits} \
CONFIG.GPIO_BOARD_INTERFACE {dip_switches_4bits} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_gpio_0

  # Create instance: axi_gpio_1, and set properties
  set axi_gpio_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_1 ]
  set_property -dict [ list \
CONFIG.C_ALL_OUTPUTS_2 {1} \
CONFIG.C_GPIO2_WIDTH {12} \
CONFIG.C_INTERRUPT_PRESENT {1} \
CONFIG.C_IS_DUAL {1} \
CONFIG.GPIO2_BOARD_INTERFACE {rgb_led} \
CONFIG.GPIO_BOARD_INTERFACE {push_buttons_4bits} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_gpio_1

  # Create instance: axi_gpio_2, and set properties
  set axi_gpio_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_2 ]
  set_property -dict [ list \
CONFIG.C_GPIO2_WIDTH {16} \
CONFIG.C_IS_DUAL {1} \
CONFIG.GPIO2_BOARD_INTERFACE {shield_dp26_dp41} \
CONFIG.GPIO_BOARD_INTERFACE {shield_dp0_dp19} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_gpio_2

  # Create instance: axi_gpio_3, and set properties
  set axi_gpio_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_3 ]
  set_property -dict [ list \
CONFIG.GPIO_BOARD_INTERFACE {i2c_pullups} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_gpio_3

  # Create instance: axi_iic_0, and set properties
  set axi_iic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0 ]
  set_property -dict [ list \
CONFIG.IIC_BOARD_INTERFACE {i2c} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_iic_0

  # Create instance: axi_intc_0, and set properties
  set axi_intc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 axi_intc_0 ]

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {2} \
 ] $axi_mem_intercon

  # Create instance: axi_quad_spi_0, and set properties
  set axi_quad_spi_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi_0 ]
  set_property -dict [ list \
CONFIG.QSPI_BOARD_INTERFACE {spi} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_quad_spi_0

  # Create instance: axi_quad_spi_1, and set properties
  set axi_quad_spi_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi_1 ]
  set_property -dict [ list \
CONFIG.QSPI_BOARD_INTERFACE {qspi_flash} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_quad_spi_1

  # Create instance: axi_timer_0, and set properties
  set axi_timer_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0 ]

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list \
CONFIG.UARTLITE_BOARD_INTERFACE {usb_uart} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_uartlite_0

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.2 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {118.758} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {166.667} \
CONFIG.CLKOUT2_JITTER {114.829} \
CONFIG.CLKOUT2_PHASE_ERROR {98.575} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {200.000} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.CLK_IN1_BOARD_INTERFACE {sys_clock} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {6.000} \
CONFIG.MMCM_CLKOUT1_DIVIDE {5} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.NUM_OUT_CLKS {2} \
CONFIG.RESET_BOARD_INTERFACE {Custom} \
CONFIG.RESET_PORT {resetn} \
CONFIG.RESET_TYPE {ACTIVE_LOW} \
CONFIG.USE_BOARD_FLOW {true} \
 ] $clk_wiz_0

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.5 microblaze_0 ]
  set_property -dict [ list \
CONFIG.C_CACHE_BYTE_SIZE {16384} \
CONFIG.C_DCACHE_BYTE_SIZE {16384} \
CONFIG.C_DEBUG_ENABLED {1} \
CONFIG.C_D_AXI {1} \
CONFIG.C_D_LMB {1} \
CONFIG.C_I_LMB {1} \
CONFIG.C_USE_DCACHE {1} \
CONFIG.C_USE_ICACHE {1} \
 ] $microblaze_0

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {18} \
 ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: mig_7series_0, and set properties
  set mig_7series_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series:2.4 mig_7series_0 ]
  set_property -dict [ list \
CONFIG.BOARD_MIG_PARAM {ddr3_sdram} \
CONFIG.RESET_BOARD_INTERFACE {reset} \
 ] $mig_7series_0

  # Create instance: rst_mig_7series_0_83M, and set properties
  set rst_mig_7series_0_83M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_mig_7series_0_83M ]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {4} \
 ] $xlconcat_0

  # Create interface connections
  connect_bd_intf_net -intf_net PmodACL_0_Pmod_out [get_bd_intf_ports ja] [get_bd_intf_pins PmodACL_0/Pmod_out]
  connect_bd_intf_net -intf_net PmodACL_1_Pmod_out [get_bd_intf_ports jd] [get_bd_intf_pins PmodACL_1/Pmod_out]
  connect_bd_intf_net -intf_net PmodGPS_0_PmodGPS_Out [get_bd_intf_ports jb] [get_bd_intf_pins PmodGPS_0/PmodGPS_Out]
  connect_bd_intf_net -intf_net PmodOLEDrgb_0_PmodOLEDrgb_out [get_bd_intf_ports jc] [get_bd_intf_pins PmodOLEDrgb_0/PmodOLEDrgb_out]
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO [get_bd_intf_ports dip_switches_4bits] [get_bd_intf_pins axi_gpio_0/GPIO]
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO2 [get_bd_intf_ports led_4bits] [get_bd_intf_pins axi_gpio_0/GPIO2]
  connect_bd_intf_net -intf_net axi_gpio_1_GPIO [get_bd_intf_ports push_buttons_4bits] [get_bd_intf_pins axi_gpio_1/GPIO]
  connect_bd_intf_net -intf_net axi_gpio_1_GPIO2 [get_bd_intf_ports rgb_led] [get_bd_intf_pins axi_gpio_1/GPIO2]
  connect_bd_intf_net -intf_net axi_gpio_2_GPIO [get_bd_intf_ports shield_dp0_dp19] [get_bd_intf_pins axi_gpio_2/GPIO]
  connect_bd_intf_net -intf_net axi_gpio_2_GPIO2 [get_bd_intf_ports shield_dp26_dp41] [get_bd_intf_pins axi_gpio_2/GPIO2]
  connect_bd_intf_net -intf_net axi_gpio_3_GPIO [get_bd_intf_ports i2c_pullups] [get_bd_intf_pins axi_gpio_3/GPIO]
  connect_bd_intf_net -intf_net axi_iic_0_IIC [get_bd_intf_ports i2c] [get_bd_intf_pins axi_iic_0/IIC]
  connect_bd_intf_net -intf_net axi_intc_0_interrupt [get_bd_intf_pins axi_intc_0/interrupt] [get_bd_intf_pins microblaze_0/INTERRUPT]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins mig_7series_0/S_AXI]
  connect_bd_intf_net -intf_net axi_quad_spi_0_SPI_0 [get_bd_intf_ports spi] [get_bd_intf_pins axi_quad_spi_0/SPI_0]
  connect_bd_intf_net -intf_net axi_quad_spi_1_SPI_0 [get_bd_intf_ports qspi_flash] [get_bd_intf_pins axi_quad_spi_1/SPI_0]
  connect_bd_intf_net -intf_net axi_uartlite_0_UART [get_bd_intf_ports usb_uart] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DC [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins microblaze_0/M_AXI_DC]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DP [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_IC [get_bd_intf_pins axi_mem_intercon/S01_AXI] [get_bd_intf_pins microblaze_0/M_AXI_IC]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M00_AXI [get_bd_intf_pins axi_quad_spi_0/AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins axi_iic_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins axi_gpio_1/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M04_AXI [get_bd_intf_pins axi_gpio_2/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M05_AXI [get_bd_intf_pins axi_gpio_3/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M06_AXI [get_bd_intf_pins axi_quad_spi_1/AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M06_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M07_AXI [get_bd_intf_pins PmodACL_0/AXI_LITE_SPI] [get_bd_intf_pins microblaze_0_axi_periph/M07_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M08_AXI [get_bd_intf_pins PmodACL_0/AXI_LITE_GPIO] [get_bd_intf_pins microblaze_0_axi_periph/M08_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M09_AXI [get_bd_intf_pins PmodGPS_0/AXI_LITE_UART] [get_bd_intf_pins microblaze_0_axi_periph/M09_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M10_AXI [get_bd_intf_pins PmodGPS_0/AXI_LITE_GPIO] [get_bd_intf_pins microblaze_0_axi_periph/M10_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M11_AXI [get_bd_intf_pins PmodOLEDrgb_0/AXI_LITE_GPIO] [get_bd_intf_pins microblaze_0_axi_periph/M11_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M12_AXI [get_bd_intf_pins PmodOLEDrgb_0/AXI_LITE_SPI] [get_bd_intf_pins microblaze_0_axi_periph/M12_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M13_AXI [get_bd_intf_pins PmodACL_1/AXI_LITE_SPI] [get_bd_intf_pins microblaze_0_axi_periph/M13_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M14_AXI [get_bd_intf_pins PmodACL_1/AXI_LITE_GPIO] [get_bd_intf_pins microblaze_0_axi_periph/M14_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M15_AXI [get_bd_intf_pins axi_timer_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M15_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M16_AXI [get_bd_intf_pins axi_uartlite_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M16_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M17_AXI [get_bd_intf_pins axi_intc_0/s_axi] [get_bd_intf_pins microblaze_0_axi_periph/M17_AXI]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net mig_7series_0_DDR3 [get_bd_intf_ports ddr3_sdram] [get_bd_intf_pins mig_7series_0/DDR3]

  # Create port connections
  connect_bd_net -net axi_gpio_1_ip2intc_irpt [get_bd_pins axi_gpio_1/ip2intc_irpt] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net axi_iic_0_iic2intc_irpt [get_bd_pins axi_iic_0/iic2intc_irpt] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net axi_timer_0_interrupt [get_bd_pins axi_timer_0/interrupt] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net axi_uartlite_0_interrupt [get_bd_pins axi_uartlite_0/interrupt] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins mig_7series_0/sys_clk_i]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins mig_7series_0/clk_ref_i]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_mig_7series_0_83M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins PmodACL_0/ext_spi_clk] [get_bd_pins PmodACL_0/s_axi_aclk] [get_bd_pins PmodACL_1/ext_spi_clk] [get_bd_pins PmodACL_1/s_axi_aclk] [get_bd_pins PmodGPS_0/s_axi_aclk] [get_bd_pins PmodOLEDrgb_0/ext_spi_clk] [get_bd_pins PmodOLEDrgb_0/s_axi_aclk] [get_bd_pins PmodOLEDrgb_0/s_axi_aclk2] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_gpio_1/s_axi_aclk] [get_bd_pins axi_gpio_2/s_axi_aclk] [get_bd_pins axi_gpio_3/s_axi_aclk] [get_bd_pins axi_iic_0/s_axi_aclk] [get_bd_pins axi_intc_0/s_axi_aclk] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon/S01_ACLK] [get_bd_pins axi_quad_spi_0/ext_spi_clk] [get_bd_pins axi_quad_spi_0/s_axi_aclk] [get_bd_pins axi_quad_spi_1/ext_spi_clk] [get_bd_pins axi_quad_spi_1/s_axi_aclk] [get_bd_pins axi_timer_0/s_axi_aclk] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/M04_ACLK] [get_bd_pins microblaze_0_axi_periph/M05_ACLK] [get_bd_pins microblaze_0_axi_periph/M06_ACLK] [get_bd_pins microblaze_0_axi_periph/M07_ACLK] [get_bd_pins microblaze_0_axi_periph/M08_ACLK] [get_bd_pins microblaze_0_axi_periph/M09_ACLK] [get_bd_pins microblaze_0_axi_periph/M10_ACLK] [get_bd_pins microblaze_0_axi_periph/M11_ACLK] [get_bd_pins microblaze_0_axi_periph/M12_ACLK] [get_bd_pins microblaze_0_axi_periph/M13_ACLK] [get_bd_pins microblaze_0_axi_periph/M14_ACLK] [get_bd_pins microblaze_0_axi_periph/M15_ACLK] [get_bd_pins microblaze_0_axi_periph/M16_ACLK] [get_bd_pins microblaze_0_axi_periph/M17_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins mig_7series_0/ui_clk] [get_bd_pins rst_mig_7series_0_83M/slowest_sync_clk]
  connect_bd_net -net mig_7series_0_mmcm_locked [get_bd_pins mig_7series_0/mmcm_locked] [get_bd_pins rst_mig_7series_0_83M/dcm_locked]
  connect_bd_net -net mig_7series_0_ui_clk_sync_rst [get_bd_pins mig_7series_0/ui_clk_sync_rst] [get_bd_pins rst_mig_7series_0_83M/ext_reset_in]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins clk_wiz_0/resetn] [get_bd_pins mig_7series_0/sys_rst]
  connect_bd_net -net rst_mig_7series_0_83M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/SYS_Rst] [get_bd_pins rst_mig_7series_0_83M/bus_struct_reset]
  connect_bd_net -net rst_mig_7series_0_83M_interconnect_aresetn [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins rst_mig_7series_0_83M/interconnect_aresetn]
  connect_bd_net -net rst_mig_7series_0_83M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins rst_mig_7series_0_83M/mb_reset]
  connect_bd_net -net rst_mig_7series_0_83M_peripheral_aresetn [get_bd_pins PmodACL_0/s_axi_aresetn] [get_bd_pins PmodACL_1/s_axi_aresetn] [get_bd_pins PmodGPS_0/s_axi_aresetn] [get_bd_pins PmodOLEDrgb_0/s_axi_aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_gpio_1/s_axi_aresetn] [get_bd_pins axi_gpio_2/s_axi_aresetn] [get_bd_pins axi_gpio_3/s_axi_aresetn] [get_bd_pins axi_iic_0/s_axi_aresetn] [get_bd_pins axi_intc_0/s_axi_aresetn] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon/S01_ARESETN] [get_bd_pins axi_quad_spi_0/s_axi_aresetn] [get_bd_pins axi_quad_spi_1/s_axi_aresetn] [get_bd_pins axi_timer_0/s_axi_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/M04_ARESETN] [get_bd_pins microblaze_0_axi_periph/M05_ARESETN] [get_bd_pins microblaze_0_axi_periph/M06_ARESETN] [get_bd_pins microblaze_0_axi_periph/M07_ARESETN] [get_bd_pins microblaze_0_axi_periph/M08_ARESETN] [get_bd_pins microblaze_0_axi_periph/M09_ARESETN] [get_bd_pins microblaze_0_axi_periph/M10_ARESETN] [get_bd_pins microblaze_0_axi_periph/M11_ARESETN] [get_bd_pins microblaze_0_axi_periph/M12_ARESETN] [get_bd_pins microblaze_0_axi_periph/M13_ARESETN] [get_bd_pins microblaze_0_axi_periph/M14_ARESETN] [get_bd_pins microblaze_0_axi_periph/M15_ARESETN] [get_bd_pins microblaze_0_axi_periph/M16_ARESETN] [get_bd_pins microblaze_0_axi_periph/M17_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins mig_7series_0/aresetn] [get_bd_pins rst_mig_7series_0_83M/peripheral_aresetn]
  connect_bd_net -net sys_clock_1 [get_bd_ports sys_clock] [get_bd_pins clk_wiz_0/clk_in1]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins axi_intc_0/intr] [get_bd_pins xlconcat_0/dout]

  # Create address segments
  create_bd_addr_seg -range 0x10000 -offset 0x44A20000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs PmodACL_0/AXI_LITE_SPI/Reg0] SEG_PmodACL_0_Reg0
  create_bd_addr_seg -range 0x1000 -offset 0x44A30000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs PmodACL_0/AXI_LITE_GPIO/Reg0] SEG_PmodACL_0_Reg01
  create_bd_addr_seg -range 0x10000 -offset 0x44A70000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs PmodACL_1/AXI_LITE_SPI/Reg0] SEG_PmodACL_1_Reg0
  create_bd_addr_seg -range 0x1000 -offset 0x44A32000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs PmodACL_1/AXI_LITE_GPIO/Reg0] SEG_PmodACL_1_Reg01
  create_bd_addr_seg -range 0x10000 -offset 0x44A40000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs PmodGPS_0/AXI_LITE_UART/Reg0] SEG_PmodGPS_0_Reg0
  create_bd_addr_seg -range 0x1000 -offset 0x44A31000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs PmodGPS_0/AXI_LITE_GPIO/Reg0] SEG_PmodGPS_0_Reg01
  create_bd_addr_seg -range 0x10000 -offset 0x44A50000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs PmodOLEDrgb_0/AXI_LITE_GPIO/AXI_LITE_GPIO_reg] SEG_PmodOLEDrgb_0_AXI_LITE_GPIO_reg
  create_bd_addr_seg -range 0x10000 -offset 0x44A60000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs PmodOLEDrgb_0/AXI_LITE_SPI/AXI_LITE_SPI_reg] SEG_PmodOLEDrgb_0_AXI_LITE_SPI_reg
  create_bd_addr_seg -range 0x10000 -offset 0x40000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40010000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_gpio_1/S_AXI/Reg] SEG_axi_gpio_1_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40020000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_gpio_2/S_AXI/Reg] SEG_axi_gpio_2_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40030000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_gpio_3/S_AXI/Reg] SEG_axi_gpio_3_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40800000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_iic_0/S_AXI/Reg] SEG_axi_iic_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41200000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_intc_0/s_axi/Reg] SEG_axi_intc_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_quad_spi_0/AXI_LITE/Reg] SEG_axi_quad_spi_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x44A10000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_quad_spi_1/AXI_LITE/Reg] SEG_axi_quad_spi_1_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x41C00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_timer_0/S_AXI/Reg] SEG_axi_timer_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x40600000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000 -offset 0x0 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x10000000 -offset 0x80000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x10000000 -offset 0x80000000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port spi -pg 1 -y 1110 -defaultsOSRD
preplace port shield_dp0_dp19 -pg 1 -y 970 -defaultsOSRD
preplace port ddr3_sdram -pg 1 -y 780 -defaultsOSRD
preplace port ja -pg 1 -y 320 -defaultsOSRD
preplace port shield_dp26_dp41 -pg 1 -y 990 -defaultsOSRD
preplace port jb -pg 1 -y 460 -defaultsOSRD
preplace port qspi_flash -pg 1 -y 1370 -defaultsOSRD
preplace port i2c_pullups -pg 1 -y 60 -defaultsOSRD
preplace port jc -pg 1 -y 630 -defaultsOSRD
preplace port sys_clock -pg 1 -y 860 -defaultsOSRD
preplace port jd -pg 1 -y 1690 -defaultsOSRD
preplace port usb_uart -pg 1 -y 1820 -defaultsOSRD
preplace port push_buttons_4bits -pg 1 -y 1230 -defaultsOSRD
preplace port i2c -pg 1 -y 1510 -defaultsOSRD
preplace port rgb_led -pg 1 -y 1250 -defaultsOSRD
preplace port led_4bits -pg 1 -y 190 -defaultsOSRD
preplace port reset -pg 1 -y 880 -defaultsOSRD
preplace port dip_switches_4bits -pg 1 -y 170 -defaultsOSRD
preplace inst axi_quad_spi_1 -pg 1 -lvl 6 -y 1380 -defaultsOSRD
preplace inst rst_mig_7series_0_83M -pg 1 -lvl 1 -y 750 -defaultsOSRD
preplace inst axi_iic_0 -pg 1 -lvl 6 -y 1530 -defaultsOSRD
preplace inst axi_intc_0 -pg 1 -lvl 3 -y 1770 -defaultsOSRD
preplace inst mig_7series_0 -pg 1 -lvl 6 -y 820 -defaultsOSRD
preplace inst microblaze_0_axi_periph -pg 1 -lvl 2 -y 1340 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 2 -y 1900 -defaultsOSRD
preplace inst axi_timer_0 -pg 1 -lvl 3 -y 1950 -defaultsOSRD
preplace inst PmodOLEDrgb_0 -pg 1 -lvl 6 -y 630 -defaultsOSRD
preplace inst axi_gpio_0 -pg 1 -lvl 6 -y 180 -defaultsOSRD
preplace inst PmodGPS_0 -pg 1 -lvl 6 -y 470 -defaultsOSRD
preplace inst axi_gpio_1 -pg 1 -lvl 6 -y 1250 -defaultsOSRD
preplace inst axi_gpio_2 -pg 1 -lvl 6 -y 990 -defaultsOSRD
preplace inst mdm_1 -pg 1 -lvl 3 -y 770 -defaultsOSRD
preplace inst axi_gpio_3 -pg 1 -lvl 6 -y 60 -defaultsOSRD
preplace inst axi_uartlite_0 -pg 1 -lvl 6 -y 1830 -defaultsOSRD
preplace inst microblaze_0 -pg 1 -lvl 4 -y 800 -defaultsOSRD
preplace inst clk_wiz_0 -pg 1 -lvl 5 -y 1140 -defaultsOSRD
preplace inst axi_mem_intercon -pg 1 -lvl 5 -y 910 -defaultsOSRD
preplace inst PmodACL_0 -pg 1 -lvl 6 -y 320 -defaultsOSRD
preplace inst microblaze_0_local_memory -pg 1 -lvl 5 -y 670 -defaultsOSRD
preplace inst PmodACL_1 -pg 1 -lvl 6 -y 1690 -defaultsOSRD
preplace inst axi_quad_spi_0 -pg 1 -lvl 6 -y 1120 -defaultsOSRD
preplace netloc microblaze_0_axi_periph_M15_AXI 1 2 1 720
preplace netloc axi_intc_0_interrupt 1 3 1 1050
preplace netloc PmodOLEDrgb_0_PmodOLEDrgb_out 1 6 1 NJ
preplace netloc axi_quad_spi_0_SPI_0 1 6 1 NJ
preplace netloc mig_7series_0_mmcm_locked 1 0 7 50 860 NJ 860 NJ 860 NJ 900 NJ 760 NJ 910 2220
preplace netloc microblaze_0_axi_periph_M08_AXI 1 2 4 720 300 NJ 300 NJ 300 NJ
preplace netloc microblaze_0_axi_periph_M04_AXI 1 2 4 740 1210 NJ 1210 NJ 1210 NJ
preplace netloc microblaze_0_axi_periph_M13_AXI 1 2 4 770 1650 NJ 1650 NJ 1650 NJ
preplace netloc mig_7series_0_DDR3 1 6 1 NJ
preplace netloc axi_iic_0_iic2intc_irpt 1 1 6 410 1810 NJ 1640 NJ 1640 NJ 1640 NJ 1600 2220
preplace netloc axi_uartlite_0_interrupt 1 1 6 430 2060 NJ 2060 NJ 2060 NJ 2060 NJ 2060 2220
preplace netloc microblaze_0_Clk 1 0 7 30 840 370 1820 800 1680 1060 910 1570 1060 1890 920 2230
preplace netloc microblaze_0_axi_periph_M06_AXI 1 2 4 780 1350 NJ 1350 NJ 1350 NJ
preplace netloc microblaze_0_axi_periph_M03_AXI 1 2 4 N 1230 NJ 1230 NJ 1230 NJ
preplace netloc axi_gpio_3_GPIO 1 6 1 NJ
preplace netloc rst_mig_7series_0_83M_peripheral_aresetn 1 1 5 390 1980 700 1850 NJ 1850 1580 1520 1900
preplace netloc microblaze_0_axi_periph_M10_AXI 1 2 4 750 460 NJ 460 NJ 460 NJ
preplace netloc microblaze_0_axi_periph_M00_AXI 1 2 4 800 1220 NJ 1220 NJ 1220 NJ
preplace netloc microblaze_0_M_AXI_DP 1 1 4 430 710 NJ 710 NJ 710 1510
preplace netloc axi_mem_intercon_M00_AXI 1 5 1 1840
preplace netloc microblaze_0_M_AXI_DC 1 4 1 N
preplace netloc PmodACL_1_Pmod_out 1 6 1 NJ
preplace netloc microblaze_0_ilmb_1 1 4 1 1540
preplace netloc sys_clock_1 1 0 5 NJ 870 NJ 870 NJ 870 NJ 920 NJ
preplace netloc microblaze_0_axi_periph_M05_AXI 1 2 4 700 40 NJ 40 NJ 40 NJ
preplace netloc axi_quad_spi_1_SPI_0 1 6 1 NJ
preplace netloc axi_gpio_1_GPIO2 1 6 1 NJ
preplace netloc rst_mig_7series_0_83M_mb_reset 1 1 3 410 840 NJ 840 NJ
preplace netloc microblaze_0_axi_periph_M16_AXI 1 2 4 740 1690 NJ 1690 NJ 1690 NJ
preplace netloc xlconcat_0_dout 1 2 1 710
preplace netloc microblaze_0_axi_periph_M01_AXI 1 2 4 790 1510 NJ 1510 NJ 1510 NJ
preplace netloc microblaze_0_M_AXI_IC 1 4 1 N
preplace netloc PmodGPS_0_PmodGPS_Out 1 6 1 NJ
preplace netloc axi_gpio_0_GPIO2 1 6 1 NJ
preplace netloc axi_gpio_1_ip2intc_irpt 1 1 6 400 1800 NJ 1500 NJ 1500 NJ 1500 NJ 1460 2220
preplace netloc clk_wiz_0_clk_out1 1 5 1 1880
preplace netloc axi_uartlite_0_UART 1 6 1 NJ
preplace netloc axi_gpio_0_GPIO 1 6 1 NJ
preplace netloc axi_iic_0_IIC 1 6 1 NJ
preplace netloc mig_7series_0_ui_clk_sync_rst 1 0 7 20 660 NJ 660 NJ 660 NJ 660 NJ 750 NJ 730 2230
preplace netloc clk_wiz_0_clk_out2 1 5 1 1870
preplace netloc microblaze_0_axi_periph_M14_AXI 1 2 4 760 1670 NJ 1670 NJ 1670 NJ
preplace netloc microblaze_0_axi_periph_M07_AXI 1 2 4 710 280 NJ 280 NJ 280 NJ
preplace netloc microblaze_0_axi_periph_M02_AXI 1 2 4 690 160 NJ 160 NJ 160 NJ
preplace netloc PmodACL_0_Pmod_out 1 6 1 NJ
preplace netloc axi_gpio_2_GPIO 1 6 1 NJ
preplace netloc microblaze_0_dlmb_1 1 4 1 1530
preplace netloc axi_gpio_1_GPIO 1 6 1 NJ
preplace netloc microblaze_0_debug 1 3 1 1070
preplace netloc reset_1 1 0 6 NJ 880 NJ 880 NJ 880 NJ 930 1530 1070 1850
preplace netloc rst_mig_7series_0_83M_interconnect_aresetn 1 1 4 400 850 NJ 850 NJ 890 1560
preplace netloc mdm_1_debug_sys_rst 1 0 4 40 850 NJ 830 NJ 830 1020
preplace netloc microblaze_0_axi_periph_M17_AXI 1 2 1 700
preplace netloc microblaze_0_axi_periph_M12_AXI 1 2 4 770 580 NJ 580 NJ 580 NJ
preplace netloc microblaze_0_axi_periph_M11_AXI 1 2 4 760 570 NJ 570 NJ 570 NJ
preplace netloc microblaze_0_axi_periph_M09_AXI 1 2 4 730 440 NJ 440 NJ 440 NJ
preplace netloc axi_gpio_2_GPIO2 1 6 1 NJ
preplace netloc axi_timer_0_interrupt 1 1 3 420 2050 NJ 2050 1050
preplace netloc rst_mig_7series_0_83M_bus_struct_reset 1 1 4 NJ 700 NJ 700 NJ 700 N
levelinfo -pg 1 0 210 560 910 1290 1710 2070 2250 -top 0 -bot 2070
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


