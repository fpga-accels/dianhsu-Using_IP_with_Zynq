# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\dianhsu\Desktop\Using_IP_with_Zynq\mylab\relu_vitis\zed_hw\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\dianhsu\Desktop\Using_IP_with_Zynq\mylab\relu_vitis\zed_hw\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {zed_hw}\
-hw {C:\Users\dianhsu\Desktop\Using_IP_with_Zynq\mylab\relu_vivado\relu_bd_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab/relu_vitis}

platform write
platform generate -domains 
platform active {zed_hw}
platform generate
platform clean
platform generate
platform clean
platform generate
