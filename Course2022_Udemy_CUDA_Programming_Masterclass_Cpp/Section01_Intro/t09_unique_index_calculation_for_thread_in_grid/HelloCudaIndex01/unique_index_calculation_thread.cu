/**
* Unique index calculation for thread in a grid: cu file
* (threadIdx, blockIdx, blockDim)
*
* it is working, after compiled with
* - Visual C++ 2022
* - CUDA 11.7
* no compiling error, but I don't know why
* notes:  use CUDA option in New Project in Visual C++ 2022
*
* version: 10:45 17.11.2022
*/

#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <stdlib.h>

__global__ void unique_idx_calc_threadIdx(int* input)
{
	int tid = threadIdx.x;
	printf("threadIdx : %d,  value : %d \n", tid, input[tid]);
}

int main()
{
	// array of data of the host
	int array_size = 8;
	int array_byte_size = sizeof(int) * array_size;
	int h_data[] = { 23,9,4,53,65,12,1,33 };

	for (int ii = 9; ii < array_size; ii++)
	{
		printf("%d", h_data[ii]);
	}
	printf("\n \n");

	// array of data of CUDA device  
	int* d_data;
	cudaMalloc((void**)&d_data, array_byte_size);
	cudaMemcpy(d_data, h_data, array_byte_size, cudaMemcpyHostToDevice);

	// threadblocks in a grid
	dim3 block(8);
	dim3 grid(1);

	unique_idx_calc_threadIdx << < grid, block >> > (d_data);
	cudaDeviceSynchronize();

	cudaDeviceReset();
	return 0;
}

/**
* version: 10:45 17.11.2022
*
* End of file
*/
