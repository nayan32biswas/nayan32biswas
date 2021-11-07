# Dart

## Install Dart

1. `sudo apt-get update && sudo apt-get install apt-transport-https`
2. `sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'`
3. `sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'`
4. `sudo apt-get update; sudo apt-get install dart`
5. `export PATH="$PATH:/usr/lib/dart/bin" && echo 'export PATH="$PATH:/usr/lib/dart/bin"' >> ~/.profile`

- `dart filename.dart` **Run** dart.

## Data type.

- **Premitive Variable**
```dart
import 'dart:collection';
int intNum = 10, resInt = 17 ~/ 5;
String strStr = "String";
double douNum = 10;
var varNum = 11, varStr = "varStr";
dynamic dynVar = 100;
dynVar = "int to str";
}
```

- **List**
```dart
  var fixedList = new List(5);
  fixedList[0] = "first";
  var dynamicList = new List();
  dynamicList.add("first");
  dynamicList.addAll(["second", "third"]);
  dynamicList.insert(1, "insert");
  dynamicList.insertAll(0, ["ins_first", "ins_second"]);
  dynamicList.remove("none");
  dynamicList.remove("second");
  dynamicList.removeAt(1);
  dynamicList.replaceRange(0, 2, ["rep_one", "rep_two"]);
  for (var each in dynamicList) print(each);
```

- **Map**
```dart
  var firstMap = new Map();
  firstMap["first"] = "test";
  var tempMap = {"one": "one", "two": 2, "three": 3.0};
  tempMap["new"] = "new";
  tempMap.addAll({"add1": "add1", "add2": "add2"});
  tempMap.remove("one");
  tempMap.remove("two");
  tempMap.clear();
```

- **Set**
```dart
  var firstSet = new Set(), tempSet = new Set.from([1, 2, 3, 1, 2, 3]);
  firstSet.add(100);
  firstSet.add(101);
  firstSet.add(100);
  for (var each in tempSet) print(each);
```

- **HashMap**
```dart
  var firstHashMap = new HashMap();
  firstHashMap["first"] = "test";
  var tempHashMap = new HashMap.from({"one": "one", "two": 2, "three": 3.0});
  tempHashMap["new"] = "new";
  tempHashMap.addAll({"add1": "add1", "add2": "add2"});
  tempHashMap.remove("one");
  tempHashMap.remove("two");
  tempHashMap.clear();
```

- **HashMap**
```dart

  var firstHashSet = new HashSet(),
      tempHashSet = new HashSet.from([1, 3, 1, 2, 3]);
  firstHashSet.add(100);
  firstHashSet.add(101);
  firstHashSet.add(100);
  print(firstHashSet);
  print(tempHashSet);
  for (var each in tempHashSet) print(each);
```

- **Generics**
```dart
var genMap = new Map<String, int>(); // This is only integer value.
genMap["first"] = 10;
var genHashMap = new HashMap<String, int>(); // This is only integer value.
genHashMap["first"] = 10;

var genSet = new Set<int>(); // This is only integer value.
genSet.add(10);

var genHashSet = new HashSet<int>(); // This is only integer value.
genHashSet.add(10);
```

## Function
```dart
// Regular function
int hello_re(){
	return "Hello World";
}

// arrow function
int hello() => "Hello World";
```

## OOP

```dart
// On Parent.dart file
abstract class Box { // No one can create instance of this Box class becouse of abstract.
  int height;
  Box(height) {
    this.height = height;
  }
  void area() {
    print(this.height * height);
  }
}

// On Child.dart file.
import "Parent.dart";

class Square extends Box {
  Square(height) : super(height);
  @override
  void area() {
    print(Utils.pow(this.height));
  }
}

class Ractangle extends Box {
  int width;
  Ractangle(height, width)
      : width = width,
        super(height);
  void set setWidth(int width) {
    this.width = width;
  }
  int get getWidth {
    return this.width;
  }
  @override
  void area() {
    print(this.height * this.width);
  }
}

class Utils {
  static void Devided(int a, int b) {
    try {
      print(a ~/ b);
    } catch (e) {
      print(e);
      throw new Exception("You are wrong!!!");
    }
  }
  void checking() {
    try {
      Devided(17, 0);
    } catch (e) {
      print(e);
    }
  }
  static int pow(int a) {
    return a * a;
  }
}

```
