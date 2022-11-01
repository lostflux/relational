# Minimal Makefile to run tests.
#
# Author: Amittai Siavava, Ke Lou

all: run

.PHONY: run database clean

run: main.py author.py editor.py reviewer.py dbconfig.py dbconfig.ini
	@printf "Running program...\n\n"
	@python3 main.py

database:
	@make -C ./sql

clean:
	rm -rf __pycache__ *.pyc
	make -C ./sql clean
