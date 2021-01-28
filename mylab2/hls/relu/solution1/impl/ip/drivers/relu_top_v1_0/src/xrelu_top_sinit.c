// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xrelu_top.h"

extern XRelu_top_Config XRelu_top_ConfigTable[];

XRelu_top_Config *XRelu_top_LookupConfig(u16 DeviceId) {
	XRelu_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XRELU_TOP_NUM_INSTANCES; Index++) {
		if (XRelu_top_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XRelu_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XRelu_top_Initialize(XRelu_top *InstancePtr, u16 DeviceId) {
	XRelu_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XRelu_top_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XRelu_top_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

