vlib work
vlib activehdl

vlib activehdl/xilinx_vip
vlib activehdl/xpm
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/axi_vip_v1_1_8
vlib activehdl/processing_system7_vip_v1_0_10
vlib activehdl/xil_defaultlib
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/xbip_utils_v3_0_10
vlib activehdl/axi_utils_v2_0_6
vlib activehdl/xbip_pipe_v3_0_6
vlib activehdl/xbip_dsp48_wrapper_v3_0_4
vlib activehdl/xbip_dsp48_addsub_v3_0_6
vlib activehdl/xbip_dsp48_multadd_v3_0_6
vlib activehdl/xbip_bram18k_v3_0_6
vlib activehdl/mult_gen_v12_0_16
vlib activehdl/floating_point_v7_1_11
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/fifo_generator_v13_2_5
vlib activehdl/axi_data_fifo_v2_1_21
vlib activehdl/axi_register_slice_v2_1_22
vlib activehdl/axi_protocol_converter_v2_1_22

vmap xilinx_vip activehdl/xilinx_vip
vmap xpm activehdl/xpm
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_8 activehdl/axi_vip_v1_1_8
vmap processing_system7_vip_v1_0_10 activehdl/processing_system7_vip_v1_0_10
vmap xil_defaultlib activehdl/xil_defaultlib
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap xbip_utils_v3_0_10 activehdl/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 activehdl/axi_utils_v2_0_6
vmap xbip_pipe_v3_0_6 activehdl/xbip_pipe_v3_0_6
vmap xbip_dsp48_wrapper_v3_0_4 activehdl/xbip_dsp48_wrapper_v3_0_4
vmap xbip_dsp48_addsub_v3_0_6 activehdl/xbip_dsp48_addsub_v3_0_6
vmap xbip_dsp48_multadd_v3_0_6 activehdl/xbip_dsp48_multadd_v3_0_6
vmap xbip_bram18k_v3_0_6 activehdl/xbip_bram18k_v3_0_6
vmap mult_gen_v12_0_16 activehdl/mult_gen_v12_0_16
vmap floating_point_v7_1_11 activehdl/floating_point_v7_1_11
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_5 activehdl/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_21 activehdl/axi_data_fifo_v2_1_21
vmap axi_register_slice_v2_1_22 activehdl/axi_register_slice_v2_1_22
vmap axi_protocol_converter_v2_1_22 activehdl/axi_protocol_converter_v2_1_22

vlog -work xilinx_vip  -sv2k12 "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"C:/Xilinx/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_8  -sv2k12 "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_10  -sv2k12 "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/relu_bd/ip/relu_bd_processing_system7_0_0/sim/relu_bd_processing_system7_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/relu_bd/ip/relu_bd_rst_ps7_0_100M_0/sim/relu_bd_rst_ps7_0_100M_0.vhd" \

vcom -work xbip_utils_v3_0_10 -93 \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/d117/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6 -93 \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/1971/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -93 \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/910d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_6 -93 \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/b0ac/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_6 -93 \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/d367/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_16 -93 \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ce84/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work floating_point_v7_1_11 -93 \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/b0c0/hdl/floating_point_v7_1_rfs.vhd" \

vlog -work floating_point_v7_1_11  -v2k5 "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/b0c0/hdl/floating_point_v7_1_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/eea0/hdl/verilog/relu_top_control_s_axi.v" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/eea0/hdl/verilog/relu_top_fcmp_32ns_32ns_1_2_no_dsp_1.v" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/eea0/hdl/verilog/relu_top_gmem_m_axi.v" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/eea0/hdl/verilog/relu_top.v" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/eea0/hdl/ip/relu_top_ap_fcmp_0_no_dsp_32.v" \
"../../../bd/relu_bd/ip/relu_bd_relu_top_0_1/sim/relu_bd_relu_top_0_1.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  -v2k5 "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  -v2k5 "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_22  -v2k5 "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/ec67/hdl" "+incdir+../../../../relu_vivado.gen/sources_1/bd/relu_bd/ipshared/34f8/hdl" "+incdir+C:/Xilinx/Vivado/2020.2/data/xilinx_vip/include" \
"../../../bd/relu_bd/ip/relu_bd_auto_pc_0/sim/relu_bd_auto_pc_0.v" \
"../../../bd/relu_bd/ip/relu_bd_auto_pc_1/sim/relu_bd_auto_pc_1.v" \
"../../../bd/relu_bd/sim/relu_bd.v" \

vlog -work xil_defaultlib \
"glbl.v"

