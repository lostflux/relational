# CS 61: Database Systems
## Problem Set 2: MySQL Application
## Fall 2022
## [Ke Lou](https://github.com/fpoon777), [Amittai Siavava](https://github.com/siavava)

This directory contains the files for our submission
for CS-61 lab 2d.

To test our program, run `make`.

> Note:
> - Please only specify your user ID at the initial prompt.
>   Do not add the `login` command.
> - Thereafter, switching users will follow the usual `login <user-id>` command.
> - You also need to modify
>   [dbconfig.ini][def] to point to your desired database / credentials.


Here's the composition of this directory:

```bash

# files in the directory
λ> tree
.
├── Makefile
├── README.md
├── author.py
├── dbconfig.ini
├── dbconfig.py
├── editor.py
├── main.py
└── reviewer.py


# file composition

λ> cloc .
       8 text files.
       8 unique files.                              
       0 files ignored.

github.com/AlDanial/cloc v 1.94  T=0.03 s (261.1 files/s, 53169.3 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
Python                           5            238            434            887
Markdown                         1             12              0             41
INI                              1              1              0              5
make                             1              3              3              5
-------------------------------------------------------------------------------
SUM:                             8            254            437            938
-------------------------------------------------------------------------------
```


[def]: dbconfig.ini
