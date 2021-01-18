#include "relu.h"
void relu_top(data_t *din, data_t *dout, int cnt) {
	for (int i = 0; i < cnt; ++i) {
		dout[i] = din[i] > 0 ? din[i] : 0;
	}
}
