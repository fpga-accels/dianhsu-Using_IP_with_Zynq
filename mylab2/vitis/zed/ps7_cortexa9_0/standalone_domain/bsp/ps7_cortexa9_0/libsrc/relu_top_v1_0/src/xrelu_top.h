// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XRELU_TOP_H
#define XRELU_TOP_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xrelu_top_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XRelu_top_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XRelu_top;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XRelu_top_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XRelu_top_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XRelu_top_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XRelu_top_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XRelu_top_Initialize(XRelu_top *InstancePtr, u16 DeviceId);
XRelu_top_Config* XRelu_top_LookupConfig(u16 DeviceId);
int XRelu_top_CfgInitialize(XRelu_top *InstancePtr, XRelu_top_Config *ConfigPtr);
#else
int XRelu_top_Initialize(XRelu_top *InstancePtr, const char* InstanceName);
int XRelu_top_Release(XRelu_top *InstancePtr);
#endif

void XRelu_top_Start(XRelu_top *InstancePtr);
u32 XRelu_top_IsDone(XRelu_top *InstancePtr);
u32 XRelu_top_IsIdle(XRelu_top *InstancePtr);
u32 XRelu_top_IsReady(XRelu_top *InstancePtr);
void XRelu_top_EnableAutoRestart(XRelu_top *InstancePtr);
void XRelu_top_DisableAutoRestart(XRelu_top *InstancePtr);

void XRelu_top_Set_din(XRelu_top *InstancePtr, u64 Data);
u64 XRelu_top_Get_din(XRelu_top *InstancePtr);
void XRelu_top_Set_dout(XRelu_top *InstancePtr, u64 Data);
u64 XRelu_top_Get_dout(XRelu_top *InstancePtr);

void XRelu_top_InterruptGlobalEnable(XRelu_top *InstancePtr);
void XRelu_top_InterruptGlobalDisable(XRelu_top *InstancePtr);
void XRelu_top_InterruptEnable(XRelu_top *InstancePtr, u32 Mask);
void XRelu_top_InterruptDisable(XRelu_top *InstancePtr, u32 Mask);
void XRelu_top_InterruptClear(XRelu_top *InstancePtr, u32 Mask);
u32 XRelu_top_InterruptGetEnabled(XRelu_top *InstancePtr);
u32 XRelu_top_InterruptGetStatus(XRelu_top *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
