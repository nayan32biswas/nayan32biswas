# Bash

## Condition

```bash
count=11

if [ $count -eq 11 ]
then
	echo "This was baby" 
elif (( $count > 12 && $count < 18 ))
then
	echo "This was child"
else
	echo "This was adult"
fi
if (( $count <= 12 ))
then
	echo "age 0 to 12 year"
elif [ $count -gt 12 -a $count -le 20 ]
then
	echo "Age 11 to 20 year"
elif [[ $count -ge 21 	&& $count -le 30 ]]
then
	echo "Age 21 to 30"
else
	echo "Age more then 30"
fi
```

## Switch Case

```bash
select car in bmw mercedese tesla rover toyota
do
	case $car in
	bmw)
		echo "b selected";;
	mercedese)
		echo "m selected";;
	tesla)
		echo "te selected";;
	rover)
		echo "r selected";;
	toyota)
		echo "to selected";;
	*)
		echo "Invalid selection";;
	esac
done
```

## Input

```bash
# echo "filename $0, firstinput $1"
args=("$@")
echo "${args[0]}--> ${args[1]}--> ${args[2]}"
echo "$@" # all input in single line
echo "$#" # input length
while read line
do
	echo "$line"
done < "${1:-/dev/stdin}" # it will take terminal input as well as selective input like ./input.sh <input.txt>
```

## Output

```bash
# Here 1 means STD output and 2 means STD error
ls -al 1>output.txt 2>error.txt

# This will add output at the bottom
# ls -al 1>>output.txt 2>>error.txt

# This is STD output and error on same file.
# ls -al 1>& output.txt
# ls -al 1>output.txt 2>&1
```

## Export

**parent.sh**

```bash
message="Hello World"
export message
./child.sh
```

**child.sh**

```bash
echo "String come from parent was --> $message"
```

## Number

```bash
one=15
two=4
: '
echo $(( one + two ))
echo $(expr $one + $two )
echo $(( one - two ))
echo $(( one * two ))
echo $(( one / two ))
echo $(( one % two ))
'
echo "Enter Hex Number"
read hex
echo -n "The deciaml value of $hex is: "
echo "obase=10; ibase=16; $hex" | bc
```

## String

```bash
echo "Enter 1st string"
read str1
echo "Enter 2nd string"
read str2
if [ "$str1" == "$str2" ]
then
	echo "String Match"
else
	echo "String doesn't Match"
fi
if [ "$str1" \< "$str2" ]
then
	echo "$str1 is smaller then $str2"
elif [ "$str1" \> "$str2" ]
then
	echo "$str1 is getter then $str2"
else
	echo "Both string are same"
fi
# Concatination
plus="+"
res=$str1$plus$str2
echo "Result was: $res"
# Case conversion
echo "Lower case: ${res,,}"
echo "Upper case: ${res^^}"
echo "Toggle case: ${res~~}"
```

## Declare

```bash
declare var=nayan # change able variable
declare -r pwdfile=/etc/passwd # const variable
echo "$var --- $pwdfile"
var=changed
pwdfile=new_error
echo "$var --- $pwdfile"
```

## Loop

```bash
number=0
size=3
: 'echo "While Loop:"
while [ $number -lt $size ]
do
	echo "$number"
	number=$((number+1))
done
number=0
echo "Untill Loop:"
until [ $number -gt $size ]
do
	echo "$number"
	number=$((number+1))
done
'
for i in 1 2 3 4 5 
do 
	echo -n "$i " # -n will remove new line from echo.
done
echo ""
# {start..end..step_size}
for i in {0..10..3}
do 
	echo -n "$i "
done
echo ""
# Traditional for loop
for (( i=0; i<5; i++ ))
do 
	echo -n "$i "
done
echo ""
# break and continue
for (( i=0; i<10; i++ ))
do
	if (( $i == 3 ))
	then
		echo -n "continue "
		continue
	elif (( $i == 7 ))
	then
		echo -n "break"
		break
	else
		echo -n "$i "
	fi
done
echo ""
# for (( i=0; i<5; i++ )); do; echo -n "$i "; done; echo ""
```

## Array

```bash
car=("One" "Two" "Three" "Four")
echo "Second value: ${car[1]}"
echo "All Array: ${car[@]}" # pring all value of an array
echo "All Indexes: ${!car[@]}" # Show indexes number
echo "Length: ${#car[@]}" # Show array length
car[2]="Change"
echo "After change third index: ${car[@]}"
unset car[2]
echo "After Remove third index: ${car[@]}"
```

## Function

```bash
function func(){
	returningVar="Changed var"
}
returningVar="Initial value"
echo $returningVar
func
echo $returningVar
function isPrime(){
	num=$1
	prime=1
	for (( i=3; i < num; i++ ))
	do
		if (( num % $i == 0 ))
		then
			prime=0
			break
		fi
	done
	if (( num != 2 && (( num < 2 || num%2 == 0 )) ))
	then
		prime=0
	fi
}
for i in {1..20}
do
	echo -n "$i is: "
	isPrime $i
	if (( prime == 1 ))
	then
		echo "Prime"
	else
		echo "not Prime"
	fi
done
```

## File

```bash
: 'echo "Enter dr name"
read direct

if [ -d "$direct" ]
then
	echo "$direct exists"
else
	echo "$direct not exists"
fi
'

: 'echo "Enter File Name"
read filename
if [ -f "$filename" ]
then
	echo "$filename exists"
else
	echo "$filename not exists"
fi
'

echo "Enter file name"
read filename
if [ -f "$filename" ]
then
	while IFS= read -r line
	do
		echo $line
	done < $filename
else
	echo "$filename doesn't exists"
fi
```

## Bash Email

- `sudo apt install ssmtp` secure smtp service
- `sudo vi /etc/ssmtp/ssmtp.conf` Open this file

```conf
root=your_email@gmail.com
mailhub=smtp.gmail.com:587
AuthUser=your_email@gmail.com
AuthPass=your_email_pass
UseSTARTTLS=yes
```

```bash
ssmtp your_email@gmail.com
```

- Run script in input give those information
  - To: demo@gmail.com
  - From your_email@gmail.com
  - Cc: your_cc_mail@gmail.com
  - Subject: Test
  - This is Body

## CURL

```bash
url="<your_file_url>"
# curl ${url} -o
# curl ${url} -o output_file
curl ${url} > output_file

# Check file meta this can used for knowing server info or file status
curl -I ${url}
```

## Waiting

```bash
echo "Press any key to exit"
while [ true ]
do
	read -t 5 -n 1
if [ $? = 0 ]
then
	echo ""
	echo "You have terminated"
	exit;
else
	echo "Waiting for you to press the key!!!"
fi
done
```

## notify folder change

- `sudo apt install inotify-tools` Install **Inotify-Tools**

```bash
inotifywait -m /temp/NewFolder
```

## Search by Grep

```bash
echo "Enter filename to search text from"
read filename

if [[ -f $filename ]]
then
	echo "Enter the text to search"
	read text
	# -i for case insencetive, -n for line number
	# you can use -c, -v. -c how many word match. -v for will show those line which are not match.
	grep -i -n $text $filename
else
	echo "$filename does'nt exist"
fi
# find . -type f; wc -c < ./dbms/postgresql-cheat-sheet.png
```

## AWK

```bash
echo "Enter filename to print from awk"
read filename

if [[ -f $filename ]]
then
	# awk "/filename/ {print}" $filename
	awk "/filename/ {print $1,$2}" $filename # print n'th charecter of result line
	
else
	echo "$filename does'nt exist"
fi
```

## SED

```bash
echo "Enter filename to print from awk"
read filename

if [[ -f $filename ]]
then
	sed "s/i/I/g" $filename > new_file.txt
	# sed -i "s/i/I/g" $filename # -i meand derect action of the filename
	
else
	echo "$filename does'nt exist"
fi
```

## debug

**Three way** of debugging

1. `bash -x ./<filename>.sh` This will show you code step by step.

2. 
```bash
#! /usr/bin/bash -x
code="Your all code."
code="This system as same as first one. but different way."
```

3. 
```bash
code="Start code"
set -x # debugging start.
code="Other code you want to debug"
set +x # debugging end.
```

## Color

```
# Reset
Color_Off="\033[0m"  

# Regular Colors
Black="\033[0;30m"
Red="\033[0;31m"
Green="\033[0;32m"
Yellow="\033[0;33m"
Blue="\033[0;34m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
White="\033[0;37m"

# Bold
BBlack="\033[1;30m"
BRed="\033[1;31m"
BGreen="\033[1;32m"
BYellow="\033[1;33m" 
BBlue="\033[1;34m"
BPurple="\033[1;35m" 
BCyan="\033[1;36m"
BWhite="\033[1;37m"

# Underline
UBlack="\033[4;30m"
URed="\033[4;31m"
UGreen="\033[4;32m"
UYellow="\033[4;33m" 
UBlue="\033[4;34m"
UPurple="\033[4;35m" 
UCyan="\033[4;36m"
UWhite="\033[4;37m"

# Background
On_Black="\033[40m"
On_Red="\033[41m"
On_Green="\033[42m"
On_Yellow="\033[43m" 
On_Blue="\033[44m"
On_Purple="\033[45m" 
On_Cyan="\033[46m"
On_White="\033[47m"

# High Intensity
IBlack="\033[0;90m"
IRed="\033[0;91m"
IGreen="\033[0;92m"
IYellow="\033[0;93m" 
IBlue="\033[0;94m"
IPurple="\033[0;95m" 
ICyan="\033[0;96m"
IWhite="\033[0;97m"

# Bold High Intensity
BIBlack="\033[1;90m" 
BIRed="\033[1;91m"
BIGreen="\033[1;92m" 
BIYellow="\033[1;93m"
BIBlue="\033[1;94m"
BIPurple="\033[1;95m"
BICyan="\033[1;96m"
BIWhite="\033[1;97m" 

# High Intensity backgrounds
On_IBlack="\033[0;100m"
On_IRed="\033[0;101m"
On_IGreen="\033[0;102m"
On_IYellow="\033[0;103m"
On_IBlue="\033[0;104m"
On_IPurple="\033[0;105m"
On_ICyan="\033[0;106m"
On_IWhite="\033[0;107m"
```
RED="\033[0;31m"
NC="\033[0m" # No Color
echo -e "I ${RED}love${NC} Stack Overflow"

