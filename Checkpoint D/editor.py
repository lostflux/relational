#!/usr/bin/env python
# -*- coding: utf-8 -*-

from mysql.connector import MySQLConnection, Error, errorcode, FieldType
from dbconfig import read_db_config
import getpass
import mysql
import sys
from datetime import date
import shlex


class Editor:
    def __init__(self, editor_id: int, conn: MySQLConnection):
        self.editor_id = editor_id
        self.conn = conn
        self.is_valid = self.login()


    def __bool__(self):
        return self.is_valid

    @property
    def prompt(self):
        """
            Print the user prompt in the terminal
        """
        return f"Editor {self.editor_id}"

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

        cursor = self.conn.cursor()
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
            cursor = self.conn.cursor()
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
            cursor = self.conn.cursor()
            cursor.execute(query)
            self.conn.commit()
            editor_id = cursor.lastrowid
            success = True
        except mysql.self.connector.Error as err:
            print(err.msg)
        finally:
            cursor.close()
        
        if success:
            self.editor_id = editor_id
            print("You have been registered as editor with ID: {}".format(self.editor_id))
            print(f"Status update: \n{self.status()}")
        return success

    # 4. editor assign manuscript
    def assign_reviewer(self, manuscript_number: int, reviewer_id: int):
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
            cursor = self.conn.cursor()
            cursor.execute(query)
            self.conn.commit()
            success = True
        except Error as error:
            print(error)
        finally:
            cursor.close()
        
        return success

    # 5. editor reject manuscript
    def reject_manuscript(self, manuscript_number: int):
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
            cursor = self.conn.cursor()
            cursor.execute(query)
            self.conn.commit()
            success = True
        except Error as error:
            print(error)
        finally:
            cursor.close()
        
        return success

    # 6. editor accept manuscript
    def accept_manuscript(self, manuscript_number: int):
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
            cursor = self.conn.cursor()
            cursor.execute(query)
            self.conn.commit()
            success = True
        except Error as error:
            print(error)
        finally:
            cursor.close()
        
        return success

    def schedule_manuscript(self, manuscript_number, issue):
        """
            Schedule a manuscript for publication.

            Parameters
            ----------
            `manuscript_number`: int
                Manuscript number.
            `issue`: int
                Issue number: 2019-1 

            Returns
            -------
            bool: True if the manuscript was scheduled successfully, False otherwise.
        """
        input = issue.split("-")
        year = input[0]
        period = input[1]
        query = f"""
                    SELECT issue_ID
                    FROM Issue
                    WHERE `year`={year} AND `period`={period};
                """
        success = False

        try:
            cursor = self.conn.cursor()
            cursor.execute(query)
            row = cursor.fetchone()
            if row:
                issue_id = row[0]
                query = f"""
                    SELECT Manuscript.`status` 
                    FROM Manuscript 
                    WHERE Manuscript.`manuscript_number` = {manuscript_number};
                """
                cursor.execute(query)
                res = cursor.fetchone()
                manuscript_status = res[0] if res else ""

                query = f"""
                    SELECT sum(Manuscript.`page_count`)
                    FROM Manuscript
                    GROUP BY Manuscript.`Issue_issue_ID`, Manuscript.`status`
                    HAVING Manuscript.`Issue_issue_ID` = {issue_id} AND Manuscript.`status`='schedule for publication';
                """
                cursor.execute(query)
                res = cursor.fetchone()
                curr_page_total = res[0] if res else 0

                query = f"""
                    SELECT page_count
                    FROM Manuscript
                    WHERE manuscript_number = 43;
                """
                cursor.execute(query)
                res = cursor.fetchone()
                manuscript_page = res[0] if res else 0
                curr_page_total += manuscript_page

                if manuscript_status == "ready" and curr_page_total <= 100:
                    query = f"""
                        UPDATE Manuscript
                        SET status = 'schedule for publication', Issue_issue_ID = {issue_id}
                        WHERE manuscript_number = {manuscript_number};
                    """
                    cursor.execute(query)
            self.conn.commit()
            success = True
        except Error as error:
            print(error)
        finally:
            cursor.close()
        
        return success

    def publish_issue(self, issue):

        input = issue.split("-")
        year = input[0]
        period = input[1]
        query = f"""
            SELECT COUNT(Manuscript.`manuscript_number`)
            FROM Manuscript
            LEFT JOIN Issue
            ON Manuscript.`Issue_issue_ID` = Issue.`issue_ID`
            WHERE `year`={year} AND `period`={period};
        """

        query2 = f"""
            SELECT Manuscript.`manuscript_number`
            FROM Manuscript
            LEFT JOIN Issue
            ON Manuscript.`Issue_issue_ID` = Issue.`issue_ID`
            WHERE `year`={year} AND `period`={period};
        """
        success = False

        try:
            cursor = self.conn.cursor()
            cursor.execute(query)
            result = cursor.fetchall()
            if result[0][0] >= 1:
                cursor.execute(query2)
                result = cursor.fetchall()
                today = date.today()
                for row in result:
                    query3 = f"""
                        UPDATE Manuscript
                        SET status = 'published', status_change_date={today}
                        WHERE manuscript_number = {row[0]};
                    """
                    cursor.execute(query3)
                
                query4 = f"""
                    SELECT issue_ID
                    FROM Issue
                    WHERE `year`={year} AND `period`={period};
                """
                cursor.execute(query4)
                row = cursor.fetchone();
                if row:
                    issue_id = row[0]
                    query5 = f"""
                        UPDATE Issue
                        SET `publication_date`= {today}
                        WHERE `issue_ID` = {issue_id};
                    """
                    cursor.execute(query5)
            self.conn.commit()
            success = True
        except Error as error:
            print(error)
        finally:
            cursor.close()
        
        return success

    def reset_database(self):
        """
            Reset the database to its initial state.
        """

        querys = [
            "SET FOREIGN_KEY_CHECKS = 0;"
            "DROP TABLE IF EXISTS RICodes;"
            "DROP TABLE IF EXISTS Affiliation;"
            "DROP TABLE IF EXISTS Journal;"
            "DROP TABLE IF EXISTS Issue;"
            "DROP TABLE IF EXISTS Editor;"
            "DROP TABLE IF EXISTS Reviewer;"
            "DROP TABLE IF EXISTS Author;"
            "DROP TABLE IF EXISTS Manuscript_Author;"
            "DROP TABLE IF EXISTS Journal_has_RICodes;"
            "DROP TABLE IF EXISTS Reviewer_has_Manuscript;"
            "DROP TABLE IF EXISTS Manuscript;"
            "DROP TABLE IF EXISTS Reviewer_has_RICodes;"
            "SET FOREIGN_KEY_CHECKS = 1;"
        ]
        try:
            cursor = self.conn.cursor()
            for query in querys:
                cursor.execute(query)
            self.conn.commit()
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


    # the mysql self.connection instance.

    db_config = read_db_config()
    conn = MySQLConnection(**db_config)
    
    print("Testing Editor instantiation, login, and status...")
    editor_id = input("Enter editor ID: ")
    editor = Editor(editor_id, conn)
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

    # the mysql self.connection instance.

    db_config = read_db_config()
    conn = MySQLConnection(**db_config)

    print("Testing editor handling message queries...")
    editor_id = input("Enter editor ID: ")
    editor = Editor(editor_id, conn)
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

    # test editor
    test_editor()
    test_editor_handle_request()




