/* Script for definition of triggers in the database */

/*
  Trigger #1: AutoRejectManuscriptOnNoReviewers 
  When an author is submitting a new manuscript to the system
  with an ICode for which there is no reviewer 
  raise an exception that informs the author the paper
  can not be considered at this time.
 */



DELIMITER $$
CREATE TRIGGER AutoRejectManuscriptOnNoReviewers
  BEFORE INSERT ON Manuscript
  FOR EACH ROW
  BEGIN
    DECLARE counter INT;
    SELECT COUNT(*) INTO counter
    FROM Reviewer_has_RICodes
    WHERE Reviewer_has_RICodes.RICodes_code = NEW.RICodes_code;
    IF counter = 0 THEN
      SET NEW.status = "rejected";
      SET NEW.status_change_date = NOW();
    END IF;
  END$$
DELIMITER ;

/*
  Trigger #2: 
  When a reviewer resigns
    any manuscript in “UnderReview” state
    for which that reviewer was the only reviewer
    AND
    there is another reviewer in the system with the matching ICode
    that isn’t assigned to review it,
    that manuscript must be reset to “submitted”
    state and an appropriate exception message displayed.
*/

-- First, delete assignment and RICode link when a reviewer resigns.
DELIMITER $$
CREATE TRIGGER DeleteAssignmentOnReviewerResign
  BEFORE DELETE ON Reviewer
  FOR EACH ROW
  BEGIN
    DELETE FROM Reviewer_has_Manuscript
    WHERE Reviewer_reviewer_id = OLD.reviewer_id;
    DELETE FROM Reviewer_has_RICodes
    WHERE Reviewer_reviewer_id = OLD.reviewer_id;
  END$$
DELIMITER ;

-- Next, reset manuscripts to either submitted or rejected.
DELIMITER $$
CREATE TRIGGER ResetManuscriptStatusonReviewerResign
  BEFORE DELETE ON Reviewer_has_Manuscript
  FOR EACH ROW
  BEGIN
    DECLARE current_reviewers_count INT;
    DECLARE other_reviewers_count INT;
    SELECT COUNT(*) INTO current_reviewers_count
    FROM Reviewer_has_Manuscript
    WHERE
      Manuscript_manuscript_number = OLD.Manuscript_manuscript_number
      AND Reviewer_reviewer_id != OLD.Reviewer_reviewer_id;
    IF current_reviewers_count = 0 THEN
      SELECT COUNT(*) INTO other_reviewers_count
      FROM Reviewer
      WHERE reviewer_id != OLD.Reviewer_reviewer_id
      AND reviewer_id IN
        (
          SELECT Reviewer_reviewer_id
          FROM Reviewer_has_RICodes
          WHERE RICodes_code =
            (
              SELECT RICodes_code
              FROM Manuscript
              WHERE manuscript_number = OLD.Manuscript_manuscript_number
            )
        );
      IF other_reviewers_count > 0 THEN
        UPDATE Manuscript
        SET status = 'Submitted',
        status_change_date = NOW()
        WHERE manuscript_number = OLD.Manuscript_manuscript_number;
        SIGNAL SQLSTATE '42000'
        SET MESSAGE_TEXT = 'Manuscript status reset to submitted.';
      ELSE
        UPDATE Manuscript
        SET status = 'Rejected',
        status_change_date = NOW()
        WHERE manuscript_number = OLD.Manuscript_manuscript_number;
      END IF;
    END IF;
  END$$
DELIMITER ;

/*
  Trigger: ManuscriptStatusChange
  Purpose: When a manuscript's status is changed, update the status_change_date.
  Permissions: Editor.
*/


/* 
   Trigger #3: manuscript_become_accepted
   Purpose: When a manuscript's status is changed to accepted
            the status is immediately set to typesetting
   Permissions: Editor.
*/
DELIMITER $$
CREATE TRIGGER AutoAcceptManuscript
    BEFORE UPDATE ON Manuscript
    FOR EACH ROW
    BEGIN
		IF NEW.status = 'Accepted' THEN
			SET NEW.status = 'Typesetting';
		END IF;
    END$$
DELIMITER ;



-- Index new editors into credentials table.
DELIMITER $$
CREATE TRIGGER IndexAuthor
  AFTER INSERT ON Author
  FOR EACH ROW
  BEGIN
    SET @author_id = NEW.author_ID;
    INSERT INTO credentials (password, user_type, type_id)
    VALUES (NULL, 'Author', @author_id);
  END$$
DELIMITER ;



-- Index new reviewers into credentials table

DELIMITER $$
CREATE TRIGGER IndexReviewer
  AFTER INSERT ON Reviewer
  FOR EACH ROW
  BEGIN
    SET @reviewer_id = NEW.reviewer_ID;
    INSERT INTO credentials (password, user_type, type_id)
    VALUES (NULL, 'Reviewer', @reviewer_id);
  END$$
DELIMITER ;



-- Index new editors into credentials table
DELIMITER $$
CREATE TRIGGER IndexEditor
  AFTER INSERT ON Editor
  FOR EACH ROW
  BEGIN
    SET @editor_id = NEW.editor_ID;
    INSERT INTO credentials (password, user_type, type_id)
    VALUES (NULL, 'Editor', @editor_id);
  END$$
DELIMITER ;
