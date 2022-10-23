/* Script for definition of triggers in the database */

/* 
   Trigger: manuscript_become_accepted
   Purpose: When a manuscript's status is changed to accepted
            the status is immediately set to typesetting
   Permissions: Editor.
*/
DROP TRIGGER IF EXISTS manuscript_become_accepted;
DELIMITER $$
CREATE TRIGGER manuscript_become_accepted
    BEFORE UPDATE ON Manuscript
    FOR EACH ROW
    BEGIN
		IF NEW.status = 'accepted' THEN
			SET NEW.status = 'typesetting';
		END IF;
    END$$
DELIMITER ;



    


