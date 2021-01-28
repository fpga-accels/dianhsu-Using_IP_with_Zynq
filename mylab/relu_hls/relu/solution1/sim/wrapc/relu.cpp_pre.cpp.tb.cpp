// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
# 1 "C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab/relu_hls/relu.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab/relu_hls/relu.cpp"
# 1 "C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab/relu_hls/relu.h" 1




typedef float data_t;

int relu_top(data_t din[3][128][128]);
# 2 "C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab/relu_hls/relu.cpp" 2
int relu_top(data_t din[3][128][128]) {
 int cnt = 0;
 relu_top_label0: for (int i = 0; i < 3; ++i) {
  relu_top_label1: for (int j = 0; j < 128; ++j) {
   relu_top_label2: for (int k = 0; k < 128; ++k) {
    if(din[i][j][k] > 0){
     cnt++;
    }else{
     din[i][j][k] = 0;
    }
   }
  }
 }
 return cnt;
}
#ifndef HLS_FASTSIM
#ifdef __cplusplus
extern "C"
#endif
int apatb_relu_top_ir(float (*)[128][128]);
#ifdef __cplusplus
extern "C"
#endif
int relu_top_hw_stub(float (*din)[128][128]){
int _ret = relu_top(din);
return _ret;
}
#ifdef __cplusplus
extern "C"
#endif
int apatb_relu_top_sw(float (*din)[128][128]){
int _ret = apatb_relu_top_ir(din);
return _ret;
}
#endif
# 16 "C:/Users/dianhsu/Desktop/Using_IP_with_Zynq/mylab/relu_hls/relu.cpp"

