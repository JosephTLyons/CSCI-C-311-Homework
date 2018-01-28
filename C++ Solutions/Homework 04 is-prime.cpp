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
    for (int i = 0; i < 500; i++)
    {
        if (isPrime (i))
            std::cout << i << std::endl;
    }
    
    return 0;
}
