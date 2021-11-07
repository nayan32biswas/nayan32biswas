# GO

## Variable
- If any variable declare that **start with Uppercase** those variable **exported** from the package and sccessable from other package.
### Global Variable
- It's a package level or global veriable
- In package there need to define type of each variable

1. 
```go
var num int = 0
var str string = "str"
```
2. 
```go
var (
	int_int int    = 0
	str_2   string = "str"
)
```
3. 
```go
const(
	_ = iota // here iota is zero, and ignore first value
	Kilo = 1 << (10 * iota)
	Mega
	Giga
	Tera
	Peta
	Exa
	Zetta
	Yotta
)
```
### Native Variable types
```go
func nativeType() {
	var num8 int8 = math.MaxInt8
	var num16 int16 = math.MaxInt16
	var num32 int32 = math.MaxInt32
	var num64 int64 = math.MaxInt64
	var numInt int = math.MaxInt64 // 32 or 64 based on system architecture
	var unum8 uint8 = math.MaxUint8
	var unum16 uint16 = math.MaxUint16
	var unum32 uint32 = math.MaxUint32
	var unum64 uint64 = math.MaxUint64
	var unumInt uint = math.MaxUint64 // 32 or 64 based on system architecture

	var numF32 float32 = math.MaxFloat32
	var numF64 float64 = math.MaxFloat64
	var com64 complex64 = -5 + 12i // here 12i is imaginary part of a equation
	var com128 complex128 = -5 + 12i
	const comp = complex(math.MaxFloat64, math.MaxFloat64)
	var res complex128
	res = com128 + comp
	res = com128 - comp
	res = com128 * comp
	res = com128 / comp

	fmt.Println("Number Type: ", num8, num16, num32, num64, numInt, unum8, unum16, unum32, unum64, unumInt)
	fmt.Println("Floating: ", numF32, numF64, com64, com128, comp, res)
	fmt.Printf("%v %v=====%T %T\n", real(com64), imag(com64), real(com64), imag(com64))

	var b bool = true
	var char rune = 'A'            // it's same as 'int32'
	var str string = "demo string" // each of str[i] is equal 'uint8'
	fmt.Printf("%v %v %c\n", b, str, char)
}
```
## Condition
```go
func condition(){
	n := 4
	// If else
	if n==1 || n==2 ||  n==3 || n==4 {
		fmt.Println("between 1, 2, 3 and 4")
	}else if n==5{
		fmt.Println("last number")
	} else{
		fmt.Println("Invalid number")
	}

	// Switch case
	switch n {
	case 1, 2, 3, 4:
		fmt.Println("between 1, 2, 3 and 4")
		break
		fmt.Println("If needed use break before execute all")
	case 5:
		fmt.Println("last number")
	default:
		fmt.Println("Invalid number")
	}
	fmt.Println()
	switch {
	case n <= 4:
		fmt.Println("between 1, 2, 3 and 4")
		fallthrough // this is very sensitive, use it when next statement should be executed.
	case n <= 5:
		fmt.Println("last number")
	default:
		fmt.Println("Invalid number")
	}
}
```
## STL
### Arrays
```go
func arrays() {
	// var variable [size]type
	// variable [...]type{1, 2, 3}
	var greads [3]int
	students := [...]string{"One", "Two", "Three"}
	greads[0] = 90
	greads[1] = 80
	greads[2] = 85
	fmt.Println(len(students), students, greads) // 3 [One Two Three] [90 80 85]

	// 2D
	var matrix [3][3]int = [3][3]int{[3]int{1, 0, 0}, [3]int{1, 1, 1}, [3]int{0, 0, 1}}
	matrix[1] = [3]int{0, 1, 0}
	fmt.Println(matrix) // [[1 0 0] [0 1 0] [0 0 1]]

	// array copy
	arr := [...]int{1, 2, 3}
	copyArr := arr // array copy full data
	copyArr[0] = 100000
	fmt.Println(arr, copyArr) // [1 2 3] [100000 2 3]

	arrPtr := [...]int{1, 2, 3}
	copyPtr := &arrPtr
	copyPtr[0] = 100000
	fmt.Println(arrPtr, copyPtr) // [100000 2 3] &[100000 2 3]

	for key, value := range arr {
		fmt.Println(key, value)
	}
}
```

### Slice
```go
func slice() {
	// Slices
	// var variable []type{}
	// variable := make([]type, size, capacity) // here capacity is optional value
	// variable []type{1, 2, 3}
	// slices copy
	slices := []int{1, 2, 3, 4, 5, 6}

	// actual copy
	copyOne := append([]int(nil), slices...)
	/*
		In make function allways try to use 3rd element 8.
		Other wise if size exit the go will increment capacity 8 to other big number and copy all slice data.
		So it is slow and expencive.
	*/
	copyTwo := make([]int, len(slices), 8)
	copy(copyTwo, slices)

	// Ref assign
	copyRef := slices // Slice doesnot copy data, it's assign ref
	copyRef[0] = 100000

	// [100000 2 3 4 5 6] [100000 2 3 4 5 6] [1 2 3 4 5 6] [1 2 3 4 5 6]                6 8
	fmt.Println(slices, copyRef, copyOne, copyTwo, "\t\t", len(copyTwo), cap(copyTwo))
	fmt.Println(slices[:], slices[:3], slices[3:], slices[2:5]) // [100000 2 3 4 5 6] [100000 2 3] [4 5 6] [3 4 5]

	// try to remove midle two element 3, 4 from [1 2 3 4 5 6]
	wiard := append(copyOne[:2], copyOne[4:]...)
	fmt.Println(wiard, copyOne)                  // [1 2 5 6] [1 2 5 6 5 6] // here main copy also changed
	proper := append([]int(nil), copyTwo[:2]...) // copy first part
	proper = append(proper, copyTwo[4:]...)      // copy second part
	fmt.Println(wiard, copyTwo)                  // [1 2 5 6] [1 2 3 4 5 6] //

	for key, value := range slices {
		fmt.Println(key, value)
	}
}
```
### Map
```go
func maps() {
	// var variable map[key_type]value_type
	// variable := make(map[key_type]value_type)
	// variable map[key_type]value_type{key:value, key:value}
	datas := map[string]int{"one": 1, "two": 2}

	// map key_type can be anything except (slice, map and function)
	// variable := map[array_type]slice_type
	arrMap := map[[3]int][]int{
		[3]int{1, 2, 3}: []int{1, 4, 7},
		[3]int{1, 3, 2}: []int{1, 4, 7},
	}
	fmt.Println(datas, arrMap) // map[one:1 two:2] map[[1 2 3]:[1 4 7] [1 3 2]:[1 4 7]]

	// map pass ref
	copyRef := datas
	copyRef["three"] = 3
	delete(copyRef, "two")
	four, ok := copyRef["four"]                         // ok return true if key exists
	fmt.Println(datas, copyRef, len(copyRef), four, ok) // map[one:1 three:3] map[one:1 three:3] 2 0 false
	if temp, ok := copyRef["four"]; ok {                // Four doesn't exists condition false
		fmt.Println(temp)
	}
	if one, ok := copyRef["one"]; ok { // one exists condition true
		fmt.Println(one)
	}
	for key, value := range datas {
		fmt.Println(key, value) // one 1, three 3
	}
}
```
### Struct
```go
func struct_func(){
	type Book struct{
		id int
		name string `required min:"5" max:"100"`
		author string
		related_books []int
	}
	book := Book{id: 1,name: "First"}
	copy_book := book // it's copy full data
	copy_book.name = "Full copy"
	copy_book_ref := &book // it's assign ref
	copy_book_ref.name = "Assign ref"
	fmt.Println(book, copy_book_ref, copy_book)

	books := []Book{
		Book{id: 1,name: "First",author: "Unknown"},
		Book{id: 2,name: "Second",author: "Unknown", related_books: []int{1}},
	}
	fmt.Println(books, "\t\t", books[0].name)

	// field validation
	t := reflect.TypeOf(Book{})
	field, _ := t.FieldByName("name")
	fmt.Println(field.Tag) // required min:"5" max:"100" Use this data to validate by extra library

	anonymous := struct{name string}{name: "Anonymous struct"}
	fmt.Println(anonymous) // {Anonymous struct}

	// Implement inheritance like thinks
	type Animal struct{
		name string
		origin string
		ave_weight float32
	}
	type Bird struct{
		Animal
		speed float32
		ave_height_to_fly float32
		canFly bool
	}

	bird := Bird{
		Animal: Animal{name: "unknown",ave_weight: 1.2},
		speed: 40.6,
		canFly: true,
	}
	fmt.Println(bird, bird.name) // {{unknown  1.2} 40.6 0 true} unknown
}
```
## Manipulation
### For Loop
```go
func loop() {
	for true {
		fmt.Println("While loop")
		break
	}
label:
	for i, j := 1, 3; i < 5; i, j = i+1, j+1 {
		for k := 1; k < 5; k++ {
			fmt.Println(i * j * k)
			if i*j*k <= 10 {
				continue
			}
			if i*j*k > 10 {
				break label // also break outer loop
			}
		}
	}
	datas := []int{5, 3, 1}
	for k, v := range datas {
		fmt.Println(k, v)
	}
}
```

### Control Flow
```go
func controlFlow() {
	// execute function code => defer => panic => recover => return
	// defer
	res, err := http.Get("http://www.google.com/robots.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer res.Body.Close()
	robots, err := ioutil.ReadAll(res.Body)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("%d\n", len(robots))

	// panic and recover
	fmt.Println("Start")
	defer func() { // anonymous function
		if err := recover(); err != nil { // function called if something happend bad
			log.Println("Error: ", err)
			// panic(err) // If you want to throw error to the parent function
		}
	}()
	a, b := 10, 0
	c := a / b // in go this is called panic or you can create panic by using panic("error message")
	fmt.Println("Error done", c)
}
```

### Pointer

```go
func pointer() {
	var a int = 42
	var b *int = &a
	a = 27
	fmt.Println(a, b) // 27 0xc0000160d8
	*b = 20
	fmt.Println(a, *b) // 20 20
}
```
### Function

```go
// result := function("string", 1, 2, 3, 4)
func function(mes string, values ...int) (*int, error) {
	result := 0
	var changeValue func(*int) = func(value *int) {
		*value = 9999
	}
	for _, value := range values {
		if value < 0 {
			return &result, fmt.Errorf("Answer should not be negative")
		}
		if value%3 == 0 {
			changeValue(&value)
		}
		result += value
	}
	fmt.Println(result)
	return &result, nil
}

// Method
type method struct {
	name string
	age  int
}
// This is a method not a function
func (m method) print() {
	fmt.Println(m.name, m.age) // Nayan 29
}
func testMethod() {
	obj := method{
		name: "Nayan",
		age:  29,
	}
	obj.print()
}
```
## Interfaces
```go
// Writer defination
type Writer interface {
	Writer([]byte) (int, error)
}

// ConsoleWriter assign
type ConsoleWriter struct{}

// Writer (int, error) Implementation
func (cw ConsoleWriter) Writer(data []byte) (int, error) {
	n, err := fmt.Println(string(data))
	return n, err
}

func interfaces() {
	var console Writer = ConsoleWriter{}
	console.Writer([]byte("demo data"))
}
func typeCheckWithInterface() {
	var value interface{} = 0
	switch value.(type) {
	case int:
		fmt.Println("This is int type")
	case string:
		fmt.Println("This is string type")
	case byte:
		fmt.Println("This is byte type")
	default:
		fmt.Println("Unknown type")
	}
}
```

## GO Routine

### Synchronous Councerency
```go
var wg = sync.WaitGroup{}
var counter = 0

func print() {
	fmt.Printf("%v, ", counter)
	wg.Done()
}
func increment() {
	counter++
	wg.Done()
}
func goRoutine() {
	for i := 0; i < 10; i++ {
		wg.Add(2)
		go print()
		go increment()
	}
	wg.Wait()
	fmt.Println("")
}
// 2, 3, 4, 1, 8, 5, 9, 10, 8, 8,
```

###  Sequential Councerency

```go
var wg = sync.WaitGroup{}
var counter = 0
var m = sync.RWMutex{}

func print() {
	m.RLock() // read lock
	fmt.Printf("%v, ", counter)
	m.RUnlock() // read unlock
	wg.Done()
}
func increment() {
	m.Lock() // write lock
	counter++
	m.Unlock() // write unlock
	wg.Done()
}
func goRoutine() {
	for i := 0; i < 10; i++ {
		wg.Add(2)
		go print()
		go increment()
	}
	wg.Wait()
	fmt.Println("")
}
// 1, 2, 2, 2, 2, 2, 2, 2, 2, 3,
```

### Synchronization With GO Routine

```go
var wg = sync.WaitGroup{}
var counter = 0
var m = sync.RWMutex{}

func print() {
	fmt.Printf("%v, ", counter)
	m.RUnlock()
	wg.Done()
}
func increment() {
	counter++
	m.Unlock()
	wg.Done()
}
func goRoutine() {
	for i := 0; i < 10; i++ {
		wg.Add(2)
		m.RLock()
		go print()
		m.Lock()
		go increment()
	}
	wg.Wait()
	fmt.Println()
}
// 0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
```

## CHANNELS

### Basic Channels
```go
var wg = sync.WaitGroup{}

func channels() {
	ch := make(chan int)
	wg.Add(2)
	go func() {
		val := <-ch
		fmt.Printf("Receiver: %v\n", val)
		wg.Done()

	}()
	go func() {
		temp := 10
		ch <- temp
		temp = 27
		fmt.Printf("Sender: %v\n", temp)
		wg.Done()

	}()
	wg.Wait()
}
```


### Channels with chan args and close

```go
var wg = sync.WaitGroup{}

func channels() {
	ch := make(chan int)
	wg.Add(2)
	go func(ch <-chan int) {
		fmt.Println("Receiver start")
		for val := range ch {
			fmt.Printf("Receiver: %v\n", val)
		}
		fmt.Println("Receiver end")
		wg.Done()
	}(ch)
	go func(ch chan<- int) {
		fmt.Println("Sender start")
		ch <- 0
		ch <- 1
		fmt.Println("Sender mid")
		ch <- 2
		ch <- 3
		close(ch)
		fmt.Println("Sender end")
		wg.Done()

	}(ch)
	wg.Wait()
}
/*
Receiver start
Sender start
Receiver: 0
Receiver: 1
Sender mid
Receiver: 2
Receiver: 3
Sender end
Receiver end
*/
```
### Logger with channels
```go
const (
	logInfo    = "INFO"
	logWarning = "WARNING"
	logError   = "ERROR"
)

type logEntry struct {
	time     time.Time
	severity string
	message  string
}

var logCh = make(chan logEntry, 50)
var doneCh = make(chan struct{})

func logger() {
	for { // infinite loog
		select { // this selector will activate when new entry will come in
		case entry := <-logCh:
			fmt.Printf("%v - [%v]%v\n", entry.time.Format("2006-01-02T15:04:05"), entry.severity, entry.message)
		case <-doneCh:
			break
		}
	}
}

func channels() {
	go logger() // will destroy when channels destroy
	logCh <- logEntry{time.Now(), logInfo, "App is starting"}
	logCh <- logEntry{time.Now(), logInfo, "App is shutting down"}
	time.Sleep(100 * time.Microsecond)
}
```
## Installetion
### Documented way
- `curl -O https://dl.google.com/go/go1.15.7.linux-amd64.tar.gz` first [download](https://golang.org/dl/go1.15.7.linux-amd64.tar.gz) the file
- `sudo tar -C /usr/local -xzf go1.15.7.linux-amd64.tar.gz` unzip it.
- `export PATH=$PATH:/usr/local/go/bin`
### Using Snap
- `sudo apt-get update; sudo apt-get -y upgrade; sudo snap install go --classic` Update, Upgrade and install.
- `go version` Check version

### (Install air for development)[https://github.com/cosmtrek/air]
- `curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin` Install air.
- `cd ./project-file`
- `air init` Initializer air on project setup.
- `air` run project by **typing air**.

## Userful command
- `go mod init github.com/you/hello` Initiate project, will create **go.mod** to track dependency.
- `go mod edit -dropreplace github.com/author/project`
- `go mod tidy` Will remove unused packages from **go.mod** file. Make sure to run this before **every release**.
- `go mod download` Download packages.
**Get Packages** from git repo, It will create **go.sum** for package/dependecy validation.
- `go get github.com/author/project@v1.1.1` use Git tags.
- `go get github.com/author/project@master` or Git branch name.
- `go get github.com/author/project@23r2s4c` or Git commit hash.
- `go get -u` Update packages.
- `go test` Test the project. It will automatically download packages.
- `go build` Build the project. It will automatically download packages.
- `go run file.go` Build & run go file.
- `go run -rece file.go` Check warnings.
