// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
# 1 "C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab2/hls/relu.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab2/hls/relu.cpp"
# 1 "C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab2/hls/relu.h" 1



typedef float data_t;
void relu_top(data_t din[8][8], data_t dout[8][8], int* positive, int* negative);
# 2 "C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab2/hls/relu.cpp" 2

void relu_top(data_t din[8][8], data_t dout[8][8], int *positive,
  int *negative) {
 for (int i = 0; i < 8; ++i) {
  for (int j = 0; j < 8; ++j) {
   if (din[i][j] > 0) {
    *positive = *positive + 1;
    dout[i][j] = din[i][j];
   } else {
    *negative = *negative + 1;
    dout[i][j] = 0;
   }
  }
 }
}
#ifndef HLS_FASTSIM
#ifdef __cplusplus
extern "C"
#endif
void apatb_relu_top_ir(float (*)[8], float (*)[8], int *, int *);
#ifdef __cplusplus
extern "C"
#endif
void relu_top_hw_stub(float (*din)[8], float (*dout)[8], int *positive, int *negative){
relu_top(din, dout, positive, negative);
return ;
}
#ifdef __cplusplus
extern "C"
#endif
void apatb_relu_top_sw(float (*din)[8], float (*dout)[8], int *positive, int *negative){
apatb_relu_top_ir(din, dout, positive, negative);
return ;
}
#endif
# 16 "C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab2/hls/relu.cpp"

