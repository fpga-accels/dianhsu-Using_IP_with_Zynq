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

void XRelu_top_Start(XRelu_top *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRelu_top_ReadReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_AP_CTRL) & 0x80;
    XRelu_top_WriteReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XRelu_top_IsDone(XRelu_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRelu_top_ReadReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XRelu_top_IsIdle(XRelu_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRelu_top_ReadReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XRelu_top_IsReady(XRelu_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRelu_top_ReadReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XRelu_top_EnableAutoRestart(XRelu_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRelu_top_WriteReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XRelu_top_DisableAutoRestart(XRelu_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRelu_top_WriteReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XRelu_top_Get_return(XRelu_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRelu_top_ReadReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_AP_RETURN);
    return Data;
}
void XRelu_top_Set_din(XRelu_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRelu_top_WriteReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_DIN_DATA, (u32)(Data));
    XRelu_top_WriteReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_DIN_DATA + 4, (u32)(Data >> 32));
}

u64 XRelu_top_Get_din(XRelu_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XRelu_top_ReadReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_DIN_DATA);
    Data += (u64)XRelu_top_ReadReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_DIN_DATA + 4) << 32;
    return Data;
}

void XRelu_top_InterruptGlobalEnable(XRelu_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRelu_top_WriteReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_GIE, 1);
}

void XRelu_top_InterruptGlobalDisable(XRelu_top *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRelu_top_WriteReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_GIE, 0);
}

void XRelu_top_InterruptEnable(XRelu_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRelu_top_ReadReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_IER);
    XRelu_top_WriteReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_IER, Register | Mask);
}

void XRelu_top_InterruptDisable(XRelu_top *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XRelu_top_ReadReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_IER);
    XRelu_top_WriteReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_IER, Register & (~Mask));
}

void XRelu_top_InterruptClear(XRelu_top *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XRelu_top_WriteReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_ISR, Mask);
}

u32 XRelu_top_InterruptGetEnabled(XRelu_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRelu_top_ReadReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_IER);
}

u32 XRelu_top_InterruptGetStatus(XRelu_top *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XRelu_top_ReadReg(InstancePtr->Control_BaseAddress, XRELU_TOP_CONTROL_ADDR_ISR);
}

