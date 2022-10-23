DROP TABLE IF EXISTS `myTable`;

CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `Reviewer_reviewer_id` mediumint,
  `RICodes_code` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `myTable` (`Reviewer_reviewer_id`,`RICodes_code`)
VALUES
  (1,4),
  (2,8),
  (3,7),
  (4,1),
  (5,3),
  (6,6),
  (7,5),
  (8,2),
  (9,3),
  (10,2);
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`RICodes_code`)
VALUES
  (11,3),
  (12,1),
  (13,7),
  (14,10),
  (15,4),
  (16,7),
  (17,8),
  (18,4),
  (19,7),
  (20,4);
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`RICodes_code`)
VALUES
  (21,8),
  (22,2),
  (23,3),
  (24,2),
  (25,2),
  (26,7),
  (27,4),
  (28,9),
  (29,6),
  (30,10);
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`RICodes_code`)
VALUES
  (31,7),
  (32,3),
  (33,3),
  (34,9),
  (35,8),
  (36,10),
  (37,6),
  (38,1),
  (39,4),
  (40,8);
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`RICodes_code`)
VALUES
  (41,9),
  (42,7),
  (43,5),
  (44,3),
  (45,5),
  (46,5),
  (47,5),
  (48,7),
  (49,5),
  (50,8);
INSERT INTO `myTable` (`Reviewer_reviewer_id`,`RICodes_code`)
VALUES
  (51,4),
  (52,5),
  (53,6),
  (54,1),
  (55,4),
  (56,3),
  (57,3),
  (58,1),
  (59,3),
  (60,6);
