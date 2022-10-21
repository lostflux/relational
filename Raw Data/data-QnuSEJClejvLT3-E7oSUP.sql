DROP TABLE IF EXISTS `myTable`;

CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `Reviewer_reviewer_id` mediumint default NULL,
  `Manuscript_manuscript_number` mediumint default NULL,
  `date_sent` varchar(255),
  `Appropriateness` mediumint default NULL,
  `Clarity` mediumint default NULL,
  `Methodology` mediumint default NULL,
  `Experimental` mediumint default NULL,
  `Recommendation` mediumint default NULL,
  `feedback_date` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (19,55,"07/25/2024",8,6,2,0,1,"Aug 2, 2023"),
  (47,95,"12/05/2021",6,4,1,9,2,"Dec 22, 2023"),
  (41,8,"07/21/2024",5,2,2,5,4,"Dec 1, 2022"),
  (14,19,"09/18/2022",5,5,3,3,6,"Jan 14, 2022"),
  (11,47,"01/18/2022",5,2,1,2,9,"Jan 10, 2022"),
  (48,61,"10/14/2023",9,3,0,6,3,"Jan 28, 2022"),
  (33,77,"09/20/2022",0,3,5,5,9,"Apr 13, 2022"),
  (37,69,"05/26/2023",5,8,0,8,3,"Nov 6, 2023"),
  (19,2,"07/22/2022",5,3,2,1,9,"May 19, 2023"),
  (48,37,"01/18/2024",7,0,9,6,5,"Apr 8, 2022");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (23,14,"12/12/2022",4,1,6,7,3,"Oct 24, 2022"),
  (39,58,"03/19/2023",3,6,7,2,4,"Dec 12, 2022"),
  (40,58,"08/08/2022",4,3,4,6,6,"Jun 15, 2022"),
  (37,66,"12/06/2021",7,6,5,1,5,"Nov 14, 2022"),
  (41,16,"10/04/2023",7,7,5,4,1,"Jun 18, 2024"),
  (47,24,"06/27/2024",3,9,7,5,7,"Sep 5, 2023"),
  (0,82,"01/28/2022",0,0,8,2,0,"Jun 15, 2022"),
  (43,33,"02/26/2023",0,5,7,8,3,"Jun 18, 2024"),
  (15,85,"06/24/2024",5,4,7,3,10,"Mar 16, 2023"),
  (48,16,"10/02/2023",10,1,4,0,5,"Jul 15, 2024");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (45,30,"04/21/2023",4,7,3,3,4,"Apr 26, 2023"),
  (48,28,"06/13/2022",0,9,7,3,8,"Nov 19, 2022"),
  (37,0,"06/27/2023",2,6,9,9,4,"Nov 14, 2021"),
  (11,52,"05/28/2022",2,2,5,9,7,"Apr 5, 2022"),
  (10,69,"08/20/2022",6,2,4,5,1,"Jun 4, 2024"),
  (18,61,"07/15/2023",1,5,8,5,8,"Feb 27, 2024"),
  (45,55,"12/21/2021",4,7,3,9,3,"Aug 8, 2024"),
  (20,88,"03/04/2024",6,4,6,8,0,"Apr 5, 2022"),
  (47,90,"08/07/2022",1,4,6,4,2,"Oct 31, 2021"),
  (35,43,"07/30/2022",0,8,5,9,4,"Nov 24, 2022");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (12,6,"05/01/2023",2,4,3,0,0,"Jul 6, 2023"),
  (43,7,"02/10/2023",4,10,4,3,3,"Feb 18, 2022"),
  (39,19,"03/11/2024",3,8,2,8,4,"Jul 8, 2024"),
  (6,28,"05/09/2022",6,5,3,2,1,"Oct 12, 2023"),
  (41,33,"11/14/2022",4,5,6,7,10,"Jul 19, 2024"),
  (9,59,"04/27/2023",8,9,9,8,1,"Apr 10, 2024"),
  (2,1,"02/21/2024",8,1,8,5,1,"Oct 24, 2021"),
  (50,7,"01/09/2023",6,9,9,10,1,"Feb 3, 2024"),
  (24,9,"03/08/2023",4,9,1,7,2,"Aug 15, 2022"),
  (31,60,"08/12/2023",3,5,3,7,7,"Jul 10, 2022");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (20,49,"07/05/2022",7,6,5,3,5,"Dec 23, 2021"),
  (42,22,"01/22/2024",8,5,4,9,2,"Jul 22, 2023"),
  (41,4,"11/27/2023",1,4,10,10,4,"Feb 5, 2022"),
  (20,30,"03/07/2024",4,5,7,8,9,"May 11, 2024"),
  (26,69,"11/05/2022",4,10,5,2,1,"Jun 19, 2024"),
  (46,4,"01/21/2024",1,8,0,9,2,"Jun 1, 2023"),
  (31,69,"03/04/2024",6,8,7,1,5,"Feb 9, 2023"),
  (37,100,"06/19/2022",1,7,5,5,5,"May 30, 2024"),
  (6,39,"04/09/2022",9,1,7,5,3,"Aug 29, 2023"),
  (21,70,"07/24/2024",7,2,2,3,8,"Sep 28, 2023");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (11,1,"08/27/2023",10,5,4,1,9,"Jul 21, 2022"),
  (11,7,"08/20/2023",1,3,5,5,1,"Jul 20, 2022"),
  (5,4,"10/26/2022",6,0,3,6,2,"Jan 14, 2022"),
  (31,62,"01/29/2023",8,9,3,2,1,"Sep 21, 2022"),
  (38,13,"11/27/2022",10,9,7,9,4,"Jan 22, 2024"),
  (32,61,"10/03/2022",3,5,0,5,9,"Mar 5, 2023"),
  (12,11,"09/16/2023",1,10,6,5,1,"Jul 12, 2022"),
  (46,34,"04/08/2024",7,8,6,9,10,"Nov 4, 2023"),
  (9,66,"04/05/2024",9,9,6,4,1,"May 17, 2022"),
  (7,87,"06/24/2023",8,2,4,2,10,"Mar 16, 2023");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (12,35,"01/24/2024",1,7,3,5,2,"Sep 4, 2022"),
  (20,20,"09/08/2023",6,7,5,4,5,"Aug 5, 2023"),
  (7,89,"06/13/2023",0,8,7,7,0,"Apr 5, 2023"),
  (8,80,"04/28/2023",3,4,6,1,8,"Mar 25, 2024"),
  (29,17,"02/26/2022",7,7,4,6,2,"Jan 3, 2022"),
  (49,66,"05/05/2024",9,1,10,0,8,"Jun 7, 2023"),
  (43,23,"11/27/2021",7,9,5,3,7,"Jan 3, 2024"),
  (48,84,"11/04/2023",4,0,8,9,0,"Jan 13, 2022"),
  (20,86,"01/08/2024",9,2,7,5,4,"Dec 17, 2021"),
  (27,82,"07/17/2022",1,9,7,6,9,"Sep 24, 2022");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (13,28,"04/26/2023",6,3,9,1,6,"Feb 7, 2024"),
  (28,13,"10/06/2023",0,1,8,5,1,"Nov 14, 2023"),
  (17,55,"11/04/2022",9,5,3,1,7,"Dec 25, 2022"),
  (37,50,"01/31/2023",5,8,6,7,0,"Dec 2, 2022"),
  (3,85,"11/10/2022",3,3,8,7,2,"Jun 29, 2023"),
  (14,90,"04/30/2023",3,8,6,3,6,"Sep 5, 2023"),
  (42,5,"06/14/2023",2,5,7,7,1,"Feb 27, 2023"),
  (0,33,"01/05/2022",4,7,0,9,0,"Jul 16, 2022"),
  (29,79,"11/08/2021",2,2,7,6,5,"Aug 31, 2023"),
  (11,4,"01/18/2023",2,2,5,5,6,"Nov 25, 2023");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (6,4,"11/13/2021",3,2,5,8,6,"Dec 6, 2022"),
  (42,42,"08/09/2024",5,10,10,4,7,"Mar 14, 2023"),
  (24,83,"05/24/2022",1,10,9,8,8,"Mar 5, 2023"),
  (12,81,"02/08/2023",8,1,10,1,7,"Nov 23, 2023"),
  (28,53,"12/18/2022",4,1,9,2,1,"Jun 23, 2022"),
  (33,56,"09/22/2022",6,5,1,4,1,"Jan 8, 2022"),
  (27,55,"10/21/2022",0,9,1,2,4,"Apr 24, 2024"),
  (3,70,"05/23/2024",6,6,8,2,7,"Jan 15, 2023"),
  (2,60,"02/20/2023",3,7,4,0,2,"Jan 4, 2022"),
  (47,85,"12/13/2023",1,10,5,5,6,"Oct 25, 2022");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (32,62,"10/09/2022",4,5,7,3,8,"Apr 13, 2024"),
  (39,63,"02/17/2022",3,0,4,8,3,"Jun 30, 2023"),
  (25,74,"09/21/2023",8,10,0,1,10,"Apr 19, 2022"),
  (19,34,"01/01/2023",7,3,8,1,7,"Nov 13, 2021"),
  (50,1,"01/10/2023",5,1,9,1,6,"Jan 9, 2024"),
  (6,20,"05/29/2022",2,8,6,4,2,"Feb 10, 2022"),
  (23,83,"07/04/2022",7,3,8,7,9,"May 26, 2023"),
  (32,49,"06/17/2022",3,3,8,7,3,"May 16, 2022"),
  (49,23,"03/01/2022",6,2,6,0,8,"Feb 2, 2022"),
  (1,82,"08/10/2022",6,5,1,2,9,"May 23, 2022");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (10,31,"05/09/2022",2,1,7,7,1,"Jun 23, 2023"),
  (24,84,"10/17/2022",4,6,8,3,3,"Jan 5, 2022"),
  (17,51,"05/20/2022",9,7,1,4,5,"Apr 17, 2023"),
  (20,67,"03/07/2022",8,5,9,7,3,"Dec 19, 2023"),
  (2,6,"03/12/2022",1,8,2,5,9,"Apr 29, 2023"),
  (42,86,"12/01/2021",2,9,3,4,5,"Jun 18, 2024"),
  (20,29,"04/02/2022",3,9,3,2,3,"Mar 23, 2022"),
  (43,40,"03/06/2023",6,6,1,5,7,"May 1, 2024"),
  (12,71,"05/17/2023",8,6,1,8,7,"Jul 9, 2024"),
  (27,14,"01/25/2022",0,5,3,8,10,"Oct 18, 2023");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (14,10,"05/13/2023",2,1,1,10,10,"Oct 4, 2022"),
  (37,93,"04/21/2024",1,9,0,8,3,"Jul 23, 2024"),
  (24,22,"01/28/2024",9,7,6,0,6,"May 5, 2024"),
  (5,46,"03/26/2023",2,5,8,1,9,"Jun 12, 2023"),
  (23,43,"10/23/2023",8,6,5,8,7,"Jan 20, 2023"),
  (17,58,"06/20/2024",6,4,5,6,8,"May 27, 2024"),
  (5,18,"02/03/2022",1,0,9,5,1,"Jan 21, 2023"),
  (22,99,"10/03/2022",10,6,2,4,8,"Oct 31, 2022"),
  (6,38,"06/06/2023",9,1,2,8,8,"May 10, 2023"),
  (10,31,"02/22/2023",1,5,3,6,6,"Aug 31, 2024");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (19,68,"12/14/2021",2,6,3,7,2,"Apr 11, 2022"),
  (37,3,"12/31/2023",5,7,8,2,3,"May 21, 2022"),
  (29,7,"05/25/2023",1,10,4,6,3,"Mar 10, 2022"),
  (28,96,"06/30/2023",4,2,8,1,9,"Feb 6, 2024"),
  (42,18,"02/12/2023",3,2,7,5,5,"Nov 12, 2023"),
  (16,89,"02/17/2023",8,9,2,8,10,"Feb 6, 2023"),
  (35,14,"10/28/2023",0,2,6,0,1,"Feb 22, 2022"),
  (20,83,"08/06/2023",5,1,6,3,7,"Jan 15, 2022"),
  (18,94,"04/17/2024",8,8,7,9,5,"Nov 30, 2022"),
  (19,24,"05/22/2022",5,9,1,8,0,"Jun 5, 2022");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (35,88,"05/14/2022",3,0,3,2,1,"May 3, 2022"),
  (16,5,"05/12/2024",3,1,1,9,2,"Feb 16, 2022"),
  (18,15,"05/10/2022",6,5,2,10,8,"Jun 5, 2024"),
  (6,94,"09/05/2022",8,3,6,1,6,"Jan 14, 2023"),
  (26,6,"02/12/2022",2,6,9,8,8,"Oct 25, 2021"),
  (22,48,"07/24/2022",6,6,2,5,4,"Dec 31, 2021"),
  (43,81,"03/06/2024",10,7,5,7,1,"Dec 3, 2023"),
  (10,76,"08/28/2024",2,10,5,7,6,"Dec 18, 2023"),
  (47,33,"05/18/2024",8,5,10,10,4,"Apr 27, 2023"),
  (32,89,"11/14/2021",3,2,1,2,6,"Jul 9, 2022");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (41,60,"03/10/2024",9,5,5,10,2,"Jun 13, 2024"),
  (9,17,"01/01/2024",7,4,6,6,3,"Aug 5, 2023"),
  (42,25,"08/08/2023",7,2,2,8,8,"Aug 28, 2022"),
  (23,87,"06/29/2023",4,2,7,4,2,"Jul 1, 2022"),
  (20,1,"03/21/2023",8,2,7,9,0,"Mar 29, 2024"),
  (21,90,"08/10/2022",9,7,3,1,2,"Oct 25, 2021"),
  (40,12,"02/07/2023",1,2,1,1,3,"Nov 28, 2023"),
  (38,94,"09/03/2023",8,9,4,2,2,"Aug 14, 2022"),
  (42,57,"03/17/2023",8,4,8,8,10,"Jun 7, 2023"),
  (11,4,"07/06/2024",8,4,5,5,3,"Nov 18, 2023");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (14,84,"08/12/2022",5,7,2,7,8,"Jul 14, 2023"),
  (4,3,"07/14/2024",8,1,7,10,8,"Jan 1, 2022"),
  (9,91,"09/20/2022",4,5,5,7,5,"Jun 3, 2022"),
  (15,79,"04/12/2022",5,4,5,6,2,"Dec 15, 2022"),
  (14,97,"01/22/2024",8,8,7,1,8,"Feb 17, 2023"),
  (16,75,"12/22/2021",2,7,6,0,9,"May 19, 2022"),
  (3,68,"03/30/2022",7,10,9,2,3,"Feb 26, 2022"),
  (29,89,"02/25/2024",10,7,5,8,5,"Sep 15, 2022"),
  (18,99,"11/21/2022",2,0,0,7,5,"Apr 24, 2022"),
  (34,98,"03/30/2024",2,8,2,3,7,"Aug 31, 2023");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (7,40,"03/14/2024",5,9,8,6,3,"Feb 1, 2022"),
  (14,0,"11/07/2022",6,5,1,6,1,"Aug 5, 2022"),
  (48,31,"11/01/2021",2,0,8,1,4,"Aug 9, 2024"),
  (11,18,"09/08/2023",5,2,7,9,6,"Nov 5, 2023"),
  (37,55,"11/22/2021",2,3,4,5,4,"Aug 10, 2024"),
  (4,57,"09/02/2023",6,4,8,8,7,"Jan 2, 2023"),
  (40,12,"11/26/2021",8,6,5,0,3,"Sep 16, 2023"),
  (27,18,"03/08/2024",9,4,8,3,2,"Aug 6, 2024"),
  (9,46,"06/13/2022",5,5,3,4,8,"Jan 2, 2023"),
  (18,36,"04/23/2022",8,4,0,0,2,"Jan 22, 2024");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (22,44,"08/23/2023",1,4,3,1,7,"Jan 20, 2023"),
  (11,35,"04/07/2022",1,2,1,5,3,"Apr 8, 2023"),
  (6,96,"01/02/2023",2,1,1,5,1,"Jun 22, 2024"),
  (6,23,"11/17/2023",7,5,8,4,7,"Jul 16, 2024"),
  (18,82,"01/23/2022",10,8,6,7,2,"Feb 26, 2024"),
  (46,63,"08/27/2023",9,3,6,0,3,"Oct 20, 2023"),
  (27,13,"11/26/2022",7,4,9,2,7,"Feb 20, 2023"),
  (18,84,"10/17/2023",3,1,4,6,7,"Jun 17, 2023"),
  (1,85,"11/18/2021",3,8,10,9,8,"Apr 2, 2022"),
  (22,41,"05/16/2024",0,3,10,9,7,"Nov 21, 2022");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (45,32,"05/06/2024",7,6,10,0,6,"Dec 15, 2022"),
  (1,84,"06/22/2024",7,8,5,8,9,"Jul 8, 2023"),
  (29,27,"06/21/2023",2,0,1,7,3,"Apr 17, 2024"),
  (32,33,"11/12/2021",4,3,2,6,5,"Jan 18, 2023"),
  (34,37,"05/08/2022",5,0,9,4,2,"Jul 23, 2023"),
  (15,10,"07/08/2024",5,0,1,8,5,"Dec 13, 2021"),
  (46,51,"03/01/2024",2,2,9,5,2,"May 16, 2024"),
  (49,27,"12/10/2023",9,6,1,8,8,"Aug 28, 2022"),
  (42,30,"03/05/2022",9,8,6,4,5,"Jan 12, 2022"),
  (41,65,"08/12/2024",1,2,2,4,0,"Feb 19, 2024");
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`Manuscript_manuscript_number`,`date_sent`,`Appropriateness`,`Clarity`,`Methodology`,`Experimental`,`Recommendation`,`feedback_date`)
VALUES
  (1,26,"07/13/2023",7,2,5,3,10,"Apr 15, 2024"),
  (21,10,"01/12/2023",9,2,8,6,9,"Nov 9, 2021"),
  (2,6,"04/26/2024",8,6,4,2,5,"Dec 1, 2021"),
  (4,45,"12/14/2021",7,6,6,3,7,"Dec 16, 2021"),
  (16,20,"12/08/2022",8,7,2,6,4,"Sep 29, 2023"),
  (29,48,"02/07/2022",7,9,10,1,1,"Mar 26, 2022"),
  (4,19,"01/09/2023",9,1,1,9,3,"Oct 25, 2023"),
  (19,83,"07/13/2024",8,3,1,9,9,"May 29, 2022"),
  (44,4,"03/08/2024",7,9,10,4,1,"Mar 4, 2024"),
  (46,6,"06/10/2022",1,1,2,2,9,"Mar 4, 2023");
