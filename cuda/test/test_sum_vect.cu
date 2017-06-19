#include <stdio.h>
#include <stdlib.h>
#include <float.h>
#include <unistd.h>
#include <time.h>

#include "cuda_utils_opal.h"



typedef float FT;

__global__ void d_sum_vect(FT *vect_a, FT *vect_b, FT *vect_c, 
        const unsigned int vect_size) {
    unsigned int tidx = blockIdx.x * blockDim.x + threadIdx.x;
    if(tidx < vect_size) {
        vect_c[tidx] = vect_a[tidx] + vect_b[tidx];
    }
}

void sum_vect(FT *vect_a, FT *vect_b, FT *vect_c, 
        const unsigned int vect_size) {
    for(unsigned int vect_ind = 0; vect_ind < vect_size; vect_ind++) {
        vect_c[vect_ind] = vect_a[vect_ind] + vect_b[vect_ind];
    }
}

int check_sum(FT *vect_a, FT *vect_b, const unsigned int vect_size) {
    for(unsigned int vect_ind = 0; vect_ind < vect_size; vect_ind++) {
        if(fabs(vect_a[vect_ind] - vect_b[vect_ind]) > DBL_EPSILON) {
            printf("\nERROR :: %lf vs. %lf.\n",
                    (double) vect_a[vect_ind], (double) vect_b[vect_ind]);
            return EXIT_FAILURE;
        }
    }
    return EXIT_SUCCESS;
}

void init_vect(FT *vect, const unsigned int vect_size) {
    srand((unsigned int) time(NULL));
    for(unsigned int vect_ind = 0; vect_ind < vect_size; vect_ind++) {
        vect[vect_ind] = (FT) rand() / RAND_MAX;
    }
} 

void print_vect_samples(FT *vect_a, FT *vect_b, const unsigned int vect_size) {
    for(unsigned int vect_ind = 0; vect_ind < vect_size; 
            vect_ind += (vect_size / 10)) {
        printf("vect_a[%d] = %lf && vect_b[%d] = %lf.\n",
            vect_ind, vect_a[vect_ind], vect_ind, vect_b[vect_ind]);
    }
}



int main( void ) {
    const int dev_ind = 0;
    HCE(cudaSetDevice(dev_ind));

    const int trial_num = 2000;

    const unsigned int vect_size = 1 << 25;
    const unsigned int vect_size_bytes = sizeof(FT) * vect_size;
    printf("Vector Size = %d.\n", vect_size);
    FT *vect_a, *vect_b, *vect_c, *vect_c_cpy_gpu;
    vect_a = (FT *) malloc(vect_size_bytes);
    vect_b = (FT *) malloc(vect_size_bytes);
    vect_c = (FT *) malloc(vect_size_bytes);
    vect_c_cpy_gpu = (FT *) malloc(vect_size_bytes);

    init_vect(vect_a, vect_size);
    init_vect(vect_b, vect_size);

    time_t cpu_time_start, cpu_time_end;
    time(&cpu_time_start);
    for(unsigned int trial_ind = 0; trial_ind < trial_num; trial_ind++) {
        sum_vect(vect_a, vect_b, vect_c, vect_size);
    }
    time(&cpu_time_end);
    double cpu_time = difftime(cpu_time_end, cpu_time_start);
    printf("CPU time : %7.2lf.\n", cpu_time);

    FT *d_vect_a, *d_vect_b, *d_vect_c;
    HCE(cudaMalloc((FT **) &d_vect_a, vect_size_bytes));
    HCE(cudaMalloc((FT **) &d_vect_b, vect_size_bytes));
    HCE(cudaMalloc((FT **) &d_vect_c, vect_size_bytes));

    time_t gpu_time_start, gpu_time_end;
    time(&gpu_time_start);
    HCE(cudaMemcpy(d_vect_a, vect_a, vect_size_bytes, cudaMemcpyHostToDevice));
    HCE(cudaMemcpy(d_vect_b, vect_b, vect_size_bytes, cudaMemcpyHostToDevice));
    dim3 block(1024);
    dim3 grid((vect_size + block.x - 1) / block.x);
    for(unsigned int trial_ind = 0; trial_ind < trial_num; trial_ind++) {
        d_sum_vect<<<grid, block>>>(d_vect_a, d_vect_b, d_vect_c, 
            vect_size_bytes);
        HCE(cudaDeviceSynchronize());
        HCE(cudaGetLastError());
    }
    time(&gpu_time_end);
    double gpu_time = difftime(gpu_time_end, gpu_time_start);
    printf("GPU time : %7.2lf.\n", gpu_time);

    HCE(cudaMemcpy(vect_c_cpy_gpu, d_vect_c, vect_size_bytes, 
                cudaMemcpyDeviceToHost));

    check_sum(vect_c_cpy_gpu, vect_c, vect_size);
    print_vect_samples(vect_c_cpy_gpu, vect_c, vect_size);
    
    HCE(cudaFree(d_vect_a));
    HCE(cudaFree(d_vect_b));
    HCE(cudaFree(d_vect_c));

    free(vect_a);
    free(vect_b);
    free(vect_c);
    free(vect_c_cpy_gpu);

    HCE(cudaDeviceReset());
    return EXIT_SUCCESS;
}
