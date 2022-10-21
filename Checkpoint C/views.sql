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


-- DROP VIEW IF EXISTS PublishedIssues;
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
