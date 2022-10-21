DROP TABLE IF EXISTS `myTable`;

CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `email` varchar(255) default NULL,
  `f_name` varchar(255) default NULL,
  `l_name` varchar(255) default NULL,
  `Affiliation_affiliation_id` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `myTable` (`email`,`f_name`,`l_name`,`Affiliation_affiliation_id`)
VALUES
  ("nisi.dictum.augue@aol.org","Nigel","Henry",8),
  ("rutrum.eu@protonmail.org","Magee","Snider",3),
  ("velit.pellentesque@yahoo.net","MacKensie","Robinson",1),
  ("dictum@protonmail.ca","Mollie","Suarez",14),
  ("integer.tincidunt.aliquam@google.ca","Uma","Sullivan",4),
  ("scelerisque@hotmail.ca","Ocean","Griffin",15),
  ("ipsum.cursus.vestibulum@icloud.couk","Chase","Parker",13),
  ("ultricies.sem@protonmail.couk","Tad","Rocha",8),
  ("auctor@aol.org","Axel","Bates",0),
  ("risus@yahoo.net","Jerome","Huffman",8);
INSERT INTO `myTable` (`email`,`f_name`,`l_name`,`Affiliation_affiliation_id`)
VALUES
  ("imperdiet.dictum@google.couk","Buckminster","Cleveland",14),
  ("per.inceptos@aol.ca","Geoffrey","Wall",7),
  ("nunc.est.mollis@aol.com","Roth","Cooke",1),
  ("dui.fusce@protonmail.net","Neville","Gutierrez",15),
  ("nunc.ullamcorper.velit@protonmail.com","Zachary","Jacobson",11),
  ("dictum@yahoo.org","Victor","Donovan",6),
  ("pede.nunc.sed@hotmail.com","James","Henderson",11),
  ("egestas@aol.edu","Burke","Cooper",4),
  ("viverra.donec@aol.org","Danielle","Mcdowell",14),
  ("nunc.id.enim@google.org","Tallulah","Rowland",4);
INSERT INTO `myTable` (`email`,`f_name`,`l_name`,`Affiliation_affiliation_id`)
VALUES
  ("commodo.ipsum.suspendisse@yahoo.net","Darrel","Cook",8),
  ("ipsum.phasellus.vitae@yahoo.edu","Graham","Rice",11),
  ("laoreet.posuere@yahoo.ca","Mia","Rocha",2),
  ("eget@aol.ca","Daria","Cobb",11),
  ("dis.parturient@google.org","Fay","Nielsen",13),
  ("morbi@hotmail.ca","Drew","Cooke",7),
  ("lorem.lorem@outlook.com","Brennan","Beasley",3),
  ("fames.ac@protonmail.ca","Autumn","Gross",2),
  ("egestas.duis@outlook.org","Lila","Pacheco",13),
  ("non.lorem@protonmail.com","Kibo","Bryant",11);
INSERT INTO `myTable` (`email`,`f_name`,`l_name`,`Affiliation_affiliation_id`)
VALUES
  ("sed.tortor.integer@protonmail.couk","Gwendolyn","Curtis",17),
  ("massa.quisque@outlook.couk","Pearl","Johnston",12),
  ("lobortis.tellus@aol.com","Kimberly","Kramer",10),
  ("sagittis.augue@hotmail.edu","Anjolie","Beasley",12),
  ("auctor.odio.a@hotmail.ca","Quin","Blake",18),
  ("lobortis.augue.scelerisque@outlook.couk","Kadeem","Gibbs",19),
  ("class.aptent@google.couk","Myra","Romero",16),
  ("egestas.urna@icloud.couk","Sheila","Avila",16),
  ("mus@yahoo.com","Jemima","Perry",12),
  ("a.auctor@google.couk","Lydia","Gates",11);
INSERT INTO `myTable` (`email`,`f_name`,`l_name`,`Affiliation_affiliation_id`)
VALUES
  ("neque.in@outlook.org","Yoshi","Horn",1),
  ("purus.gravida@yahoo.edu","Ferris","Reyes",12),
  ("consectetuer@yahoo.ca","Rashad","Moran",6),
  ("eu.neque.pellentesque@icloud.ca","Leila","Gonzalez",18),
  ("sed.eget@outlook.edu","Roth","Tate",5),
  ("sagittis.duis@protonmail.com","Aiko","Francis",7),
  ("est.mauris@hotmail.couk","Isabelle","Mcintosh",15),
  ("sit@icloud.net","Lester","Bradford",17),
  ("in.mi.pede@outlook.com","Jerome","Kelly",10),
  ("etiam.ligula.tortor@aol.com","Cally","Hampton",13);
