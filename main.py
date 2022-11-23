#!/usr/bin/env python
# -*- coding: utf-8 -*-

import shlex
from getpass import getpass

from sys import argv

from utils import (
  User, InvalidUser, SuperUser, Author, Editor, Reviewer,
  DBParseError, DBConnectError, connect, warn, info, build_database
)


def user_login(user_id: int) -> User:
  """Login user"""

  try:
    conn = connect()
  except (DBParseError, DBConnectError) as err:
    print(err)
    exit(1)

  cursor = conn.cursor()

  # get user password and encrypt
  cursor.execute(
    f"""
      SELECT MD5('{getpass("Enter password: ")}') AS encrypted_password
    """
  )
  encrypted_password = cursor.fetchone()[0]

  cursor.execute(
    f"""
      SELECT user_type, type_id, password
      FROM credentials
      WHERE user_id = {user_id}
    """
  )
  row = cursor.fetchone()

  # if no record matched, user is nonexistent.
  if row is None:
    warn("User not found")
    return InvalidUser()
  else:
    user_type, type_id, password = row

    # password exists & does not match --> invalid attempt
    if password and password != encrypted_password:
      warn("Incorrect password!\nPlease try again.")
      return InvalidUser()
    elif user_type == "Admin":
      cursor.close()
      return SuperUser(user_id, conn)
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
      warn("Invalid user type, please contact the system administrator.")
      return InvalidUser()
    

def handle_user_login(request: str) -> User:
  """Handle user login"""
  request_tokens = shlex.split(request)
  if len(request_tokens) == 2:
    user_id = int(request_tokens[1])
    return user_login(user_id)
  else:
    warn("Invalid command: too few or too many arguments")
    return InvalidUser()


def main():
  """Main function"""

  if len(argv) == 2:
    if argv[1] == "/clean":
      build_database()

  user_id = int(input("Enter User ID: "))
  user: User = user_login(user_id)
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
