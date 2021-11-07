import 'dart:math';

bool isPrime(int num) {
  if (num > 1) {
    int root = sqrt(num).toInt() + 1;
    for (int i = 2; i < root; i++) if ((num % i) == 0) return false;
    return true;
  }
  return false;
}

List<int> storePrime(int N) {
  var primeList = List<int>();
  for (int i = 0; i < N; i++) {
    if (isPrime(i)) {
      primeList.add(i);
    }
  }
  return primeList;
}

bool isPalindrop(String temp) {
  int i = 0, j = temp.length - 1;
  while (i < j) {
    if (temp[i] != temp[j]) return false;
    i++;
    j--;
  }
  return true;
}

stringCheck(int N) {
  String second = "", temp;
  String value = "abcdefghijklmnopqrstuvwxyz1234567890";
  for (int i = 0; i < N; i++) {
    second += value;
  }
  temp = second;
  second = second.split('').reversed.join();
  temp = temp + second;
  isPalindrop(temp);
  return temp;
}

// dart dart.dart 10000 1000
int main(List<String> args) {
  dynamic start = Stopwatch()..start();

  var P = int.parse(args[0]);
  var S = int.parse(args[1]);

  storePrime(P);
  var primeTime = start.elapsedMilliseconds;
  start = Stopwatch()..start();

  stringCheck(S);
  var stringTime = start.elapsedMilliseconds;
  start = Stopwatch()..start();

  print("Dart:   ${primeTime}ms ${stringTime}ms");
  return 0;
}
