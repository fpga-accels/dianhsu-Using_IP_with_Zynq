-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Fri Jan 22 16:28:07 2021
-- Host        : Windows10-508 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ relu_bd_relu_top_0_2_stub.vhdl
-- Design      : relu_bd_relu_top_0_2
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    s_axi_control_AWADDR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_AWVALID : in STD_LOGIC;
    s_axi_control_AWREADY : out STD_LOGIC;
    s_axi_control_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_WVALID : in STD_LOGIC;
    s_axi_control_WREADY : out STD_LOGIC;
    s_axi_control_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_BVALID : out STD_LOGIC;
    s_axi_control_BREADY : in STD_LOGIC;
    s_axi_control_ARADDR : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_ARVALID : in STD_LOGIC;
    s_axi_control_ARREADY : out STD_LOGIC;
    s_axi_control_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_RVALID : out STD_LOGIC;
    s_axi_control_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC;
    m_axi_din_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_din_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_din_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_din_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_din_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_din_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_din_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_din_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_din_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_din_AWVALID : out STD_LOGIC;
    m_axi_din_AWREADY : in STD_LOGIC;
    m_axi_din_WDATA : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_din_WSTRB : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_din_WLAST : out STD_LOGIC;
    m_axi_din_WVALID : out STD_LOGIC;
    m_axi_din_WREADY : in STD_LOGIC;
    m_axi_din_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_din_BVALID : in STD_LOGIC;
    m_axi_din_BREADY : out STD_LOGIC;
    m_axi_din_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_din_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_din_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_din_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_din_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_din_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_din_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_din_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_din_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_din_ARVALID : out STD_LOGIC;
    m_axi_din_ARREADY : in STD_LOGIC;
    m_axi_din_RDATA : in STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_din_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_din_RLAST : in STD_LOGIC;
    m_axi_din_RVALID : in STD_LOGIC;
    m_axi_din_RREADY : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_control_AWADDR[3:0],s_axi_control_AWVALID,s_axi_control_AWREADY,s_axi_control_WDATA[31:0],s_axi_control_WSTRB[3:0],s_axi_control_WVALID,s_axi_control_WREADY,s_axi_control_BRESP[1:0],s_axi_control_BVALID,s_axi_control_BREADY,s_axi_control_ARADDR[3:0],s_axi_control_ARVALID,s_axi_control_ARREADY,s_axi_control_RDATA[31:0],s_axi_control_RRESP[1:0],s_axi_control_RVALID,s_axi_control_RREADY,ap_clk,ap_rst_n,interrupt,m_axi_din_AWADDR[63:0],m_axi_din_AWLEN[7:0],m_axi_din_AWSIZE[2:0],m_axi_din_AWBURST[1:0],m_axi_din_AWLOCK[1:0],m_axi_din_AWREGION[3:0],m_axi_din_AWCACHE[3:0],m_axi_din_AWPROT[2:0],m_axi_din_AWQOS[3:0],m_axi_din_AWVALID,m_axi_din_AWREADY,m_axi_din_WDATA[63:0],m_axi_din_WSTRB[7:0],m_axi_din_WLAST,m_axi_din_WVALID,m_axi_din_WREADY,m_axi_din_BRESP[1:0],m_axi_din_BVALID,m_axi_din_BREADY,m_axi_din_ARADDR[63:0],m_axi_din_ARLEN[7:0],m_axi_din_ARSIZE[2:0],m_axi_din_ARBURST[1:0],m_axi_din_ARLOCK[1:0],m_axi_din_ARREGION[3:0],m_axi_din_ARCACHE[3:0],m_axi_din_ARPROT[2:0],m_axi_din_ARQOS[3:0],m_axi_din_ARVALID,m_axi_din_ARREADY,m_axi_din_RDATA[63:0],m_axi_din_RRESP[1:0],m_axi_din_RLAST,m_axi_din_RVALID,m_axi_din_RREADY";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "relu_top,Vivado 2020.2";
begin
end;
