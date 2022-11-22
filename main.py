#!/usr/bin/env python
# -*- coding: utf-8 -*-

from mysql.connector import MySQLConnection, Error, errorcode, FieldType
from dbconfig import read_db_config
import shlex
from getpass import getpass

from author import Author
from editor import Editor
from reviewer import Reviewer


def user_login(user_id: int):
    """Login user"""

    try:
        db_config = read_db_config()
        conn = MySQLConnection(**db_config)
        cursor = conn.cursor()

        user_password = getpass("Enter password: ")
        encryption_query = f"""
            SELECT MD5('{user_password}') AS encrypted_password
        """

        cursor.execute(encryption_query)
        encrypted_password = cursor.fetchone()[0]

        fetch_user = f"""
            SELECT user_type, type_id, password
            FROM credentials
            WHERE user_id = {user_id}"""
        cursor.execute(fetch_user)
        row = cursor.fetchone()
        if row is not None:
            user_type, type_id, password = row
            if password and password != encrypted_password:
                print("Incorrect password!\nPlease try again.")
                return None
            elif user_type == "Author":
                cursor.close()
                return Author(type_id, conn)
            elif user_type == "Editor":
                cursor.close()
                return Editor(type_id, conn)
            elif user_type == "Reviewer":
                cursor.close()
                return Reviewer(type_id, conn)
            else:
                print("Invalid user type, please contact the system administrator")
        else:
            print("User not found")
    except Error as error:
        print(f"Error connecting to MySQL: {error}")

def handle_user_login(request: str):
    """Handle user login"""
    request_tokens = shlex.split(request)
    if len(request_tokens) == 2:
        user_id = int(request_tokens[1])
        return user_login(user_id)
    else:
        print("Invalid command: too few or too many arguments")
        return None


def main():
    """Main function"""
    user_id = int(input("Enter User ID: "))
    user: "Author | Editor | Reviewer"  = user_login(user_id)
    while user:
        request = input(f"{user.prompt} ")
        if request.startswith("login"):
            new_user = handle_user_login(request)
            if new_user:
                user = new_user
        else:
            user.handle_request(request)

if __name__ == '__main__':
    main()
