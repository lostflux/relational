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