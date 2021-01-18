// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon Jan 18 21:08:13 2021
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
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(s_axi_HLS_RELU_TOP_AWADDR, 
  s_axi_HLS_RELU_TOP_AWVALID, s_axi_HLS_RELU_TOP_AWREADY, s_axi_HLS_RELU_TOP_WDATA, 
  s_axi_HLS_RELU_TOP_WSTRB, s_axi_HLS_RELU_TOP_WVALID, s_axi_HLS_RELU_TOP_WREADY, 
  s_axi_HLS_RELU_TOP_BRESP, s_axi_HLS_RELU_TOP_BVALID, s_axi_HLS_RELU_TOP_BREADY, 
  s_axi_HLS_RELU_TOP_ARADDR, s_axi_HLS_RELU_TOP_ARVALID, s_axi_HLS_RELU_TOP_ARREADY, 
  s_axi_HLS_RELU_TOP_RDATA, s_axi_HLS_RELU_TOP_RRESP, s_axi_HLS_RELU_TOP_RVALID, 
  s_axi_HLS_RELU_TOP_RREADY, ap_clk, ap_rst_n, ap_start, ap_done, ap_idle, ap_ready)
/* synthesis syn_black_box black_box_pad_pin="s_axi_HLS_RELU_TOP_AWADDR[5:0],s_axi_HLS_RELU_TOP_AWVALID,s_axi_HLS_RELU_TOP_AWREADY,s_axi_HLS_RELU_TOP_WDATA[31:0],s_axi_HLS_RELU_TOP_WSTRB[3:0],s_axi_HLS_RELU_TOP_WVALID,s_axi_HLS_RELU_TOP_WREADY,s_axi_HLS_RELU_TOP_BRESP[1:0],s_axi_HLS_RELU_TOP_BVALID,s_axi_HLS_RELU_TOP_BREADY,s_axi_HLS_RELU_TOP_ARADDR[5:0],s_axi_HLS_RELU_TOP_ARVALID,s_axi_HLS_RELU_TOP_ARREADY,s_axi_HLS_RELU_TOP_RDATA[31:0],s_axi_HLS_RELU_TOP_RRESP[1:0],s_axi_HLS_RELU_TOP_RVALID,s_axi_HLS_RELU_TOP_RREADY,ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready" */;
  input [5:0]s_axi_HLS_RELU_TOP_AWADDR;
  input s_axi_HLS_RELU_TOP_AWVALID;
  output s_axi_HLS_RELU_TOP_AWREADY;
  input [31:0]s_axi_HLS_RELU_TOP_WDATA;
  input [3:0]s_axi_HLS_RELU_TOP_WSTRB;
  input s_axi_HLS_RELU_TOP_WVALID;
  output s_axi_HLS_RELU_TOP_WREADY;
  output [1:0]s_axi_HLS_RELU_TOP_BRESP;
  output s_axi_HLS_RELU_TOP_BVALID;
  input s_axi_HLS_RELU_TOP_BREADY;
  input [5:0]s_axi_HLS_RELU_TOP_ARADDR;
  input s_axi_HLS_RELU_TOP_ARVALID;
  output s_axi_HLS_RELU_TOP_ARREADY;
  output [31:0]s_axi_HLS_RELU_TOP_RDATA;
  output [1:0]s_axi_HLS_RELU_TOP_RRESP;
  output s_axi_HLS_RELU_TOP_RVALID;
  input s_axi_HLS_RELU_TOP_RREADY;
  input ap_clk;
  input ap_rst_n;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
endmodule
