#include <bits/stdc++.h>
using namespace std;

bool isPrime(int num)
{
    if (num > 1)
    {
        int root = int(sqrt(num)) + 1;
        for (int i = 2; i < root; i++)
            if ((num % i) == 0)
                return false;
        return true;
    }
    return false;
}
vector<int> storePrime(int N)
{
    vector<int> primeList;
    for (int i = 0; i < N; i++)
    {
        if (isPrime(i))
        {
            primeList.push_back(i);
        }
    }
    return primeList;
}

bool isPalindrop(string temp)
{
    int i = 0, j = temp.size() - 1;
    while (i < j)
    {
        if (temp[i] != temp[j])
            return false;
        i++, j--;
    }
    return true;
}

string stringCheck(int N)
{
    string second = "", temp;
    string value = "abcdefghijklmnopqrstuvwxyz1234567890";
    for (int i = 0; i < N; i++)
        second += value;
    temp = second;
    reverse(second.begin(), second.end());
    temp = temp + second;
    isPalindrop(temp);
    return temp;
}

// g++ cpp.cpp; ./a.out 10000 10000
int main(int argc, char **argv)
{
    int start = clock(), div = 1000;

    int P = stoi(argv[1]);
    int S = stoi(argv[2]);

    storePrime(P);
    int primeTime = (clock() - start) / div;
    start = clock();

    stringCheck(S);
    int stringTime = int(clock() - start) / div;
    start = clock();

    printf("C++:    %dms %dms\n", primeTime, stringTime);
    return 0;
}
