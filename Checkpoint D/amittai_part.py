#!/usr/bin/env python
# -*- coding: utf-8 -*-

from mysql.connector import MySQLConnection, Error, errorcode, FieldType
from dbconfig import read_db_config
import getpass
import mysql
import sys


# the mysql connection instance.

db_config = read_db_config()
conn = MySQLConnection(**db_config)

# Added the last two imports above to fix problems running on some systems

# Author Functionalities

# 1. Register a new author.
def author_register(f_name: str, l_name: str, email: str, affiliation: str):
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

# 2. author status.
def author_status(author_id: int):
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
        WHERE LeadAuthorManuscripts.author_id = {author_id}
        AND LeadAuthorManuscripts.manuscript_number = Manuscript.manuscript_number
    """

    cursor = conn.cursor()
    cursor.execute(query)
    results = "\n".join(f"{row}" for row in cursor)
    if len(results) == 0:
        results = "Author has no manuscripts."

    return results

# 3. author login.
def author_login(author_id: int):
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
        WHERE author_ID = {author_id}
    """

    success = False

    try:
        cursor = conn.cursor()
        cursor.execute(query)
        row = cursor.fetchone()
        if row:
            success = True
            print(f"Welcome, author {author_id}!")
            status = author_status(author_id)
            print(f"Status update: \n{status}")
    except Error as error:
        print(error)
    finally:
        cursor.close()

    return success

# 4. author submit
def author_submit_manuscript(
    title: str, affiliation: str, i_code: str,
    author_two=None, author_three=None, author_four=None, filename="unspecified"):
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
    author_one = 23 # this should be the current author's ID

    queries = [
        f"""
            ALTER TABLE Author
            SET Affiliation_affiliation_ID = {affiliation}
            WHERE author_id = {author_one}
        """,
        f"""
            INSERT INTO Manuscript (title, Affiliation_affiliation_ID, RICodes_code)
            VALUES ('{title}', '{i_code}')
        """,
        f"""
            INSERT INTO Manuscript_Author (author_id, manuscript_number, author_ordinal)
            VALUES ({author_one}, (SELECT MAX(manuscript_number) FROM Manuscript), 1)
        """
    ]

    if author_two:
        queries.append(f"""
            INSERT INTO Manuscript_Author (author_id, manuscript_number, author_ordinal)
            VALUES ({author_two}, (SELECT MAX(manuscript_number) FROM Manuscript), 2)
        """)
    if author_three:
        queries.append(f"""
            INSERT INTO Manuscript_Author (author_id, manuscript_number, author_ordinal)
            VALUES ({author_three}, (SELECT MAX(manuscript_number) FROM Manuscript), 3)
        """)

    if author_four:
        queries.append(f"""
            INSERT INTO Manuscript_Author (author_id, manuscript_number, author_ordinal)
            VALUES ({author_four}, (SELECT MAX(manuscript_number) FROM Manuscript), 4)
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


# 2. editor status.
def editor_status(editor_id: int):
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
def editor_login(editor_id: int):
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
        WHERE editor_ID = {editor_id}
    """

    success = False

    try:
        cursor = conn.cursor()
        cursor.execute(query)
        row = cursor.fetchone()
        if row:
            success = True
            print(f"Welcome, editor {editor_id}!")
            print(f"Status update: \n{editor_status(editor_id)}")

    except Error as error:
        print(error)
    finally:
        cursor.close()

    return success

# 4. editor assign manuscript
def editor_assign_reviewer(manuscript_number: int, reviewer_id: int):
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
def editor_reject_manuscript(manuscript_number: int):
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
def editor_accept_manuscript(manuscript_number: int):
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


def test_author_register():
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

    success = author_register(f_name, l_name, email, affiliation)

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
    
    return success

def test_author_status():
    for _ in range(5):
        author_id = input("Author ID: ")
        status = author_status(author_id)
        print(f"Status update: \n{status}")
        print()

def test_author_login():
    for _ in range(5):
        author_id = int(input("Author ID: "))
        status = author_login(author_id)
        if status:
            print("Author logged in successfully.")
        else:
            print("Author login failed.")
        print()

def test_author_submit():
    title = input("Title: ")
    affiliation = input("Affiliation: ")
    i_code = input("Institutional code: ")
    author_two = input("Author two: ")
    author_three = input("Author three: ")
    author_four = input("Author four: ")
    filename = input("Filename: ")

    success = author_submit_manuscript(
        title, affiliation, i_code,
        author_two, author_three, author_four, filename)

    if success:
        print("Manuscript submitted successfully.")
    else:
        print("Manuscript submission failed.")
    print()
    
    return success


def test_editor_login():
    for _ in range(5):
        editor_id = int(input("Editor ID: "))
        status = editor_login(editor_id)
        if status:
            print("Editor logged in successfully.")
        else:
            print("Editor login failed.")
        print()

def test_editor_status():
    for _ in range(5):
        editor_id = input("Editor ID: ")
        status = editor_status(editor_id)
        print(f"Status update: \n{status}")
        print()
    
    return status

def test_editor_login():
    for _ in range(5):
        editor_id = int(input("Editor ID: "))
        status = editor_login(editor_id)
        if status:
            print("Editor logged in successfully.")
        else:
            print("Editor login failed.")
        print()
    
    return status

def test_editor_assign_reviewer():
    for _ in range(5):
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

        status = editor_assign_reviewer(manuscript_number, reviewer_id)
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
    
    return status

def test_editor_reject_manuscript():
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

        status = editor_reject_manuscript(manuscript_number)
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

def test_editor_accept_manuscript():
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

        status = editor_accept_manuscript(manuscript_number)
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


if __name__ == '__main__':
    # test author register.
    # test_author_register()

    # test author status.
    # test_author_status()


    # test author login.
    # test_author_login()

    # test author submit.
    # test_author_submit()

    # test editor login.
    # test_editor_login()

    # test editor assign reviewer.
    # test_editor_assign_reviewer()

    # test editor reject manuscript.
    # test_editor_reject_manuscript()

    # test editor accept manuscript.
    test_editor_accept_manuscript()




