DROP TABLE IF EXISTS `myTable`;

CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `code` mediumint,
  `interest` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `myTable` (`code`,`interest`)
VALUES
  (1,"Nullam Corporation"),
  (2,"Iaculis Aliquet LLC"),
  (3,"Magnis Consulting"),
  (4,"Arcu Vestibulum Ante LLP"),
  (5,"Pede Blandit Associates"),
  (6,"Lacus Varius Limited"),
  (7,"Nunc Corp."),
  (8,"Sapien Molestie Consulting"),
  (9,"Lobortis Risus In Inc."),
  (10,"At Augue LLP");
