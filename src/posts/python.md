# PYTHON CHEAT SHEET
## Loop
```py
dict_obj = {"one": 1, "two": 2}
list_obj = [1, 2, 3]
tuple_obj = (1, 2, 3)

[data for data in range(5)] # [0, 1, 2, 3, 4]
[data for data in range(3, 5)] # [3, 4]

[data for data in dict_obj] # ['one', 'two']
[(key, value) for key, value in dict_obj.items()] # [('one', 1), ('two', 2)]

[(index, value) for index, value in enumerate(list_obj)] # [(0, 1), (1, 2), (2, 3)]
```
## LIST
```py
data_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
new_int = data_list[-1] # last position

# Slicing
new_list = data_list[2:5] # [3, 4, 5] Here 2 is lower range 5 is upper range.
new_list = data_list[5:] # [6, 7, 8, 9, 10]
new_list = data_list[:5] # [1, 2, 3, 4, 5]
new_list = data_list[-5:-1] # [6, 7, 8, 9]
new_list = data_list[0:5:2] # [1, 3, 5] here 0 is lower range 5 is upper range and 2 is repeater.
new_list = data_list[::3] # [1, 4, 7, 10]
new_list = data_list[2::3] # [3, 6, 9]
new_list = data_list[:5:3] # [1, 4]

new_int = len(data_list) # list size
data_list.append(10) # add new item end of the list.
new_list.extend(data_list.copy()) # saturated list into list. if a = [1, 2], b=[3,4] then c will be [1, 2, 3, 4]
data_list.pop() # remove last item from list.
data_list.insert(5, 0) # insert data in index 5
data_list.remove(6) # remove 6 if exist other wise rise error.
del data_list[0] # delete by index
del data_list # delete full list
data_list.clear() # clear full list
new_list = data_list+data_list # join the list
new_list = data_list.copy() # return new list

new_int = data_list.index(5) # find 5 and return index number.
new_int = data_list.count(4) # return occurrence of 4.
data_list.reverse() # reverse all element
new_list = reversed(data_list) # reverse all element and return new list without changing data_list.
data_list.sort() # sort all element by acending order
data_list.sort(reverse=True) # sort all element by descending order
new_list = reversed(data_list) # reverse all element and return new list without changing data_list.
new_boolean = 5 in data_list # return 5 is exist or not.
```
## STRING
```py
data_str = "hello wordl!"
data_format = "Hi I am {0}. Do yo see {} and {}."
data_format1 = "Hi I am {2}. Do yo see {0} and {1}." # add ordering
data_str_list = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten']
long_wtr = """
This is long string
its {} put anything by format
    support everything.
    {} put anything by format
"""
# String Support Slicing operation.
new_str = data_str[1:5:1] # like list.
new_int = len(data_str) # string size.
new_str = data_str.strip() # remove whitespace from left and right side.
new_str = data_str.upper() # to upper.
new_str = data_str.replace("wordl", "Python") # to replace World to Python.
new_boolean = "llo" in data_str # check llo exist or not.
new_str = data_str + "new string" + " " + 100 # String Concatenation.
new_str = data_format.format("Hemel", "Utshaw") # if number of empty formate does not match then this will rise execption.
new_str = data_format1.format("Hamza","Hemel", "Utshaw") # add ordering third, first, second.
new_str = data_str.capitalize() # Converts the first character to upper case.
new_str = data_str.center() # Returns a centered string.
new_str = data_str.encode() # Returns an encoded version of the string.
new_boolean = data_str.endswith("wordl!") # Returns true if the string ends with the specified value.
new_str = data_str.expandtabs(5) # replace \t to 5 space.
new_boolean = data_str.find("wordl!") # Searches the string for a specified value and returns the position of where it was found.
new_int = data_str.index("o", 5, 10) # search from 5 to 10. return 7.
new_boolean = data_str.isalnum() # if any number exist then return True.
new_boolean = data_str.isalpha() # Returns True if all characters in the string are in the alphabet.
new_boolean = data_str.isdecimal() # Returns True if all characters in the string are decimals.
new_boolean = data_str.isdigit() # Returns True if all characters in the string are digits.
new_boolean = data_str.islower() # Returns True if all characters in the string are lower case.
new_boolean = data_str.isnumeric() # Returns True if all characters in the string are numeric.
new_boolean = data_str.isprintable() # Returns True if all characters in the string are printable.
new_boolean = data_str.isspace() # Returns True if all characters in the string are whitespaces.
new_boolean = data_str.istitle() # Returns True if the string follows the rules of a title.
new_boolean = data_str.isupper() # Returns True if all characters in the string are upper case.
new_str = ", ".join(data_str_list) # Joins the elements of an iterable to the end of the string.
new_boolean = data_str.ljust(20) # Returns a left justified version of the string.
new_boolean = data_str.lower() # Converts a string into lower case.
new_list = data_str.partition("o wo") # Returns a tuple where the string is parted into three parts.
new_list = data_str.rfind("lo wo") # Searches the string for a specified value and returns the last position of where it was found.
new_list = data_str.rindex("lo wo") # Returns a right justified version of the string.
new_list = data_str.rpartition("o wo") # Returns a tuple where the string is parted into three parts.
new_list = data_str.rsplit("w") # Splits the string at the specified separator, and returns a list.
new_str = data_str.rstrip() # Returns a right trim version of the string.
new_list = data_str.split() # Splits the string at the specified separator, and returns a list.
new_list = data_str.split("o") # Splits the string at the specified separator, and returns a list.
new_boolean = data_str.startswith("hello") # Returns true if the string starts with the specified value.
new_str = data_str.strip() # Returns a trimmed version of the string.
new_str = data_str.swapcase() # Swaps cases, lower case becomes upper case and vice versa.
new_str = data_str.title() # Converts the first character of each word to upper case.
new_list = data_str.translate() # Returns a translated string.
new_list = data_str.zfill(10) # Fills the string with a specified number of 0 values at the beginning.
```
## SET

```py
data_sets = {'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten'}
data_sets_two = set(("eleven", "twelve", "thirteen", "fourteen", "fifteen"))
new_boolean = "one" in data_sets
data_sets.add("eleven.") # add new item into set.
data_sets.update(["eleven."]) # update list of item into set.
new_int = len(data_sets)
data_sets.remove("three.") # remove item from set. rise error if not exists.
data_sets.discard("three.") # remove item from set is exists.
data_sets.clear() # clear set.
del data_sets # delete all set.
new_set = data_sets.union(data_sets_two) # new set.
new_set = data_sets.update(data_sets_two) # new set.

new_item = data_sets.pop() # remove last element.

```
## DICT
```py
import json
data_dict = {'eggs': 2, 'sausage': 1, 'bacon': 1, 'spam': 500}
new_string = json.dumps(data_dict, indent=4)
new_keys = data_dict.keys()
new_keys = list(new_keys)  # ['eggs', 'sausage', 'bacon', 'spam']
values = data_dict.values()
new_keys = list(values)  # [2, 1, 1, 500]
# view objects are dynamic and reflect dict changes
del data_dict['eggs']
del data_dict['sausage']
new_keys = list(new_keys)  # ['bacon', 'spam']
# set operations
new_keys = new_keys & {'eggs', 'bacon', 'salad'}  # {'bacon'}
new_keys = new_keys ^ {'sausage', 'juice'}  # {'juice', 'sausage', 'bacon', 'spam'}
keys = data_dict.keys() # find all keys from dict

# list from dict.
nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
num_names = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten']
new_dict = { i : 5 for i in num_names } # {"hello": 5, "at": 5, .....}
new_dict = dict.fromkeys(num_names, 5) # {"hello": 5, "at": 5, .....}
listofTuples = [("Riti" , 11), ("Aadi" , 12), ("Sam" , 13),("John" , 22),("Lucy" , 90)]
listofTuples = dict(listofTuples)
new_dict = dict(zip(num_names, nums)) # Single liner, two list to single list of tupel then list of tuple to dict
data_dict.update(new_dict) # Updata or marge new_dict into data_dict.
```
## MAP
```py
data_list = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten']
data_list_two = ["eleven", "twelve", "thirteen", "fourteen", "fifteen"]
def myfunc(n): return len(n)
new_generator = map(myfunc, data_list) # you can convert to list by list(map(....))
new_generator = map(lambda n: len(n), data_list)
"""************************************************************************"""
def myfunc(a, b): return a+"--"+b
new_generator = map(myfunc, data_list, data_list_two)
new_generator = map(lambda a, b: a+"--"+b, data_list, data_list_two) # you can put n number of list though maximum retrive upto minimum length.
```
## FILTER
```py
data_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
def myFunc(x): return False if x<5 else True
new_generator = filter(myFunc, data_list) # you can convert to list by list(map(....))
new_generator = filter(lambda x: False if x<5 else True, data_list)
```
## List Comprehensions
```PY
data_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
num_names = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten']
dup_nums = data_list+data_list

new_list = [n for n in data_list] # just simple
new_list = [n*n for n in data_list] # create squre
new_list = [n for n in data_list if n%2==0] # find even
new_list = [(name, n) for name in num_names for n in data_list] # create list of tuple
new_list = zip(num_names, data_list) # same as upper one create list of tupple
new_dict = {name: n for name, n in zip(num_names, data_list)} # two list to dict
new_dict = {name: n for name, n in zip(num_names, data_list) if n%2==0} # same as upper with even condition
new_set = {n for n in dup_nums} # to set
```
## MATH
```py
import math
new_float = pow(103, 100000007, 203) # Big power (base, mod, power)
```
## CONVERSION
```py
new_string = bin(n)[2:] # removing "0b" prefix
```
## UTILS
```py
import secrets
key = secrets.token_hex()
key = secrets.token_hex(24)
```

## CUSTOM SORT

```py
import datetime
from operator import itemgetter, attrgetter
new_list = sorted("This is a test string from Andrew".split(), key=str.lower) # ['a', 'Andrew', 'from', 'is', 'string', 'test', 'This']
"""************************************************************************"""
student_tuples = [('john', 'A', 15),('jane', 'B', 12),('dave', 'B', 10),]
new_list = sorted(student_tuples, key=lambda student: student[2])   # sort by age [('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]
"""************************************************************************"""
class Student:
    def __init__(self, name, grade, age):
        self.name = name
        self.grade = grade
        self.age = age
    def __repr__(self):
        return repr((self.name, self.grade, self.age))
student_objects = [Student('john', 'A', 15), Student('jane', 'B', 12), Student('dave', 'B', 10),]
new_list = sorted(student_objects, key=lambda student: student.age) # sort by age [('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]
"""************************************************************************"""
new_list = sorted(student_tuples, key=itemgetter(2)) # [('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]
new_list = sorted(student_objects, key=attrgetter('age')) # [('dave', 'B', 10), ('jane', 'B', 12), ('john', 'A', 15)]
new_list = sorted(student_tuples, key=itemgetter(1, 2)) # [('john', 'A', 15), ('dave', 'B', 10), ('jane', 'B', 12)]
new_list = sorted(student_objects, key=attrgetter('grade', 'age')) # [('john', 'A', 15), ('dave', 'B', 10), ('jane', 'B', 12)]
"""************************************************************************"""
def numeric_compare(x, y):
    return x - y
def myFunc(e):
  return len(e[0]) # if string
new_list.sort(reverse=True, key=myFunc)
new_list = sorted([5, 2, 4, 1, 3], cmp=numeric_compare)  # doctest: +SKIP
"""************************************************************************"""
summary = [
    {'date': datetime.datetime(2019, 11, 1, 0, 0), 'data': 156167, 'target_data': 209263, 'bi_data': 159290},
    {'date': datetime.datetime(2019, 10, 31, 0, 0), 'data': 209879, 'target_data': 249756, 'bi_data': 220372}
]
summary.sort(key=date)
summary.sort(key=lambda data: data.get("date"), reverse=True)
```
## Regular Expression

```py
import re
sentance = "hello my number is +8801746352810 you"
phone_number = re.compile(r"(\+880)(1\d)(\d\d\d\d\d\d\d\d)").search(sentance).group()
country_code = re.compile(r"(\+880)(1\d)(\d\d\d\d\d\d\d\d)").search(sentance).group(1)
operator_code = re.compile(r"(\+880)(1\d)(\d\d\d\d\d\d\d\d)").search(sentance).group(2)
other_numbers = re.compile(r"(\+880)(1\d)(\d\d\d\d\d\d\d\d)").search(sentance).group(3)

phone_number = re.compile(r"(\+880)(1\d)(\d{8})").search(sentance).group()

all_phone_number = re.compile(r"(\+880)(1\d)(\d{8})").findall(sentance)
```
# Create Package.
### Setup

**setup.py** .

```py
import os
from setuptools import find_packages, setup

with open(os.path.join(os.path.dirname(__file__), 'README.md')) as readme:
    README = readme.read()

# allow setup.py to be run from any path
os.chdir(os.path.normpath(os.path.join(os.path.abspath(__file__), os.pardir)))

setup(
    name='<package_name>',
    version='1.0',
    description='A ColorField to save and filter by radius Colors in RGB array in postgresql.',
    long_description=README,
    long_description_content_type="text/markdown",
    url='<package_git_url>',
    author='Nayan Biswas',
    author_email='nayan32biswas@gmail.com',
    license='MIT License',  # example license

    packages=find_packages(),
    include_package_data=True,
    # install_requires = ['django'],
    classifiers=[
        'Environment :: Web Environment',
        'Framework :: Django',
        'Framework :: Django :: 2.0',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
        'Programming Language:: Python :: 3',
        'Programming Language:: Python :: 3.6',
        'Programming Language:: Python :: 3.7',
        'Programming Language:: Python :: 3.8',
        'Topic :: Internet :: WWW/HTTP',
        'Topic :: Internet :: WWW/HTTP :: Dynamic Content',
    ],
)
```

### README

**README.md**.

Set Long description.

### MANIFEST

**MANIFEST.in**.

```in
include LICENSE
include README.rst
recursive-include colorfield/static *
recursive-include colorfield/templates *
recursive-include docs *
```

### Build app

- Go to root file of lib where setup file exits.
- This command create a file inside <project>/dist/<project_name.tar.gz>

```bash
python3 setup.py sdist
```

### Locally install

```bash
python3 -m pip install dist/<project_name.tar.gz>
```

### (Upload to PyPi)[https://packaging.python.org/tutorials/packaging-projects/]

Create **LICENSE** and Assign MIT License

- `python3 -m pip install --user --upgrade setuptools wheel`
- `python3 setup.py sdist bdist_wheel` make sure **`.whl`** and **`.tar.gz`** file exist inside **/dist/**.
- `python3 -m pip install --user --upgrade twine` Install **twine** to upload into PyPi.
- `python3 -m twine upload --repository testpypi dist/*` Upload your project to PyPi as **Test**.
- `twine check dist/*` Check doc is currect or not.
- `twine upload dist/*` Finally Upload your file.


# Setup Python

## Ubuntu

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt install -y python3-pip
sudo apt install -y build-essential libssl-dev libffi-dev python3-dev autoconf libtool pkg-config libpq-dev
sudo apt install -y python3-venv
sudo ln -s /usr/bin/python3 /usr/bin/python
sudo apt install pipenv
```

Create and activate Virtual Environment.

```bash
python3 -m venv my_env
source my_env/bin/activate

python3 filename.py
or
python3 -m script.operation.operation
```

Make python file

```py
import py_compile
py_compile.compile("myadd.py")
python -m compileall .
```

## Windows

1. download python letest version
2. Open installation process
3. select custom install
4. add path, pip
5. use <<C:\\python>> as path location
6. <<Set-ExecutionPolicy Unrestricted>> to fixed powershell

`pip install virtualenv`
make "envs" directory and go there
`virtualenv <<vertual_name>>` this will create virtualenv file.
`.\<<name>>\Script\activate` to active virtualenv use.

Install **python2**

- `then setup envermentpath C:\Python27` firstly download and install file
- `python -m pip install --upgrade pip setuptools wheel` Run.
- `C:\Python27\Scripts` then setup envermentpath 

## Mac

- `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"` Install homebrew with the command.
- `brew install python` Install Python with Brew.
- Permissions errors? Do this.
  1. `sudo chown -R "$USER":admin /usr/local` 
  2. `sudo chown -R "$USER":admin /Library/Caches/Homebrew` 

- `sudo easy_install pip` Install Pip. (Python Package Installer).
- `sudo pip install virtualenv` Install virtualenv.
- `virtualenv yourenv -p python3.6` Create a new virtualenv.
- `source bin/activate` Activate virtualenv.
