#include <stdio.h>

int main( void ) {
    #ifdef _STDC_NO_VLA_
        printf("Variable Length Variables are not supported!.\n");
    #endif
}
