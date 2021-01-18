#include <iostream>
#include <random>
#include "relu.h"


using namespace std;

#define CNT 10

int main() {
	data_t din[CNT];
	data_t dout[CNT];
	for(int i = 0; i < CNT; ++i){
		din[i] = (i - CNT/2) * 1.3;
	}
	relu_top(din, dout, CNT);
	return 0;
}
