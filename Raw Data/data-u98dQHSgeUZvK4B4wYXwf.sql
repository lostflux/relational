DROP TABLE IF EXISTS `myTable`;

CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `l_name` varchar(255) default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `myTable` (`l_name`)
VALUES
  ("Mcintyre"),
  ("Snow"),
  ("Freeman"),
  ("Suarez"),
  ("Good"),
  ("Valdez"),
  ("Rocha"),
  ("Baldwin"),
  ("Turner"),
  ("Price");
INSERT INTO `myTable` (`l_name`)
VALUES
  ("Roth"),
  ("Walls"),
  ("Simpson"),
  ("Gilbert"),
  ("Bishop"),
  ("Steele"),
  ("Copeland"),
  ("Gay"),
  ("Vazquez"),
  ("Glass");
INSERT INTO `myTable` (`l_name`)
VALUES
  ("Kent"),
  ("Stone"),
  ("Barr"),
  ("Thompson"),
  ("Gilbert"),
  ("Fuentes"),
  ("Mckee"),
  ("Mitchell"),
  ("Anthony"),
  ("Morin");
