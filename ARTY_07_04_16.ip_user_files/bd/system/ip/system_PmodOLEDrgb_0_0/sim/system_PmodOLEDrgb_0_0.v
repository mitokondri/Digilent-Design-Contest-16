// (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: digilentinc.com:IP:PmodOLEDrgb:1.0
// IP Revision: 39

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_PmodOLEDrgb_0_0 (
  ext_spi_clk,
  pmod_out_pin10_i,
  pmod_out_pin10_o,
  pmod_out_pin10_t,
  pmod_out_pin1_i,
  pmod_out_pin1_o,
  pmod_out_pin1_t,
  pmod_out_pin2_i,
  pmod_out_pin2_o,
  pmod_out_pin2_t,
  pmod_out_pin3_i,
  pmod_out_pin3_o,
  pmod_out_pin3_t,
  pmod_out_pin4_i,
  pmod_out_pin4_o,
  pmod_out_pin4_t,
  pmod_out_pin7_i,
  pmod_out_pin7_o,
  pmod_out_pin7_t,
  pmod_out_pin8_i,
  pmod_out_pin8_o,
  pmod_out_pin8_t,
  pmod_out_pin9_i,
  pmod_out_pin9_o,
  pmod_out_pin9_t,
  s_axi_aclk,
  s_axi_aclk2,
  s_axi_aresetn,
  axi_lite_gpio_awaddr,
  axi_lite_gpio_awprot,
  axi_lite_gpio_awvalid,
  axi_lite_gpio_awready,
  axi_lite_gpio_wdata,
  axi_lite_gpio_wstrb,
  axi_lite_gpio_wvalid,
  axi_lite_gpio_wready,
  axi_lite_gpio_bresp,
  axi_lite_gpio_bvalid,
  axi_lite_gpio_bready,
  axi_lite_gpio_araddr,
  axi_lite_gpio_arprot,
  axi_lite_gpio_arvalid,
  axi_lite_gpio_arready,
  axi_lite_gpio_rdata,
  axi_lite_gpio_rresp,
  axi_lite_gpio_rvalid,
  axi_lite_gpio_rready,
  axi_lite_spi_awaddr,
  axi_lite_spi_awprot,
  axi_lite_spi_awvalid,
  axi_lite_spi_awready,
  axi_lite_spi_wdata,
  axi_lite_spi_wstrb,
  axi_lite_spi_wvalid,
  axi_lite_spi_wready,
  axi_lite_spi_bresp,
  axi_lite_spi_bvalid,
  axi_lite_spi_bready,
  axi_lite_spi_araddr,
  axi_lite_spi_arprot,
  axi_lite_spi_arvalid,
  axi_lite_spi_arready,
  axi_lite_spi_rdata,
  axi_lite_spi_rresp,
  axi_lite_spi_rvalid,
  axi_lite_spi_rready
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ext_spi_clk CLK" *)
input wire ext_spi_clk;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN10_I" *)
input wire pmod_out_pin10_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN10_O" *)
output wire pmod_out_pin10_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN10_T" *)
output wire pmod_out_pin10_t;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN1_I" *)
input wire pmod_out_pin1_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN1_O" *)
output wire pmod_out_pin1_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN1_T" *)
output wire pmod_out_pin1_t;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN2_I" *)
input wire pmod_out_pin2_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN2_O" *)
output wire pmod_out_pin2_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN2_T" *)
output wire pmod_out_pin2_t;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN3_I" *)
input wire pmod_out_pin3_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN3_O" *)
output wire pmod_out_pin3_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN3_T" *)
output wire pmod_out_pin3_t;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN4_I" *)
input wire pmod_out_pin4_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN4_O" *)
output wire pmod_out_pin4_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN4_T" *)
output wire pmod_out_pin4_t;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN7_I" *)
input wire pmod_out_pin7_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN7_O" *)
output wire pmod_out_pin7_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN7_T" *)
output wire pmod_out_pin7_t;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN8_I" *)
input wire pmod_out_pin8_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN8_O" *)
output wire pmod_out_pin8_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN8_T" *)
output wire pmod_out_pin8_t;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN9_I" *)
input wire pmod_out_pin9_i;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN9_O" *)
output wire pmod_out_pin9_o;
(* X_INTERFACE_INFO = "digilentinc.com:interface:pmod:1.0 PmodOLEDrgb_out PIN9_T" *)
output wire pmod_out_pin9_t;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 AXI_LITE_GPIO_CLK CLK" *)
input wire s_axi_aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 AXI_LITE_SPI_CLK CLK" *)
input wire s_axi_aclk2;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 AXI_LITE_GPIO_RST RST, xilinx.com:signal:reset:1.0 AXI_LITE_SPI_RST RST" *)
input wire s_axi_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO AWADDR" *)
input wire [3 : 0] axi_lite_gpio_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO AWPROT" *)
input wire [2 : 0] axi_lite_gpio_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO AWVALID" *)
input wire axi_lite_gpio_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO AWREADY" *)
output wire axi_lite_gpio_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO WDATA" *)
input wire [31 : 0] axi_lite_gpio_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO WSTRB" *)
input wire [3 : 0] axi_lite_gpio_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO WVALID" *)
input wire axi_lite_gpio_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO WREADY" *)
output wire axi_lite_gpio_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO BRESP" *)
output wire [1 : 0] axi_lite_gpio_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO BVALID" *)
output wire axi_lite_gpio_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO BREADY" *)
input wire axi_lite_gpio_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO ARADDR" *)
input wire [3 : 0] axi_lite_gpio_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO ARPROT" *)
input wire [2 : 0] axi_lite_gpio_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO ARVALID" *)
input wire axi_lite_gpio_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO ARREADY" *)
output wire axi_lite_gpio_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO RDATA" *)
output wire [31 : 0] axi_lite_gpio_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO RRESP" *)
output wire [1 : 0] axi_lite_gpio_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO RVALID" *)
output wire axi_lite_gpio_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_GPIO RREADY" *)
input wire axi_lite_gpio_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI AWADDR" *)
input wire [6 : 0] axi_lite_spi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI AWPROT" *)
input wire [2 : 0] axi_lite_spi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI AWVALID" *)
input wire axi_lite_spi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI AWREADY" *)
output wire axi_lite_spi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI WDATA" *)
input wire [31 : 0] axi_lite_spi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI WSTRB" *)
input wire [3 : 0] axi_lite_spi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI WVALID" *)
input wire axi_lite_spi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI WREADY" *)
output wire axi_lite_spi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI BRESP" *)
output wire [1 : 0] axi_lite_spi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI BVALID" *)
output wire axi_lite_spi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI BREADY" *)
input wire axi_lite_spi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI ARADDR" *)
input wire [6 : 0] axi_lite_spi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI ARPROT" *)
input wire [2 : 0] axi_lite_spi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI ARVALID" *)
input wire axi_lite_spi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI ARREADY" *)
output wire axi_lite_spi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI RDATA" *)
output wire [31 : 0] axi_lite_spi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI RRESP" *)
output wire [1 : 0] axi_lite_spi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI RVALID" *)
output wire axi_lite_spi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 AXI_LITE_SPI RREADY" *)
input wire axi_lite_spi_rready;

  PmodOLEDrgb_v1_0 #(
    .C_AXI_LITE_GPIO_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_AXI_LITE_GPIO_ADDR_WIDTH(4),  // Width of S_AXI address bus
    .C_AXI_LITE_SPI_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_AXI_LITE_SPI_ADDR_WIDTH(7)  // Width of S_AXI address bus
  ) inst (
    .ext_spi_clk(ext_spi_clk),
    .pmod_out_pin10_i(pmod_out_pin10_i),
    .pmod_out_pin10_o(pmod_out_pin10_o),
    .pmod_out_pin10_t(pmod_out_pin10_t),
    .pmod_out_pin1_i(pmod_out_pin1_i),
    .pmod_out_pin1_o(pmod_out_pin1_o),
    .pmod_out_pin1_t(pmod_out_pin1_t),
    .pmod_out_pin2_i(pmod_out_pin2_i),
    .pmod_out_pin2_o(pmod_out_pin2_o),
    .pmod_out_pin2_t(pmod_out_pin2_t),
    .pmod_out_pin3_i(pmod_out_pin3_i),
    .pmod_out_pin3_o(pmod_out_pin3_o),
    .pmod_out_pin3_t(pmod_out_pin3_t),
    .pmod_out_pin4_i(pmod_out_pin4_i),
    .pmod_out_pin4_o(pmod_out_pin4_o),
    .pmod_out_pin4_t(pmod_out_pin4_t),
    .pmod_out_pin7_i(pmod_out_pin7_i),
    .pmod_out_pin7_o(pmod_out_pin7_o),
    .pmod_out_pin7_t(pmod_out_pin7_t),
    .pmod_out_pin8_i(pmod_out_pin8_i),
    .pmod_out_pin8_o(pmod_out_pin8_o),
    .pmod_out_pin8_t(pmod_out_pin8_t),
    .pmod_out_pin9_i(pmod_out_pin9_i),
    .pmod_out_pin9_o(pmod_out_pin9_o),
    .pmod_out_pin9_t(pmod_out_pin9_t),
    .s_axi_aclk(s_axi_aclk),
    .s_axi_aclk2(s_axi_aclk2),
    .s_axi_aresetn(s_axi_aresetn),
    .axi_lite_gpio_awaddr(axi_lite_gpio_awaddr),
    .axi_lite_gpio_awprot(axi_lite_gpio_awprot),
    .axi_lite_gpio_awvalid(axi_lite_gpio_awvalid),
    .axi_lite_gpio_awready(axi_lite_gpio_awready),
    .axi_lite_gpio_wdata(axi_lite_gpio_wdata),
    .axi_lite_gpio_wstrb(axi_lite_gpio_wstrb),
    .axi_lite_gpio_wvalid(axi_lite_gpio_wvalid),
    .axi_lite_gpio_wready(axi_lite_gpio_wready),
    .axi_lite_gpio_bresp(axi_lite_gpio_bresp),
    .axi_lite_gpio_bvalid(axi_lite_gpio_bvalid),
    .axi_lite_gpio_bready(axi_lite_gpio_bready),
    .axi_lite_gpio_araddr(axi_lite_gpio_araddr),
    .axi_lite_gpio_arprot(axi_lite_gpio_arprot),
    .axi_lite_gpio_arvalid(axi_lite_gpio_arvalid),
    .axi_lite_gpio_arready(axi_lite_gpio_arready),
    .axi_lite_gpio_rdata(axi_lite_gpio_rdata),
    .axi_lite_gpio_rresp(axi_lite_gpio_rresp),
    .axi_lite_gpio_rvalid(axi_lite_gpio_rvalid),
    .axi_lite_gpio_rready(axi_lite_gpio_rready),
    .axi_lite_spi_awaddr(axi_lite_spi_awaddr),
    .axi_lite_spi_awprot(axi_lite_spi_awprot),
    .axi_lite_spi_awvalid(axi_lite_spi_awvalid),
    .axi_lite_spi_awready(axi_lite_spi_awready),
    .axi_lite_spi_wdata(axi_lite_spi_wdata),
    .axi_lite_spi_wstrb(axi_lite_spi_wstrb),
    .axi_lite_spi_wvalid(axi_lite_spi_wvalid),
    .axi_lite_spi_wready(axi_lite_spi_wready),
    .axi_lite_spi_bresp(axi_lite_spi_bresp),
    .axi_lite_spi_bvalid(axi_lite_spi_bvalid),
    .axi_lite_spi_bready(axi_lite_spi_bready),
    .axi_lite_spi_araddr(axi_lite_spi_araddr),
    .axi_lite_spi_arprot(axi_lite_spi_arprot),
    .axi_lite_spi_arvalid(axi_lite_spi_arvalid),
    .axi_lite_spi_arready(axi_lite_spi_arready),
    .axi_lite_spi_rdata(axi_lite_spi_rdata),
    .axi_lite_spi_rresp(axi_lite_spi_rresp),
    .axi_lite_spi_rvalid(axi_lite_spi_rvalid),
    .axi_lite_spi_rready(axi_lite_spi_rready)
  );
endmodule
