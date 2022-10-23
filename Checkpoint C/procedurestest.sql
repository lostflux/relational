/* Script to test procedures in the database */

SELECT * FROM Reviewer_has_Manuscript WHERE Reviewer_has_Manuscript.Manuscript_manuscript_number = 34;

CALL MakeDecision(34, @decision);

SELECT @decision;