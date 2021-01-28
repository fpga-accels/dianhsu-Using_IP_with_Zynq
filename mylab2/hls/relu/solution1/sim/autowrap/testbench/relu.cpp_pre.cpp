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
