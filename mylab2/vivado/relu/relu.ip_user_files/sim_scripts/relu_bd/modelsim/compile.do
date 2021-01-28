vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr "+incdir+../../../../relu.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../relu.gen/sources_1/bd/relu_bd/ipshared/b876/hdl/verilog/relu_top_control_s_axi.v" \
"../../../../relu.gen/sources_1/bd/relu_bd/ipshared/b876/hdl/verilog/relu_top_fcmp_32ns_32ns_1_2_no_dsp_1.v" \
"../../../../relu.gen/sources_1/bd/relu_bd/ipshared/b876/hdl/verilog/relu_top_gmem_m_axi.v" \
"../../../../relu.gen/sources_1/bd/relu_bd/ipshared/b876/hdl/verilog/relu_top.v" \
"../../../../relu.gen/sources_1/bd/relu_bd/ipshared/b876/hdl/ip/relu_top_ap_fcmp_0_no_dsp_32.v" \
"../../../bd/relu_bd/ip/relu_bd_relu_top_0_0/sim/relu_bd_relu_top_0_0.v" \
"../../../bd/relu_bd/ip/relu_bd_processing_system7_0_0/sim/relu_bd_processing_system7_0_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/relu_bd/ip/relu_bd_rst_ps7_0_100M_0/sim/relu_bd_rst_ps7_0_100M_0.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../relu.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/relu_bd/ip/relu_bd_auto_pc_0/sim/relu_bd_auto_pc_0.v" \
"../../../bd/relu_bd/ip/relu_bd_auto_pc_1/sim/relu_bd_auto_pc_1.v" \
"../../../bd/relu_bd/sim/relu_bd.v" \

vlog -work xil_defaultlib \
"glbl.v"

