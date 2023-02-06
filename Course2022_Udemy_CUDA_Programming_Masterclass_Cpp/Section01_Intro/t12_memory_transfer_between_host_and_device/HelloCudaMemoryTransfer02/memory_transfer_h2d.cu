/**
* Memory tranfer from host to device: cu file
* when the host data is smaller than device memory
*
* it is working, after compiled with
* - Visual C++ 2022
* - CUDA 11.7
* no compiling error, but I don't know why
* notes:  use CUDA option in New Project in Visual C++ 2022
*
* version: 09:42 06.02.2023
*/

#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <stdlib.h>
#include<cstring>
#include<time.h>

__global__ void mem_trs_test(int* input)
{
	int gid = blockIdx.x * blockDim.x + threadIdx.x;
	printf("tid : %d, gid: %d, value : %d \n", threadIdx.x, gid, input[gid]);
}

__global__ void mem_trs_test2(int* input, int size)
{
	int gid = blockIdx.x * blockDim.x + threadIdx.x;

	if (gid < size)
	{
		printf("tid : %d, gid: %d, value : %d \n", threadIdx.x, gid, input[gid]);
	}		
	else
	{
		printf("tid : %d, gid: %d, value : dodol \n", threadIdx.x, gid);
	}
}

int main()
{
	// size of the array
	int size = 150;
	int byte_size = size * sizeof(int);

	// array of data of the host
	int* h_input;
	h_input = (int*)malloc(byte_size);

	// random numbers in the array
	time_t t;
	srand((unsigned)time(&t));  // seeding, before randomization  
	for (int ii = 0; ii < size; ii++)
	{
		h_input[ii] = (int)(rand() & 0xff);
	}

	// array of data of the device
	int* d_input;
	cudaMalloc((void**)&d_input, byte_size);

	// transfer memory from host to device
	cudaMemcpy(d_input, h_input, byte_size, cudaMemcpyHostToDevice);

	// threadblocks in a grid
	dim3 block(32);
	dim3 grid(5);

	mem_trs_test2 << < grid, block >> > (d_input, size);
	cudaDeviceSynchronize();

	// free the memory
	cudaFree(d_input);
	free(h_input);

	cudaDeviceReset();
	return 0;
}

/**
* version: 09:42 06.02.2023
*
* End of file
*/
