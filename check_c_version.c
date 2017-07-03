#include <stdio.h>
#include <stdlib.h>



int main( void ) {
/*
 * ISO Standard C :: 1
 */
#ifdef __STDC__
    printf("__STDC__ == %d.\n", __STDC__);
#endif

/*
 * C11 :: 201112
 */
#ifdef __STDC_VERSION__
    printf("__STDC_VERSION__ = %ld.\n", __STDC_VERSION__);
#endif

    return EXIT_SUCCESS;
}
