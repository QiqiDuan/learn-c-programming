/* ***************************************************************************** *
 * CUDA Utils for the OPtimization And Learning Laboratory, CS-SUSTC.
 *
 * Version: v00.00.000 [2017-07-13 23:00:00]
 * Author : DQQ-077    [Qiqi Duan]
 *          SC         [Chang Shao]
 * Email  : duanqq@mail.sustc.edu.cn
 *          shaoc@mail.sustc.edu.cn
 * ***************************************************************************** */
#include <stdio.h>
#include <stdlib.h>
#include <cuda_runtime.h>



#ifndef CUDA_UTILS_OPAL_H
#define CUDA_UTILS_OPAL_H

/**
 * HOST: Handle CUDA Errors.
 **/
#define HCE(cuda_expr) { print_gpu_error(cuda_expr, __FILE__, __LINE__); }

void print_gpu_error(const cudaError_t error_index,
        const char *error_file, const unsigned int error_line) {
    if(error_index != cudaSuccess) {
        fprintf(stderr, "\n\n\n*******\nCUDA ERROR :: FILE %s "
                "[LINE %u] ---> %s.\n*******\n\n\n",
                error_file, error_line, cudaGetErrorString(error_index));
        cudaDeviceReset();
        exit(EXIT_FAILURE);
    }
}

#endif /* !CUDA_UTILS_OPAL_H */
