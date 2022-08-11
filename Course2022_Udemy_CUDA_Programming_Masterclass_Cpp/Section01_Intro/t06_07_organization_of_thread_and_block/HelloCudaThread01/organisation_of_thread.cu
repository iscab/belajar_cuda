/**
* Organization of thread and block: cu file
*
* it is working, after compiled with
* - Visual C++ 2022
* - CUDA 11.7
* - a main function in a cpp file, including a cuh header file
* note: this is a work-around to compile cu files.
*
* version: 08:21 11.08.2022
*/

#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include "./organisation_of_thread.cuh"

#include <stdio.h>

__global__ void print_threadIds()
{
	printf("threadIdx.x : %d, threadIdx.y : %d, threadIdx.z : %d  \n",
		threadIdx.x, threadIdx.y, threadIdx.z);
}

__global__ void print_details()
{
	printf("blockIdx.x : %d, blockIdx.y : %d, blockIdx.z : %d, blockDim.x: %d, blockDim.y: %d, gridDim.x: %d, gridDim.y: %d  \n",
		blockIdx.x, blockIdx.y, blockIdx.z, 
		blockDim.x, blockDim.y,
		gridDim.x, gridDim.y);
}

int organisation_of_thread()
{
	int nx, ny;
	nx = 16;
	ny = 16;

	dim3 block(8, 8);
	dim3 grid(nx / block.x, ny / block.y);

	// Example 1: threadId
	//print_threadIds << < grid, block >> > ();
	//cudaDeviceSynchronize();

	// Example 2: blockId
	print_details << < grid, block >> > ();
	cudaDeviceSynchronize();

	cudaDeviceReset();
	return 0;
}

/**
* version: 08:21 11.08.2022
*
* End of file
*/
