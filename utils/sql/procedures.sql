/* Script to setup procedures in the database */

/* 
    Procedure: MakeDecision
    Purpose: Make a decision on a manuscript
    Parameters: 
        (1) manuscript number
    Output: 
        (1) A varchar indicating "Accepted" or "Rejected"
    Logic:
        Accept the manuscript if it scores larger or equal to 40
        Reject the manuscript if it scores less than 40
*/

DELIMITER $$
CREATE PROCEDURE MakeDecision(
 IN manuscript_number INT,
 OUT decision VARCHAR(20))
BEGIN
 DECLARE avg_score INT;
 SELECT 
	SUM(Reviewer_has_Manuscript.appropriateness + Reviewer_has_Manuscript.clarity + Reviewer_has_Manuscript.methodology + Reviewer_has_Manuscript.experimental)
    / COUNT(Reviewer_has_Manuscript.Manuscript_manuscript_number) INTO avg_score
 FROM
   Reviewer_has_Manuscript 
 WHERE
   Reviewer_has_Manuscript.Manuscript_manuscript_number = manuscript_number
 GROUP BY
   Reviewer_has_Manuscript.Manuscript_manuscript_number
   ;
 IF avg_score >= 40 THEN
    SET decision = 'Accepted';
 ELSE
    SET decision = 'Rejected';
 END IF;
END$$
DELIMITER ;
