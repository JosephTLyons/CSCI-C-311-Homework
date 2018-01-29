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
    int divisor = 1;
    int divisorCount = 0;
    int quotient = number;
    
    while (divisor < quotient)
    {
        quotient = number / divisor;
        
        if (number % divisor == 0)
            divisorCount += 2;
        
        divisor++;
    }
    
    if (divisorCount == 2)
        return true;
    
    else
        return false;
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
