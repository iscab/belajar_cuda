/**
* Hello CUDA World
*
* it is working, after compiled with
* - Visual C++ 2022
* - CUDA 11.7
* no compiling error, but I don't know why  
* notes:  use CUDA option in New Project in Visual C++ 2022  
* 
* 
* version: 10:55 09.11.2022
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
* version: 10:55 09.11.2022
*
* End of file
*/
