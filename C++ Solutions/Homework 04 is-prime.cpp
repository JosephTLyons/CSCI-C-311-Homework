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
    if (number == 0 || number == 1)
        return false;
    
    // All numbers are divisible by one,
    // So start divisor at divisor at 1 and divisorCount at 1
    int divisor = 1;
    int divisorCount = 1;
    int quotient;
    
    do
    {
        quotient = number / divisor;
        
        if (number % divisor == 0)
        {
            divisorCount++;
            
            if (divisorCount > 2)
                return false;
        }
        
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
