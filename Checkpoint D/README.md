# CS 61: Database Systems
## Problem Set 2: MySQL Application
## Fall 2022
## [Ke Lou](https://github.com/fpoon777), [Amittai Siavava](https://github.com/siavava)

This directory contains the files for our submission
for CS-61 lab 2d.

To test our program, run `make`.

> Note:
> 1. For our program to work as intended, the underlying database must have been already set up.
>   We have included the SQL files from Lab 2c under the [sql][def2] directory.
>   You can run them by either `make` inside [sql][def2] or `make database` inside
>   the current directory.
>   The scripts rebuild the database and insert sample data.
> 2. Please only specify your user ID at the initial prompt.
>      - Do not add the `login` command.
>      - Thereafter, switching users will follow the usual `login <user-id>` command.
> 3. If you wish to use a different database name or location:
>      - Modify [dbconfig.ini][def] with your desired database, server, and credentials.
>      - Modify [sql/Makefile](./sql/Makefile) with your desired database, server, adn credentials.


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
├── reviewer.py
└── sql
    ├── Makefile
    ├── README.md
    ├── assignment.md
    ├── insert.sql
    ├── procedures.sql
    ├── procedurestest.sql
    ├── tables.sql
    ├── triggersetup.sql
    ├── triggertest.sql
    └── views.sql

1 directory, 18 files


# file composition
λ> cloc .
      18 text files.
      18 unique files.                              
       0 files ignored.

github.com/AlDanial/cloc v 1.94  T=0.04 s (403.9 files/s, 85416.3 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
SQL                              7            131            180           1612
Python                           5            238            436            894
Markdown                         3             69              0            186
make                             2             14             13             28
INI                              1              1              0              5
-------------------------------------------------------------------------------
SUM:                            18            453            629           2725
-------------------------------------------------------------------------------
```


[def]: dbconfig.ini
[def2]: sql
