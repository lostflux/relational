/* Script to setup procedures in the database */

DROP PROCEDURE IF EXISTS MakeDecision;
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