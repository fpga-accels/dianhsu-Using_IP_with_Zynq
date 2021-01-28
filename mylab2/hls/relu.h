#ifndef __HLS_RELU_H__
#define __HLS_RELU_H__

typedef float data_t;
void relu_top(data_t din[8][8], data_t dout[8][8], int* positive, int* negative);

#endif
