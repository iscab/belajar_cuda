/**
* Hello CUDA World cu file
*
* it is working, after compiled with
* - Visual C++ 2022
* - CUDA 11.7
* - a main function in a cpp file, including a cuh header file
* note: this is a work-around to compile cu files. 
*
* version: 10:51 29.07.2022
*/

#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include "./hello_cuda.cuh"

#include <stdio.h>

__global__ void hello_cuda_kernel()
{
	printf("Hello CUDA World \n");
}

/* Wrapper function
*/
int hello_cuda()
{
	// Example 1: 
	//hello_cuda_kernel << < 1, 1 >> > ();
	//cudaDeviceSynchronize();

	// Example 2:
	//hello_cuda_kernel << < 1, 20 >> > ();
	//cudaDeviceSynchronize();

	// Example 3:
	//dim3 block(4);
	//dim3 grid(8);
	//hello_cuda_kernel << < grid, block >> > ();
	//cudaDeviceSynchronize();

	// Example 4:
	//dim3 block(8,2);
	//dim3 grid(2,2);
	//hello_cuda_kernel << < grid, block >> > ();
	//cudaDeviceSynchronize();

	// Example 5:
	int nx, ny;
	nx = 16;
	ny = 4;
	dim3 block(8, 2);
	dim3 grid(nx / block.x, ny / block.y);
	hello_cuda_kernel << < grid, block >> > ();
	cudaDeviceSynchronize();


	cudaDeviceReset();
	return 0;
}

/**
* version: 10:51 29.07.2022
*
* End of file
*/
