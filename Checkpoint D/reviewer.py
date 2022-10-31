#!/usr/bin/env python
# -*- coding: utf-8 -*-

from mysql.connector import MySQLConnection, Error, errorcode, FieldType
from dbconfig import read_db_config
from getpass import getpass
import mysql
import sys
from datetime import date
import shlex


class Reviewer:
    """
        Reviewer Class
    """

    def __init__(self, reviewer_id: int, conn: MySQLConnection):
        self.reviewer_id = reviewer_id
        self.conn = conn
        self.is_valid = self.login(reviewer_id)

    @property
    def prompt(self):
        """
            Print the user prompt in the terminal
        """
        return f"Reviewer {self.reviewer_id}> "

    def register_reviewer(self, fname: str, lname: str, ICode_list: "list[int]"):
        """Register a reviewer

        Arguments:
            fname       -- first name of the reviewer
            lname       -- last name of the reviewer
            ICode_list  -- list of interest codes
        """
        reviewer_id = None

        query = """
            INSERT INTO `Reviewer` (`f_name`,`l_name`)
            VALUES ('{}','{}');""".format(fname, lname)
    
        password = getpass("Enter password: ")
        
        password_query = f"""
            UPDATE credentials
            SET password = MD5('{password}')
            WHERE
                user_type = "Reviewer"
                AND type_id = (
                    SELECT reviewer_ID FROM Reviewer
                    WHERE f_name = '{fname}' AND l_name = '{lname}'
                )
        """

        success = False
        try:
            cursor = self.conn.cursor()
            cursor.execute(query)
            reviewer_id = cursor.lastrowid
            for ICode in ICode_list:
                query = f"""
                    INSERT INTO `Reviewer_has_RICodes` (`Reviewer_reviewer_ID`, `RICodes_code`)
                    VALUES ({reviewer_id}, {ICode});"""
                cursor.execute(query)

            self.conn.commit()
            if password:
                cursor.execute(password_query)
                self.conn.commit()
            success = True
        except mysql.connector.Error as err:
            print(err.msg)

        if success:
            print("Reviewer registered successfully!")

        return success

    def login(self, reviewer_id: int):
        """
            Log in as a reviewer.

            Parameters
            ----------
            `reviewer_id`: int
                The ID of the reviewer.
        """
        try:
            query = f"""
                SELECT CONCAT('Hello, ', Reviewer.`f_name`, ' ', Reviewer.`l_name`)
                FROM `Reviewer` WHERE Reviewer.`reviewer_ID` = {reviewer_id};"""
            cursor = self.conn.cursor()
            cursor.execute(query)
            result = cursor.fetchone()
            print(result[0], "\n")
            print(f"Status:\n{self.status()}\n")
            return True
        except mysql.connector.Error as err:
            print(err.msg)
        return False

    def resign_reviewer(self, reviewer_id: int):
        """Resign a reviewer

        Arguments:
            reviewer_id -- id of the reviewer
        """
        try:
            query = "DELETE FROM `Reviewer` WHERE `reviewer_ID` = {};".format(reviewer_id)
            cursor = self.conn.cursor()
            cursor.execute(query)
        except mysql.connector.Error as err:
            print(err.msg)
        else:
            print("Thank you for your service!")
            return True
        return False

    def status(self):
        """
            Return current status as string
        """

        query = f"""SELECT Reviewer_has_Manuscript.`Manuscript_manuscript_number` 
                        AS `Manuscript #`, Manuscript.status 
                        FROM Reviewer_has_Manuscript, Manuscript 
                        WHERE Reviewer_has_Manuscript.`Reviewer_reviewer_ID` = {self.reviewer_id}
                        AND Manuscript.manuscript_number = Reviewer_has_Manuscript.`Manuscript_manuscript_number` 
                        ORDER BY FIELD (Manuscript.status, 'under review', 'rejected', 'accepted', 'submitted', 'in typesetting', 'schedule for publication', 'published');"""
        
        cursor = self.conn.cursor()
        cursor.execute(query)
        results = ""
        title = "Status"
        title = f"| Manuscript #### | {title:>30} |"
        delim = "-" * len(title)
        for row in cursor:
            manuscript_number, status = row
            results += f"| Manuscript {manuscript_number:4d} | {status:>30} |\n{delim}\n"
        cursor.close()
        if len(results) == 0:
            results = "Reviewer has no manuscripts."
        else:
            results = f"{delim}\n{title}\n{delim}\n{results}"

        return results

    def set_manuscript_opinion(self, action, output):
        """Set the opinion of the reviewer on a manuscript
        
        Arguments:
            action      -- action of the reviewer
            ascore      -- score for the article
            cscore      -- score for the content
            mscore      -- score for the methodology
            escore      -- score for the evaluation
        """
        manuscript_id = output[0]
        ascore = output[1]
        cscore = output[2]
        mscore = output[3]
        escore = output[4]
        accept_score = 10
        reject_score = 1
        try:
            query = """
                SELECT IF(SUM(Reviewer_has_Manuscript.`Manuscript_manuscript_number` = {}), 'Y', 'N')
                AS RES FROM Reviewer_has_Manuscript
                GROUP BY `REVIEWER_reviewer_ID`
                HAVING `REVIEWER_reviewer_ID` = {};""".format(manuscript_id, self.reviewer_id)
            cursor = self.conn.cursor()
            cursor.execute(query)

            reviewer_has_manu = cursor.fetchall()
            if reviewer_has_manu[0][0] == 'N':
                print("You are not assigned to this manuscript")
                return False
            
            query = "SELECT `status` FROM Manuscript WHERE `manuscript_number` = {};".format(manuscript_id)
            cursor.execute(query)
            manuscript_status = cursor.fetchall()
            if manuscript_status[0][0] != 'under review':
                print("This manuscript is not under review")
                return False
            
            score = accept_score if action == 'accept' else reject_score
            query = f"""
                UPDATE Reviewer_has_Manuscript
                SET
                    `appropriateness` = {ascore},
                    `clarity` = {cscore},
                    `methodology`={mscore},
                    `experimental`={escore},
                    `recommendation`= {score}
                WHERE Reviewer_has_Manuscript.`Reviewer_reviewer_ID` = {self.reviewer_id}
                AND Reviewer_has_Manuscript.`Manuscript_manuscript_number`={manuscript_id}
            """
            cursor.execute(query)
            self.conn.commit()
            
        except Error as err:
            print(err.msg)
            return False
        else:
            print("Successfully set your opinion on the manuscript")
            return True

    def accept_manuscript(self, manuscript_id: int, ascore: int, cscore: int, mscore: int, escore: int):
        """Accept a manuscript

        Arguments:
            manuscript_id   -- id of the manuscript
            ascore          -- score for the article
            cscore          -- score for the content
            mscore          -- score for the methodology
            escore          -- score for the evaluation
        """
        output = [manuscript_id, ascore, cscore, mscore, escore]
        return self.set_manuscript_opinion('accept', output)

    def reject_manuscript(self, manuscript_id: int, ascore: int, cscore: int, mscore: int, escore: int):
        """Reject a manuscript

        Arguments:
            manuscript_id   -- id of the manuscript
            ascore          -- score for the article
            cscore          -- score for the content
            mscore          -- score for the methodology
            escore          -- score for the evaluation
        """
        output = [manuscript_id, ascore, cscore, mscore, escore]
        return self.set_manuscript_opinion('reject', output)


    def handle_request(self, request: str):
        """Process the input from the reviewer

        Arguments:
            `request`  -- string
                The user request. It can be one of the following:

        """

        input_list = shlex.split(request)
        input_size = len(input_list)

        action = input_list[0]

        if action == 'status' and input_size == 1:
            return print(f"Status:\n{self.status()}")

        if input_size == 2 and action == "resign":
            if input_list[1].isnumeric():
                reviewer_id = int(input_list[1])
                return self.resign_reviewer(reviewer_id)
            else:
                print("Invalid input: reviewer ID must be a number")
                return False

        elif input_size == 2 and action == "login":
            if input_list[1].isnumeric():
                reviewer_id = input_list[1]
                return self.login(reviewer_id)
            else:
                print("Invalid input for login statement: reviewer ID must be a number")
                return False
                
        elif 5 <= input_size <= 7 and action == "register":
            fname = input_list[2]
            lname = input_list[3]
            ICode_list = input_list[4:]
            for ICode in ICode_list:
                if not ICode.isnumeric():
                    print("Invalid RICode input, RICodes must be numeric")
                    return False
            return self.register_reviewer(fname, lname, ICode_list)
        
        elif input_size == 6 and action in ["accept", "reject"]:
            if input_list[1].isnumeric():
                manuscript_id = int(input_list[1])
                if input_list[2].isnumeric()\
                    and input_list[3].isnumeric()\
                    and input_list[4].isnumeric()\
                    and input_list[5].isnumeric():
                    ascore = int(input_list[2])
                    cscore = int(input_list[3])
                    mscore = int(input_list[4])
                    escore = int(input_list[5])
                    
                    self.set_manuscript_opinion(action, (manuscript_id, ascore, cscore, mscore, escore))
        else:
            print("Invalid input for register statement")
            print("""Please use the following format:
            register <first name> <last name> <RICode1> <RICode2> ... <RICodeN>""")
            return False

    def publish_issue(self, issue):
        """Publish an issue

        Arguments:
            issue       -- issue number
        """
        success = False
        try:
            query = f"""
                UPDATE `Manuscript`
                SET `status` = 'published'
                WHERE `issue` = {issue};"""
            cursor = self.conn.cursor()
            cursor.execute(query)
            success = True
        except mysql.connector.Error as err:
            print(err.msg)
        if success:
            print("Issue {} has been published".format(issue))

        return success

def test_reviewer_handle_request():

    # the mysql self.connection instance.

    db_config = read_db_config()
    conn = MySQLConnection(**db_config)


    print("Testing reviewer initialization, login")
    reviewer_id = int(input("Enter reviewer ID: "))
    reviewer = Reviewer(reviewer_id, conn)

    while True:
        request = input("Enter request: ")
        if request == "exit":
            break
        reviewer.process_request(request)

if __name__ == "__main__":
    test_reviewer_handle_request()
