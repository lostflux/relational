# Minimal Makefile to run tests.
#
# Author: Amittai Siavava, Ke Lou

all: run

.PHONY: run database clean

run: main.py utils dbconfig.ini
	@printf "Running program...\n\n"
	./main.py /rebuild /populate

test: main.py utils dbconfig.ini test.sh
	@printf "Running test...\n\n"
	./test.sh

database:
	@make -C ./sql

clean:
	rm -rf __pycache__ *.pyc
	rm -rf ./utils/__pycache__
	make -C ./utils/sql clean
