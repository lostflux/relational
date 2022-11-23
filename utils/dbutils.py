#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
  Utilities for the database
"""

from typing import List
from mysql.connector import DatabaseError

from .dbconfig import connect, DBParseError, DBConnectError, ConnectionHandler
from .colors import warn, info

import os

def read_sql_file(path: str) -> List[str]:
  """
    Read a SQL file and return its contents.
  """
  commands = []
  delim = ';'
  block_comment = False
  with open(path, 'r') as f:

    command = ""
    for line in f:
      line = line.strip()

      # ignore empty lines
      if line == '':
        continue

      # ignore block comments
      elif block_comment and line.endswith("*/"):
        block_comment = False
        continue
      elif line.startswith('/*'):
        block_comment = True
        continue
      elif block_comment:
        continue

      # ignore single line comments
      elif line.startswith('--'):
        continue

      # handle delimiters
      elif line.startswith("DELIMITER"):
        delim = line.split(" ")[1]
        if len(command) > 0:
          commands.append(command)
          command = ""

      # handle normal commands
      else:
        command += f"\n{line}"
        if command.endswith(delim):
          commands.append(command.replace(delim, ""))
          command = ""
  return commands

def build_database(config_file="dbconfig.ini", load_data=True):
  """
    Rebuild the database.
  """

  path = os.path.join(os.path.dirname(__file__), "sql")
  
  commands = read_sql_file(f"{path}/clear.sql")
  commands += read_sql_file(f"{path}/tables.sql")
  commands += read_sql_file(f"{path}/views.sql")
  commands += read_sql_file(f"{path}/triggers.sql")
  commands += read_sql_file(f"{path}/procedures.sql")

  with connect(filename=config_file) as conn:
    cursor = conn.cursor(buffered=True)
    for command in commands:
      cursor.execute(command)
    conn.commit()
    info("Database built successfully")
    
    # load data if necessary
    if load_data:
      info("Inserting data into database...")
      insert_commands = read_sql_file(f"{path}/data.sql")
      for command in insert_commands:
        try:
          cursor.execute(command)
        except DatabaseError as err:
          warn(f"Some data was skipped due to inconsistency.")
        except Exception as e:
          raise

      info("Data inserted successfully")
      conn.commit()
    cursor.close()

if __name__ == '__main__':

  build_database(load_data=True)
