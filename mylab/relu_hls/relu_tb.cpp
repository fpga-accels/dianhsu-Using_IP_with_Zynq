#include <iostream>
#include <random>
#include "relu.h"


using namespace std;

#define CNT 10

int main() {
	data_t din[3][128][128];
	for(int i = 0; i < 3 * 128 * 128; ++i){
		din[i/128/128][i/128%128][i%128] = (i - CNT/2) * 1.3;
	}
	relu_top(din);
	return 0;
}
