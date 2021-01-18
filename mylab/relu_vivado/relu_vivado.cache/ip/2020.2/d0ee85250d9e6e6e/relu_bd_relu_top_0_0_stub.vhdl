-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Mon Jan 18 21:08:13 2021
-- Host        : Windows10-508 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ relu_bd_relu_top_0_0_stub.vhdl
-- Design      : relu_bd_relu_top_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    s_axi_HLS_RELU_TOP_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_HLS_RELU_TOP_AWVALID : in STD_LOGIC;
    s_axi_HLS_RELU_TOP_AWREADY : out STD_LOGIC;
    s_axi_HLS_RELU_TOP_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_HLS_RELU_TOP_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_HLS_RELU_TOP_WVALID : in STD_LOGIC;
    s_axi_HLS_RELU_TOP_WREADY : out STD_LOGIC;
    s_axi_HLS_RELU_TOP_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_HLS_RELU_TOP_BVALID : out STD_LOGIC;
    s_axi_HLS_RELU_TOP_BREADY : in STD_LOGIC;
    s_axi_HLS_RELU_TOP_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_HLS_RELU_TOP_ARVALID : in STD_LOGIC;
    s_axi_HLS_RELU_TOP_ARREADY : out STD_LOGIC;
    s_axi_HLS_RELU_TOP_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_HLS_RELU_TOP_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_HLS_RELU_TOP_RVALID : out STD_LOGIC;
    s_axi_HLS_RELU_TOP_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_HLS_RELU_TOP_AWADDR[5:0],s_axi_HLS_RELU_TOP_AWVALID,s_axi_HLS_RELU_TOP_AWREADY,s_axi_HLS_RELU_TOP_WDATA[31:0],s_axi_HLS_RELU_TOP_WSTRB[3:0],s_axi_HLS_RELU_TOP_WVALID,s_axi_HLS_RELU_TOP_WREADY,s_axi_HLS_RELU_TOP_BRESP[1:0],s_axi_HLS_RELU_TOP_BVALID,s_axi_HLS_RELU_TOP_BREADY,s_axi_HLS_RELU_TOP_ARADDR[5:0],s_axi_HLS_RELU_TOP_ARVALID,s_axi_HLS_RELU_TOP_ARREADY,s_axi_HLS_RELU_TOP_RDATA[31:0],s_axi_HLS_RELU_TOP_RRESP[1:0],s_axi_HLS_RELU_TOP_RVALID,s_axi_HLS_RELU_TOP_RREADY,ap_clk,ap_rst_n,ap_start,ap_done,ap_idle,ap_ready";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "relu_top,Vivado 2020.2";
begin
end;
