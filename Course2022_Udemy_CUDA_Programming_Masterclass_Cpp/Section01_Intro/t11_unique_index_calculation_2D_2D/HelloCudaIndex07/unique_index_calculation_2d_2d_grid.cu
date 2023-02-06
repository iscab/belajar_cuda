/**
* Unique index calculation for thread in a 2D 2D grid: cu file
* (threadIdx, blockIdx, blockDim)
*
* it is working, after compiled with
* - Visual C++ 2022
* - CUDA 11.7
* no compiling error, but I don't know why
* notes:  use CUDA option in New Project in Visual C++ 2022
*
* version: 09:40 06.02.2023
*/

#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <stdlib.h>

__global__ void unique_gid_calculation_2d_2d(int* input)
{
	int tid = blockDim.x * threadIdx.y + threadIdx.x;

	int num_threads_in_a_block = blockDim.x * blockDim.y;
	int block_offset = blockIdx.x * num_threads_in_a_block;

	int num_threads_in_a_row = num_threads_in_a_block * gridDim.x;
	int row_offset = num_threads_in_a_row * blockIdx.y;

	int gid = tid + block_offset + row_offset;
	printf("blockIdx.x : %d, blockIdx.y : %d, threadIdx.x : %d, threadIdx.y : %d, tid : %d, gid : %d, value : %d \n",
		blockIdx.x, blockIdx.y, threadIdx.x, threadIdx.y, tid, gid, input[gid]);
}

int main()
{
	// array of data of the host
	int array_size = 16;
	int array_byte_size = sizeof(int) * array_size;
	int h_data[] = { 23,9,4,53,65,12,1,33,22,43,56,4,76,81,94,32 };

	for (int ii = 0; ii < array_size; ii++)
	{
		printf("%d ", h_data[ii]);
	}
	printf("\n \n");

	// array of data of CUDA device  
	int* d_data;
	cudaMalloc((void**)&d_data, array_byte_size);
	cudaMemcpy(d_data, h_data, array_byte_size, cudaMemcpyHostToDevice);

	// threadblocks in a grid
	dim3 block(2, 2);
	dim3 grid(2, 2);

	unique_gid_calculation_2d_2d << < grid, block >> > (d_data);
	cudaDeviceSynchronize();

	cudaDeviceReset();
	return 0;
}

/**
* version: 09:40 06.02.2023
*
* End of file
*/
