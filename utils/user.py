#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# import abstract base class
from abc import ABC, abstractmethod

from .logging import Logging, warn

class User(ABC):
  """
    An abstract base class for database users supporting:
      - user providing a request prompt
      - user handling a request string
  """
  
  @abstractmethod
  def prompt(self) -> str:
    """
      Interface for user prompting a request on the terminal.
    """
    return NotImplemented

  @abstractmethod
  def handle_request(self, request: str):
    """
      Interface for user handling a request string.
    """
    return NotImplemented

  def __bool__(self):
    """
      Return True if the user is valid.
    """
    return NotImplemented

class InvalidUser(User):
  """
    Invalid users for whatever reason.
    
    No actions allowed.
  """

  def __init__(self, *args, **kwargs):
    warn("Invalid user, please log in again!")

  def __bool__(self):
    return False
    
  def prompt(self) -> str:
    return Logging.warning("Invalid user, please log in again!")

  def handle_request(self, request: str):
    print(Logging.warning("Invalid user, please log in again!"))

