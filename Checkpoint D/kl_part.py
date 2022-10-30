#!/usr/bin/env python
# -*- coding: utf-8 -*-


from mysql.connector import MySQLConnection, Error, errorcode, FieldType
from dbconfig import read_db_config
import getpass
import sys
import mysql
import shlex

try:
    dbconfig = read_db_config()
    print('Connecting to MySQL database...')
    conn = MySQLConnection(**dbconfig)
    if conn.is_connected():
        print('connection established.')
        mycursor = conn.cursor(buffered=True)
    else:
        print('connection failed.')

except mysql.connector.Error as err:
    print('connection failed somehow')
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Something is wrong with your user name or password")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("Database does not exist")
    else:
        print("Unexpected error")
        print(err)
        sys.exit(1)

class Reviewer:
    """
        Reviewer Class
    """

    def __init__(self, reviewer_id: int):
        self.reviewer_id = reviewer_id
        self.is_valid = self.login(reviewer_id)

    def register_reviewer(self, fname, lname, ICode_list):
        """Register a reviewer

        Arguments:
            fname       -- first name of the reviewer
            lname       -- last name of the reviewer
            ICode_list  -- list of interest codes
        """
        reviewer_id = None
        try:
            query = """
                INSERT INTO `Reviewer` (`f_name`,`l_name`)
                VALUES ('{}','{}');""".format(fname, lname)
            cursor = conn.cursor()
            cursor.execute(query)
            reviewer_id = cursor.lastrowid
            for ICode in ICode_list:
                query = """
                    INSERT INTO `Reviewer_has_RICodes` (`Reviewer_reviewer_ID`, `RICodes_code`)
                    VALUES ({}, {});""".format(reviewer_id, ICode)
                cursor.execute(query)
        except mysql.connector.Error as err:
            print(err.msg)
        else:
            self.reviewer_id = reviewer_id
            print("You have been registered as reviewer with ID: {}".format(self.reviewer_id))
            return True
        return False

    def login(self, reviewer_id: int):
        """
            Log in as a reviewer.

            Parameters
            ----------
            `reviewer_id`: int
                The ID of the reviewer.
        """
        try:
            query = """
                SELECT CONCAT('Hello, ', Reviewer.`f_name`, ' ', Reviewer.`l_name`)
                FROM `Reviewer` WHERE Reviewer.`reviewer_ID` = {};""".format(reviewer_id)
            cursor = conn.cursor()
            cursor.execute(query)
            result = cursor.fetchone()
            print(result[0], "\n")
            print("Below is a list of manuscripts assigned to you:")
            query = f"""SELECT Reviewer_has_Manuscript.`Manuscript_manuscript_number` 
                        AS `Manuscript #`, Manuscript.status 
                        FROM Reviewer_has_Manuscript, Manuscript 
                        WHERE Reviewer_has_Manuscript.`Reviewer_reviewer_ID` = {reviewer_id}
                        AND Manuscript.manuscript_number = Reviewer_has_Manuscript.`Manuscript_manuscript_number` 
                        ORDER BY FIELD (Manuscript.status, 'under review', 'rejected', 'accepted', 'submitted', 'in typesetting', 'schedule for publication', 'published');"""
            cursor.execute(query)
            result = cursor.fetchall()
            print('Manuscript #', 'Status')
            print("--------------------")
            for row in result:
                print(row[0], row[1])
            print("--------------------")
        except mysql.connector.Error as err:
            print(err.msg)
            return False
        return True

    def resign_reviewer(self, reviewer_id: int):
        """Resign a reviewer

        Arguments:
            reviewer_id -- id of the reviewer
        """
        try:
            query = "DELETE FROM `Reviewer` WHERE `reviewer_ID` = {};".format(reviewer_id)
            cursor = conn.cursor()
            cursor.execute(query)
        except mysql.connector.Error as err:
            print(err.msg)
        else:
            print("Thank you for your service!")
            return True
        return False

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
            cursor = conn.cursor()
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
            conn.commit()
            
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


    def process_request(self, request: str):
        """Process the input from the reviewer

        Arguments:
            `request`  -- string
                The user request. It can be one of the following:

        """

        input_list = shlex.split(request)
        input_size = len(input_list)

        action = input_list[0]

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
            cursor = conn.cursor()
            cursor.execute(query)
            success = True
        except mysql.connector.Error as err:
            print(err.msg)
        if success:
            print("Issue {} has been published".format(issue))

        return success

def test_reviewer_handle_request():
    print("Testing reviewer initialization, login")
    reviewer_id = int(input("Enter reviewer ID: "))
    reviewer = Reviewer(reviewer_id)

    while True:
        request = input("Enter request: ")
        if request == "exit":
            break
        reviewer.process_request(request)




if __name__ == '__main__':

    test_reviewer_handle_request()

    notExit = True
    curr_role = None 
    curr_user_id = None
    loggedIn = False
    # while notExit:
    #     action = None
    #     output = None
    #     raw_input = sys.stdin.readline()
    #     input_list = [word.lower() for word in raw_input.split()]
    #     # exit the program
    #     if len(input_list) == 1 and input_list[0] == "exit":
    #         notExit = False
    #     # reviewer
    #     elif len(input_list) >= 2 and input_list[1] == "reviewer"\
    #         or input_list[0] == "resign":
    #         action, output = process_reviewer_input(input_list)
    #         if action and output:
    #             curr_role = "reviewer"
    #             register_res, login_res, resign_res = process_reviewer_sql(action, output)
    #             if register_res != None and register_res == False:
    #                 print("Registration failed")
    #             if login_res != None and login_res == True:
    #                 curr_user_id = output
    #                 process_reviewer_login(curr_user_id)
    #                 curr_role = None
    #                 curr_user_id = None
    #                 loggedIn = False
    #             if login_res != None and login_res == False:
    #                 print("Login failed")
    #             if resign_res != None and resign_res == True:
    #                 loggedIn = False
    #                 curr_user_id = None
        # # Editor
        # elif len(input_list) >= 2 and input_list[1] == "editor":
        #     action, output = process_editor_input(input_list)
        #     if action and output:
        #         curr_role = "editor"
        #         print("action: {}, output: {}".format(action, output))
                # register_res, login_res, resign_res = process_editor_sql(action, output)
                # if register_res != None and register_res == False:
                #     print("Registration failed")
                # if login_res != None and login_res == True:
                #     loggedIn = True
                #     curr_user_id = output
                # if login_res != None and login_res == False:
                #     print("Login failed")
                # if resign_res != None and resign_res == True:
                #     loggedIn = False
                #     curr_user_id = None
                

    

