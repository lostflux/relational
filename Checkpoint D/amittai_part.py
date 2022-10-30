#!/usr/bin/env python
# -*- coding: utf-8 -*-

from mysql.connector import MySQLConnection, Error, errorcode, FieldType
from dbconfig import read_db_config
import getpass
import mysql
import sys
from datetime import date
import shlex


# the mysql connection instance.

db_config = read_db_config()
conn = MySQLConnection(**db_config)

# Added the last two imports above to fix problems running on some systems

# Author Functionalities
class Author:
    def __init__(self, author_id: int):
        self.author_id = author_id
        self.is_valid = self.login()

    def __bool__(self):
        return self.is_valid

    # 3. author login.
    def login(self):
        """
            Author login.
            
            Params
            ------
            `author_id`: int
                Author ID.

            Returns
            -------
            bool: True if the author was logged in successfully, False otherwise.
        """

        query = f"""
            SELECT * FROM Author
            WHERE author_ID = {self.author_id}
        """

        success = False

        try:
            cursor = conn.cursor()
            cursor.execute(query)
            row = cursor.fetchone()
            if row:
                success = True
                print(f"Welcome, author {self.author_id}!")
                print(f"Status update: \n{self.status()}")
        except Error as error:
            print(error)
        finally:
            cursor.close()

        return success

    # 2. author status.
    def status(self):
        """
            Return a status of the current author's manuscripts.

            Parameters
            ----------
            `author_id`: int
                Author ID.

            Returns
            -------
                String value representing the status of all manuscripts
                where author is primary author.
        """
        query = f"""
            SELECT LeadAuthorManuscripts.manuscript_number, Manuscript.status
            FROM LeadAuthorManuscripts, Manuscript
            WHERE LeadAuthorManuscripts.author_id = {self.author_id}
            AND LeadAuthorManuscripts.manuscript_number = Manuscript.manuscript_number
        """

        cursor = conn.cursor()
        cursor.execute(query)
        results = "\n".join(f"{row}" for row in cursor)
        if len(results) == 0:
            results = "Author has no manuscripts."

        return results

        
    # 4. author submit
    def submit_manuscript(self, title: str, affiliation: str, i_code: str,
        author_two="", author_three="", author_four="", filename="unspecified"):
        """
            Submit a manuscript.

            Parameters
            ----------
            `title`: str
                Title of the manuscript.
            `affiliation`: str
                Affiliation (organization) of the author.
            `i_code`: str
                Institutional code of the author.
            `author_two`: int
                Author ID of the second author.
            `author_three`: int
                Author ID of the third author.
            `filename`: str
                Filename of the manuscript.

            Returns
            -------
            bool: True if the manuscript was submitted successfully, False otherwise.
        """
        author_one = self.author_id

        queries = [
            f"""
                INSERT INTO Manuscript (title, date_received, status, RICodes_code)
                VALUES ('{title}', \"{date.today()}\", "submitted", '{i_code}')
            """,
            f"""
                INSERT INTO Manuscript_Author (Author_author_id, Manuscript_manuscript_number, author_ordinal)
                VALUES ({author_one}, (SELECT MAX(manuscript_number) FROM Manuscript), 1)
            """
        ]

        if author_two:
            author_two_tokens = author_two.split(" ")
            author_two_fname = author_two_tokens[0]
            author_two_lname = author_two_tokens[1] if len(author_two_tokens) > 1 else ""
            print(f"Author two is:  --> {author_two_fname}, {author_two_lname}")
            Author.register_author_if_nonexistent(author_two_fname, author_two_lname, "", affiliation)
            author_two_id = self.get_author_id(author_two_fname, author_two_lname)
            queries.append(f"""
                INSERT INTO Manuscript_Author (Author_author_id, Manuscript_manuscript_number, author_ordinal)
                VALUES ({author_two_id}, (SELECT MAX(manuscript_number) FROM Manuscript), 2)
            """)
        if author_three:
            author_three_tokens = author_three.split(" ")
            author_three_fname = author_three_tokens[0]
            author_three_lname = author_three_tokens[1] if len(author_three_tokens) > 1 else ""
            Author.register_author_if_nonexistent(author_three_fname, author_three_lname, "", affiliation)
            author_three_id = self.get_author_id(author_three_fname, author_three_lname)
            queries.append(f"""
                INSERT INTO Manuscript_Author (Author_author_id, Manuscript_manuscript_number, author_ordinal)
                VALUES ({author_three_id}, (SELECT MAX(manuscript_number) FROM Manuscript), 3)
            """)

        if author_four:
            author_four_tokens = author_four.split(" ")
            author_four_fname = author_four_tokens[0]
            author_four_lname = author_four_tokens[1] if len(author_four_tokens) > 1 else ""
            Author.register_author_if_nonexistent(author_four_fname, author_four_lname, "", affiliation)
            author_four_id = self.get_author_id(author_four_fname, author_four_lname)
            queries.append(f"""
                INSERT INTO Manuscript_Author (Author_author_id, Manuscript_manuscript_number, author_ordinal)
                VALUES ({author_four_id}, (SELECT MAX(manuscript_number) FROM Manuscript), 4)
            """)

        success = False

        try:
            cursor = conn.cursor()
            for query in queries:
                cursor.execute(query)
                conn.commit()
            success = True
        except Error as error:
            print(error)
        finally:
            cursor.close()

        return success

    @staticmethod
    def get_author_id(fname: str, lname: str):
        """
            Get the author ID of an author.

            Parameters
            ----------
            `fname`: str
                First name of the author.
            `lname`: str
                Last name of the author.

            Returns
            -------
            int: Author ID.
        """
        query = f"""
            SELECT author_id FROM Author
            WHERE f_name = '{fname}'
            AND l_name = '{lname}'
        """

        cursor = conn.cursor()
        cursor.execute(query)
        row = cursor.fetchone()
        return int(row[0])


    # 1. Register a new author.
    @staticmethod
    def register_author(f_name: str, l_name: str, email: str, affiliation: str):
        """
            Register a new author.
            
            Params
            ------
            `f_name`: str
                First name of the author.
            `l_name`: str
                Last name of the author.
            `email`: str
                Email of the author.
            `affiliation`: str
                Affiliation (organization) of the author.

            Returns
            -------
            bool: True if the author was registered successfully, False otherwise.
        """

        query = f"""
            INSERT INTO Author (f_name, l_name, email, Affiliation_affiliation_ID)
            VALUES ('{f_name}', '{l_name}', '{email}', '{affiliation}')
        """

        success = False

        try:
            cursor = conn.cursor()
            cursor.execute(query)
            conn.commit()
            success = True
        except Error as error:
            print(error)
        finally:
            cursor.close()

        return success

    @staticmethod
    def register_author_if_nonexistent(f_name: str, l_name: str, email: str, affiliation: str):
        """
            Register a new author if the author does not exist.

            Params
            ------
            `f_name`: str
                First name of the author.
            `l_name`: str
                Last name of the author.
            `email`: str
                Email of the author.
            `affiliation`: str
                Affiliation (organization) of the author.

            Returns
            -------
            bool: True if the author was registered successfully, False otherwise.
        """

        query = f"""
            SELECT * FROM Author
            WHERE f_name = '{f_name}'
            AND l_name = '{l_name}'
        """

        cursor = conn.cursor()
        cursor.execute(query)
        row = cursor.fetchone()
        if row:
            return False
        else:
            return Author.register_author(f_name, l_name, email, affiliation)

    def handle_request(self, request: str):
        """
            Handle a request

            Parameters
            ----------
            `request`: str
                The request to handle.
                Possible values:

                - `register author <fname> <lname> <email> <affiliation>`
                - `login <id>`
                - `submit <title> <Affiliation> <ICode> <author2> <author3> <author4> <filename>`
                - `status`
        """

        request_tokens  = shlex.split(request)
        request_type = request_tokens[0].lower() if len(request_tokens) > 0 else ""

        if request_type == "status":
            print(f"Author ID: {self.author_id}\n{self.status()}")

        elif request_type == "register":
            if len(request_tokens) < 6:
                print("Invalid request: too few arguments.")
                return
            if request_tokens[1].lower() != "author":
                print("Invalid request.")
                return

            f_name = request_tokens[2]
            l_name = request_tokens[3]
            email = request_tokens[4]
            affiliation = request_tokens[5]

            if self.register_author_if_nonexistent(f_name, l_name, email, affiliation):
                print("Author registered successfully.")
            else:
                print("Author registration failed.")
        elif request_type == "submit":
            if len(request_tokens) < 4:
                print("Invalid request: not enough arguments.")
                return

            title = request_tokens[1]
            affiliation = request_tokens[2]
            i_code = request_tokens[3]
            
            author_two = request_tokens[4] if len(request_tokens) > 4 else ""
            author_three = request_tokens[5] if len(request_tokens) > 5 else ""
            author_four = request_tokens[6] if len(request_tokens) > 6 else ""
            filename = request_tokens[7] if len(request_tokens) > 7 else ""
            

            if self.submit_manuscript(title, affiliation, i_code, author_two, author_three, author_four, filename):
                print("Manuscript submitted successfully.")
            else:
                print("Manuscript submission failed.")
        elif request_type == "login":
            if len(request_tokens) < 2:
                print("Invalid request: not enough arguments.")
                return

            try:
                author_id = int(request_tokens[1])
                self.__init__(author_id)
            except ValueError:
                print("Invalid request: author ID must be an integer.")
                return

        else:
            print("Invalid request.")
        

def test_author():
    for _ in range(3):
        print("\n\nTesting author instantiation, login, and status...\n")
        author_id = int(input("Enter author ID: "))
        author = Author(author_id)
        if author:
            print("Author logged in successfully.")
        else:
            print("Author login failed.")
            continue

        print("\n\nTesting author registration...\n")
        f_name = input("First name: ")
        l_name = input("Last name: ")
        email = input("Email: ")
        affiliation = input("Affiliation: ")

        print("Before registration:")
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Author")
        for row in cursor:
            print(row)
        cursor.close()

        success = Author.register_author_if_nonexistent(f_name, l_name, email, affiliation)

        if success:
            print("Author registered successfully.")
            print("After registration:")
            cursor = conn.cursor()
            cursor.execute("SELECT * FROM Author")
            for row in cursor:
                print(row)
            cursor.close()

        else:
            print("Author registration failed.")

        print("\n\nTesting submission of manuscripts...\n")
        title = input("Title: ")
        affiliation = input("Affiliation ID: ")
        icode = input("i-code: ")
        author_two = input("Author two: ") or None
        author_three = input("Author three: ") or None
        author_four = input("Author four: ") or None
        print(f"Current status: \n{author.status()}")
        success = author.submit_manuscript(title, affiliation, icode, author_two, author_three, author_four)
        if success:
            print("Manuscript submitted successfully.")
            print(f"New status: {author.status()}")
        else:
            print("Manuscript submission failed.")

        print(f"Author status: \n{author.status()}")

def test_author_handle_request():
    print("\n\nTesting author handle request...\n")
    author_id = int(input("Enter author ID: "))
    author = Author(author_id)
    if author:
        print("Author logged in successfully.")
    else:
        print("Author login failed.")
        return

    while True:
        request = input("Enter request: ")
        author.handle_request(request)
        print(f"Author status: \n{author.status()}")
    return


class Editor:
    def __init__(self, editor_id: int):
        self.editor_id = editor_id
        self.is_valid = self.login()


    def __bool__(self):
        return self.is_valid

    # 2. editor status.
    def status(self):
        """
            Return a status of the current editor's manuscripts.

            Parameters
            ----------
            `editor_id`: int
                Editor ID.

            Returns
            -------
                String value representing the status of all manuscripts
                assigned to the editor.
        """
        query = f"""
            SELECT manuscript_number, status
            FROM Manuscript
            ORDER BY status, manuscript_number
        """

        cursor = conn.cursor()
        cursor.execute(query)
        results = "\n".join(f"{row}" for row in cursor)
        if len(results) == 0:
            results = "There are currently no manuscripts in the system."

        return results

    # 3. editor login
    def login(self):
        """
            Editor login.
            
            Params
            ------
            `editor_id`: int
                Editor ID.

            Returns
            -------
            bool: True if the editor was logged in successfully, False otherwise.
        """

        query = f"""
            SELECT * FROM Editor
            WHERE editor_ID = {self.editor_id}
        """

        success = False

        try:
            cursor = conn.cursor()
            cursor.execute(query)
            row = cursor.fetchone()
            if row:
                success = True
                print(f"Welcome, editor {self.editor_id}!")
                print(f"Status update: \n{self.status()}")

        except Error as error:
            print(error)
        finally:
            cursor.close()

        return success

    def register_editor(self, fname, lname):
        """Register a editor

        Arguments:
            fname       -- first name of the reviewer
            lname       -- last name of the reviewer
        """
        success = False
        editor_id = None
        query = f"""
            INSERT INTO `Editor` (`f_name`,`l_name`)
            VALUES ('{fname}','{lname}')"""

        try:
            cursor = conn.cursor()
            cursor.execute(query)
            conn.commit()
            editor_id = cursor.lastrowid
            success = True
        except mysql.connector.Error as err:
            print(err.msg)
        finally:
            cursor.close()
        
        if success:
            print("OK")
            self.editor_id = editor_id
            print("You have been registered as editor with ID: {}".format(self.editor_id))
            print(f"Status update: \n{self.status()}")
        return success

    # 4. editor assign manuscript
    @staticmethod
    def assign_reviewer(manuscript_number: int, reviewer_id: int):
        """
            Assign a manuscript to a reviewer.

            Parameters
            ----------
            `manuscript_number`: int
                Manuscript number.
            `reviewer_id`: int
                Reviewer ID.

            Returns
            -------
            bool: True if the manuscript was assigned successfully, False otherwise.
        """

        query = f"""
            INSERT INTO Reviewer_has_Manuscript
            (Manuscript_manuscript_number, Reviewer_reviewer_id)
            VALUES ({manuscript_number}, {reviewer_id})
        """

        success = False

        try:
            cursor = conn.cursor()
            cursor.execute(query)
            conn.commit()
            success = True
        except Error as error:
            print(error)
        finally:
            cursor.close()
        
        return success

    # 5. editor reject manuscript
    @staticmethod
    def reject_manuscript(manuscript_number: int):
        """
            Reject a manuscript.

            Parameters
            ----------
            `manuscript_number`: int
                Manuscript number.

            Returns
            -------
            bool: True if the manuscript was rejected successfully, False otherwise.
        """

        query = f"""
            UPDATE Manuscript
            SET status = 'rejected'
            WHERE manuscript_number = {manuscript_number}
        """

        success = False

        try:
            cursor = conn.cursor()
            cursor.execute(query)
            conn.commit()
            success = True
        except Error as error:
            print(error)
        finally:
            cursor.close()
        
        return success

    # 6. editor accept manuscript
    @staticmethod
    def accept_manuscript(manuscript_number: int):
        """
            Accept a manuscript.

            Parameters
            ----------
            `manuscript_number`: int
                Manuscript number.

            Returns
            -------
            bool: True if the manuscript was accepted successfully, False otherwise.
        """

        query = f"""
            UPDATE Manuscript
            SET status = 'accepted'
            WHERE manuscript_number = {manuscript_number}
        """

        success = False

        try:
            cursor = conn.cursor()
            cursor.execute(query)
            conn.commit()
            success = True
        except Error as error:
            print(error)
        finally:
            cursor.close()
        
        return success

    def handle_request(self, request: str):
        """
            Handle a request from the user.

            Parameters
            ----------
            `request`: str
                Request from the user.

            Returns
            -------
            None
        """
        request_tokens  = shlex.split(request)
        request_type = request_tokens[0].lower() if len(request_tokens) > 0 else ""

        if request_type == "status":
            print(f"Editor ID: {self.editor_id}\n{self.status()}")

        elif request_type == "register":
            if len(request_tokens) != 4:
                print("Invalid request: too few arguments.")
                return
            if request_tokens[1].lower() != "editor":
                print("Invalid request.")
                return

            f_name = request_tokens[2]
            l_name = request_tokens[3]

            if self.register_editor_if_nonexistent(f_name, l_name):
                print("Editor registered successfully.")
            else:
                print("Author registration failed.")

        elif request_type == "login":
            if len(request_tokens) != 2:
                print("Invalid request: too few arguments.")
                return
            try:
                editor_id = int(request_tokens[1])
                self.__init__(editor_id)
            except ValueError:
                print("Invalid request: editor ID must be an integer.")
                return
        elif request_type == "status":
            print(f"Editor ID: {self.editor_id}\n{self.status()}")

        elif request_type == "assign":
            if len(request_tokens) != 3:
                print("Invalid request: too few arguments.")
                return
            try:
                manuscript_number = int(request_tokens[1])
                reviewer_id = int(request_tokens[2])
            except ValueError:
                print("Invalid request: manuscript number and reviewer ID must be integers.")
                return
            if self.assign_reviewer(manuscript_number, reviewer_id):
                print("Reviewer assigned successfully.")
            else:
                print("Reviewer assignment failed.")

        elif request_type == "reject":
            if len(request_tokens) != 2:
                print("Invalid request: too few arguments.")
                return
            try:
                manuscript_number = int(request_tokens[1])
            except ValueError:
                print("Invalid request: manuscript number must be an integer.")
                return
            if self.reject_manuscript(manuscript_number):
                print("Manuscript rejected successfully.")
            else:
                print("Manuscript rejection failed.")
        
        elif request_type == "accept":
            if len(request_tokens) != 2:
                print("Invalid request: too few arguments.")
                return
            try:
                manuscript_number = int(request_tokens[1])
            except ValueError:
                print("Invalid request: manuscript number must be an integer.")
                return
            if self.accept_manuscript(manuscript_number):
                print("Manuscript accepted successfully.")
            else:
                print("Manuscript acceptance failed.")
        elif request_type == "schedule":
            if len(request_tokens) != 3:
                print("Invalid request: too few arguments.")
                return
            try:
                manuscript_number = int(request_tokens[1])
                issue = request_tokens[2]
            except ValueError:
                print("Invalid request: manuscript number must be an integer.")
                return
            if self.schedule_manuscript(manuscript_number, issue):
                print("Manuscript scheduled successfully.")
            else:
                print("Manuscript scheduling failed.")

        elif request_type == "publish":
            if len(request_tokens) != 2:
                print("Invalid request: too few arguments.")
                return
            issue = request_tokens[1]
            if self.publish_issue(issue):
                print("Issue published successfully.")
            else:
                print("Issue publishing failed.")

        elif request_type == "reset":
            self.reset_database()
            print("Database reset successfully.")
        elif request_type == "exit":
            print("Exiting...")
            exit(0)
        else:
            print("Invalid request.")
        
      

def test_editor():
    print("Testing Editor instantiation, login, and status...")
    editor_id = input("Enter editor ID: ")
    editor = Editor(editor_id)
    if editor:
        print("Editor logged in successfully.")
    else:
        print("Editor login failed.")
        return
    
    print("\n\nTesting assignment of reviewers...\n")

    print("Testing assignment of reviewers")
    for _ in range(2):
        manuscript_number = int(input("Manuscript number: "))
        reviewer_id = int(input("Reviewer ID: "))

        print("Before assignment:")
        cursor = conn.cursor()
        cursor.execute("""
                        SELECT
                            Manuscript_manuscript_number AS Manuscript_NO,
                            Reviewer_reviewer_id AS Reviewer_ID
                        FROM Reviewer_has_Manuscript""")
        for row in cursor:
            print(row)
        cursor.close()

        status = editor.assign_reviewer(manuscript_number, reviewer_id)
        if status:
            print("Manuscript assigned successfully.")
        else:
            print("Manuscript assignment failed.")
        
        print("After assignment:")
        cursor = conn.cursor()
        cursor.execute("""
                        SELECT
                            Manuscript_manuscript_number AS Manuscript_NO,
                            Reviewer_reviewer_id AS Reviewer_ID
                        FROM Reviewer_has_Manuscript""")
        for row in cursor:
            print(row)
        cursor.close()
        print()

    print("\n\nTesting rejection of manuscripts...\n")
    for _ in range(5):
        manuscript_number = int(input("Manuscript number: "))

        print("Before rejection:")
        cursor = conn.cursor()
        cursor.execute(f"""
                        SELECT manuscript_number, status
                        FROM Manuscript
                        WHERE manuscript_number = {manuscript_number}""")
        for row in cursor:
            print(row)
        cursor.close()

        status = editor.reject_manuscript(manuscript_number)
        if status:
            print("Manuscript rejected successfully.")
        else:
            print("Manuscript rejection failed.")
        
        print("After rejection:")
        cursor = conn.cursor()
        cursor.execute(f"""
                        SELECT manuscript_number, status
                        FROM Manuscript
                        WHERE manuscript_number = {manuscript_number}""")
        for row in cursor:
            print(row)
        cursor.close()
        print()
        
    print("\n\nTesting acceptance of manuscripts...\n")
    for _ in range(5):
        manuscript_number = int(input("Manuscript number: "))

        print("Before acceptance:")
        cursor = conn.cursor()
        cursor.execute(f"""
                        SELECT manuscript_number, status
                        FROM Manuscript
                        WHERE manuscript_number = {manuscript_number}""")
        for row in cursor:
            print(row)
        cursor.close()

        status = editor.accept_manuscript(manuscript_number)
        if status:
            print("Manuscript accepted successfully.")
        else:
            print("Manuscript acceptance failed.")

        print("After acceptance:")
        cursor = conn.cursor()
        cursor.execute(f"""
                        SELECT manuscript_number, status
                        FROM Manuscript
                        WHERE manuscript_number = {manuscript_number}""")
        for row in cursor:
            print(row)
        cursor.close()
        print()

def test_editor_handle_request():
    """
        Function to test editor handling message queries
    """
    print("Testing editor handling message queries...")
    editor_id = input("Enter editor ID: ")
    editor = Editor(editor_id)
    if editor:
        print("Editor logged in successfully.")
    else:
        print("Editor login failed.")
        return
    while True:
        request = input("Enter request: ")
        editor.handle_request(request)
        print(f"Editor status: \n{editor.status()}")
    return


if __name__ == '__main__':

    # test author
    # test_author()
    # test_author_handle_request()

    # test editor
    # test_editor()
    test_editor_handle_request()




