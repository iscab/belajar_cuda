
/**
* Organization of thread and block (exercise): cu file
*
* it is working, after compiled with
* - Visual C++ 2022
* - CUDA 11.7
* no compiling error, but I don't know why
* notes:  use CUDA option in New Project in Visual C++ 2022
*
* version: 09:25 15.11.2022
*/

#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

__global__ void print_details()
{
	printf("threadIdx.x : %d, threadIdx.y : %d, threadIdx.z : %d,  blockIdx.x : %d, blockIdx.y : %d, blockIdx.z : %d, blockDim.x: %d, blockDim.y: %d, gridDim.x: %d, gridDim.y: %d  \n",
		threadIdx.x, threadIdx.y, threadIdx.z,
		blockIdx.x, blockIdx.y, blockIdx.z,
		blockDim.x, blockDim.y,
		gridDim.x, gridDim.y);
}


int main()
{
	int nx, ny, nz;
	// 3D grid which has 4 threads in all X, Y, Z dimension  
	nx = 4;
	ny = 4;
	nz = 4;

	// thread block size will be 2 threads in each dimension  
	dim3 block(2, 2, 2);
	dim3 grid(nx/block.x, ny/block.y, nz/block.z);

	print_details << < grid, block >> > ();
	cudaDeviceSynchronize();

	cudaDeviceReset();
	return 0;
}

/**
* version: 09:25 15.11.2022
*
* End of file
*/
