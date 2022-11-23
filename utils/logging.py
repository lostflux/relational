#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
  Generic handler for colors on the terminal.
"""

class Logging:
  HEADER = '\033[95m'
  BLUE = '\033[94m'
  CYAN = '\033[96m'
  GREEN = '\033[92m'
  WARNING = '\033[93m'
  FAIL = '\033[91m'
  END = '\033[0m'
  BOLD = '\033[1m'
  UNDERLINE = '\033[4m'

  def warning(s: str):
    """
      Format a string with WARNING color.
    """
    return f"{Logging.WARNING}{s}{Logging.END}"

  def info(s: str):
    """
      Format a string with INFO color.
    """
    return f"{Logging.BLUE}{s}{Logging.END}"

def warn(s: str):
  """
    Print a warning string.
  """
  print(f"{Logging.warning(s)}")

def info(s: str):
  """
    Print an info string.
  """
  print(f"{Logging.CYAN}{s}{Logging.END}")
