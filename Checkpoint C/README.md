# Part-C: Constructing the Database (SQL, Data, Stored Procedures, Triggers, and Views)

When your design of the database has been approved, the next Part is to construct the database by implementing the database schema in a database engine (MySQL).

1. Build a `tables.sql` SQL script to create all tables, including DROP statements, key and foreign key constraints, and you should include checks where possible to ensure that valid data can be inserted or updated in the database.
2. When you have created the tables, you should fill the tables with example data using an `insert.sql` script. This can be time-consuming, but it is an important part of the development of a database. Having a variety of data in the database that covers all cases, both common occurrences and rare or edge cases, is essential to properly verify that the database behaves the way that you expect it to. You should fill the tables with enough data so that it is possible to test that your application can handle the various operations specified above. Inserting lots of data is of no use if the data doesn’t test all parts of the database. Here is a sample of the kinds of data and tests you should include:

	- A set of manuscripts, with at least two in each possible status.
	- A number of tests verifying the correct operation of the interface for _Author_, _Editor_, and _Reviewer_ users.
	- Various error conditions, such as a new Reviewer without ICodes or a nameless Editor.

		> **Testing hint:** Don’t forget that you can generate data [GenerateData.com](http://generatedata.com/) rather than manually. It may take a little effort, but you can generate lots of data in the form you want it.

3. Since you know what information users of your application will need from the database, and in what forms, it is a good idea to include SQL VIEWS that provide that information in a simple form. In a live deployment, we would use DB privileges to ensure that the users can work only with views when querying the DB. Unfortunately we cannot test working with privileges on the MySQL machine we use, but we do expect your application to enforce the privileges as much as possible.

	Following the system specification, create these views:

	View: `LeadAuthorManuscripts`

	For all authors, return tuples with their last name, author id, and the manuscript id for which they are the primary author, along with the current status of the manuscript, and the timestamp of the most recent status change. If an author currently has two manuscripts in the system, the view would return two tuples (rows). Results ordered by author last name, author id number, and then by increasing timestamp of the most recent status change. **Permissions: Editor.**

	View: `AnyAuthorManuscripts`

	For all authors, their name, id, and the manuscript(s) for which they are _among_ the authors (if any), along with the status of the manuscript(s). Results ordered by author last name and then by increasing timestamp of the most recent status change. **Permissions: Author, Editor.**

	View: `PublishedIssues`

	For all completed (published) issues, the issue year, issue number (1, 2, 3, or 4), the title of each manuscript included in that issue, with page numbers, ordered by issue year, issue number, and page numbers. **Permissions: Author, Editor, Reviewer.**

	View: `ReviewQueue`

	For all manuscripts in UnderReview state. The view should contain the primary author, author id, manuscript id, and assigned reviewer(s) are included all together in one row, with the rows ordered by increasing most recent status change timestamp. This View is also used by `ReviewStatus` view. **Permissions: Editor.**

	View: `WhatsLeft`

	For all manuscripts, the manuscript id, current status, and the timestamp of the current status. **Permissions: Editor.**

	View: `ReviewStatus`

	For all manuscripts assigned to the Reviewer, a view including:

	- the timestamp when it was assigned to this review
	- the manuscript id
	- the manuscript title
	- the review results (integer values 1-10)
	- **a**ppropriatenes score
	- **c**larity score
	- **m**ethodology score
	- **e**xperimental resuts score
	- recommendation (either “accept” or “reject”)
	- ordered by increasing submission timestamp.

	HINT: Since you cannot modify a view “on the fly”, you will need to follow a process like the following to get the desired ReviewerId into the view:

	1. create a SQL function `ViewRevId` that returns the value of a SQL variable (e.g., `@rev_id`)
	2. use that SQL function in the view to identify the desired reviewer id
	3. set the variable (e.g., `SET @rev_id = reviewer_id_you_want`)
	4. `SELECT whatever FROM ViewRevId @rev_id`

	**Permissions: Editor, Reviewer.**

4. When your tables and views are implemented correctly, the next step is to create triggers to handle some key issues in the day-to-day use of the database.

	You can find detailed information on triggers in our class notes and in the [MySQL Triggers Documentation](https://dev.mysql.com/doc/refman/5.5/en/trigger-syntax.html) .

	You may find that creating one or more additional views might simplify your triggers.

	When a new manuscript is submitted the submitting author must specify an ICode. It is possible that there may no reviewer in the system that indicated that ICode as one he/she could handle. Detecting this situation is a perfect job for a trigger.

	> Trigger 1: When an author is submitting a new manuscript to the system with an ICode for which there is no reviewer who handles that ICode you should raise an exception that informs the author the paper can not be considered at this time.

	Reviewers sometimes unexpectedly withdraw their services. This can be due to a change in their employment or interests, an illness, or even their untimely demise. When this happens, any manuscripts in the system which remain under review that have that reviewer as the _only_ one reviewer for that manuscript, will have to be changed back to the submitted state. If there are no reviewers with ICodes matching the manuscript’s after that reviewer resigns, the manuscript must be rejected.

	> Trigger 2: When a reviewer resigns any manuscript in “UnderReview” state for which that reviewer was the only reviewer **AND** there is another reviewer in the system with the matching ICode that isn’t assigned to review it, that manuscript must be reset to “submitted” state and an appropriate exception message displayed.

	If no reviewer with the required ICode is available, the manuscript should be rejected.

	> Trigger 3: When a manuscript’s status changes to “accepted”, that update triggers an immediate status change to “typesetting”.

	This should be self-explanatory.

	You will need to prepare test cases (in `.sql` files) for testing your triggers.

	Triggers can raise exceptions (which issue messages) like this:

	```sql
		...
		set msg = concat('LAB2: No reviewers for manuscript id ', cast(manuscript_id as char));
		signal sqlstate '45000' set message_text = msg;
		...
	```

5. Finally, you should provide a stored procedure or function that can be invoked to make the accept/reject decision based upon the average score from the reviewers for a document. All the logic for the decision is localized in this stored procedure/function for ease of update. It should return an indication of its result.

		Hint: for further flexibility, the minimum score for a manuscript to be accepted could be stored in the configuration file

		Feel free to create additional procedures/functions as you need them.

## Provided Code

Here’s an example of defining your own exception conditions and messages: [triggerException.sql](http://www.cs.dartmouth.edu/~cs61/Resources/Examples/SQL/sql_files/triggerException.sql)

## For Part-C, You Should Hand in via Canvas:

- `tables.sql`
		your SQL code for creating the tables in the MySQL database .
- `insert.sql`
		your `.sql` file that contains the insert statements for the data.
- `views.sql`
		your SQL code for creating the views defined above (and your own, if any).
- `triggersetup.sql`
		SQL code that sets up your database for testing the triggers
- `triggers.sql` your SQL code for creating the two triggers.
- `triggertest.sql` your SQL code for testing the triggers
- `procedures.sql` OR `function.sql`. your SQL code for setting up the procedures/functions
- `procedurestest.sql` OR `functionstest.sql`. Your SQL code for testing the procedures/functions

You should submit a _compressed_ tar file (with file extension `.tgz`) containing the following:

- All source code (`.sql`, `.py`, `Team##Lab2.ini`, `Makefile`, `Bash scripts`, data files) required to create and run your application
- `README.md` providing a brief file-by-file overview of what you are submitting.

We should be able to test your triggers by executing files `triggersetup.sql`, `triggers.sql` and `triggertest.sql` (in that order) and your procedures/functions by executing files `proceduressetup.sql`/`functionssetup.sql` and `procedurestest.sql`/`functionstest.sql` (in that order).

Make sure that MySQL can execute your files before you hand them in. Test this by clearing out your database and then running your SQL files and tests.

**Submissions of `.doc`, `.pages`, `.txt`, `.odt`, or `.tex` files, and no form of scanned handwritten solutions will not be graded.**
