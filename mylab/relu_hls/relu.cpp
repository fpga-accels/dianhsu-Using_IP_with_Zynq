#include "relu.h"
void relu_top(data_t din[3][128][128]) {
	relu_top_label0: for (int i = 0; i < 3; ++i) {
		relu_top_label1: for (int j = 0; j < 128; ++j) {
			relu_top_label2: for (int k = 0; k < 128; ++k) {
				din[i][j][k] = din[i][j][k] > 0 ? din[i][j][k] : 0;
			}
		}
	}
}
