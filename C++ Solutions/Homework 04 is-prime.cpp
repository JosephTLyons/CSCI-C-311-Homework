//
//  main.cpp
//  prime
//
//  Created by Joseph Lyons on 1/28/18.
//  Copyright © 2018 Joseph Lyons. All rights reserved.
//

#include <iostream>
#include <math.h>

bool isPrime (const int &number)
{
    if (number == 0 || number == 1)
        return false;

    int divisor = 2;
    int divisorCount = 2;

    int limit = floor (sqrt (number));

    while (divisor < limit + 1)
    {
        if (number % divisor == 0)
            divisorCount += 2;

        divisor++;
    }

    if (divisorCount == 2)
        return true;

    else
        return false;
}

bool isPrime2 (const int &number)
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

void printPrimeNumbersUpTo (const int &upperLimit)
{
    for (int i = 0; i <= upperLimit; i++)
    {
        if (isPrime (i))
            std::cout << i << std::endl;
    }
}

int main()
{
    printPrimeNumbersUpTo (500);

    return 0;
}
