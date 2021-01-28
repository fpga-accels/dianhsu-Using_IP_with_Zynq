#include <iostream>
#include <stdlib.h>
#include "relu.h"

using namespace std;

int main() {
	data_t din[8][8], dout[8][8];
	int positive = 0, negative = 0;
	for (int i = 0; i < 8; ++i) {
		for (int j = 0; j < 8; ++j) {
			din[i][j] = rand() % 100 - 49.9;
			if(din[i][j] > 0)
				positive ++;
			else
				negative ++;
		}
	}
	for (int i = 0; i < 8; ++i) {
		printf("| ");
		for (int j = 0; j < 8; ++j) {
			printf("%6.2f | ", din[i][j]);
		}
		printf("\n");
	}
	printf("positive = %d, negative = %d\n", positive, negative);
	positive = 0, negative = 0;
	relu_top(din, dout, &positive, &negative);
	for (int i = 0; i < 8; ++i) {
		printf("| ");
		for (int j = 0; j < 8; ++j) {
			printf("%6.2f | ", dout[i][j]);
		}
		printf("\n");
	}
	printf("positive = %d, negative = %d\n", positive, negative);
	return 0;
}
