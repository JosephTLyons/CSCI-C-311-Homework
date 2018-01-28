//
//  main.cpp
//  prime
//
//  Created by Joseph Lyons on 1/28/18.
//  Copyright © 2018 Joseph Lyons. All rights reserved.
//

#include <iostream>

bool isPrime (const int &number)
{
    // All numbers are divisible by one and themselves,
    // So start divisor at
    int divisor = 2;
    int quotient;
    
    do
    {
        quotient = number / divisor;
        
        if (number % divisor == 0)
            return false; // Divisible by more than just one and itself
        
        divisor++;
    }
    while (divisor < quotient);
    
    return true;
}

int main()
{
    std::cout << isPrime (157) << std::endl;
    std::cout << isPrime (163) << std::endl;
    std::cout << isPrime (167) << std::endl;
    std::cout << isPrime (181) << std::endl;
    std::cout << isPrime (191) << std::endl;
    std::cout << isPrime (193) << std::endl;
    std::cout << isPrime (156) << std::endl;
    
    return 0;
}
