#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main( void ) {
    printf("The range of the rand() function is [0, RAND_MAX).\n");
    printf("RAND_MAX = %d\n", RAND_MAX);

    srand((unsigned int) time(NULL));
    for(int i = 0; i < 7; i++) {
        printf("%-7.2lf\n", 2.0 + ((double) rand() / RAND_MAX) * (5.0 - 2.0));
    }

   return EXIT_SUCCESS;
}
