/* ***************************************************************************** *
 * Understand Warp Divergence.
 *
 * Version: v00.00.000 [2017-08-01 19:30:00]
 * Author : DQQ-077    [Qiqi Duan]
 *          SC         [Chang Shao]
 * Email  : duanqq@mail.sustc.edu.cn
 *          shaoc@mail.sustc.edu.cn
 * OUTPUT:
 * -------
 *  # nvcc understand_warp_divergence.cu
 *      Run time :: diverge_warp() vs. avoid_diverge_warp()
 *                | 0.00157   vs. 0.00090
 *  # nvcc -O3 understand_warp_divergence.cu
 *      Run time :: diverge_warp() vs. avoid_diverge_warp()
 *                | 0.00157   vs. 0.00089
 *  # nvcc -g -G understand_warp_divergence.cu
 *      Run time :: diverge_warp() vs. avoid_diverge_warp()
 *                | 0.01510   vs. 0.02559
 * ***************************************************************************** */
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

#include "cuda_utils_opal.h"

#define THREAD_NUM_IN_WARP 32

__global__ void diverge_warp(double *array) {
    double a = 2.2, b = 5.5;
    size_t tidx = blockDim.x * blockIdx.x + threadIdx.x;
    if(tidx % 3 == 0) {
        array[tidx] = a + b;
    } else if(tidx % 3 == 1) {
        array[tidx] = a * b;
    } else {
        array[tidx] = a / b;
    }
}

__global__ void avoid_diverge_warp(double *array) {
    double a = 2.2, b = 5.5;
    size_t tidx = blockDim.x * blockIdx.x + threadIdx.x;
    if(tidx / THREAD_NUM_IN_WARP % 3 == 0) {
        array[tidx] = a + b;
    } else if(tidx / THREAD_NUM_IN_WARP % 3 == 1) {
        array[tidx] = a * b;
    } else {
        array[tidx] = a / b;
    }
}

int main(void) {
    printf("Understand Warp Divergence ::\n");
    HCE(cudaSetDevice(0));
    double run_time_diverge_warp = 0.0,
           run_time_avoid_diverge_warp = 0.0;

    struct timeval run_time_start, run_time_end;
    double run_time_start_double, run_time_end_double;

    size_t array_length = 1 << 24;
    size_t array_length_bytes = array_length * sizeof(double);
    double *array1, *array2;
    array1 = (double *)malloc(array_length_bytes);
    array2 = (double *)malloc(array_length_bytes);
    double *d_array1, *d_array2;
    HCE(cudaMalloc((double **)&d_array1, array_length_bytes));
    HCE(cudaMalloc((double **)&d_array2, array_length_bytes));
    HCE(cudaDeviceSynchronize());
    HCE(cudaGetLastError());

    dim3 block_size(1024);
    dim3 grid_size((array_length + block_size.x - 1) / block_size.x);

    gettimeofday(&run_time_start, NULL);
    avoid_diverge_warp<<<grid_size, block_size>>>(d_array2);
    HCE(cudaDeviceSynchronize());
    HCE(cudaGetLastError());
    gettimeofday(&run_time_end, NULL);
    HCE(cudaMemcpy(array2, d_array2, array_length_bytes, cudaMemcpyDeviceToHost));
    run_time_start_double = (double)run_time_start.tv_sec
        + (double)run_time_start.tv_usec / 1e6;
    run_time_end_double = (double)run_time_end.tv_sec
        + (double)run_time_end.tv_usec / 1e6;
    run_time_avoid_diverge_warp = run_time_end_double - run_time_start_double;

    gettimeofday(&run_time_start, NULL);
    diverge_warp<<<grid_size, block_size>>>(d_array1);
    HCE(cudaDeviceSynchronize());
    HCE(cudaGetLastError());
    gettimeofday(&run_time_end, NULL);
    HCE(cudaMemcpy(array1, d_array1, array_length_bytes, cudaMemcpyDeviceToHost));
    run_time_start_double = (double)run_time_start.tv_sec
        + (double)run_time_start.tv_usec / 1e6;
    run_time_end_double = (double)run_time_end.tv_sec
        + (double)run_time_end.tv_usec / 1e6;
    run_time_diverge_warp = run_time_end_double - run_time_start_double;

    printf("Run time :: diverge_warp() vs. avoid_diverge_warp()\n");
    printf("          | %-9.5lf vs. %-9.5lf\n",
            run_time_diverge_warp, run_time_avoid_diverge_warp);

    printf("\n\n\nSampling:\n");
    for(size_t i = 0; i < 4; i++) {
        printf("%zu :: %5.4lf vs. %5.4lf\n", i, array1[i], array2[i]);
    }
    printf("...\n");
    for(size_t i = array_length - 4; i < array_length; i++) {
        printf("%zu :: %5.4lf vs. %5.4lf\n", i, array1[i], array2[i]);
    }

    cudaFree(d_array1);
    cudaFree(d_array2);
    free(array1);
    free(array2);
}
