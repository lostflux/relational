/* Script to test procedures in the database */

/* 
   Test case 1: get the decision for manuscript 34
   Avg score = 20.5
   Expected output: Rejected
*/
SELECT * FROM Reviewer_has_Manuscript WHERE Reviewer_has_Manuscript.Manuscript_manuscript_number = 34;

CALL MakeDecision(34, @decision);

SELECT @decision;