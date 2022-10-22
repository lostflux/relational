/* Script to setup views in the database */

DROP VIEW IF EXISTS LeadAuthorManuscripts;
CREATE VIEW LeadAuthorManuscripts AS
  SELECT
    Author.l_name,
    Author.author_id,
    Manuscript.manuscript_number
    -- Manuscript.status_change_date
  FROM
    Author,
    Manuscript,
    Manuscript_author
  WHERE
    Author.author_id = Manuscript_author.Author_author_id
    AND Manuscript.manuscript_number = Manuscript_author.Manuscript_manuscript_number
    AND Manuscript_author.author_ordinal = 1
  ORDER BY
    Author.l_name DESC,
    Author.author_id DESC;
    -- Manuscript.status_change_date ASC;

SELECT * FROM LeadAuthorManuscripts;

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
        Authors,
        Manuscript_author,
        Manuscript
    WHERE
        Author.author_id = Manuscript_author.author_id
        AND Manuscript_author.manuscript_number = Manuscript.manuscript_number
    ORDER BY 
        Author.l_name DESC,
        Manuscript.status_change_date ASC
    ;


-- CREATE VIEW AnyAuthorManuscripts AS
--     SELECT 
--         Author.author_id,
--         Author.f_name,
--         Author.l_name,
--         Manuscript.manuscript_number,
--         Manuscript.title,
--         Manuscript.status,
--         Manuscript.status_change_date
--     FROM
--         Authors,
--         Manuscript_author,
--         Manuscript
--     WHERE
--         Author.author_id = Manuscript_author.author_id
--         AND Manuscript_author.manuscript_number = Manuscript.manuscript_number
--     ORDER BY 
--         Author.l_name DESC,
--         Manuscript.status_change_date ASC

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
    AND Manuscript_Author.author_ordinal = 4
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
