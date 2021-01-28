create_project prj -part xc7z020-clg484-1 -force
set_property target_language verilog [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/verilog"
source "C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab/relu_hls/relu/solution1/syn/verilog/relu_top_ap_fcmp_0_no_dsp_32_ip.tcl"
