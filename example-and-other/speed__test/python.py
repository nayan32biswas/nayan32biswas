import math
import time
import sys


def isPrime(num):
    if num > 1:
        root = int(math.sqrt(num))+1
        for i in range(2, root):
            if (num % i) == 0:
                return False
        return True
    return False


def storePrime(N):
    primeList = []
    for i in range(N):
        if(isPrime(i)):
            primeList.append(i)
    return primeList


def isPalindrop(temp):
    i, j = 0, len(temp)-1
    while(i < j):
        if(temp[i] != temp[j]):
            return False
        i += 1
        j -= 1
    return True


def stringCheck(N):
    temp = ""
    value = """abcdefghijklmnopqrstuvwxyz1234567890"""
    for i in range(N):
        temp += value
    temp = temp+temp[::-1]
    isPalindrop(temp)
    return temp


# python3 python.py 10000 10000
if __name__ == "__main__":
    start = time.time()

    P = int(sys.argv[-2])
    S = int(sys.argv[-1])

    storePrime(P)
    primeTime = int((time.time()-start)*1000)
    start = time.time()

    stringCheck(S)
    stringTime = int((time.time()-start)*1000)
    start = time.time()

    print(f"Python: {primeTime}ms {stringTime}ms")
