# JS
## Install Node
```bash
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
```
## Install yarn
```bash
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update;
sudo apt-get install yarn
```
## Install npm
```bash
sudo apt-get install npm
```
## Update nodejs:
```bash
sudo npm cache clean -f
sudo npm install -g n
```
## Variable

### Native types
```js
var one;
let two;
const three;
let bool = true; 	// number boolean
let number = 1; 	// number type
let string = "two"; // string type
let y = 123e5;      // 12300000
let z = 123e-5;     // 0.00123
```
### type check
```js
typeof 314          // Returns "number"
typeof 3.14         // Returns "number"
typeof true         // Returns "boolean"
typeof "str"		// Returns "string"
typeof no_def		// Returns "undefined"
typeof {name:'Name'} // Returns "object"
typeof [1,2,3,4]	// Returns "object"
typeof null			// Returns "object"
typeof function myFunc(){}   // Returns "function"
```
## STL
### array
```js
let arr = ["Saab", "Volvo", "BMW"];
let custom = [keyP, arr];
arr.keys();
Array.isArray(arr);
arr.push("FR"); // arr will [..., "FR"]
arr.pop(); // return "BMW"
arr.shift(); // return "Saab"
arr.unshift("First", "Second"); // arr will ["First", "Second", ...]

arr.slice(0, 2);// return ["Saab", "Volvo"]
arr.slice(-2, -1);// return ["Volvo"]
arr.slice(1);// return ["Volvo", "BMW"]
arr.slice(-1);// return ["BMW"]

arr.sort();
arr.reverse();
```

### Object
```js
let keyP = {firstName:"First", lastName:"Last"};
```
## Conversion
```js
let x = 16 + "str"; // => "16str"
let x = "str" + 16; // => "str16"
```
## String
```js
"\b"	// Backspace
"\f"	// Form Feed
"\n"	// New Line
"\r"	// Carriage Return
"\t"	// Horizontal Tabulator
"\v"	// Vertical Tabulator
let str = "Please locate where 'locate' occurs!";
let sln = str.length;

let pos, ascii, res, n, demo;

str.charAt(0);                              // return "P"
str.charCodeAt(0);                          // return 80
str.indexOf("locate");                      // return 7
str.indexOf("locate", 15);                  // return 21
str.lastIndexOf("locate");                  // return 21
str.lastIndexOf("nai");                     // return -1
str.lastIndexOf("locate", 15);              // return 7
// search take "regular expressions".
str.search("locate");                       // return 7
// substring() cannot accept negative indexes.
str.substring(7, 13);                       // return "locate"
// The difference is that the second parameter specifies the length of the extracted part.
str.substr(7, 6);                           // return "locate"
str.substr(7);                              // return "locate where 'locate' occurs!"
str.substr(-4);                             // return "urs!"
str.replace("locate", "change hoyche");     // return "Please change hoyche where 'locate' occurs!"
str.replace("locate", "change hoyche");     // return "Please change hoyche where 'locate' occurs!"
// regular expression with an /i flag (insensitive):
str.replace(/locate/i, "change hoyche");    // return "Please change hoyche where 'locate' occurs!"
// regular expression with a /g flag (global match):
str.replace(/locate/g, "change hoyche");    // return "Please change hoyche where 'change hoyche' occurs!"
str.toUpperCase();                          // return "PLEASE LOCATE WHERE 'LOCATE' OCCURS!"
str.toLowerCase();                          // return "please locate where 'locate' occurs!"
str.concat(" ", str);                       // return "Please locate where 'locate' occurs! Please locate where 'locate' occurs!"
"Hello".concat(" ", "World!");              // return "Hello World!"
str.trim();                                 // return "Please locate where 'locate' occurs!"
str.padStart(4,0);                          // return "Please locate where 'locate' occurs!"
str.padEnd(4,0);                            // return "Please locate where 'locate' occurs!"
str.split("");                              // [ 'P','l','e','a','s','e',' ',' ..., '!']  
str.split(" ");                             // [ 'Please', 'locate', 'where', ''\'locate\'', 'occurs!' ]
str.split(" ").join();						// 'Please locate where \'locate\' occurs!'
```
## Manipulation
```js
let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
let obj = {first: "one", second: "two", third: 3};
function isPrime(num) {
	for (let i = 2; num > i; i++)
		if (num % i == 0)
		  return false;
	return num > 1;
}
```
### For loop
```js
for (;;) {  break; }
for (let i = 0; i < 5; i++) {  console.log(i); }
for (let value in arr) { console.log(value); }
for (let key in obj) { console.log(obj[key]); }
```
### Map
```js
arr.map(Math.sqrt);
arr.map(value => value*value);
```
### Filter
```js
arr.filter(isPrime); // return [ 2, 3, 5, 7 ]
arr.filter(value => value%2==0); // return [2, 4, 6, 8, 10]
```
### Reducer
## OOP


## Extra function
- **Get location**
```js
function getSeason(latitude, month) {
    if (2 < month && month < 9) {
        return latitude > 0 ? "winter" : "summer";
    }
    else {
        console.log("hello", latitude);
        return latitude > 0 ? "summer" : "winter";
    }
}
```
- **Get season**
```js
function main() {
    let latitude = null, longitude = null, errorMessage=null;
    window.navigator.geolocation.getCurrentPosition(
        position =>  latitude= position.coords.latitude, longitude= position.coords.longitude ,
        error =>  errorMessage = error.message
    );
    console.log(new Date().getMonth())
    var season = getSeason(this.state.latitude, new Date().getMonth());
}
```
