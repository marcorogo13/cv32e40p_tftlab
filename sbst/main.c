#include "tests.h"


const signature_t const GOLDEN_SIGNATURES[NUMTESTS] = {
	0xCAFECAFE,	// TEST1
};

int main()
{
	int i, fails;
	fails = 0;
	signature_t signatures[NUMTESTS];

	int test0_iterations = 56;
	int test1_iterations = 28;
	int test2_iterations = 56;

	// division tests
	int test3_iterations = 56;
	int test4_iterations = 28;
	int test5_iterations = 0;
	
	// signatures[TEST1] = test1(test0_iterations);
	// signatures[TEST2] = test2(test1_iterations);
	// signatures[TEST3] = test3(test2_iterations);
	//signatures[TEST4] = test4(test3_iterations);
	signatures[TEST5] = test5(test4_iterations);
	//signatures[TEST6] = test6(test5_iterations);

	// if (signatures[TEST1] != test0_iterations){
	// 	fails++;
	// }
	// if (signatures[TEST2] != test1_iterations){
	// 	fails++;
	// }
	// if (signatures[TEST3] != test2_iterations){
	// 	fails++;
	// }
	// if (signatures[TEST4] != test3_iterations){
	// 	fails++;
	// }
	if (signatures[TEST5] != test4_iterations){
		fails++;
	}
	// if (signatures[TEST6] != test5_iterations){
	// 	fails++;
	// }	



 	return fails;
	
}