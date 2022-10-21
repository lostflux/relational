/* Scripts to create tables in the database */

CREATE DATABASE ps2;

USE ps2;

/* Create Manuscript table */
DROP TABLE IF EXISTS Manuscript;
CREATE TABLE Manuscript
  (
    manuscript_NO     INT           NOT NULL  PRIMARY KEY   AUTO_INCREMENT,
    title             VARCHAR(255)  NOT NULL,
    date_received     DATE          NOT NULL,
    status            VARCHAR(45),
    page_count        INT,
    date_accepted     DATE,
    RICode_code       INT   FOREIGN KEY   REFERENCES RICode(code),
    Editor_editor_ID  INT   FOREIGN KEY   REFERENCES Editor(editor_ID),
    Issue_issue_ID    INT   FOREIGN KEY   REFERENCES Issue(issue_ID)
  );

/* Create Issue table */
DROP TABLE IF EXISTS Issue;
CREATE TABLE Issue
  (
    issue_ID            INT   NOT NULL  PRIMARY KEY AUTO_INCREMENT,
    year                INT   NOT NULL,
    period              INT   NOT NULL,
    publication_date    DATE,
    Journal_journal_ID  INT   FOREIGN KEY   REFERENCES Journal(journal_ID)
  );

/* Create Author table */
DROP TABLE IF EXISTS Author;
CREATE TABLE Author
  (
    author_ID                   INT   NOT NULL  PRIMARY KEY   AUTO_INCREMENT,
    Affiliation_affiliation_ID  INT   NOT NULL  FOREIGN KEY   REFERENCES Affiliation(affiliation_ID),
    f_name                      VARCHAR(45),
    l_name                      VARCHAR(45),
    email                       VARCHAR(45)
  );

/* Create Affiliation table */
DROP TABLE IF EXISTS Affiliation;
CREATE TABLE Affiliation
  (
    affiliation_ID  INT   NOT NULL  PRIMARY KEY AUTO_INCREMENT,
    name            VARCHAR(45)
  );

/* Create RICode table */
DROP TABLE IF EXISTS RICode;
CREATE TABLE RICode
  (
    code      INT   NOT NULL  PRIMARY KEY   AUTO_INCREMENT,
    interest  VARCHAR(45)
  );

/* Create Journal table */
DROP TABLE IF EXISTS Journal;
CREATE TABLE Journal
  (
    journal_ID    INT   NOT NULL      PRIMARY KEY AUTO_INCREMENT,
    RICode_code   INT   FOREIGN KEY   REFERENCES RICode(code),
  );

/* Create Editor table */
DROP TABLE IF EXISTS Editor;
CREATE TABLE Editor
  (
    editor_ID           INT   NOT NULL  PRIMARY KEY   AUTO_INCREMENT,
    email               VARCHAR(45),
    f_name              VARCHAR(45),
    l_name              VARCHAR(45),
    Journal_journal_ID  INT   FOREIGN KEY   REFERENCES Journal(journal_ID)
  );

/* Create Reviewer table */
DROP TABLE IF EXISTS Reviewer;
CREATE TABLE Reviewer
  (
    reviewer_ID                 INT   NOT NULL  PRIMARY KEY   AUTO_INCREMENT,
    email                       VARCHAR(45),
    f_name                      VARCHAR(45),
    l_name                      VARCHAR(45),
    Affiliation_affiliation_ID  INT   FOREIGN KEY   REFERENCES Affiliation(affiliation_ID)
  );

/*
  Create helper tables for relationships.
*/

/* Create Manuscript_Author table */
DROP TABLE IF EXISTS Manuscript_Author;
CREATE TABLE Manuscript_Author
  (
    Manuscript_manuscript_NO  INT   NOT NULL  FOREIGN KEY   REFERENCES Manuscript(manuscript_NO),
    Author_author_ID          INT   NOT NULL  FOREIGN KEY   REFERENCES Author(author_ID),
    author_ordinal            INT,
    PRIMARY KEY               (Manuscript_manuscript_NO, Author_author_ID)
  );

/* Create Journal_has_RICodes table */
DROP TABLE IF EXISTS Journal_has_RICodes;
CREATE TABLE Journal_has_RICodes
  (
    Journal_journal_ID  INT   NOT NULL  FOREIGN KEY   REFERENCES Journal(journal_ID),
    RICode_code         INT   NOT NULL  FOREIGN KEY   REFERENCES RICode(code),
    PRIMARY KEY         (Journal_journal_ID, RICode_code)
  );

/* Create Reviewer_has_Manuscript table */
DROP TABLE IF EXISTS Reviewer_has_Manuscript;
CREATE TABLE Reviewer_has_Manuscript
  (
    Reviewer_reviewer_ID      INT   NOT NULL FOREIGN KEY REFERENCES Reviewer(reviewer_ID),
    Manuscript_manuscript_NO  INT   NOT NULL FOREIGN KEY REFERENCES Manuscript(manuscript_NO),
    date_sent                 DATE,
    appropriateness           INT   CHECK (appropriateness >= 1 AND appropriateness <= 10),
    clarity                   INT   CHECK (clarity >= 1 AND clarity <= 10),
    methodology               INT   CHECK (methodology >= 1 AND methodology <= 10),
    experimental              INT   CHECK (experimental >= 1 AND experimental <= 10),
    recommendation            INT   CHECK (recommendation >= 1 AND recommendation <= 10),
    feedback_date             DATE,
    PRIMARY KEY               (Reviewer_reviewer_ID, Manuscript_manuscript_NO)
  );
