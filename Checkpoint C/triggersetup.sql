/* Script for definition of triggers in the database */

/*
  Trigger: ManuscriptStatusChange
  Purpose: When a manuscript's status is changed, update the status_change_date.
  Permissions: Editor.
*/
SELECT COUNT(*) FROM Manuscript WHERE Manuscript.status = 'accepted';

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



    


