/******************************************************************************
 *
 * Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Use of the Software is limited solely to applications:
 * (a) running on a Xilinx device, or
 * (b) that interact with a Xilinx device through a bus or interconnect.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
 * OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 * Except as contained in this notice, the name of the Xilinx shall not be used
 * in advertising or otherwise to promote the sale, use or other dealings in
 * this Software without prior written authorization from Xilinx.
 *
 ******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <stdlib.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xscugic.h"
#include "XRelu_top.h"

XRelu_top ReluTop;
XScuGic ScuGic;

volatile static int RunReluTop = 0;
volatile static int ResultAvailReluTop = 0;

int setup_interrupt();
int relu_top_init(XRelu_top *relu_topPtr);
void relu_top_start(void *InstancePtr);
// The ISR prototype
void relu_top_isr(void *InstancePtr);

int main() {
	init_platform();

	print("Hello World\n\r");
	print("Successfully ran Hello World application");
	cleanup_platform();
	return 0;
}

int setup_interrupt() {
	//This functions sets up the interrupt on the ARM
	int result;
	XScuGic_Config *pCfg = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
	if (pCfg == NULL) {
		print("Interrupt Configuration Lookup Failed\n\r");
		return XST_FAILURE;
	}
	result = XScuGic_CfgInitialize(&ScuGic, pCfg, pCfg->CpuBaseAddress);
	if (result != XST_SUCCESS) {
		return result;
	}
	// self test
	result = XScuGic_SelfTest(&ScuGic);
	if (result != XST_SUCCESS) {
		return result;
	}
	// Initialize the exception handler
	Xil_ExceptionInit();
	// Register the exception handler
	//print("Register the exception handler\n\r");
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler) XScuGic_InterruptHandler, &ScuGic);
	//Enable the exception handler
	Xil_ExceptionEnable()
	;
	// Connect the Adder ISR to the exception table
	//print("Connect the Adder ISR to the Exception handler table\n\r");
	result = XScuGic_Connect(&ScuGic, XPAR_FABRIC_RELU_TOP_0_INTERRUPT_INTR,
			(Xil_InterruptHandler) relu_top_isr, &ReluTop);
	if (result != XST_SUCCESS) {
		return result;
	}
	//print("Enable the Adder ISR\n\r");
	XScuGic_Enable(&ScuGic, XPAR_FABRIC_RELU_TOP_0_INTERRUPT_INTR);
	return XST_SUCCESS;
}
int relu_top_init(XRelu_top *relu_topPtr){
	XRelu_top_Config *cfgPtr;
	   int status;

	   cfgPtr = XRelu_top_LookupConfig(XPAR_XRELU_TOP_0_DEVICE_ID);
	   if (!cfgPtr) {
	      print("ERROR: Lookup of acclerator configuration failed.\n\r");
	      return XST_FAILURE;
	   }
	   status = XRelu_top_CfgInitialize(relu_topPtr, cfgPtr);
	   if (status != XST_SUCCESS) {
	      print("ERROR: Could not initialize accelerator.\n\r");
	      return XST_FAILURE;
	   }
	   return status;
}
void relu_top_start(void *InstancePtr) {
	XRelu_top *pAccelerator = (XRelu_top *) InstancePtr;
	XRelu_top_InterruptEnable(pAccelerator, 1);
	XRelu_top_InterruptGlobalEnable(pAccelerator);
	XRelu_top_Start(pAccelerator);
}
// The ISR prototype
void relu_top_isr(void *InstancePtr) {
	XRelu_top *pAccelerator = (XRelu_top *) InstancePtr;

	//Disable the global interrupt
	XRelu_top_InterruptGlobalDisable(pAccelerator);
	//Disable the local interrupt
	XRelu_top_InterruptDisable(pAccelerator, 0xffffffff);

	// clear the local interrupt
	XRelu_top_InterruptClear(pAccelerator, 1);

	ResultAvailReluTop = 1;
	// restart the core if it should run again
	if (RunReluTop) {
		relu_top_start(pAccelerator);
	}
}