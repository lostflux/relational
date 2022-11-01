/* Tests for the triggers defined in the database */

/* 
   Test case 1: change the status of manuscript 18 to accepted
   Before: status = 'under review'
   After: status = 'typesetting'
   Note: the trigger will change everything in the database
         that is have a status of accepted to typesetting
*/
SELECT * FROM Manuscript WHERE Manuscript.manuscript_number = 18;

UPDATE Manuscript SET Manuscript.status = 'accepted' WHERE Manuscript.manuscript_number = 18;

SELECT * FROM Manuscript WHERE Manuscript.manuscript_number = 18;

/*
  Test case 2: auto-reject manuscripts for icodes with no reviewers
 */

INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id,page_number)
VALUES
  ("fringilla euismod enim. Etiam gravida molestie arcu.","2021-11-13","in typesetting",6,"2021-04-05",2000,2,9,1),
  ("eu, ultrices sit amet, risus. Donec","2022-06-11","schedule for publication",17,"2024-07-06",800,4,3,27);


/* 
  Test case 3: ResetManuscriptStatusonReviewerResign
  Before: status = 'under review'
  After: status = 'submitted' IF other reviewers available
          status = 'rejected' IF no other reviewers available
*/

INSERT INTO RICodes (code,interest)
VALUES
  (11,"Test Category 1"), -- 11
  (12,"Test Category 2"), -- 12
  (13,"Test Category 3"), -- 13
  (14,"Test Category 4"); -- 14

DROP PROCEDURE IF EXISTS AddTestData;
DELIMITER $$
CREATE PROCEDURE AddTestData()
BEGIN

  INSERT INTO Reviewer (email,f_name,l_name,Affiliation_affiliation_id)
  VALUES
    ("amittai@outlook.com","Amittai","Siavava",1), -- 61
    ("lou.gmail.com","Ke","Lou",1), -- 62
    ("siavava@outlook.com","Amittai","Siavava",1), -- 63
    ("ke.gmail.com","Ke","Lou",1); -- 64

  INSERT INTO Reviewer_has_RICodes (Reviewer_reviewer_id,RICodes_code)
  VALUES
    (61,11),
    (62,11),
    (62,12),
    (63,13),
    (64,13),
    (64,14);


  INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id,page_number)
  VALUES
    ("First","2021-11-13","under review",6,"2021-04-05",11,2,9,1), -- 201
    ("Second","2022-06-11","under review",17,"2024-07-06",12,4,3,27), -- 202
    ("Third","2022-06-11","under review",17,"2024-07-06",13,4,3,27), -- 203
    ("Fourth","2022-06-11","under review",17,"2024-07-06",14,4,3,27); -- 204


  INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
  VALUES
    (61,201,"2022-10-26",5,6,4,9,6,"2024-05-02"),
    (62,202,"2022-10-26",5,6,4,9,6,"2024-05-02"),
    (63,203,"2022-10-26",5,6,4,9,6,"2024-05-02"),
    (64,204,"2022-10-26",5,6,4,9,6,"2024-05-02");
END$$
DELIMITER ;


-- 201 has RICode 11, assignable to ether 61 or 62.
-- 201 is only currently aassigned to 61
-- when we delete the assignment to reviewer 61, 201 should revert to "submitted".

call AddTestData();

SELECT * FROM Manuscript WHERE manuscript_number = 201;

DELETE FROM Reviewer WHERE reviewer_ID = 61; -- delete reviewer 61.

SELECT * FROM Manuscript WHERE manuscript_number = 201;


-- 204 has RICode 11, assignable to only 64.
-- 204 is currently aassigned to 64
-- when we delete reviewer 64, 204 should change to "rejected".

SELECT * FROM Manuscript WHERE manuscript_number = 204;

DELETE FROM Reviewer WHERE reviewer_ID = 64; -- delete reviewer 61.

SELECT * FROM Manuscript WHERE manuscript_number = 204;

