/* Tests for the triggers defined in the database */

/* 
   Trigger: manuscript_become_accepted
   Purpose: When a manuscript's status is changed to accepted
            the status is immediately set to typesetting
   Permissions: Editor.
*/
SELECT * FROM Manuscript WHERE Manuscript.manuscript_number = 18;

UPDATE Manuscript SET Manuscript.status = 'accepted' WHERE Manuscript.manuscript_number = 18;

SELECT * FROM Manuscript WHERE Manuscript.manuscript_number = 18;