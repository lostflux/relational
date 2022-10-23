# CS 61: Database Systems
## Problem Set 2: MySQL Application
## Fall 2022
## [Ke Lou](https://github.com/fpoon777), [Amittai Siavava](https://github.com/siavava)

This directory contains the files for our submission
for CS-61 lab 2c.

To test our code, run `make test` or `make`.

> Note:
> - This generates an aggregate file `all.sql` containing all the SQL code.
> - You also need to modify two variables in the Makefile
>   to point to the full path to this directory in your system
>   and to your MySQL username, respectively.
> - Your MySQL password will be prompted for when you run `make test`.

Here's the composition of this directoy:

```text
λ> tree
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



λ> cloc .
      10 text files.
      10 unique files.                              
       0 files ignored.

github.com/AlDanial/cloc v 1.94  T=0.02 s (636.9 files/s, 131718.9 lines/s)
-------------------------------------------------------------------------------
Language                     files          blank        comment           code
-------------------------------------------------------------------------------
SQL                              7            128            177           1571
Markdown                         2             51              0            106
make                             1             10              9             16
-------------------------------------------------------------------------------
SUM:                            10            189            186           1693
-------------------------------------------------------------------------------
```
