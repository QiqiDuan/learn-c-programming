#include <stdio.h>

#include "cuda_utils_opal.h"



__device__ int d_increase = 0;

__global__ void d_printf(void) {
    int print_id;
    print_id = atomicAdd(&d_increase, 1);
    printf("Block %d && Thread %d : %d\n",
        blockIdx.x, threadIdx.x, print_id);
}



int main( void ) {
    printf("* start test:\n");
    d_printf<<<3, 8>>>();
    HCE(cudaDeviceSynchronize());
    HCE(cudaGetLastError());
    printf("* end test!\n");

    return EXIT_SUCCESS;
}
