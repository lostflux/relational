# Minimal Makefile to run tests.
#
# Author: Amittai Siavava, Ke Lou

all: run

.PHONY: run database clean

run: main.py utils dbconfig.ini
	@printf "Running program...\n\n"
	@python3 main.py /clean

database:
	@make -C ./sql

clean:
	rm -rf __pycache__ *.pyc
	make -C ./sql clean
