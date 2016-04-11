-- (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: digilentinc.com:IP:PmodACL:1.0
-- IP Revision: 7

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT system_PmodACL_1_0
  PORT (
    AXI_LITE_GPIO_araddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    AXI_LITE_GPIO_arready : OUT STD_LOGIC;
    AXI_LITE_GPIO_arvalid : IN STD_LOGIC;
    AXI_LITE_GPIO_awaddr : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    AXI_LITE_GPIO_awready : OUT STD_LOGIC;
    AXI_LITE_GPIO_awvalid : IN STD_LOGIC;
    AXI_LITE_GPIO_bready : IN STD_LOGIC;
    AXI_LITE_GPIO_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI_LITE_GPIO_bvalid : OUT STD_LOGIC;
    AXI_LITE_GPIO_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI_LITE_GPIO_rready : IN STD_LOGIC;
    AXI_LITE_GPIO_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI_LITE_GPIO_rvalid : OUT STD_LOGIC;
    AXI_LITE_GPIO_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI_LITE_GPIO_wready : OUT STD_LOGIC;
    AXI_LITE_GPIO_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI_LITE_GPIO_wvalid : IN STD_LOGIC;
    AXI_LITE_SPI_araddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    AXI_LITE_SPI_arready : OUT STD_LOGIC;
    AXI_LITE_SPI_arvalid : IN STD_LOGIC;
    AXI_LITE_SPI_awaddr : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    AXI_LITE_SPI_awready : OUT STD_LOGIC;
    AXI_LITE_SPI_awvalid : IN STD_LOGIC;
    AXI_LITE_SPI_bready : IN STD_LOGIC;
    AXI_LITE_SPI_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI_LITE_SPI_bvalid : OUT STD_LOGIC;
    AXI_LITE_SPI_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI_LITE_SPI_rready : IN STD_LOGIC;
    AXI_LITE_SPI_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    AXI_LITE_SPI_rvalid : OUT STD_LOGIC;
    AXI_LITE_SPI_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    AXI_LITE_SPI_wready : OUT STD_LOGIC;
    AXI_LITE_SPI_wstrb : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    AXI_LITE_SPI_wvalid : IN STD_LOGIC;
    Pmod_out_pin10_i : IN STD_LOGIC;
    Pmod_out_pin10_o : OUT STD_LOGIC;
    Pmod_out_pin10_t : OUT STD_LOGIC;
    Pmod_out_pin1_i : IN STD_LOGIC;
    Pmod_out_pin1_o : OUT STD_LOGIC;
    Pmod_out_pin1_t : OUT STD_LOGIC;
    Pmod_out_pin2_i : IN STD_LOGIC;
    Pmod_out_pin2_o : OUT STD_LOGIC;
    Pmod_out_pin2_t : OUT STD_LOGIC;
    Pmod_out_pin3_i : IN STD_LOGIC;
    Pmod_out_pin3_o : OUT STD_LOGIC;
    Pmod_out_pin3_t : OUT STD_LOGIC;
    Pmod_out_pin4_i : IN STD_LOGIC;
    Pmod_out_pin4_o : OUT STD_LOGIC;
    Pmod_out_pin4_t : OUT STD_LOGIC;
    Pmod_out_pin7_i : IN STD_LOGIC;
    Pmod_out_pin7_o : OUT STD_LOGIC;
    Pmod_out_pin7_t : OUT STD_LOGIC;
    Pmod_out_pin8_i : IN STD_LOGIC;
    Pmod_out_pin8_o : OUT STD_LOGIC;
    Pmod_out_pin8_t : OUT STD_LOGIC;
    Pmod_out_pin9_i : IN STD_LOGIC;
    Pmod_out_pin9_o : OUT STD_LOGIC;
    Pmod_out_pin9_t : OUT STD_LOGIC;
    ext_spi_clk : IN STD_LOGIC;
    s_axi_aclk : IN STD_LOGIC;
    s_axi_aresetn : IN STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : system_PmodACL_1_0
  PORT MAP (
    AXI_LITE_GPIO_araddr => AXI_LITE_GPIO_araddr,
    AXI_LITE_GPIO_arready => AXI_LITE_GPIO_arready,
    AXI_LITE_GPIO_arvalid => AXI_LITE_GPIO_arvalid,
    AXI_LITE_GPIO_awaddr => AXI_LITE_GPIO_awaddr,
    AXI_LITE_GPIO_awready => AXI_LITE_GPIO_awready,
    AXI_LITE_GPIO_awvalid => AXI_LITE_GPIO_awvalid,
    AXI_LITE_GPIO_bready => AXI_LITE_GPIO_bready,
    AXI_LITE_GPIO_bresp => AXI_LITE_GPIO_bresp,
    AXI_LITE_GPIO_bvalid => AXI_LITE_GPIO_bvalid,
    AXI_LITE_GPIO_rdata => AXI_LITE_GPIO_rdata,
    AXI_LITE_GPIO_rready => AXI_LITE_GPIO_rready,
    AXI_LITE_GPIO_rresp => AXI_LITE_GPIO_rresp,
    AXI_LITE_GPIO_rvalid => AXI_LITE_GPIO_rvalid,
    AXI_LITE_GPIO_wdata => AXI_LITE_GPIO_wdata,
    AXI_LITE_GPIO_wready => AXI_LITE_GPIO_wready,
    AXI_LITE_GPIO_wstrb => AXI_LITE_GPIO_wstrb,
    AXI_LITE_GPIO_wvalid => AXI_LITE_GPIO_wvalid,
    AXI_LITE_SPI_araddr => AXI_LITE_SPI_araddr,
    AXI_LITE_SPI_arready => AXI_LITE_SPI_arready,
    AXI_LITE_SPI_arvalid => AXI_LITE_SPI_arvalid,
    AXI_LITE_SPI_awaddr => AXI_LITE_SPI_awaddr,
    AXI_LITE_SPI_awready => AXI_LITE_SPI_awready,
    AXI_LITE_SPI_awvalid => AXI_LITE_SPI_awvalid,
    AXI_LITE_SPI_bready => AXI_LITE_SPI_bready,
    AXI_LITE_SPI_bresp => AXI_LITE_SPI_bresp,
    AXI_LITE_SPI_bvalid => AXI_LITE_SPI_bvalid,
    AXI_LITE_SPI_rdata => AXI_LITE_SPI_rdata,
    AXI_LITE_SPI_rready => AXI_LITE_SPI_rready,
    AXI_LITE_SPI_rresp => AXI_LITE_SPI_rresp,
    AXI_LITE_SPI_rvalid => AXI_LITE_SPI_rvalid,
    AXI_LITE_SPI_wdata => AXI_LITE_SPI_wdata,
    AXI_LITE_SPI_wready => AXI_LITE_SPI_wready,
    AXI_LITE_SPI_wstrb => AXI_LITE_SPI_wstrb,
    AXI_LITE_SPI_wvalid => AXI_LITE_SPI_wvalid,
    Pmod_out_pin10_i => Pmod_out_pin10_i,
    Pmod_out_pin10_o => Pmod_out_pin10_o,
    Pmod_out_pin10_t => Pmod_out_pin10_t,
    Pmod_out_pin1_i => Pmod_out_pin1_i,
    Pmod_out_pin1_o => Pmod_out_pin1_o,
    Pmod_out_pin1_t => Pmod_out_pin1_t,
    Pmod_out_pin2_i => Pmod_out_pin2_i,
    Pmod_out_pin2_o => Pmod_out_pin2_o,
    Pmod_out_pin2_t => Pmod_out_pin2_t,
    Pmod_out_pin3_i => Pmod_out_pin3_i,
    Pmod_out_pin3_o => Pmod_out_pin3_o,
    Pmod_out_pin3_t => Pmod_out_pin3_t,
    Pmod_out_pin4_i => Pmod_out_pin4_i,
    Pmod_out_pin4_o => Pmod_out_pin4_o,
    Pmod_out_pin4_t => Pmod_out_pin4_t,
    Pmod_out_pin7_i => Pmod_out_pin7_i,
    Pmod_out_pin7_o => Pmod_out_pin7_o,
    Pmod_out_pin7_t => Pmod_out_pin7_t,
    Pmod_out_pin8_i => Pmod_out_pin8_i,
    Pmod_out_pin8_o => Pmod_out_pin8_o,
    Pmod_out_pin8_t => Pmod_out_pin8_t,
    Pmod_out_pin9_i => Pmod_out_pin9_i,
    Pmod_out_pin9_o => Pmod_out_pin9_o,
    Pmod_out_pin9_t => Pmod_out_pin9_t,
    ext_spi_clk => ext_spi_clk,
    s_axi_aclk => s_axi_aclk,
    s_axi_aresetn => s_axi_aresetn
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

