# Minimal Makefile to run tests.
#
# Author: Amittai Siavava, Ke Lou

DIR = "/Users/amittaijoel/workspace/db/psets/ps2/Checkpoint\ C"
USERNAME = "sv"  # please change this to your username

all: test

# please change -u and -p to your own username and password
test:
	@echo -e "Running tests...\n"
	@echo -e "Please see 'all.sql' for which SELECT statements match to which output.\n\n"
	@cat tables.sql >  all.sql
	@cat insert.sql >> all.sql
	@cat views.sql >> all.sql
	@cat triggersetup.sql >> all.sql
	@cat procedures.sql >> all.sql
	@cat procedurestest.sql >> all.sql
	# @cat triggertest.sql >> all.sql # this raises an error in mysql. Please test separately.

	# please change username at top of Makefile.
	mysql -u $(USERNAME) -p -e "source $(DIR)/all.sql"


clean:
	@rm -f all.sql


.PHONY: test clean
