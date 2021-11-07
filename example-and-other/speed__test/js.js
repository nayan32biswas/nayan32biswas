const performance = require('perf_hooks').performance;

function isPrime(num) {
    if (num > 1) {
        var root = Math.sqrt(num) + 1;
        for (var i = 2; i < root; i++)
            if ((num % i) == 0)
                return false;
        return true;
    }
    return false;
}
function storePrime(N) {
    var primeList = [];
    for (var i = 0; i < N; i++) {
        if (isPrime(i)) {
            primeList.shift(i);
        }
    }
    return primeList;
}

function isPalindrop(temp) {
    var i = 0, j = temp.length - 1;
    while (i < j) {
        if (temp[i] != temp[j])
            return false;
        i++, j--;
    }
    return true;
}

function stringCheck(N) {
    var second = "", temp;
    var value = "abcdefghijklmnopqrstuvwxyz1234567890";
    for (var i = 0; i < N; i++)
        second += value;
    temp = second;
    second = second.split("").reverse().join("");
    temp = temp + second;
    isPalindrop(temp);
    return temp;
}

// node js.js 10000 10000
function main() {
    var start = performance.now(), div = 1;

    var P = parseInt(process.argv[2]);
    var S = parseInt(process.argv[3]);

    storePrime(P);
    var primeTime = parseInt((performance.now() - start) / div);
    start = performance.now();

    stringCheck(S);
    var stringTime = parseInt((performance.now() - start) / div);
    start = performance.now();

    console.log(`JS:     ${primeTime}ms ${stringTime}ms`);
    return 0;
}

main();