// HelloCudaThread01.cpp : This file contains the 'main' function. Program execution begins and ends there.
// version: 08:21 11.08.2022
//

#include <iostream>
#include "./organisation_of_thread.cuh"

// need main file in cpp to generate/build CUDA
int main()
{
    std::cout << "Hello World! Learn CUDA!\n---------\n\n" << std::endl;

    organisation_of_thread();

    return 0;
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file

// version: 08:21 11.08.2022
// End of file
