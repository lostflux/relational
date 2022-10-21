DROP TABLE IF EXISTS `myTable`;

CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `f_name` varchar(255) default NULL,
  `l_name` varchar(255) default NULL,
  `numberrange` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `myTable` (`name`,`f_name`,`l_name`,`numberrange`)
VALUES
  ("facilisis@protonmail.com","Leah","Wilkerson",18),
  ("consectetuer.mauris@google.org","Sawyer","Gilbert",6),
  ("pede.sagittis@google.couk","Garrison","Acevedo",11),
  ("tempus@yahoo.edu","Gregory","Wynn",16),
  ("urna.vivamus.molestie@aol.ca","Chiquita","Burch",6),
  ("sed.sapien@icloud.ca","Lesley","Bender",2),
  ("dui.suspendisse@aol.edu","Stacy","Robinson",16),
  ("lacus.varius@yahoo.org","April","Rush",13),
  ("eu.turpis.nulla@yahoo.couk","Dorian","Becker",12),
  ("sed@protonmail.couk","Jeremy","Allison",18);
