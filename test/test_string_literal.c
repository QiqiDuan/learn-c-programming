#include <stdio.h>

int main( void ) {
    char *msg1;
    msg1 = "string literal 1\n";

    char *msg2 = "string literal 2\n";

    printf("%s", msg1);
    printf("%s", msg2);
    
    return 0;
}
