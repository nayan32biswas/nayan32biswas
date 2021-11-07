package main

import (
	"fmt"
	"math"
    "time"
    "os"
    "strconv"
)

func isPrime(num int) bool {
	if num > 1 {
		root := int(math.Sqrt(float64(num))) + 1
		for i := 2; i < root; i++ {
			if num%i == 0 {
				return false
			}
		}
		return true
	}
	return false
}

func storePrime(N int) []int {
	var prime []int
	for i := 0; i < N; i++ {
		if isPrime(i) {
			prime = append(prime, int(i))
		}
	}
	return prime
}

func Reverse(s string) string {
    runes := []rune(s)
    for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }
    return string(runes)
}

func isPalindrop(temp string) bool{
    i := 1
    j := len(temp) - 1
    for (i < j){
        if (temp[i] != temp[j]){
            return false
        }
        i++
        j--
    }
    return true
}
func stringCheck(N int) string{
    second := ""
    value := "abcdefghijklmnopqrstuvwxyz1234567890"
    for  i := 0; i < N; i++{
        second += value
    }
    temp := second
    second = Reverse(second)
    temp = temp + second
    isPalindrop(temp)
    return temp
}

func main() {
    start := time.Now()
    
    Args := os.Args

	P,err := strconv.Atoi(Args[1])
    S,err := strconv.Atoi(Args[2])
    if err != nil {
        fmt.Println(err)
        os.Exit(2)
    }

	storePrime(P)
	primeTime := time.Since(start).Milliseconds()
    start = time.Now()
    
    stringCheck(S)
    stringTime := time.Since(start).Milliseconds()
	start = time.Now()

	fmt.Printf("GO:     %dms %dms\n", primeTime, stringTime)
}
