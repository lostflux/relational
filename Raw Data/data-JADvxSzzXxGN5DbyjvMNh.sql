DROP TABLE IF EXISTS `myTable`;

CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `email` varchar(255) default NULL,
  `l_name` varchar(255) default NULL,
  `f_name` varchar(255) default NULL,
  `Journal_journal_id` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `myTable` (`email`,`l_name`,`f_name`,`Journal_journal_id`)
VALUES
  ("velit.in.aliquet@icloud.couk","Barber","Walker",2),
  ("mauris.quis@yahoo.edu","Maynard","Orla",6),
  ("nec.tempus.scelerisque@icloud.com","Mcgee","Amos",6),
  ("vulputate@protonmail.org","Hyde","Ignacia",9),
  ("egestas.nunc.sed@yahoo.org","Mayer","Amanda",9),
  ("nunc@protonmail.org","Patrick","Sebastian",7),
  ("lectus.quis@aol.com","Witt","Justin",8),
  ("nulla.in@google.com","Melton","Jacob",8),
  ("condimentum.eget.volutpat@aol.couk","Vargas","Christian",4),
  ("dolor@outlook.org","Waters","Cassandra",1);
INSERT INTO `myTable` (`email`,`l_name`,`f_name`,`Journal_journal_id`)
VALUES
  ("a.scelerisque.sed@yahoo.edu","Burks","Joel",10),
  ("mollis@hotmail.com","Gutierrez","Kennan",4),
  ("orci@google.edu","Swanson","Lara",3),
  ("tristique.aliquet@yahoo.net","Eaton","Colin",6),
  ("felis.orci@hotmail.couk","Leach","Brianna",7);
