/* ***************************************************************************** *
 * Print Message From GPU on CPU.
 *
 * Version: v00.00.000 [2017-07-14 11:30:00]
 * Author : DQQ-077    [Qiqi Duan]
 *          SC         [Chang Shao]
 * Email  : duanqq@mail.sustc.edu.cn
 *          shaoc@mail.sustc.edu.cn
 *
 * OUTPUT:
 * -------

 Write the first GPU program!


 Write the second GPU program!
 Hello World!
 Hello World!
 Hello World!
 00 :: Hello World!
 01 :: Hello World!
 02 :: Hello World!
 03 :: Hello World!
 04 :: Hello World!
 05 :: Hello World!
 06 :: Hello World!
 07 :: Hello World!
 08 :: Hello World!
 09 :: Hello World!
 10 :: Hello World!
 11 :: Hello World!
 12 :: Hello World!
 13 :: Hello World!
 14 :: Hello World!
 15 :: Hello World!
 16 :: Hello World!
 17 :: Hello World!
 18 :: Hello World!
 19 :: Hello World!
 20 :: Hello World!
 21 :: Hello World!
 22 :: Hello World!
 23 :: Hello World!
 24 :: Hello World!
 25 :: Hello World!
 26 :: Hello World!
 27 :: Hello World!
 28 :: Hello World!
 29 :: Hello World!
 30 :: Hello World!
 31 :: Hello World!


 Write the third GPU program!
 BlockIdx 0 && threadIdx 0 :: 0
 BlockIdx 0 && threadIdx 1 :: 2
 BlockIdx 0 && threadIdx 2 :: 4
 BlockIdx 1 && threadIdx 0 :: 6
 BlockIdx 1 && threadIdx 1 :: 8
 BlockIdx 1 && threadIdx 2 :: 10


 Write the fourth GPU program!
 * ***************************************************************************** */
#include <stdio.h>
#include <stdlib.h>

#include "cuda_utils_opal.h"



__global__ void print_hello_world(void) {
    printf("Hello World!\n");
}

__global__ void print_hello_world2(void) {
    printf("%02d :: Hello World!\n", threadIdx.x);
}

__device__ int show_base = 0;
__global__ void print_atomicAdd(void) {
    int show_id;
    show_id = atomicAdd(&show_base, 2);
    printf("BlockIdx %d && threadIdx %d :: %d\n",
            blockIdx.x, threadIdx.x, show_id);
}

int main(void) {
    printf("Write the first GPU program!\n");
    print_hello_world<<<1, 3>>>();
    printf("\n\n");

    printf("Write the second GPU program!\n");
    print_hello_world2<<<1, 32>>>();
    HCE(cudaDeviceSynchronize());
    HCE(cudaGetLastError());
    printf("\n\n");

    printf("Write the third GPU program!\n");
    print_atomicAdd<<<2, 3>>>();
    HCE(cudaDeviceSynchronize());
    HCE(cudaGetLastError());
    printf("\n\n");

    printf("Write the fourth GPU program!\n");
    print_hello_world2<<<1, 32>>>(); // cannot work! WHY?

    return EXIT_SUCCESS;
}
