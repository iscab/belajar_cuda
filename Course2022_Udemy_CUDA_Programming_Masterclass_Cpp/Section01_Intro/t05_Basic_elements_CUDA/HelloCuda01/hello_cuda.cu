/**
* Hello CUDA World
* 
* it is not working, after compiled with
* - Visual C++ 2022
* - CUDA 11.7
* error: exe file is not generated/build
* 
* version: 10:51 29.07.2022
*/

#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

__global__ void hello_cuda()
{
	printf("Hello CUDA World \n");
}

int main()
{
	hello_cuda << < 1, 1 >> > ();
	cudaDeviceSynchronize();

	cudaDeviceReset();
	return 0;
}

/**
* version: 10:51 29.07.2022
* 
* End of file
*/