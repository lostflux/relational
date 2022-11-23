-- Active: 1666333950149@@127.0.0.1@3306@testt


-- DROP TABLES
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
DROP TABLE IF EXISTS Reviewer_has_RICodes;
DROP TABLE IF EXISTS credentials;

SET FOREIGN_KEY_CHECKS = 1;

-- DROP TRIGGERS
DROP TRIGGER IF EXISTS DeleteAssignmentOnReviewerResign;
DROP TRIGGER IF EXISTS AutoRejectManuscriptOnNoReviewers;
DROP TRIGGER IF EXISTS manuscript_become_accepted;
DROP TRIGGER IF EXISTS AutoAcceptManuscript;
DROP TRIGGER IF EXISTS ResetManuscriptStatusonReviewerResign;
DROP TRIGGER IF EXISTS IndexAuthor;
DROP TRIGGER IF EXISTS IndexReviewer;
DROP TRIGGER IF EXISTS IndexEditor;

-- DROP PROCEDURES
DROP PROCEDURE IF EXISTS MakeDecision;

-- DROP VIEWS
DROP VIEW IF EXISTS LeadAuthorManuscripts;
DROP VIEW IF EXISTS AnyAuthorManuscripts;
DROP VIEW IF EXISTS PublishedIssues;
DROP VIEW IF EXISTS ReviewQueue;
DROP VIEW IF EXISTS ReviewStatus;
DROP VIEW IF EXISTS WhatsLeft;