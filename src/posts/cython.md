# Cython

`pip install Cython` Install **Cython**

## Example

python file.

```py
def start_py(x):
    y = 1
    for i in range(1, x+1):
        temp = y/i
        y += i
    return y
```

cython file `<filename>.pyx`.

```py
# Defining new variable each time is little bit slower.
cpdef int start_cy(int x):
    cdef int y = 1
    cdef int i, temp
    for i in range(1, x+1):
        temp = y/i
        y += i
    return y
```

## build

Inside `<setup_file>.py`.

```py
from distutils.core import setup
from Cython.Build import cythonize

setup(ext_modules=cythonize('cython_code.pyx'))
```

Run this command to **Build**.

```bash
python <setup_file>.py build_ext --inplace
```

Finally import from python file and use it.
