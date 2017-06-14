#include <stdio.h>
#include <stdbool.h>

int main( void ) {
    _Bool false_0 = false;
    _Bool true_1 = true;

    printf("false = %d\n", false_0);
    printf("true = %s\n", true_1 ? "true" : "false");

    return 0;
}
