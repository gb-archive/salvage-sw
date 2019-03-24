#include <stdio.h>
#include "paranoia.h"
#include "subs.h"

#define PART1_MODULE
#include "banks.h"

#define fflush(f)

void part1(VOID) banked{
	/*=============================================*/
	Milestone = 0;
	/*=============================================*/
#ifndef NOSIGNAL
	signal(SIGFPE, sigfpe);
#endif
	/*=============================================*/
	Milestone = 7;
	/*=============================================*/
	printf("Program is now RUNNING tests on small integers:\n");
	
	TstCond (Failure, (Zero + Zero == Zero), "0+0 != 0");
	TstCond (Failure, (One - One == Zero), "1-1 != 0");
	TstCond (Failure, (One > Zero), "1 <= 0");
	TstCond (Failure, (One + One == Two), "1+1 != 2");

    if(- Zero != 0.0){
		ErrCnt[Failure] = ErrCnt[Failure] + 1;
		printf("Comparison alleges that -0.0 is Non-zero!\n");
		U2 = 0.001;
		Radix = 1;
		TstPtUf();
	}

	TstCond (Failure, (Three == Two + One),"3 != 2+1");
	TstCond (Failure, (Four == Three + One),"4 != 3 + 1");
	TstCond (Failure, (Four + Two * (- Two) == Zero),"4 + 2*(-2) != 0");
	TstCond (Failure, (Four - Three - One == Zero),"4-3-1 != 0");

	TstCond (Failure, (MinusOne == (0 - One)), "-1 != 0 - 1");
    TstCond (Failure, (MinusOne + One == Zero), "-1 + 1 != 0");
    TstCond (Failure, (One + MinusOne == Zero), "1 + (-1) != 0");
    TstCond (Failure, (MinusOne + FABS(One) == Zero), "(-1) + abs(1) != 0");

    TstCond (Failure, (Half + MinusOne + Half == Zero),"1/2 + (-1) + 1/2 != 0");
}
