// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon Jan 18 23:23:58 2021
// Host        : Windows10-508 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ relu_bd_relu_top_0_0_stub.v
// Design      : relu_bd_relu_top_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "relu_top,Vivado 2020.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axi_control_AWADDR, 
  s_axi_control_AWVALID, s_axi_control_AWREADY, s_axi_control_WDATA, s_axi_control_WSTRB, 
  s_axi_control_WVALID, s_axi_control_WREADY, s_axi_control_BRESP, s_axi_control_BVALID, 
  s_axi_control_BREADY, s_axi_control_ARADDR, s_axi_control_ARVALID, 
  s_axi_control_ARREADY, s_axi_control_RDATA, s_axi_control_RRESP, s_axi_control_RVALID, 
  s_axi_control_RREADY, ap_clk, ap_rst_n, ap_start, ap_done, ap_idle, ap_ready, m_axi_din_AWADDR, 
  m_axi_din_AWLEN, m_axi_din_AWSIZE, m_axi_din_AWBURST, m_axi_din_AWLOCK, 
  m_axi_din_AWREGION, m_axi_din_AWCACHE, m_axi_din_AWPROT, m_axi_din_AWQOS, 
  m_axi_din_AWVALID, m_axi_din_AWREADY, m_axi_din_WDATA, m_axi_din_WSTRB, m_axi_din_WLAST, 
  m_axi_din_WVALID, m_axi_din_WREADY, m_axi_din_BRESP, m_axi_din_BVALID, m_axi_din_BREADY, 
  m_axi_din_ARADDR, m_axi_din_ARLEN, m_axi_din_ARSIZE, m_axi_din_ARBURST, m_axi_din_ARLOCK, 
  m_axi_din_ARREGION, m_axi_din_ARCACHE, m_axi_din_ARPROT, m_axi_din_ARQOS, 
  m_axi_din_ARVALID, m_axi_din_ARREADY, m_axi_din_RDATA, m_axi_din_RRESP, m_axi_din_RLAST, 
  m_axi_din_RVALID, m_axi_din_RREADY, m_axi_dout_AWADDR, m_axi_dout_AWLEN, 
  m_axi_dout_AWSIZE, m_axi_dout_AWBURST, m_axi_dout_AWLOCK, m_axi_dout_AWREGION, 
  m_axi_dout_AWCACHE, m_axi_dout_AWPROT, m_axi_dout_AWQOS, m_axi_dout_AWVALID, 
  m_axi_dout_AWREADY, m_axi_dout_WDATA, m_axi_dout_WSTRB, m_axi_dout_WLAST, 
  m_axi_dout_WVALID, m_axi_dout_WREADY, m_axi_dout_BRESP, m_axi_dout_BVALID, 
  m_axi_dout_BREADY, m_axi_dout_ARADDR, m_axi_dout_ARLEN, m_axi_dout_ARSIZE, 
  m_axi_dout_ARBURST, m_axi_dout_ARLOCK, m_axi_dout_ARREGION, m_axi_dout_ARCACHE, 
  m_axi_dout_ARPROT, m_axi_dout_ARQOS, m_axi_dout_ARVALID, m_axi_dout_ARREADY, 
  m_axi_dout_RDATA, m_axi_dout_RRESP, m_axi_dout_RLAST, m_axi_dout_RVALID, 
  m_axi_dout_RREADY)
/* synthesis syn_black_box black_box_pad_pin="s_axi_control_AWADDR[4:0],s_axi_control_AWVALID,s_axi_control_AWREADY,s_axi_control_WDATA[31:0],s_axi_control_WSTRB[3:0],s_axi_control_WVALID,s_axi_control_WREADY,s_axi_control_BRESP[1:0],s_axi_control_BVALID,s_axi_control_BREADY,s_axi_control_ARADDR[4:0],s_axi_control_ARVALID,s_axi_control_ARREADY,s_axi_control_RDATA[31:0],s_axi_control_RRESP[1:0],s_axi_control_RVALID,s_axi_control_RREADY,ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready,m_axi_din_AWADDR[63:0],m_axi_din_AWLEN[7:0],m_axi_din_AWSIZE[2:0],m_axi_din_AWBURST[1:0],m_axi_din_AWLOCK[1:0],m_axi_din_AWREGION[3:0],m_axi_din_AWCACHE[3:0],m_axi_din_AWPROT[2:0],m_axi_din_AWQOS[3:0],m_axi_din_AWVALID,m_axi_din_AWREADY,m_axi_din_WDATA[63:0],m_axi_din_WSTRB[7:0],m_axi_din_WLAST,m_axi_din_WVALID,m_axi_din_WREADY,m_axi_din_BRESP[1:0],m_axi_din_BVALID,m_axi_din_BREADY,m_axi_din_ARADDR[63:0],m_axi_din_ARLEN[7:0],m_axi_din_ARSIZE[2:0],m_axi_din_ARBURST[1:0],m_axi_din_ARLOCK[1:0],m_axi_din_ARREGION[3:0],m_axi_din_ARCACHE[3:0],m_axi_din_ARPROT[2:0],m_axi_din_ARQOS[3:0],m_axi_din_ARVALID,m_axi_din_ARREADY,m_axi_din_RDATA[63:0],m_axi_din_RRESP[1:0],m_axi_din_RLAST,m_axi_din_RVALID,m_axi_din_RREADY,m_axi_dout_AWADDR[63:0],m_axi_dout_AWLEN[7:0],m_axi_dout_AWSIZE[2:0],m_axi_dout_AWBURST[1:0],m_axi_dout_AWLOCK[1:0],m_axi_dout_AWREGION[3:0],m_axi_dout_AWCACHE[3:0],m_axi_dout_AWPROT[2:0],m_axi_dout_AWQOS[3:0],m_axi_dout_AWVALID,m_axi_dout_AWREADY,m_axi_dout_WDATA[63:0],m_axi_dout_WSTRB[7:0],m_axi_dout_WLAST,m_axi_dout_WVALID,m_axi_dout_WREADY,m_axi_dout_BRESP[1:0],m_axi_dout_BVALID,m_axi_dout_BREADY,m_axi_dout_ARADDR[63:0],m_axi_dout_ARLEN[7:0],m_axi_dout_ARSIZE[2:0],m_axi_dout_ARBURST[1:0],m_axi_dout_ARLOCK[1:0],m_axi_dout_ARREGION[3:0],m_axi_dout_ARCACHE[3:0],m_axi_dout_ARPROT[2:0],m_axi_dout_ARQOS[3:0],m_axi_dout_ARVALID,m_axi_dout_ARREADY,m_axi_dout_RDATA[63:0],m_axi_dout_RRESP[1:0],m_axi_dout_RLAST,m_axi_dout_RVALID,m_axi_dout_RREADY" */;
  input [4:0]s_axi_control_AWADDR;
  input s_axi_control_AWVALID;
  output s_axi_control_AWREADY;
  input [31:0]s_axi_control_WDATA;
  input [3:0]s_axi_control_WSTRB;
  input s_axi_control_WVALID;
  output s_axi_control_WREADY;
  output [1:0]s_axi_control_BRESP;
  output s_axi_control_BVALID;
  input s_axi_control_BREADY;
  input [4:0]s_axi_control_ARADDR;
  input s_axi_control_ARVALID;
  output s_axi_control_ARREADY;
  output [31:0]s_axi_control_RDATA;
  output [1:0]s_axi_control_RRESP;
  output s_axi_control_RVALID;
  input s_axi_control_RREADY;
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  output [63:0]m_axi_din_AWADDR;
  output [7:0]m_axi_din_AWLEN;
  output [2:0]m_axi_din_AWSIZE;
  output [1:0]m_axi_din_AWBURST;
  output [1:0]m_axi_din_AWLOCK;
  output [3:0]m_axi_din_AWREGION;
  output [3:0]m_axi_din_AWCACHE;
  output [2:0]m_axi_din_AWPROT;
  output [3:0]m_axi_din_AWQOS;
  output m_axi_din_AWVALID;
  input m_axi_din_AWREADY;
  output [63:0]m_axi_din_WDATA;
  output [7:0]m_axi_din_WSTRB;
  output m_axi_din_WLAST;
  output m_axi_din_WVALID;
  input m_axi_din_WREADY;
  input [1:0]m_axi_din_BRESP;
  input m_axi_din_BVALID;
  output m_axi_din_BREADY;
  output [63:0]m_axi_din_ARADDR;
  output [7:0]m_axi_din_ARLEN;
  output [2:0]m_axi_din_ARSIZE;
  output [1:0]m_axi_din_ARBURST;
  output [1:0]m_axi_din_ARLOCK;
  output [3:0]m_axi_din_ARREGION;
  output [3:0]m_axi_din_ARCACHE;
  output [2:0]m_axi_din_ARPROT;
  output [3:0]m_axi_din_ARQOS;
  output m_axi_din_ARVALID;
  input m_axi_din_ARREADY;
  input [63:0]m_axi_din_RDATA;
  input [1:0]m_axi_din_RRESP;
  input m_axi_din_RLAST;
  input m_axi_din_RVALID;
  output m_axi_din_RREADY;
  output [63:0]m_axi_dout_AWADDR;
  output [7:0]m_axi_dout_AWLEN;
  output [2:0]m_axi_dout_AWSIZE;
  output [1:0]m_axi_dout_AWBURST;
  output [1:0]m_axi_dout_AWLOCK;
  output [3:0]m_axi_dout_AWREGION;
  output [3:0]m_axi_dout_AWCACHE;
  output [2:0]m_axi_dout_AWPROT;
  output [3:0]m_axi_dout_AWQOS;
  output m_axi_dout_AWVALID;
  input m_axi_dout_AWREADY;
  output [63:0]m_axi_dout_WDATA;
  output [7:0]m_axi_dout_WSTRB;
  output m_axi_dout_WLAST;
  output m_axi_dout_WVALID;
  input m_axi_dout_WREADY;
  input [1:0]m_axi_dout_BRESP;
  input m_axi_dout_BVALID;
  output m_axi_dout_BREADY;
  output [63:0]m_axi_dout_ARADDR;
  output [7:0]m_axi_dout_ARLEN;
  output [2:0]m_axi_dout_ARSIZE;
  output [1:0]m_axi_dout_ARBURST;
  output [1:0]m_axi_dout_ARLOCK;
  output [3:0]m_axi_dout_ARREGION;
  output [3:0]m_axi_dout_ARCACHE;
  output [2:0]m_axi_dout_ARPROT;
  output [3:0]m_axi_dout_ARQOS;
  output m_axi_dout_ARVALID;
  input m_axi_dout_ARREADY;
  input [63:0]m_axi_dout_RDATA;
  input [1:0]m_axi_dout_RRESP;
  input m_axi_dout_RLAST;
  input m_axi_dout_RVALID;
  output m_axi_dout_RREADY;
endmodule
