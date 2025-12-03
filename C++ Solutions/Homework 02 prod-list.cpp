// This file was used to help make a solution for the recursive prod-list method needed in homework 2

#include <iostream>
#include <stack>

int product (std::stack<int> &listOfNumbers)
{
    if (listOfNumbers.empty())
        return 0;

    else
    {
        if (listOfNumbers.size() == 1)
            return listOfNumbers.top();

        int topNumber = listOfNumbers.top();

        listOfNumbers.pop();

        return (topNumber * product (listOfNumbers));
    }
}

int main()
{
    std::stack<int> listOfNumbers;

    listOfNumbers.push (1);
    listOfNumbers.push (2);
    listOfNumbers.push (3);
    listOfNumbers.push (4);
    listOfNumbers.push (5);
    listOfNumbers.push (6);

    std::cout << product (listOfNumbers) << std::endl;

    return 0;
}
