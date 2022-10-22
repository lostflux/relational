/*
  This file contains the SQL statements
  to create tables in the database.
  For the schema, see the schema.pdf file.

  Authors: Amittai Siavava, Ke Lou
 */


-- First, clear the database.
-- We turn off foreign-key checks
-- to allow deletion of referenced tables,
-- then turn foreign-key checks back on.
 
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS RICodes;
DROP TABLE IF EXISTS Affiliation;
DROP TABLE IF EXISTS Journal;
DROP TABLE IF EXISTS Issue;
DROP TABLE IF EXISTS Editor;
DROP TABLE IF EXISTS Reviewer;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Manuscript_Author;
DROP TABLE IF EXISTS Journal_has_RICodes;
DROP TABLE IF EXISTS Reviewer_has_Manuscript;
DROP TABLE IF EXISTS Manuscript;

SET FOREIGN_KEY_CHECKS = 1;



-- Create tables topologically,
-- starting with those that have no foreign keys.


CREATE TABLE RICodes
  (
    code      INT   NOT NULL  PRIMARY KEY   AUTO_INCREMENT,
    interest  VARCHAR(45)
  );

CREATE TABLE Affiliation
  (
    affiliation_ID  INT   NOT NULL  PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(45)
  );

CREATE TABLE Journal
  (
    journal_ID    INT   NOT NULL      PRIMARY KEY AUTO_INCREMENT,
    journal_name   VARCHAR(45)
  );

CREATE TABLE Issue
  (
    issue_ID            INT   NOT NULL  PRIMARY KEY   AUTO_INCREMENT,
    year                INT   NOT NULL,
    period              INT   NOT NULL CHECK (period >= 1 AND period <= 4),
    publication_date    DATE,
    Journal_journal_ID  INT,
    FOREIGN KEY         (Journal_journal_ID)  REFERENCES Journal(journal_ID)
  );

CREATE TABLE Editor
  (
    editor_ID           INT   NOT NULL  PRIMARY KEY   AUTO_INCREMENT,
    email               VARCHAR(45),
    f_name              VARCHAR(45),
    l_name              VARCHAR(45),
    Journal_journal_ID  INT,
    FOREIGN KEY         (Journal_journal_ID)   REFERENCES Journal(journal_ID)
  );

CREATE TABLE Reviewer
  (
    reviewer_ID                 INT   NOT NULL  PRIMARY KEY   AUTO_INCREMENT,
    email                       VARCHAR(45),
    f_name                      VARCHAR(45),
    l_name                      VARCHAR(45),
    Affiliation_affiliation_ID  INT,
    FOREIGN KEY   (Affiliation_affiliation_ID)   REFERENCES Affiliation(affiliation_ID)
  );

CREATE TABLE Author
  (
    author_ID                   INT   NOT NULL  PRIMARY KEY   AUTO_INCREMENT,
    Affiliation_affiliation_ID  INT,
    f_name                      VARCHAR(45),
    l_name                      VARCHAR(45),
    email                       VARCHAR(45),
    FOREIGN KEY   (Affiliation_affiliation_ID)   REFERENCES Affiliation(affiliation_ID)
  );

CREATE TABLE Manuscript
  (
    manuscript_number INT            NOT NULL  PRIMARY KEY   AUTO_INCREMENT,
    title             VARCHAR(255)   NOT NULL,
    date_received     DATE           NOT NULL,
    status            VARCHAR(45),
    page_number       INT,
    page_count        INT,
    date_accepted     DATE,
    status_change_date DATE,
    RICodes_code      INT,
    Editor_editor_ID  INT,
    Issue_issue_ID    INT,
    FOREIGN KEY       (RICodes_code)      REFERENCES RICodes(code),
    FOREIGN KEY       (Editor_editor_ID)  REFERENCES Editor(editor_ID),
    FOREIGN KEY       (Issue_issue_ID)    REFERENCES Issue(issue_ID)
  );


--  Create helper tables for relationships.




CREATE TABLE Manuscript_Author
  (
    Manuscript_manuscript_number  INT   NOT NULL,
    Author_author_ID              INT   NOT NULL,
    author_ordinal                INT,
    PRIMARY KEY   (Manuscript_manuscript_number, Author_author_ID),
    FOREIGN KEY   (Manuscript_manuscript_number)  REFERENCES Manuscript(manuscript_number),
    FOREIGN KEY   (Author_author_ID)              REFERENCES Author(author_ID),
    UNIQUE        (Manuscript_manuscript_number, author_ordinal)
  );

CREATE TABLE Journal_has_RICodes
  (
    Journal_journal_ID  INT   NOT NULL,
    RICodes_code        INT   NOT NULL,
    PRIMARY KEY         (Journal_journal_ID, RICodes_code),
    FOREIGN KEY   (Journal_journal_ID)  REFERENCES Journal(journal_ID),
    FOREIGN KEY   (RICodes_code)        REFERENCES RICodes(code)
  );

CREATE TABLE Reviewer_has_Manuscript
  (
    Reviewer_reviewer_ID      INT   NOT NULL,
    Manuscript_manuscript_number  INT   NOT NULL,
    date_sent                 DATE,
    appropriateness           INT   CHECK (appropriateness >= 1 AND appropriateness <= 10),
    clarity                   INT   CHECK (clarity >= 1         AND clarity <= 10),
    methodology               INT   CHECK (methodology >= 1     AND methodology <= 10),
    experimental              INT   CHECK (experimental >= 1    AND experimental <= 10),
    recommendation            INT   CHECK (recommendation >= 1  AND recommendation <= 10),
    feedback_date             DATE,
    PRIMARY KEY   (Reviewer_reviewer_ID, Manuscript_manuscript_number),
    FOREIGN KEY   (Reviewer_reviewer_ID)      REFERENCES Reviewer(reviewer_ID),
    FOREIGN KEY   (Manuscript_manuscript_number)  REFERENCES Manuscript(manuscript_number)
  );
