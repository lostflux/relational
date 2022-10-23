/* Script for definition of triggers in the database */

/*
  When an author is submitting a new manuscript to the system
  with an ICode for which there is no reviewer 
  raise an exception that informs the author the paper
  can not be considered at this time.
 */

DROP TRIGGER IF EXISTS AutoRejectManuscriptOnNoReviewers;
DELIMITER $$
CREATE TRIGGER AutoRejectManuscriptOnNoReviewers
  BEFORE INSERT ON Manuscript
  FOR EACH ROW
  BEGIN
    DECLARE counter INT;
    SELECT COUNT(*) INTO counter
    FROM Reviewer_has_RICodes
    WHERE RICodes_code = NEW.RICodes_code;
    IF counter = 0 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Sorry, we cannot review your manuscript at this time.';
    END IF;
  END$$
DELIMITER ;


/*
  Trigger: ManuscriptStatusChange
  Purpose: When a manuscript's status is changed, update the status_change_date.
  Permissions: Editor.
*/


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



    


