#include "tests.h"


const signature_t const GOLDEN_SIGNATURES[NUMTESTS] = {
	0xCAFECAFE,	// TEST1
};

int main()
{
	int i, fails;
	fails = 0;
	signature_t signatures[NUMTESTS];
	
	signatures[TEST1] = test1();
	signatures[TEST2] = test2();
	signatures[TEST3] = test3();

	if (signatures[0] != 128){
		fails++;
	}
	if (signatures[1] != 28){
		fails++;
	}
	if (signatures[2] != 128){
		fails++;
	}



 	return fails;
	
}