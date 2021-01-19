// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xrelu_top.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XRelu_top_CfgInitialize(XRelu_top *InstancePtr, XRelu_top_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XRelu_top_Set_cnt(XRelu_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRelu_top_WriteReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_CNT_DATA, Data);
}

u32 XRelu_top_Get_cnt(XRelu_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRelu_top_ReadReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_CNT_DATA);
    return Data;
}

