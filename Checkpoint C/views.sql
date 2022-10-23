/* Script to setup views in the database */

/*
  View: LeadAuthorManuscripts
   
  For all the authors that are first authors of a manuscript,:
    (1) author's last name
    (2) author's id
    (3) manuscript number
    (4) manuscript status change date
    
  Permissions: Editor.
 */
DROP VIEW IF EXISTS LeadAuthorManuscripts;
CREATE VIEW LeadAuthorManuscripts AS
  SELECT
    Author.l_name,
    Author.author_id,
    Manuscript.manuscript_number,
    Manuscript.status_change_date
  FROM
    Author,
    Manuscript,
    Manuscript_Author
  WHERE
    Author.author_id = Manuscript_Author.Author_author_id
    AND Manuscript.manuscript_number = Manuscript_Author.Manuscript_manuscript_number
    AND Manuscript_Author.author_ordinal = 1
  ORDER BY
    Author.l_name ASC,
    Author.author_id ASC,
    Manuscript.status_change_date ASC;

SELECT * FROM LeadAuthorManuscripts;

/*
  View: AnyAuthorManuscripts
   
  For all the authors that are associated with the manuscripts:
    (1) author's last name
    (2) author's id
    (3) manuscript number
    (4) manuscript status change date
    
  Permissions: Author, Editor.
 */
DROP VIEW IF EXISTS AnyAuthorManuscripts;
CREATE VIEW AnyAuthorManuscripts AS
    SELECT 
        Author.author_id,
        Author.f_name,
        Author.l_name,
        Manuscript.manuscript_number,
        Manuscript.title,
        Manuscript.status,
        Manuscript.status_change_date
    FROM
        Author,
        Manuscript_Author,
        Manuscript
    WHERE
        Author.author_id = Manuscript_Author.Author_author_ID
        AND Manuscript_Author.Manuscript_manuscript_number = Manuscript.manuscript_number
    ORDER BY 
        Author.l_name ASC,
        Manuscript.status_change_date ASC
    ;

SELECT * FROM AnyAuthorManuscripts;

/*
  View: PublishedIssues
   
  For all completed (published) issues:
    (1) the issue year
    (2) issue number (1, 2, 3, or 4)
    (3) the title of each manuscript included in that issue,
      - with page numbers
      - ordered by issue year, issue number, and page numbers. 
    
  Permissions: Author, Editor, Reviewer.
 */

DROP VIEW IF EXISTS PublishedIssues;
CREATE VIEW PublishedIssues AS
  SELECT
    Issue.year,
    Issue.period,
    Manuscript.title,
    Manuscript.page_number
  FROM
    Issue,
    Manuscript
  WHERE
    Issue.issue_ID = Manuscript.Issue_issue_ID
    AND Issue.publication_date IS NOT NULL
  ORDER BY
    Issue.year ASC,
    Issue.period ASC,
    Manuscript.page_number ASC;

SELECT * FROM PublishedIssues;

/*
  View: ReviewQueue

  For all manuscripts in UnderReview state:
    - List the:
      (1) primary author
      (2) author id
      (3) manuscript id
      (4) assigned reviewer(s) are included all together in one row
      with the rows ordered by increasing most recent status change timestamp.
      
    - This View is also used by ReviewStatus view.
    - Permissions: Editor.
 */

DROP VIEW IF EXISTS ReviewQueue;
CREATE VIEW ReviewQueue AS
  SELECT
    CONCAT_WS(' ', Author.f_name, Author.l_name) AS primary_author,
    Author.author_id,
    Manuscript.manuscript_number,
    MAX(Reviewer_has_Manuscript.date_sent) AS status_change_date,
    GROUP_CONCAT(CONCAT_WS(' ', Reviewer.f_name, Reviewer.l_name)) AS reviewers
  FROM
    Author,
    Manuscript,
    Manuscript_Author,
    Reviewer,
    Reviewer_has_Manuscript
  WHERE
    Author.author_id = Manuscript_Author.Author_author_id
    AND Manuscript.manuscript_number = Manuscript_Author.Manuscript_manuscript_number
    AND Manuscript.manuscript_number = Reviewer_has_Manuscript.Manuscript_manuscript_number
    AND Reviewer.reviewer_id = Reviewer_has_Manuscript.Reviewer_reviewer_id
    AND Manuscript.status = 'under review'
    AND Manuscript_Author.author_ordinal = 1
  GROUP BY
    Manuscript.manuscript_number
  ORDER BY
    status_change_date ASC,
    Author.author_id ASC;

select * from ReviewQueue;

-- COUNT

-- DROP FUNCTION IF EXISTS CountManuscriptAuthors;
-- DELIMITER \\
-- CREATE FUNCTION CountManuscriptAuthors(manuscript_number INT)
-- RETURNS INT
-- READS SQL DATA
-- BEGIN
--   DECLARE cnt INT;
--   SELECT COUNT(*) INTO cnt FROM Manuscript_Author
--   WHERE Manuscript_manuscript_number = manuscript_number;
--   RETURN cnt;
-- END; \\
-- DELIMITER ;

-- SELECT Manuscript_number, CountManuscriptAuthors(Manuscript_number)
-- FROM Manuscript;

/*
  View: WhatsLeft

  For all manuscripts:
    - List the:
      (1) manuscript number
      (2) current status
      (3) time stamp of the current status

    - Permissions: Editor.
 */

DROP VIEW IF EXISTS WhatsLeft;
CREATE VIEW WhatsLeft AS
  SELECT
    Manuscript.manuscript_number,
    Manuscript.status,
    Manuscript.status_change_date
  FROM
    Manuscript
  ;

SELECT * FROM WhatsLeft;


/*
  Function: ReviewStatus

  For creating a view with a specific reviewer id
  Input: None
  Output: A variable named @rev_id that is set later in the script

 */
DROP FUNCTION IF EXISTS ViewRevId;
DELIMITER $$
CREATE FUNCTION ViewRevId() RETURNS INT
BEGIN
  RETURN @rev_id;
END$$
DELIMITER ;

/*
  View: ReviewStatus

  For a given reviewer:
    - List the:
      (1) manuscript date sent
      (2) manuscript number
      (3) manuscript title
      (4) clarity,
      (5) methodology,
      (6) experimental,
      (7) recommendation
      (8) appropriateness

    - Permissions: Editor.
 */
DROP VIEW IF EXISTS ReviewStatus;
CREATE VIEW ReviewStatus AS
  SELECT
    Reviewer_has_Manuscript.date_sent,
    Reviewer_has_Manuscript.Manuscript_manuscript_number,
    Manuscript.title,
    Reviewer_has_Manuscript.appropriateness,
    Reviewer_has_Manuscript.clarity,
    Reviewer_has_Manuscript.methodology,
    Reviewer_has_Manuscript.experimental,
    Reviewer_has_Manuscript.recommendation,
  FROM
    Manuscript,
    Reviewer_has_Manuscript
  WHERE
    Reviewer_has_Manuscript.Manuscript_manuscript_number = Manuscript.manuscript_number
    AND Reviewer_has_Manuscript.Reviewer_reviewer_id = ViewRevId()
  ;

SET @rev_id=15;
SELECT * FROM ReviewStatus;
