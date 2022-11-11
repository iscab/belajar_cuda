/**
* Organization of thread and block: cu file
*
* it is working, after compiled with
* - Visual C++ 2022
* - CUDA 11.7
* no compiling error, but I don't know why  
* notes:  use CUDA option in New Project in Visual C++ 2022  
*
* version: 09:45 11.11.2022
*/

#include "cuda_runtime.h"
#include "device_launch_parameters.h"

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

__global__ void print_more_details()
{
	printf("threadIdx.x : %d, threadIdx.y : %d, threadIdx.z : %d,  blockIdx.x : %d, blockIdx.y : %d, blockIdx.z : %d, blockDim.x: %d, blockDim.y: %d, gridDim.x: %d, gridDim.y: %d  \n",
		threadIdx.x, threadIdx.y, threadIdx.z,
		blockIdx.x, blockIdx.y, blockIdx.z,
		blockDim.x, blockDim.y,
		gridDim.x, gridDim.y);
}

int main()
{
	int nx, ny;
	nx = 16;
	ny = 16;

	// 8 by 8 threadblocks, so a block has 8 by 8 threads. A grid will have 2 by 2 blocks.
	dim3 block(8, 8);
	dim3 grid(nx / block.x, ny / block.y);

	// Example 1: threadId
	//print_threadIds << < grid, block >> > ();
	//cudaDeviceSynchronize();

	// Example 2: blockId
	//print_details << < grid, block >> > ();
	//cudaDeviceSynchronize();

	// Example 3: threadId & blockId
	print_more_details << < grid, block >> > ();
	cudaDeviceSynchronize();

	cudaDeviceReset();
	return 0;
}


/**
* version: 09:45 11.11.2022
*
* End of file
*/
