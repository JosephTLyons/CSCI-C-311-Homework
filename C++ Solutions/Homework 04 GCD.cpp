//
//  main.cpp
//  Homework
//
//  Created by Joseph Lyons on 1/31/18.
//  Copyright © 2018 Joseph Lyons. All rights reserved.
//

#include <iostream>

int GCD (const int &n, const int &m)
{
    int remainder = 1;
    int dividend = n;
    int divisor = m;

    while (remainder != 0)
    {
        remainder = dividend % divisor;
        dividend = divisor;
        divisor = remainder;
    }

    return dividend;
}

int main()
{
    std::cout << GCD (500, 24);
}
