# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\dianhsu\Desktop\Using_IP_with_Zynq\mylab2\vitis\zed\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\dianhsu\Desktop\Using_IP_with_Zynq\mylab2\vitis\zed\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {zed}\
-hw {C:\Users\dianhsu\Desktop\Using_IP_with_Zynq\mylab2\vivado\relu\relu.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab2/vitis}

platform write
platform generate -domains 
platform active {zed}
platform generate
platform clean
platform active {zed}
platform config -updatehw {C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab2/vivado/relu/relu.xsa}
platform generate
platform clean
platform generate
platform clean
platform generate
platform config -updatehw {C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab2/vivado/relu/relu.xsa}
platform clean
platform generate