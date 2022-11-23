#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from getpass import getpass
import shlex

from .dbutils import ConnectionHandler, DBConnectError, DBParseError, warn, info
from .user import User
from .colors import Colors

class SuperUser(User):
  """
    SuperUser is a user with extra privileges
    to manage the database.
  """

  def __init__(self, user_id: int, conn: ConnectionHandler):
    self.user_id = user_id
    self.conn = conn

  def __bool__(self):
    return self.conn.is_connected()

  def handle_request(self, request: str):
    """
      Handle a request string.
    """

    if len(tokens := shlex.split(request)) == 0:
      return

    command = tokens[0]

    if command == "status":
      print(f"Admin ID: {self.user_id}\n{self.status()}")

    elif command == "register":
      if len(tokens) != 4:
        warn("Invalid number of arguments")
        return

      # [register, <fname>, <lname>, <user_type>]
      self.register_user(*tokens[1:])
    else:
      warn("Invalid request")

  @property
  def prompt(self):
    """
      Print the user prompt in the terminal
    """
    return f"Admin {self.user_id}> "

  def status(self):
    """
      Get summary status of database.

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
    results = ""
    title = "Status"
    title = f"| Manuscript #### | {title:>30} |"
    delim = "-" * len(title)
    for row in cursor:
      manuscript_number, status = row
      results += f"| Manuscript {manuscript_number:4d} | {status:>30} |\n{delim}\n"
    cursor.close()
    if len(results) == 0:
      results = "No manuscripts in database."
    else:
      results = f"{delim}\n{title}\n{delim}\n{results}"

    return Colors.info(results)


  def register_user(self,  user_type: str, fname: str, lname: str):
    """Register a user

    Parameters
    ----------
    `fname` : str
      First name of the user
    lname : str
      Last name of the user
    user_type : str
      Type of the user
    """
    user_type = user_type.title()
    assert user_type in ["Author", "Editor", "Reviewer", "Admin"], "Invalid user type"

    cursor = self.conn.cursor()

    user_id = None

    query = f"""
      INSERT INTO `{user_type}` (f_name,l_name)
      VALUES ('{fname}','{lname}')
    """

    cursor.execute(query)
    self.conn.commit()

    cursor.execute(f"""
      SELECT user_id
      FROM credentials
      WHERE user_type = '{user_type}'
      AND type_id = {cursor.lastrowid}
    """)

    if cursor.rowcount == 0:
      warn("User registration failed")
      user_id = None
    else:
      user_id = cursor.fetchone()[0]

    password = getpass("Enter password (default empty): ")

    if password:
      password_query = f"""
        UPDATE credentials
        SET password = MD5('{password}')
        WHERE
          user_type = "{user_type}"
          AND type_id = "{user_id}"
      """

      cursor.execute(password_query)
      self.conn.commit()

    info(f"\nUser registered with user_id: {user_id}\n")

    
    cursor.close()
    
