from mysql.connector import MySQLConnection, Error, errorcode, FieldType
from dbconfig import read_db_config
import getpass
import sys
import mysql

# Added the last two imports above to fix problems running on some systems

def drop_table_if_exists(cursor, tablename):
    """Drop the specified table using the mysql connection cursor       
    
    Arguments:
        cursor  -- mysql connection cursor 
        tablename  -- string name of table to be dropped if exists
    """
    try:
        print("Dropping",tablename)
        cursor.execute("DROP TABLE IF EXISTS {}".format(tablename))

    except Error as error:
        print(error)

def add_members(mycursor):
    member_list = ( ('Vincent','Colleen'),
                    ('Blankenship','Shaine'),
                    ('Stout','Bradley'),
                    ('Kennedy','Taylor'),
                    ('Booth','Karen'),
                    ('Conley','Raven'),
                    ('Clark','Serina'),
                    ('Carpenter','Walker'),
                    ('Reid','Alice'),
                    ('Hendrix','Vielka')
                )
    for mem in member_list:
        print("adding: {}, {} ...".format(mem[0],mem[1]), end='')
        add_member(mycursor,mem)

def add_member(cursor, mem):
    try:
        query = "INSERT INTO `members` (`last_name`,`first_name`) VALUES ('{}','{}');".format(mem[0], mem[1])
        print("-->",query,"<--", end='')
        cursor.execute(query)
    except mysql.connector.Error as err:
        print(err.msg)
    else:
        print("OK")

def mysqldemo():
    """ This is a simple program to demonstrate using the MySQL connector in Python.

        1. Get DB credentials from config file
            if password is null, get it from the user
        2. Connect to the MySQL DB with those credentials.
        3. Drop TABLE IF EXISTS mysqldemo
        4. Do these SQL commands 
            DROP TABLE IF EXISTS 'authors';
            CREATE TABLE 'authors' (
            'id' int(11) NOT NULL AUTO_INCREMENT,
            'first_name' varchar(40) NOT NULL,
            'last_name' varchar(40) NOT NULL,
            'photo' blob,
            PRIMARY KEY ('id')
            ) ENGINE=InnoDB;

            # Data for the table 'authors'
            insert  into 'authors' ... initially with missingPhoto.jpg(blob)
            # do various SQL things
            select ...
            select where...
            update
            select where...
            delete
            select where...
            ...
    """ 

    dbconfig = read_db_config()
    if dbconfig['password'] == "":  
        dbconfig['password'] = getpass.getpass("database password ? :")
    
    print(dbconfig)
    mycursor = None

    # Connect to the database
    try:
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
     

    # Ensure the table is gone before we try to create it
    print("!", end='')
    print(mycursor.rowcount)
    print("!")
    drop_table_if_exists(mycursor, "members")
        
    # Create the table
    ct = (
    "CREATE TABLE `members` ("
    "  `id` int(11) NOT NULL AUTO_INCREMENT,"
    "  `last_name` varchar(40) NOT NULL,"
    "  `first_name` varchar(40) NOT NULL,"
    "  PRIMARY KEY (`id`)"
    ") ENGINE=InnoDB")

    try:
        print("Creating members table:")
        print(ct)
        print(":")
        mycursor.execute(ct)
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_TABLE_EXISTS_ERROR:
            print("already exists.")
        else:
            print(err.msg)
    else:
        print("OK")

    # Add some members

    add_members(mycursor)

# and commit

    conn.commit()
    print("=== now get a member back ===")

    mycursor.execute("SELECT * FROM members LIMIT 1")
    rows = mycursor.fetchall()

    print('Total Row(s):', mycursor.rowcount)
    for row in rows:
       print(row)


    ##### WARNING #####
    # The rest of this demo will FAIL with mysql missing database errors
    # if you have not run the soccer.sql file

    # Now access another table and show its members
    mycursor.execute("SELECT * FROM College")
    rows = mycursor.fetchall()

    print('Total Row(s):', mycursor.rowcount)
    for row in rows:
        print(row)

    # Check attribute types
    mycursor.execute("SELECT * FROM College")
    for i in range(len(mycursor.description)):
        print("Column {}:".format(i+1))
        desc = mycursor.description[i]
        print("  column_name = {}".format(desc[0]))
        print("  type = {} ({})".format(desc[1], FieldType.get_info(desc[1])))
        print("  null_ok = {}".format(desc[6]))
        print("  column_flags = {}".format(desc[7]))

        
    print("All done - closing up.")

    mycursor.close()
    conn.cmd_reset_connection()
    conn.close()
    print("DONE")


def process_reviewer_input(input_list):
    """Process the input from the reviewer

    Arguments:
        input_list  -- list of input strings
    """
    input_size = len(input_list)
    # resign <reviwer_id>
    if input_size == 2:
        if input_list[0] == "resign" and input_list[1].isnumeric():
            action = "resign"
            reviewr_id = input_list[1]
            return action, reviewr_id
        else:
            print("Invalid input for resign statement")
            return None, None
    # login reviewer <reviewer_id>
    elif input_size == 3:
        if input_list[0] == "login" and input_list[2].isnumeric():
            action = "login"
            reviewer_id = input_list[2]
            return action, reviewer_id
        else:
            print("Invalid input for login statement")
            return None, None
    # register reviewer <fname> <lname> <ICode1> <ICode2> <ICode3>
    elif 5<= input_size <= 7:
        if input_list[0] == "register":
            action = "register"
            fname = input_list[2]
            lname = input_list[3]
            ICode_list = input_list[4:]
            for ICode in ICode_list:
                if not ICode.isnumeric():
                    print("Invalid RICode input, RICodes must be numeric")
                    return None, None
            return action, (fname, lname, ICode_list)
        else:
            print("Invalid input for register statement")
            return None, None
    else:
        print("Invalid input size")
        return None, None

def process_reviewer_action(input_list):
    """Process the input from the reviewer

    Arguments:
        input_list  -- list of input strings
    """
    input_size = len(input_list)
    if input_size != 6:
        print("Invalid input size")
        return None, None
    else:
        action = None
        if input_list[0] == "reject":
            action = "reject"
        elif input_list[0] == "accept":
            action = "accept"
        else:
            print("Invalid input for reviewer action")
            return None, None

        manuscriptid = input_list[1]
        ascore = input_list[2]
        cscore = input_list[3]
        mscore = input_list[4]
        escore = input_list[5]
        return action, (manuscriptid, ascore, cscore,mscore,escore)
  

def register_reviewer(cursor, fname, lname, ICode_list):
    """Register a reviewer

    Arguments:
        fname       -- first name of the reviewer
        lname       -- last name of the reviewer
        ICode_list  -- list of interest codes
    """
    reviewer_id = None
    try:
        query = "INSERT INTO `Reviewer` (`f_name`,`l_name`) VALUES ('{}','{}');".format(fname, lname)
        print("-->",query,"<--", end='')
        cursor.execute(query)
        reviewer_id = cursor.lastrowid
        for ICode in ICode_list:
            query = "INSERT INTO `Reviewer_has_RICodes` (`Reviewer_reviewer_ID`, `RICodes_code`) VALUES ({}, {});".format(reviewer_id, ICode)
            print("-->",query,"<--", end='')
            cursor.execute(query)
    except mysql.connector.Error as err:
        print(err.msg)
    else:
        print("OK")
        print("You have been registered as reviewer with ID: {}".format(reviewer_id))
        return True
    return False

def login_reviewer(cursor, reviewer_id):
    """Login a reviewer

    Arguments:
        reviewer_id -- id of the reviewer
    """
    try:
        query = "SELECT CONCAT('Hello, ', Reviewer.`f_name`, ' ', Reviewer.`l_name`) FROM `Reviewer` WHERE Reviewer.`reviewer_ID` = {};".format(reviewer_id)
        print("-->",query,"<--", end='')
        cursor.execute(query)
        print("Below is a list of manuscripts assigned to you:")
        query = "SELECT Reviewer_has_Manuscript.`Manuscript_manuscript_number` AS `Manuscript #`, Manuscript.status FROM Reviewer_has_Manuscript, Manuscript WHERE Reviewer_has_Manuscript.`Reviewer_reviewer_ID` = 1 AND Manuscript.manuscript_number =Reviewer_has_Manuscript.`Manuscript_manuscript_number` ORDER BY FIELD(Manuscript.status, 'under review', 'rejected', 'accepted', 'submitted', 'in typesetting', 'schedule for publication', 'published');"
        cursor.execute(query)
    except mysql.connector.Error as err:
        print(err.msg)
    else:
        print("OK")
        return True
    return False

def resign_reviewer(cursor, reviewer_id):
    """Resign a reviewer

    Arguments:
        reviewer_id -- id of the reviewer
    """
    try:
        query = "DELETE FROM `Reviewer` WHERE `reviewer_ID` = {};".format(reviewer_id)
        print("-->",query,"<--", end='')
        cursor.execute(query)
    except mysql.connector.Error as err:
        print(err.msg)
    else:
        print("OK") 
        print("Thank you for your service!")
        return True
    return False

def process_reviewer_sql(action, output):
    cursor = None
    if action == "register":
        register_res = register_reviewer(cursor,output[0], output[1], output[2])
        return register_res, None, None
    elif action == "login":
        login_res = login_reviewer(cursor, output)
        return None, login_res, None
    elif action == "resign":
        resign_res = resign_reviewer(cursor, output)
        return None, None, resign_res
    else:
        return None, None, None

def set_manuscript_opinion(cursor, action, reviewer_id, output):
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
        query = "SELECT IF(SUM(Reviewer_has_Manuscript.`Manuscript_manuscript_number` = {}), 'Y', 'N') AS RES FROM Reviewer_has_Manuscript GROUP BY `REVIEWER_reviewer_ID` HAVING `REVIEWER_reviewer_ID` = {};".format(manuscript_id, reviewer_id)
        print("-->",query,"<--", end='')
        cursor.execute(query)

        reviewer_has_manu = cursor.fetchall()
        if reviewer_has_manu[0][0] == 'N':
            print("You are not assigned to this manuscript")
            return False
        
        query = "SELECT `status` FROM Manuscript WHERE `manuscript_number` = {};".format(manuscript_id)
        print("-->",query,"<--", end='')
        cursor.execute(query)
        manuscript_status = cursor.fetchall()
        if manuscript_status[0][0] != 'under review':
            print("This manuscript is not under review")
            return False
        
        if action == "accept":
            query = "UPDATE Reviewer_has_Manuscript SET `appropriateness` = {}, `clarity` = {}, `methodology`={}, `experimental`={}, `recommendation`= {} WHERE Reviewer_has_Manuscript.`Reviewer_reviewer_ID` = {} AND Reviewer_has_Manuscript.`Manuscript_manuscript_number`={};".format(ascore, cscore, mscore, escore, accept_score, reviewer_id, manuscript_id)
        elif action =="reject":
            query = "UPDATE Reviewer_has_Manuscript SET `appropriateness` = {}, `clarity` = {}, `methodology`={}, `experimental`={}, `recommendation`= {} WHERE Reviewer_has_Manuscript.`Reviewer_reviewer_ID` = {} AND Reviewer_has_Manuscript.`Manuscript_manuscript_number`={};".format(ascore, cscore, mscore, escore, reject_score, reviewer_id, manuscript_id)
        print("-->",query,"<--", end='')
        cursor.execute(query)
            
    except mysql.connector.Error as err:
        print(err.msg)
    else:
        print("OK") 
        print("Successfully set your opinion on the manuscript")
        return True
    return False

def process_reviewer_login(reviewer_id):
    loggedIn = True
    print("You're currently loggedin as reviewer {}".format(reviewer_id))
    print("Use logout to logout")
    while loggedIn:
        raw_input = sys.stdin.readline()
        input_list = [word.lower() for word in raw_input.split()]
        # exit the login
        if len(input_list) == 1 and input_list[0] == "logout":
            loggedIn = False
        else:
            action, output = process_reviewer_action(input_list)
            print("action: {}, output: {}".format(action, output))
            if action and output:
                # print("action: {}, output: {}".format(action, output))
                process_reviewer_action_sql(curr_user_id, action, output)
    return

def process_reviewer_action_sql(reviewer_id, action, output):
    cursor = None
    res = set_manuscript_opinion(cursor, action, reviewer_id, output)
    return res

def process_editor_input(input_list):
    """Process the input of the editor

    Arguments:
        input_list -- list of the input
    """
    if len(input_list) != 4:
        print("Invalid input length")
        return False
    
def register_editor(cursor, fname, lname):
    """Register a editor

    Arguments:
        fname       -- first name of the reviewer
        lname       -- last name of the reviewer
    """
    editor_id = None
    try:
        query = "INSERT INTO `Editor` (`f_name`,`l_name`) VALUES ('{}','{}');".format(fname, lname)
        print("-->",query,"<--", end='')
        cursor.execute(query)
        editor_id = cursor.lastrowid
    except mysql.connector.Error as err:
        print(err.msg)
    else:
        print("OK")
        print("You have been registered as editor with ID: {}".format(editor_id))
        return True
    return False

def publish_issue(cursor, issue):
    """Publish an issue

    Arguments:
        issue       -- issue number
    """
    try:
        query = "UPDATE `Manuscript` SET `status` = 'published' WHERE `issue` = {};".format(issue)
        print("-->",query,"<--", end='')
        cursor.execute(query)
    except mysql.connector.Error as err:
        print(err.msg)
    else:
        print("OK")
        print("Issue {} has been published".format(issue))
        return True
    return False


if __name__ == '__main__':
    # mysqldemo()

    notExit = True
    curr_role = None 
    curr_user_id = None
    loggedIn = False
    while notExit:
        action = None
        output = None
        raw_input = sys.stdin.readline()
        input_list = [word.lower() for word in raw_input.split()]
        # exit the program
        if len(input_list) == 1 and input_list[0] == "exit":
            notExit = False
        # reviewer
        elif len(input_list) >= 2 and input_list[1] == "reviewer"\
            or input_list[0] == "resign":
            action, output = process_reviewer_input(input_list)
            if action and output:
                curr_role = "reviewer"
                print("action: {}, output: {}".format(action, output))
                register_res, login_res, resign_res = process_reviewer_sql(action, output)
                if register_res != None and register_res == False:
                    print("Registration failed")
                if login_res != None and login_res == True:
                    curr_user_id = output
                    process_reviewer_login(curr_user_id)
                    curr_role = None
                    curr_user_id = None
                    loggedIn = False
                if login_res != None and login_res == False:
                    print("Login failed")
                if resign_res != None and resign_res == True:
                    loggedIn = False
                    curr_user_id = None
        # Editor
        elif len(input_list) >= 2 and input_list[1] == "editor":
            action, output = process_editor_input(input_list)
            if action and output:
                curr_role = "editor"
                print("action: {}, output: {}".format(action, output))
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
                

    

