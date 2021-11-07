import java.util.*;

class Main {
  // javac java.java && java Main 10 20
  public static void main(String[] args) {
    long start = System.currentTimeMillis();

    int P = Integer.parseInt(args[0]);
    int S = Integer.parseInt(args[1]);

    storePrime(P);
    long primeTime = System.currentTimeMillis() - start;
    start = System.currentTimeMillis();

    stringCheck(S);
    long stringTime = System.currentTimeMillis() - start;
    start = System.currentTimeMillis();

    System.out.println("Java:   " + primeTime + "ms " + stringTime + "ms");
  }

  public static boolean isPrime(int num) {
    if (num > 1) {
      int root = (int) Math.sqrt(num) + 1;
      for (int i = 2; i < root; i++)
        if ((num % i) == 0)
          return false;
      return true;
    }
    return false;
  }

  public static ArrayList<Integer> storePrime(int N) {
    ArrayList<Integer> primeList = new ArrayList<Integer>();
    for (int i = 0; i < N; i++) {
      if (isPrime(i)) {
        primeList.add(i);
      }
    }
    return primeList;
  }

  public static boolean isPalindrop(String temp) {
    int i = 0, j = temp.length() - 1;
    while (i < j) {
      if (temp.charAt(i) != temp.charAt(j))
        return false;
      i++;
      j--;
    }
    return true;
  }

  public static String stringCheck(int N) {
    String second = "", temp;
    String value = "abcdefghijklmnopqrstuvwxyz1234567890";
    for (int i = 0; i < N; i++)
      second += value;
    temp = second;
    second = new StringBuilder(second).reverse().toString();
    temp = temp + second;
    isPalindrop(temp);
    return temp;
  }

  // dart dart.dart 10000 10000

}
