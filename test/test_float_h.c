#include <stdio.h>
#include <float.h>

int main( void ) {
    printf("FLT_ROUNDS   : %d\n", FLT_ROUNDS);
    printf("\n");
    printf("FLT_MIN      : %e\n", FLT_MIN);
    printf("DBL_MIN      : %e\n", DBL_MIN);
    printf("LDBL_MIN     : %Le\n", LDBL_MIN);
    printf("\n");
    printf("FLT_MAX      : %e\n", FLT_MAX);
    printf("DBL_MAX      : %e\n", DBL_MAX);
    printf("LDBL_MAX     : %Le\n", LDBL_MAX);
    printf("\n");
    printf("FLT_EPSILON  : %e\n", FLT_EPSILON);
    printf("DBL_EPSILON  : %e\n", DBL_EPSILON);
    printf("LDBL_EPSILON : %Le\n", LDBL_EPSILON);
    
    return 0;
}
