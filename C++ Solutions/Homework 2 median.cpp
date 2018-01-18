// This file was used to help make a solution for the median method needed in homework 2

#include <iostream>

int median (int a, int b, int c)
{
    if (a < b && b < c)
        return b;
    
    else if (c < b && b < a)
        return b;
    
    else if (b < a && a < c)
        return a;
    
    else if (c < a && a < b)
        return a;
    
    return c;
}

int main()
{
    std::cout << median (0, 1, 2) << std::endl;
    std::cout << median (0, 2, 1) << std::endl;
    std::cout << median (1, 0, 2) << std::endl;
    std::cout << median (1, 2, 0) << std::endl;
    std::cout << median (2, 0, 1) << std::endl;
    std::cout << median (2, 1, 0) << std::endl << std::endl;
    
    return 0;
}
