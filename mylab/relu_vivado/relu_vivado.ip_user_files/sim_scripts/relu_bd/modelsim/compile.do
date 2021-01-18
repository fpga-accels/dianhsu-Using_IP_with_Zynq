vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/relu_bd/ip/relu_bd_processing_system7_0_2/sim/relu_bd_processing_system7_0_2.v" \
"../../../bd/relu_bd/sim/relu_bd.v" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/e385/hdl/verilog/relu_top_control_s_axi.v" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/e385/hdl/verilog/relu_top_dcmp_64ns_64ns_1_2_no_dsp_1.v" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/e385/hdl/verilog/relu_top_din_m_axi.v" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/e385/hdl/verilog/relu_top_dout_m_axi.v" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/e385/hdl/verilog/relu_top.v" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/e385/hdl/ip/relu_top_ap_dcmp_0_no_dsp_64.v" \
"../../../bd/relu_bd/ip/relu_bd_relu_top_0_0/sim/relu_bd_relu_top_0_0.v" \
"../../../bd/relu_bd/ip/relu_bd_xbar_0/sim/relu_bd_xbar_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/relu_bd/ip/relu_bd_rst_ps7_0_100M_0/sim/relu_bd_rst_ps7_0_100M_0.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/relu_bd/ip/relu_bd_xlconstant_0_0/sim/relu_bd_xlconstant_0_0.v" \
"../../../bd/relu_bd/ip/relu_bd_auto_pc_0/sim/relu_bd_auto_pc_0.v" \
"../../../bd/relu_bd/ip/relu_bd_auto_pc_1/sim/relu_bd_auto_pc_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

