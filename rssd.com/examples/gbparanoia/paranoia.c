#include <stdio.h> /* printf */

#include "paranoia.h"

jmp_buf ovfl_buf;
Sig_type sigsave;
FLOAT Radix, BInvrse, RadixD2, BMinusU2;

/*Small floating point constants.*/
const FLOAT Zero = 0.0;
const FLOAT Half = 0.5;
const FLOAT One = 1.0;
const FLOAT Two = 2.0;
const FLOAT Three = 3.0;
const FLOAT Four = 4.0;
const FLOAT Five = 5.0;
const FLOAT Eight = 8.0;
const FLOAT Nine = 9.0;
const FLOAT TwentySeven = 27.0;
const FLOAT ThirtyTwo = 32.0;
const FLOAT TwoForty = 240.0;
const FLOAT MinusOne = -1.0;
const FLOAT OneAndHalf = 1.5;
/*Integer constants*/
const int NoTrials = 20; /*Number of tests for commutativity. */

/* Declarations of Variables */
int Indx;
char ch[8];
FLOAT AInvrse, A1;
FLOAT C, CInvrse;
FLOAT D, FourD;
FLOAT E0, E1, Exp2, E3, MinSqEr;
FLOAT SqEr, MaxSqEr, E9;
FLOAT Third;
FLOAT F6, F9;
FLOAT H, HInvrse;
int I;
FLOAT StickyBit, J;
FLOAT MyZero;
FLOAT Precision;
FLOAT Q, Q9;
FLOAT R, Random9;
FLOAT T, Underflow, S;
FLOAT OneUlp, UfThold, U1, U2;
FLOAT V, V0, V9;
FLOAT W;
FLOAT X, X1, X2, X8, Random1;
FLOAT Y, Y1, Y2, Random2;
FLOAT Z, PseudoZero, Z1, Z2, Z9;
int ErrCnt[4] = {0,0,0,0};
int fpecount;
int Milestone;
int PageNo = 1;
int M, N, N1;
Guard GMult, GDiv, GAddSub;
Rounding RMult, RDiv, RAddSub, RSqrt;
int Break, Done, NotMonot, Monot, Anomaly, IEEE,
		SqRWrng, UfNGrad;
/* Computed constants. */
/*U1  gap below 1.0, i.e, 1.0-U1 is next number below 1.0 */
/*U2  gap above 1.0, i.e, 1.0+U2 is next number above 1.0 */

/* floating point exception receiver */
void
sigfpe(INT x)
{
    fpecount++;
    printf("\n* * * FLOATING-POINT ERROR %d * * *\n", x);
    fflush(stdout);
    if (sigsave) {
#ifndef NOSIGNAL
        signal(SIGFPE, sigsave);
#endif
        sigsave = 0;
        longjmp(ovfl_buf, 1);
    }
    exit(1);
}
