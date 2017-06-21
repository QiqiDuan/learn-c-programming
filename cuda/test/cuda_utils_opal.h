/* ******************************************************************************************* *
 * CUDA Utils Designed for the OPtimization And Learning laboratory (i.e. OPAL), SUSTC.
 *
 * -----------------------------------------
 * Version: v00.00.001 [2017-06-21 20:00:00]
 * Author : DQQ-077    [Qiqi Duan]
 * Email  : duanqq@mail.sustc.edu.cn
 * ******************************************************************************************* */

#include <stdio.h>
#include <cuda_runtime.h>



#ifndef _CUDA_UTILS_OPAL_H_
#define _CUDA_UTILS_OPAL_H_



    /**
     * HOST: Handle CUDA Errors.
     */
    #define HCE(cuda_expr) { print_gpu_error(cuda_expr, __FILE__, __LINE__); }

    void print_gpu_error(cudaError_t error_index,
            const char *error_file, const unsigned int error_line) {
        if (error_index != cudaSuccess) {
            fprintf(stderr, "\n\n\n***\nCUDA ERROR :: %s [LINE %u] ---> %s.\n***\n\n\n",
                error_file, error_line, cudaGetErrorString(error_index));
            cudaDeviceReset();
            exit(EXIT_FAILURE);
        }
    }



#endif /* _CUDA_UTILS_OPAL_H_ */
