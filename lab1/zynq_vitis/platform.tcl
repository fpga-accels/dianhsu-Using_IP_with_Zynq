# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\Users\dianhsu\Desktop\Using_IP_with_Zynq\lab1\zynq_vitis\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\Users\dianhsu\Desktop\Using_IP_with_Zynq\lab1\zynq_vitis\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {zynq_vitis}\
-hw {C:\Users\dianhsu\Desktop\Using_IP_with_Zynq\lab1\macc_vivado\zynq_design_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/lab1}

platform write
platform generate -domains 
platform active {zynq_vitis}
platform generate
platform clean
platform generate
platform clean
