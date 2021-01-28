// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - enable ap_done interrupt (Read/Write)
//        bit 1  - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - ap_done (COR/TOW)
//        bit 1  - ap_ready (COR/TOW)
//        others - reserved
// 0x10 : Data signal of din
//        bit 31~0 - din[31:0] (Read/Write)
// 0x14 : Data signal of din
//        bit 31~0 - din[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of dout
//        bit 31~0 - dout[31:0] (Read/Write)
// 0x20 : Data signal of dout
//        bit 31~0 - dout[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of positive_r_i
//        bit 31~0 - positive_r_i[31:0] (Read/Write)
// 0x2c : reserved
// 0x30 : Data signal of positive_r_o
//        bit 31~0 - positive_r_o[31:0] (Read)
// 0x34 : Control signal of positive_r_o
//        bit 0  - positive_r_o_ap_vld (Read/COR)
//        others - reserved
// 0x38 : Data signal of negative_i
//        bit 31~0 - negative_i[31:0] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of negative_o
//        bit 31~0 - negative_o[31:0] (Read)
// 0x44 : Control signal of negative_o
//        bit 0  - negative_o_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XRELU_TOP_CONTROL_ADDR_AP_CTRL           0x00
#define XRELU_TOP_CONTROL_ADDR_GIE               0x04
#define XRELU_TOP_CONTROL_ADDR_IER               0x08
#define XRELU_TOP_CONTROL_ADDR_ISR               0x0c
#define XRELU_TOP_CONTROL_ADDR_DIN_DATA          0x10
#define XRELU_TOP_CONTROL_BITS_DIN_DATA          64
#define XRELU_TOP_CONTROL_ADDR_DOUT_DATA         0x1c
#define XRELU_TOP_CONTROL_BITS_DOUT_DATA         64
#define XRELU_TOP_CONTROL_ADDR_POSITIVE_R_I_DATA 0x28
#define XRELU_TOP_CONTROL_BITS_POSITIVE_R_I_DATA 32
#define XRELU_TOP_CONTROL_ADDR_POSITIVE_R_O_DATA 0x30
#define XRELU_TOP_CONTROL_BITS_POSITIVE_R_O_DATA 32
#define XRELU_TOP_CONTROL_ADDR_POSITIVE_R_O_CTRL 0x34
#define XRELU_TOP_CONTROL_ADDR_NEGATIVE_I_DATA   0x38
#define XRELU_TOP_CONTROL_BITS_NEGATIVE_I_DATA   32
#define XRELU_TOP_CONTROL_ADDR_NEGATIVE_O_DATA   0x40
#define XRELU_TOP_CONTROL_BITS_NEGATIVE_O_DATA   32
#define XRELU_TOP_CONTROL_ADDR_NEGATIVE_O_CTRL   0x44

