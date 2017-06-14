#include <stdio.h>
#include <stdbool.h>

/* 
 * the header file <stdbool.h> is in
 *     /usr/lib/gcc/x86_64-linux-gnu/5/include        [for Ubuntu 16.04.2 LTS]
 */

int main( void ) {
    _Bool false_0 = false;
    _Bool true_1 = true;

    printf("false = %d\n", false_0);
    printf("true = %s\n", true_1 ? "true" : "false");

    return 0;
}
