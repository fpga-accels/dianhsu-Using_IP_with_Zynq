// (c) Copyright 1995-2021 Xilinx, Inc. All rights reserved.
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


// IP VLNV: xilinx.com:hls:relu_top:1.3
// IP Revision: 2101182317

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module relu_bd_relu_top_0_0 (
  s_axi_control_AWADDR,
  s_axi_control_AWVALID,
  s_axi_control_AWREADY,
  s_axi_control_WDATA,
  s_axi_control_WSTRB,
  s_axi_control_WVALID,
  s_axi_control_WREADY,
  s_axi_control_BRESP,
  s_axi_control_BVALID,
  s_axi_control_BREADY,
  s_axi_control_ARADDR,
  s_axi_control_ARVALID,
  s_axi_control_ARREADY,
  s_axi_control_RDATA,
  s_axi_control_RRESP,
  s_axi_control_RVALID,
  s_axi_control_RREADY,
  ap_clk,
  ap_rst_n,
  ap_start,
  ap_done,
  ap_idle,
  ap_ready,
  m_axi_din_AWADDR,
  m_axi_din_AWLEN,
  m_axi_din_AWSIZE,
  m_axi_din_AWBURST,
  m_axi_din_AWLOCK,
  m_axi_din_AWREGION,
  m_axi_din_AWCACHE,
  m_axi_din_AWPROT,
  m_axi_din_AWQOS,
  m_axi_din_AWVALID,
  m_axi_din_AWREADY,
  m_axi_din_WDATA,
  m_axi_din_WSTRB,
  m_axi_din_WLAST,
  m_axi_din_WVALID,
  m_axi_din_WREADY,
  m_axi_din_BRESP,
  m_axi_din_BVALID,
  m_axi_din_BREADY,
  m_axi_din_ARADDR,
  m_axi_din_ARLEN,
  m_axi_din_ARSIZE,
  m_axi_din_ARBURST,
  m_axi_din_ARLOCK,
  m_axi_din_ARREGION,
  m_axi_din_ARCACHE,
  m_axi_din_ARPROT,
  m_axi_din_ARQOS,
  m_axi_din_ARVALID,
  m_axi_din_ARREADY,
  m_axi_din_RDATA,
  m_axi_din_RRESP,
  m_axi_din_RLAST,
  m_axi_din_RVALID,
  m_axi_din_RREADY,
  m_axi_dout_AWADDR,
  m_axi_dout_AWLEN,
  m_axi_dout_AWSIZE,
  m_axi_dout_AWBURST,
  m_axi_dout_AWLOCK,
  m_axi_dout_AWREGION,
  m_axi_dout_AWCACHE,
  m_axi_dout_AWPROT,
  m_axi_dout_AWQOS,
  m_axi_dout_AWVALID,
  m_axi_dout_AWREADY,
  m_axi_dout_WDATA,
  m_axi_dout_WSTRB,
  m_axi_dout_WLAST,
  m_axi_dout_WVALID,
  m_axi_dout_WREADY,
  m_axi_dout_BRESP,
  m_axi_dout_BVALID,
  m_axi_dout_BREADY,
  m_axi_dout_ARADDR,
  m_axi_dout_ARLEN,
  m_axi_dout_ARSIZE,
  m_axi_dout_ARBURST,
  m_axi_dout_ARLOCK,
  m_axi_dout_ARREGION,
  m_axi_dout_ARCACHE,
  m_axi_dout_ARPROT,
  m_axi_dout_ARQOS,
  m_axi_dout_ARVALID,
  m_axi_dout_ARREADY,
  m_axi_dout_RDATA,
  m_axi_dout_RRESP,
  m_axi_dout_RLAST,
  m_axi_dout_RVALID,
  m_axi_dout_RREADY
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *)
input wire [4 : 0] s_axi_control_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *)
input wire s_axi_control_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *)
output wire s_axi_control_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *)
input wire [31 : 0] s_axi_control_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *)
input wire [3 : 0] s_axi_control_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *)
input wire s_axi_control_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *)
output wire s_axi_control_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *)
output wire [1 : 0] s_axi_control_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *)
output wire s_axi_control_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *)
input wire s_axi_control_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *)
input wire [4 : 0] s_axi_control_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *)
input wire s_axi_control_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *)
output wire s_axi_control_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *)
output wire [31 : 0] s_axi_control_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *)
output wire [1 : 0] s_axi_control_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *)
output wire s_axi_control_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 5, DATA_WIDTH 32, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN relu_bd_processing_system7_0_2_FCLK_CLK0, NUM_READ_\
THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *)
input wire s_axi_control_RREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF s_axi_control:m_axi_din:m_axi_dout, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN relu_bd_processing_system7_0_2_FCLK_CLK0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *)
input wire ap_start;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *)
output wire ap_done;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *)
output wire ap_idle;
(* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *)
output wire ap_ready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din AWADDR" *)
output wire [63 : 0] m_axi_din_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din AWLEN" *)
output wire [7 : 0] m_axi_din_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din AWSIZE" *)
output wire [2 : 0] m_axi_din_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din AWBURST" *)
output wire [1 : 0] m_axi_din_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din AWLOCK" *)
output wire [1 : 0] m_axi_din_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din AWREGION" *)
output wire [3 : 0] m_axi_din_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din AWCACHE" *)
output wire [3 : 0] m_axi_din_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din AWPROT" *)
output wire [2 : 0] m_axi_din_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din AWQOS" *)
output wire [3 : 0] m_axi_din_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din AWVALID" *)
output wire m_axi_din_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din AWREADY" *)
input wire m_axi_din_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din WDATA" *)
output wire [63 : 0] m_axi_din_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din WSTRB" *)
output wire [7 : 0] m_axi_din_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din WLAST" *)
output wire m_axi_din_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din WVALID" *)
output wire m_axi_din_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din WREADY" *)
input wire m_axi_din_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din BRESP" *)
input wire [1 : 0] m_axi_din_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din BVALID" *)
input wire m_axi_din_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din BREADY" *)
output wire m_axi_din_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din ARADDR" *)
output wire [63 : 0] m_axi_din_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din ARLEN" *)
output wire [7 : 0] m_axi_din_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din ARSIZE" *)
output wire [2 : 0] m_axi_din_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din ARBURST" *)
output wire [1 : 0] m_axi_din_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din ARLOCK" *)
output wire [1 : 0] m_axi_din_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din ARREGION" *)
output wire [3 : 0] m_axi_din_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din ARCACHE" *)
output wire [3 : 0] m_axi_din_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din ARPROT" *)
output wire [2 : 0] m_axi_din_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din ARQOS" *)
output wire [3 : 0] m_axi_din_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din ARVALID" *)
output wire m_axi_din_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din ARREADY" *)
input wire m_axi_din_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din RDATA" *)
input wire [63 : 0] m_axi_din_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din RRESP" *)
input wire [1 : 0] m_axi_din_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din RLAST" *)
input wire m_axi_din_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din RVALID" *)
input wire m_axi_din_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_din, ADDR_WIDTH 64, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 64, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.000, CLK_DOMAIN r\
elu_bd_processing_system7_0_2_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_din RREADY" *)
output wire m_axi_din_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout AWADDR" *)
output wire [63 : 0] m_axi_dout_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout AWLEN" *)
output wire [7 : 0] m_axi_dout_AWLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout AWSIZE" *)
output wire [2 : 0] m_axi_dout_AWSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout AWBURST" *)
output wire [1 : 0] m_axi_dout_AWBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout AWLOCK" *)
output wire [1 : 0] m_axi_dout_AWLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout AWREGION" *)
output wire [3 : 0] m_axi_dout_AWREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout AWCACHE" *)
output wire [3 : 0] m_axi_dout_AWCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout AWPROT" *)
output wire [2 : 0] m_axi_dout_AWPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout AWQOS" *)
output wire [3 : 0] m_axi_dout_AWQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout AWVALID" *)
output wire m_axi_dout_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout AWREADY" *)
input wire m_axi_dout_AWREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout WDATA" *)
output wire [63 : 0] m_axi_dout_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout WSTRB" *)
output wire [7 : 0] m_axi_dout_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout WLAST" *)
output wire m_axi_dout_WLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout WVALID" *)
output wire m_axi_dout_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout WREADY" *)
input wire m_axi_dout_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout BRESP" *)
input wire [1 : 0] m_axi_dout_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout BVALID" *)
input wire m_axi_dout_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout BREADY" *)
output wire m_axi_dout_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout ARADDR" *)
output wire [63 : 0] m_axi_dout_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout ARLEN" *)
output wire [7 : 0] m_axi_dout_ARLEN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout ARSIZE" *)
output wire [2 : 0] m_axi_dout_ARSIZE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout ARBURST" *)
output wire [1 : 0] m_axi_dout_ARBURST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout ARLOCK" *)
output wire [1 : 0] m_axi_dout_ARLOCK;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout ARREGION" *)
output wire [3 : 0] m_axi_dout_ARREGION;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout ARCACHE" *)
output wire [3 : 0] m_axi_dout_ARCACHE;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout ARPROT" *)
output wire [2 : 0] m_axi_dout_ARPROT;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout ARQOS" *)
output wire [3 : 0] m_axi_dout_ARQOS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout ARVALID" *)
output wire m_axi_dout_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout ARREADY" *)
input wire m_axi_dout_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout RDATA" *)
input wire [63 : 0] m_axi_dout_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout RRESP" *)
input wire [1 : 0] m_axi_dout_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout RLAST" *)
input wire m_axi_dout_RLAST;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout RVALID" *)
input wire m_axi_dout_RVALID;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi_dout, ADDR_WIDTH 64, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_WRITE_OUTSTANDING 16, MAX_READ_BURST_LENGTH 16, MAX_WRITE_BURST_LENGTH 16, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 64, FREQ_HZ 100000000, ID_WIDTH 0, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 1, HAS_REGION 1, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, PHASE 0.000, CLK_DOMAIN \
relu_bd_processing_system7_0_2_FCLK_CLK0, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_dout RREADY" *)
output wire m_axi_dout_RREADY;

(* SDX_KERNEL = "true" *)
(* SDX_KERNEL_TYPE = "hls" *)
(* SDX_KERNEL_SIM_INST = "" *)
  relu_top #(
    .C_S_AXI_CONTROL_ADDR_WIDTH(5),
    .C_S_AXI_CONTROL_DATA_WIDTH(32),
    .C_M_AXI_DIN_ID_WIDTH(1),
    .C_M_AXI_DIN_ADDR_WIDTH(64),
    .C_M_AXI_DIN_DATA_WIDTH(64),
    .C_M_AXI_DIN_AWUSER_WIDTH(1),
    .C_M_AXI_DIN_ARUSER_WIDTH(1),
    .C_M_AXI_DIN_WUSER_WIDTH(1),
    .C_M_AXI_DIN_RUSER_WIDTH(1),
    .C_M_AXI_DIN_BUSER_WIDTH(1),
    .C_M_AXI_DIN_USER_VALUE(32'H00000000),
    .C_M_AXI_DIN_PROT_VALUE(3'B000),
    .C_M_AXI_DIN_CACHE_VALUE(4'B0011),
    .C_M_AXI_DOUT_ID_WIDTH(1),
    .C_M_AXI_DOUT_ADDR_WIDTH(64),
    .C_M_AXI_DOUT_DATA_WIDTH(64),
    .C_M_AXI_DOUT_AWUSER_WIDTH(1),
    .C_M_AXI_DOUT_ARUSER_WIDTH(1),
    .C_M_AXI_DOUT_WUSER_WIDTH(1),
    .C_M_AXI_DOUT_RUSER_WIDTH(1),
    .C_M_AXI_DOUT_BUSER_WIDTH(1),
    .C_M_AXI_DOUT_USER_VALUE(32'H00000000),
    .C_M_AXI_DOUT_PROT_VALUE(3'B000),
    .C_M_AXI_DOUT_CACHE_VALUE(4'B0011)
  ) inst (
    .s_axi_control_AWADDR(s_axi_control_AWADDR),
    .s_axi_control_AWVALID(s_axi_control_AWVALID),
    .s_axi_control_AWREADY(s_axi_control_AWREADY),
    .s_axi_control_WDATA(s_axi_control_WDATA),
    .s_axi_control_WSTRB(s_axi_control_WSTRB),
    .s_axi_control_WVALID(s_axi_control_WVALID),
    .s_axi_control_WREADY(s_axi_control_WREADY),
    .s_axi_control_BRESP(s_axi_control_BRESP),
    .s_axi_control_BVALID(s_axi_control_BVALID),
    .s_axi_control_BREADY(s_axi_control_BREADY),
    .s_axi_control_ARADDR(s_axi_control_ARADDR),
    .s_axi_control_ARVALID(s_axi_control_ARVALID),
    .s_axi_control_ARREADY(s_axi_control_ARREADY),
    .s_axi_control_RDATA(s_axi_control_RDATA),
    .s_axi_control_RRESP(s_axi_control_RRESP),
    .s_axi_control_RVALID(s_axi_control_RVALID),
    .s_axi_control_RREADY(s_axi_control_RREADY),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .m_axi_din_AWID(),
    .m_axi_din_AWADDR(m_axi_din_AWADDR),
    .m_axi_din_AWLEN(m_axi_din_AWLEN),
    .m_axi_din_AWSIZE(m_axi_din_AWSIZE),
    .m_axi_din_AWBURST(m_axi_din_AWBURST),
    .m_axi_din_AWLOCK(m_axi_din_AWLOCK),
    .m_axi_din_AWREGION(m_axi_din_AWREGION),
    .m_axi_din_AWCACHE(m_axi_din_AWCACHE),
    .m_axi_din_AWPROT(m_axi_din_AWPROT),
    .m_axi_din_AWQOS(m_axi_din_AWQOS),
    .m_axi_din_AWUSER(),
    .m_axi_din_AWVALID(m_axi_din_AWVALID),
    .m_axi_din_AWREADY(m_axi_din_AWREADY),
    .m_axi_din_WID(),
    .m_axi_din_WDATA(m_axi_din_WDATA),
    .m_axi_din_WSTRB(m_axi_din_WSTRB),
    .m_axi_din_WLAST(m_axi_din_WLAST),
    .m_axi_din_WUSER(),
    .m_axi_din_WVALID(m_axi_din_WVALID),
    .m_axi_din_WREADY(m_axi_din_WREADY),
    .m_axi_din_BID(1'B0),
    .m_axi_din_BRESP(m_axi_din_BRESP),
    .m_axi_din_BUSER(1'B0),
    .m_axi_din_BVALID(m_axi_din_BVALID),
    .m_axi_din_BREADY(m_axi_din_BREADY),
    .m_axi_din_ARID(),
    .m_axi_din_ARADDR(m_axi_din_ARADDR),
    .m_axi_din_ARLEN(m_axi_din_ARLEN),
    .m_axi_din_ARSIZE(m_axi_din_ARSIZE),
    .m_axi_din_ARBURST(m_axi_din_ARBURST),
    .m_axi_din_ARLOCK(m_axi_din_ARLOCK),
    .m_axi_din_ARREGION(m_axi_din_ARREGION),
    .m_axi_din_ARCACHE(m_axi_din_ARCACHE),
    .m_axi_din_ARPROT(m_axi_din_ARPROT),
    .m_axi_din_ARQOS(m_axi_din_ARQOS),
    .m_axi_din_ARUSER(),
    .m_axi_din_ARVALID(m_axi_din_ARVALID),
    .m_axi_din_ARREADY(m_axi_din_ARREADY),
    .m_axi_din_RID(1'B0),
    .m_axi_din_RDATA(m_axi_din_RDATA),
    .m_axi_din_RRESP(m_axi_din_RRESP),
    .m_axi_din_RLAST(m_axi_din_RLAST),
    .m_axi_din_RUSER(1'B0),
    .m_axi_din_RVALID(m_axi_din_RVALID),
    .m_axi_din_RREADY(m_axi_din_RREADY),
    .m_axi_dout_AWID(),
    .m_axi_dout_AWADDR(m_axi_dout_AWADDR),
    .m_axi_dout_AWLEN(m_axi_dout_AWLEN),
    .m_axi_dout_AWSIZE(m_axi_dout_AWSIZE),
    .m_axi_dout_AWBURST(m_axi_dout_AWBURST),
    .m_axi_dout_AWLOCK(m_axi_dout_AWLOCK),
    .m_axi_dout_AWREGION(m_axi_dout_AWREGION),
    .m_axi_dout_AWCACHE(m_axi_dout_AWCACHE),
    .m_axi_dout_AWPROT(m_axi_dout_AWPROT),
    .m_axi_dout_AWQOS(m_axi_dout_AWQOS),
    .m_axi_dout_AWUSER(),
    .m_axi_dout_AWVALID(m_axi_dout_AWVALID),
    .m_axi_dout_AWREADY(m_axi_dout_AWREADY),
    .m_axi_dout_WID(),
    .m_axi_dout_WDATA(m_axi_dout_WDATA),
    .m_axi_dout_WSTRB(m_axi_dout_WSTRB),
    .m_axi_dout_WLAST(m_axi_dout_WLAST),
    .m_axi_dout_WUSER(),
    .m_axi_dout_WVALID(m_axi_dout_WVALID),
    .m_axi_dout_WREADY(m_axi_dout_WREADY),
    .m_axi_dout_BID(1'B0),
    .m_axi_dout_BRESP(m_axi_dout_BRESP),
    .m_axi_dout_BUSER(1'B0),
    .m_axi_dout_BVALID(m_axi_dout_BVALID),
    .m_axi_dout_BREADY(m_axi_dout_BREADY),
    .m_axi_dout_ARID(),
    .m_axi_dout_ARADDR(m_axi_dout_ARADDR),
    .m_axi_dout_ARLEN(m_axi_dout_ARLEN),
    .m_axi_dout_ARSIZE(m_axi_dout_ARSIZE),
    .m_axi_dout_ARBURST(m_axi_dout_ARBURST),
    .m_axi_dout_ARLOCK(m_axi_dout_ARLOCK),
    .m_axi_dout_ARREGION(m_axi_dout_ARREGION),
    .m_axi_dout_ARCACHE(m_axi_dout_ARCACHE),
    .m_axi_dout_ARPROT(m_axi_dout_ARPROT),
    .m_axi_dout_ARQOS(m_axi_dout_ARQOS),
    .m_axi_dout_ARUSER(),
    .m_axi_dout_ARVALID(m_axi_dout_ARVALID),
    .m_axi_dout_ARREADY(m_axi_dout_ARREADY),
    .m_axi_dout_RID(1'B0),
    .m_axi_dout_RDATA(m_axi_dout_RDATA),
    .m_axi_dout_RRESP(m_axi_dout_RRESP),
    .m_axi_dout_RLAST(m_axi_dout_RLAST),
    .m_axi_dout_RUSER(1'B0),
    .m_axi_dout_RVALID(m_axi_dout_RVALID),
    .m_axi_dout_RREADY(m_axi_dout_RREADY)
  );
endmodule
