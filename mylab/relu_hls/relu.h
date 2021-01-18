#ifndef _RELU_H_
#define _RELU_H_

#include <hls_stream.h>

typedef double data_t;

void relu_top(data_t *din, data_t *dout, int cnt);

#endif //_RELU_H_
