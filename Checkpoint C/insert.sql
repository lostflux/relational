/* Script to insert test data into the database */
DROP TABLE IF EXISTS Issue;

-- number of issues:: 10
INSERT INTO Issue (year,period,publication_date)
VALUES
  (2022,1,"01/12/2022"),
  (2022,2,"03/08/2022"),
  (2024,3,"04/20/2022"),
  (2022,4,"06/21/2023"),
  (2023,1,"05/07/2023"),
  (2022,2,"10/16/2023"),
  (2023,3,"12/17/2022"),
  (2023,4,"12/19/2022"),
  (2022,1,"07/12/2023"),
  (2023,2,"01/08/2022");

-- number of RICodes:: 10
INSERT INTO RICodes (code,interest)
VALUES
  (1,"Chemistry"),
  (2,"Sociology"),
  (3,"Biology"),
  (4,"Mathematics"),
  (5,"Physics"),
  (6,"Geography"),
  (7,"History"),
  (8,"Economics"),
  (9,"Psychology"),
  (10,"Computer Science");

-- number of Affiliation:: 20
INSERT INTO Affiliation (name)
VALUES
  ("University of Oxford"),
  ("University of Cambridge"),
  ("Imperial College London"),
  ("University College London"),
  ("University of Edinburgh"),
  ("University of Manchester"),
  ("University of Bristol"),
  ("King's College London"),
  ("University of Warwick"),
  ("University of Birmingham");
INSERT INTO Affiliation (name)
VALUES
  ("University of Sheffield"),
  ("University of Glasgow"),
  ("University of Leeds"),
  ("University of Liverpool"),
  ("University of Nottingham"),
  ("University of Leicester"),
  ("University of Southampton"),
  ("University of St Andrews"),
  ("University of Bath"),
  ("University of York");

-- number of Authors:: 60
INSERT INTO Author (email,f_name,l_name)
VALUES
  ("neque.tellus@yahoo.ca","Ursa","Holman"),
  ("proin.non@yahoo.net","Lucius","Solis"),
  ("et.euismod@hotmail.ca","Cole","Bradford"),
  ("cursus.diam.at@hotmail.couk","Cassady","Nelson"),
  ("ultrices.posuere.cubilia@aol.org","Drake","Leach"),
  ("egestas.sed.pharetra@icloud.edu","Claire","Brock"),
  ("eu.dui@hotmail.couk","Miranda","Strong"),
  ("duis.at@hotmail.edu","Ainsley","Bowman"),
  ("id@yahoo.org","Dennis","Lester"),
  ("mattis.cras.eget@google.org","Dara","Hopkins");
INSERT INTO Author (email,f_name,l_name)
VALUES
  ("integer@icloud.ca","Ulysses","Hopkins"),
  ("pretium.aliquet.metus@protonmail.edu","Alana","Simpson"),
  ("elit.elit@yahoo.edu","Adria","Leach"),
  ("aliquam@outlook.edu","Belle","Talley"),
  ("commodo.hendrerit.donec@yahoo.org","Noble","Eaton"),
  ("curabitur.sed.tortor@outlook.org","Cally","Nguyen"),
  ("vitae@icloud.couk","Keelie","Albert"),
  ("at.sem@google.net","Gareth","Stein"),
  ("erat.vitae@google.edu","Denise","Gardner"),
  ("non@aol.com","Rooney","Kelly");
INSERT INTO Author (email,f_name,l_name)
VALUES
  ("eu@outlook.org","Ulric","Grimes"),
  ("dolor.nulla@outlook.ca","Christopher","Figueroa"),
  ("vestibulum.accumsan.neque@yahoo.com","Madonna","Orr"),
  ("ipsum.primis.in@outlook.net","Austin","Lancaster"),
  ("eros.non@protonmail.edu","Tad","Porter"),
  ("est.mauris.rhoncus@aol.com","Scarlet","Hewitt"),
  ("donec@outlook.com","Patience","Ford"),
  ("libero@hotmail.net","Nolan","Kirk"),
  ("eu.metus@icloud.com","Craig","Burgess"),
  ("est.congue@google.edu","Fitzgerald","Kirby");
INSERT INTO Author (email,f_name,l_name)
VALUES
  ("pretium.aliquet@aol.org","Salvador","Bowers"),
  ("velit.sed.malesuada@google.com","Gage","Mann"),
  ("est.arcu@hotmail.ca","Russell","Hale"),
  ("morbi@outlook.com","Cora","Evans"),
  ("placerat.orci@hotmail.ca","Iola","Woodward"),
  ("dolor.tempus.non@protonmail.net","Doris","Brooks"),
  ("magna.tellus@yahoo.edu","Alana","Sanchez"),
  ("erat.in@aol.net","Sean","Robles"),
  ("vehicula.risus@aol.couk","Amela","Nash"),
  ("euismod.urna@hotmail.com","Nash","Nixon");
INSERT INTO Author (email,f_name,l_name)
VALUES
  ("ultricies.ligula@hotmail.net","Hector","O'donnell"),
  ("eget.varius@aol.edu","Tamekah","Glass"),
  ("in.magna@hotmail.edu","Xyla","Jimenez"),
  ("parturient.montes.nascetur@yahoo.couk","Kristen","Haney"),
  ("rhoncus.proin.nisl@yahoo.couk","Aphrodite","Myers"),
  ("vivamus.non.lorem@protonmail.couk","Finn","Wong"),
  ("mi.duis@outlook.com","Austin","Benjamin"),
  ("ornare.fusce@yahoo.ca","Giselle","Clarke"),
  ("dignissim.magna@hotmail.com","Caryn","Copeland"),
  ("imperdiet@hotmail.ca","Orla","O'connor");
INSERT INTO Author (email,f_name,l_name)
VALUES
  ("nulla.eu@google.net","Andrew","Henderson"),
  ("ac.mattis@protonmail.couk","Xyla","Nunez"),
  ("cras@aol.com","Wyoming","Forbes"),
  ("tempor.diam.dictum@protonmail.net","Lyle","Nolan"),
  ("aliquam.arcu@protonmail.org","Germane","Tran"),
  ("nam.porttitor@hotmail.com","Evan","Stout"),
  ("magna.lorem@aol.ca","Kylan","Gardner"),
  ("parturient@protonmail.couk","Lois","Randolph"),
  ("natoque.penatibus.et@protonmail.edu","Driscoll","Beard"),
  ("conubia.nostra@google.net","Evan","Nunez");

-- number of journal:: 20
INSERT INTO Journal (journal_name)
VALUES
  ("Journal of the American Chemical Society"),
  ("Journal of the American Medical Association"),
  ("Nature"),
  ("Science"),
  ("Nature Reviews Drug Discovery"),
  ("Nature Reviews Molecular Cell Biology"),
  ("Nature Reviews Genetics"),
  ("Nature Reviews Neuroscience"),
  ("Nature Reviews Immunology"),
  ("Nature Reviews Microbiology");

INSERT INTO Journal (journal_name)
VALUES
  ("Journal of Chemistry"),
  ("Journal of Sociology"),
  ("Journal of Biology"),
  ("Journal of Mathematics"),
  ("Journal of Physics"),
  ("Journal of Geography"),
  ("Journal of History"),
  ("Journal of Economics"),
  ("Journal of Psychology"),
  ("Journal of Computer Science");

-- number of Reviewer:: 60
INSERT INTO Reviewer (email,f_name,l_name,Affiliation_affiliation_id)
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
INSERT INTO Reviewer (email,f_name,l_name,Affiliation_affiliation_id)
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
INSERT INTO Reviewer (email,f_name,l_name,Affiliation_affiliation_id)
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
INSERT INTO Reviewer (email,f_name,l_name,Affiliation_affiliation_id)
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
INSERT INTO Reviewer (email,f_name,l_name,Affiliation_affiliation_id)
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
INSERT INTO Reviewer (email,f_name,l_name,Affiliation_affiliation_id)
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

-- number of editor:: 15
INSERT INTO Editor (email,l_name,f_name,Journal_journal_id)
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
INSERT INTO Editor (email,l_name,f_name,Journal_journal_id)
VALUES
  ("a.scelerisque.sed@yahoo.edu","Burks","Joel",1),
  ("mollis@hotmail.com","Gutierrez","Kennan",4),
  ("orci@google.edu","Swanson","Lara",3),
  ("tristique.aliquet@yahoo.net","Eaton","Colin",6),
  ("felis.orci@hotmail.couk","Leach","Brianna",7);

-- number of Reviewer_has_Manuscript:: 200
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (13,45,"10/26/2022",5,6,4,9,6,"05/02/2024"),
  (42,27,"03/20/2022",10,0,1,3,0,"11/28/2022"),
  (25,22,"08/31/2023",9,10,3,7,4,"03/01/2022"),
  (21,28,"11/16/2023",8,5,1,6,1,"06/27/2024"),
  (39,73,"06/16/2023",9,10,6,7,2,"09/14/2022"),
  (21,36,"09/06/2023",2,2,5,1,9,"06/27/2024"),
  (39,54,"03/06/2024",6,8,7,5,9,"04/15/2023"),
  (34,31,"11/05/2022",9,2,3,1,3,"03/30/2022"),
  (47,80,"07/16/2023",5,3,4,1,4,"05/19/2022"),
  (33,4,"08/06/2024",3,1,8,9,4,"03/21/2022");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (2,68,"01/29/2024",6,0,7,5,8,"01/30/2022"),
  (43,56,"04/19/2022",5,9,0,7,4,"09/10/2023"),
  (47,51,"10/06/2023",7,7,10,10,9,"09/26/2022"),
  (21,69,"11/16/2022",2,4,7,8,4,"06/25/2024"),
  (20,53,"12/29/2022",9,6,1,8,3,"01/10/2022"),
  (10,73,"04/17/2022",7,2,4,6,9,"08/01/2022"),
  (47,22,"07/30/2024",4,7,0,1,6,"02/03/2023"),
  (38,59,"09/21/2023",6,9,9,4,7,"05/08/2024"),
  (46,72,"05/27/2023",8,6,5,6,6,"11/15/2021"),
  (0,85,"12/05/2023",7,9,8,10,5,"10/25/2023");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (35,80,"12/01/2023",1,1,6,4,0,"09/16/2022"),
  (6,18,"10/27/2023",6,6,8,1,8,"07/03/2024"),
  (29,45,"05/30/2023",3,3,5,5,5,"06/02/2024"),
  (21,10,"04/02/2022",4,4,6,2,0,"06/01/2024"),
  (21,48,"12/07/2022",9,9,10,5,10,"12/25/2023"),
  (17,97,"02/15/2022",7,7,1,1,9,"09/29/2023"),
  (13,51,"03/30/2022",9,3,2,9,9,"03/19/2023"),
  (14,4,"01/28/2024",1,8,1,9,7,"10/26/2022"),
  (13,11,"12/09/2023",7,4,2,7,1,"10/16/2022"),
  (35,78,"09/24/2022",7,10,9,3,3,"04/01/2023");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (39,18,"02/12/2024",9,3,8,1,2,"07/28/2024"),
  (34,24,"08/20/2024",0,4,9,1,10,"07/11/2023"),
  (17,44,"03/30/2024",6,2,9,3,6,"07/13/2024"),
  (24,48,"07/18/2023",7,7,3,5,4,"11/01/2021"),
  (38,63,"02/21/2022",1,3,6,5,1,"06/27/2022"),
  (10,56,"12/02/2021",0,4,6,0,2,"05/21/2022"),
  (45,31,"04/08/2022",7,5,9,2,5,"07/04/2022"),
  (33,55,"06/23/2022",4,4,2,4,1,"06/13/2022"),
  (5,13,"02/02/2022",3,10,9,9,4,"03/21/2023"),
  (33,28,"03/01/2022",4,6,3,3,10,"01/26/2023");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (44,9,"12/27/2021",2,6,4,1,0,"07/24/2023"),
  (30,47,"06/09/2022",9,8,5,5,4,"06/27/2023"),
  (48,92,"06/25/2023",0,10,5,1,8,"11/06/2021"),
  (10,18,"11/23/2023",6,8,1,4,4,"05/23/2022"),
  (47,34,"06/08/2022",10,5,5,1,9,"06/30/2022"),
  (33,5,"01/04/2022",4,4,7,9,3,"06/04/2023"),
  (6,94,"11/01/2023",2,2,2,2,7,"01/01/2024"),
  (50,30,"06/17/2022",1,8,0,4,1,"10/10/2023"),
  (40,22,"11/12/2022",5,1,9,1,4,"12/14/2021"),
  (2,64,"12/19/2021",9,2,2,1,10,"04/03/2022");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (30,3,"11/24/2021",2,3,3,1,7,"08/31/2022"),
  (27,12,"04/23/2024",10,0,2,9,6,"08/07/2022"),
  (22,64,"04/04/2023",2,7,0,4,9,"04/06/2023"),
  (31,85,"07/21/2022",5,1,1,3,2,"06/05/2023"),
  (48,76,"01/11/2022",2,7,7,7,10,"04/05/2024"),
  (5,32,"12/23/2023",5,8,5,8,2,"03/29/2024"),
  (11,55,"04/11/2024",9,5,5,4,1,"06/09/2022"),
  (24,90,"05/13/2024",1,7,0,4,8,"08/15/2024"),
  (1,50,"02/28/2022",9,2,0,8,3,"05/17/2022"),
  (21,12,"05/16/2024",8,2,9,1,7,"03/09/2022");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (30,20,"04/04/2024",7,5,7,8,9,"02/06/2023"),
  (44,82,"05/31/2023",8,2,6,7,5,"12/13/2021"),
  (11,24,"07/28/2024",0,5,6,1,2,"05/27/2023"),
  (27,86,"07/11/2024",4,9,4,8,6,"05/30/2024"),
  (37,67,"08/21/2023",9,7,8,7,9,"01/06/2023"),
  (17,31,"03/24/2023",10,7,7,9,1,"07/14/2022"),
  (35,25,"08/04/2023",10,7,1,9,4,"06/23/2024"),
  (45,35,"06/10/2023",6,0,4,2,6,"04/01/2023"),
  (34,61,"12/19/2021",3,4,1,6,0,"06/04/2022"),
  (8,28,"04/14/2022",8,2,6,2,7,"10/06/2022");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (13,44,"08/27/2024",8,0,0,9,1,"10/01/2023"),
  (39,39,"07/07/2024",8,6,5,5,5,"03/30/2024"),
  (48,94,"08/04/2022",7,7,3,6,3,"06/15/2023"),
  (48,46,"05/18/2022",8,9,7,2,1,"09/23/2022"),
  (16,91,"10/17/2022",0,1,8,2,9,"09/26/2022"),
  (7,3,"07/24/2024",3,5,5,3,1,"05/20/2023"),
  (13,92,"10/20/2022",6,4,6,9,6,"03/01/2023"),
  (37,72,"12/02/2023",2,7,6,1,8,"01/27/2023"),
  (24,87,"06/28/2023",7,7,9,6,4,"12/02/2022"),
  (24,88,"10/02/2022",1,4,1,4,3,"03/04/2024");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (13,49,"04/01/2022",4,3,2,2,7,"02/02/2023"),
  (38,34,"06/07/2022",0,7,10,3,4,"05/30/2023"),
  (20,78,"11/27/2021",2,8,9,1,9,"04/08/2023"),
  (39,24,"05/11/2023",5,7,2,2,3,"11/09/2021"),
  (25,72,"07/03/2022",2,0,7,8,3,"10/28/2023"),
  (39,44,"01/04/2024",3,4,4,7,4,"12/06/2023"),
  (27,95,"08/20/2023",3,8,0,7,9,"03/14/2024"),
  (26,13,"09/20/2022",9,7,6,5,7,"12/15/2023"),
  (47,15,"06/06/2023",8,1,3,7,7,"10/03/2022"),
  (38,38,"10/13/2022",6,4,5,4,2,"02/11/2024");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (31,89,"12/03/2023",0,9,4,1,3,"12/15/2021"),
  (11,73,"03/03/2022",8,9,1,5,3,"08/30/2023"),
  (31,77,"08/24/2023",1,1,8,10,8,"03/26/2022"),
  (47,92,"05/20/2022",9,1,8,7,3,"06/24/2023"),
  (20,29,"06/22/2023",5,0,6,2,6,"04/27/2024"),
  (4,9,"12/15/2022",4,4,0,3,4,"09/07/2023"),
  (45,12,"04/04/2022",7,7,9,9,4,"08/03/2022"),
  (15,87,"06/08/2022",10,9,4,1,9,"08/07/2022"),
  (45,8,"04/29/2022",1,4,2,1,9,"05/16/2024"),
  (45,93,"04/05/2024",8,8,4,2,7,"08/18/2023");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (29,76,"08/18/2024",9,7,1,3,7,"05/01/2024"),
  (21,94,"09/18/2023",9,9,9,6,3,"11/23/2021"),
  (30,91,"01/18/2024",5,9,5,4,5,"04/06/2023"),
  (49,99,"02/07/2023",0,1,8,8,9,"09/01/2023"),
  (2,76,"12/20/2023",0,1,5,4,1,"10/19/2022"),
  (19,17,"06/11/2022",9,7,4,3,3,"07/06/2022"),
  (3,70,"04/20/2023",2,0,6,5,1,"11/18/2021"),
  (17,1,"09/06/2022",2,8,2,5,3,"04/03/2024"),
  (33,82,"04/29/2022",5,8,5,0,4,"04/04/2023"),
  (9,40,"06/17/2024",8,7,5,5,2,"04/13/2023");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (41,26,"08/01/2024",1,4,3,5,3,"11/10/2023"),
  (35,87,"09/14/2023",6,9,7,5,2,"01/21/2022"),
  (0,48,"07/15/2022",7,9,5,6,4,"11/18/2022"),
  (42,56,"01/14/2023",7,5,7,2,2,"08/01/2022"),
  (16,34,"03/02/2024",5,6,1,6,2,"12/16/2021"),
  (12,6,"09/23/2022",2,2,3,7,4,"09/15/2023"),
  (46,13,"03/13/2023",2,3,1,8,6,"12/31/2021"),
  (1,71,"08/24/2022",2,4,7,7,10,"05/23/2023"),
  (31,44,"09/01/2022",9,1,5,5,4,"12/03/2023"),
  (28,21,"09/20/2023",4,6,7,6,6,"12/04/2021");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (24,83,"06/01/2022",9,3,7,1,5,"10/11/2023"),
  (26,34,"12/17/2021",3,2,3,6,1,"08/09/2022"),
  (42,57,"05/13/2024",6,5,3,3,8,"11/10/2023"),
  (22,28,"11/25/2022",3,4,1,8,9,"02/08/2024"),
  (4,19,"11/13/2022",10,5,0,5,8,"06/03/2022"),
  (22,28,"06/23/2024",2,7,7,3,5,"04/13/2023"),
  (1,17,"05/14/2023",2,6,6,6,7,"02/09/2022"),
  (41,1,"08/07/2024",10,9,3,4,6,"01/16/2022"),
  (11,93,"03/21/2022",7,9,10,0,0,"07/08/2024"),
  (37,3,"06/20/2024",7,6,0,8,7,"11/22/2021");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (26,5,"11/23/2022",5,10,10,8,5,"08/24/2024"),
  (23,56,"01/24/2022",2,3,7,1,9,"08/22/2022"),
  (28,38,"12/16/2023",0,0,6,9,3,"06/03/2023"),
  (30,58,"07/06/2023",5,4,10,6,7,"01/21/2022"),
  (15,79,"05/30/2022",1,8,2,0,7,"06/20/2022"),
  (5,37,"08/17/2023",1,7,8,5,7,"01/24/2022"),
  (9,17,"09/28/2022",7,0,1,10,9,"02/13/2022"),
  (48,87,"07/15/2022",8,3,8,3,4,"07/18/2024"),
  (48,49,"03/23/2023",1,7,3,5,8,"11/23/2021"),
  (23,62,"03/13/2022",4,7,5,3,10,"07/19/2022");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (39,51,"01/21/2023",7,4,7,3,1,"08/06/2022"),
  (19,31,"04/14/2022",5,9,5,3,1,"02/02/2023"),
  (24,99,"02/20/2023",4,5,6,3,6,"03/14/2022"),
  (4,3,"11/17/2021",1,8,2,9,2,"04/08/2023"),
  (23,99,"10/29/2021",5,8,9,3,3,"11/24/2021"),
  (47,91,"06/20/2022",6,6,6,9,9,"04/30/2024"),
  (21,79,"02/19/2022",7,0,2,9,8,"07/25/2024"),
  (5,15,"02/11/2022",8,6,9,2,2,"04/09/2023"),
  (25,31,"09/24/2022",10,2,4,4,2,"05/18/2024"),
  (39,77,"02/22/2022",9,8,9,8,2,"05/26/2022");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (10,38,"03/08/2024",3,1,3,0,4,"05/17/2022"),
  (10,88,"04/23/2023",9,3,2,9,3,"04/26/2024"),
  (34,87,"04/12/2024",5,3,0,5,0,"04/18/2023"),
  (14,15,"08/24/2022",9,4,1,2,9,"06/14/2023"),
  (37,96,"05/17/2024",3,7,3,3,1,"05/13/2022"),
  (32,1,"03/12/2022",1,4,6,3,5,"01/28/2022"),
  (42,56,"05/17/2022",4,9,1,3,7,"03/19/2022"),
  (40,20,"06/05/2022",7,8,5,5,5,"08/05/2023"),
  (18,67,"05/31/2024",7,9,8,1,2,"05/07/2022"),
  (15,32,"07/10/2023",2,6,8,2,5,"04/24/2024");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (16,91,"07/26/2024",4,8,2,6,5,"08/10/2023"),
  (27,29,"08/19/2023",3,4,9,4,2,"12/31/2022"),
  (3,61,"06/22/2022",2,3,6,9,4,"12/28/2023"),
  (20,36,"06/03/2022",10,0,3,5,1,"02/15/2024"),
  (2,91,"05/14/2022",5,6,2,1,1,"06/01/2024"),
  (31,59,"09/04/2022",1,9,2,6,4,"12/23/2021"),
  (1,0,"05/28/2022",0,2,2,5,4,"03/15/2023"),
  (12,74,"01/19/2022",1,8,7,2,10,"02/08/2022"),
  (45,27,"05/11/2023",8,4,3,7,1,"03/27/2022"),
  (48,76,"08/27/2023",5,0,9,9,8,"07/17/2023");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (10,97,"10/08/2022",7,4,9,2,9,"07/31/2023"),
  (37,44,"10/19/2023",3,3,4,6,7,"07/22/2022"),
  (18,70,"09/25/2023",6,7,2,9,5,"10/17/2023"),
  (23,51,"05/16/2022",4,8,4,1,5,"01/19/2024"),
  (15,8,"05/20/2022",5,4,0,0,8,"02/19/2024"),
  (47,65,"06/08/2022",4,0,1,5,7,"02/10/2023"),
  (48,69,"02/28/2024",8,8,0,5,0,"03/21/2023"),
  (17,63,"10/27/2023",4,2,8,1,9,"09/01/2022"),
  (0,38,"03/17/2022",2,8,1,8,4,"08/26/2023"),
  (37,25,"11/05/2023",3,5,7,9,9,"04/13/2023");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (44,92,"04/04/2024",1,5,1,3,6,"09/08/2023"),
  (38,95,"06/08/2023",4,7,4,9,8,"08/31/2022"),
  (41,84,"02/21/2023",1,7,4,5,4,"01/19/2022"),
  (15,92,"01/30/2022",2,7,1,9,2,"02/07/2022"),
  (34,67,"06/24/2022",6,10,7,8,5,"03/15/2023"),
  (27,11,"09/22/2022",1,6,7,4,1,"12/20/2021"),
  (5,32,"03/08/2024",8,8,9,9,9,"03/11/2023"),
  (35,30,"11/07/2023",2,6,3,2,2,"04/09/2024"),
  (35,33,"05/27/2024",6,9,8,6,9,"09/24/2022"),
  (42,36,"02/04/2022",9,3,5,6,2,"08/21/2022");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (26,89,"02/28/2022",5,7,6,4,3,"02/18/2023"),
  (28,9,"01/21/2022",5,5,4,2,9,"10/06/2023"),
  (29,98,"12/20/2022",5,8,10,4,8,"03/06/2022"),
  (24,51,"04/08/2023",3,8,5,8,3,"03/12/2022"),
  (12,86,"05/14/2023",0,4,9,1,0,"08/26/2024"),
  (16,75,"10/07/2023",7,3,6,1,0,"01/22/2023"),
  (38,2,"02/10/2022",5,6,4,9,8,"01/21/2022"),
  (30,71,"03/05/2022",8,6,5,0,1,"10/05/2022"),
  (42,26,"07/03/2024",2,3,5,5,1,"06/01/2023"),
  (30,38,"12/15/2022",8,8,6,8,10,"08/01/2023");

-- number of Journal_has_RICodes: 20
INSERT INTO Journal_has_RICodes (Journal_journal_id,RICode_RI_code)
VALUES
  (0,3),
  (1,3),
  (2,3),
  (3,1),
  (4,1),
  (5,1),
  (6,2),
  (7,4),
  (8,4),
  (9,5),
INSERT INTO Journal_has_RICodes (Journal_journal_id,RICode_RI_code)
VALUES
  (10,7),
  (11,8),
  (12,8),
  (13,9),
  (14,10),
  (15,10),
  (16,6),
  (17,6),
  (18,7),
  (19,7);

-- number of manuscript: 200
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("fringilla euismod enim. Etiam gravida molestie arcu.","11/13/2021","in typesetting",6,"04/05/2023",3,2,9),
  ("eu, ultrices sit amet, risus. Donec","06/11/2022","schedule for publication",17,"07/06/2024",8,4,3),
  ("convallis dolor. Quisque tincidunt pede ac urna. Ut","09/25/2023","accepted",8,"01/24/2022",4,12,4),
  ("augue porttitor interdum. Sed auctor","12/18/2021","in typesetting",18,"02/23/2023",7,2,3),
  ("a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis","04/17/2022","rejected",18,"12/19/2021",6,1,0),
  ("non massa non ante bibendum ullamcorper. Duis cursus,","06/04/2022","rejected",8,"06/19/2024",9,1,5),
  ("mollis. Integer tincidunt aliquam arcu. Aliquam ultrices","04/11/2023","rejected",7,"01/31/2023",10,12,4),
  ("neque. In ornare sagittis felis. Donec","06/09/2024","under review",12,"04/15/2022",3,10,9),
  ("luctus felis purus ac tellus. Suspendisse sed","08/15/2023","rejected",12,"06/23/2023",5,10,0),
  ("dapibus quam quis diam. Pellentesque","12/16/2021","accepted",14,"09/23/2022",10,3,0);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("mauris ipsum porta elit, a feugiat tellus lorem eu","01/07/2024","rejected",15,"09/15/2023",6,8,4),
  ("Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec,","12/05/2021","in typesetting",8,"05/27/2024",6,4,0),
  ("sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices","07/27/2024","in typesetting",15,"09/23/2022",6,4,1),
  ("turpis. Aliquam adipiscing lobortis risus.","12/21/2022","under review",11,"05/20/2022",7,8,3),
  ("neque vitae semper egestas, urna justo","08/28/2023","submitted",19,"06/24/2022",6,1,8),
  ("fermentum convallis ligula. Donec luctus aliquet odio.","05/21/2023","schedule for publication",16,"08/12/2023",7,4,5),
  ("sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices","02/01/2022","submitted",15,"04/30/2024",3,13,9),
  ("Duis volutpat nunc sit amet","07/04/2022","under review",15,"05/26/2024",4,11,9),
  ("mi lacinia mattis. Integer eu","02/03/2024","accepted",10,"06/09/2024",5,12,8),
  ("leo. Cras vehicula aliquet libero. Integer in magna.","08/19/2023","schedule for publication",12,"09/26/2022",8,8,4);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("tincidunt pede ac urna. Ut tincidunt","04/15/2022","under review",11,"03/03/2023",3,1,5),
  ("placerat, augue. Sed molestie. Sed id","11/21/2023","under review",19,"04/27/2022",4,8,7),
  ("sollicitudin a, malesuada id,","05/25/2022","under review",7,"02/19/2023",1,6,6),
  ("est ac mattis semper, dui lectus rutrum urna,","01/01/2022","in typesetting",11,"08/31/2024",8,1,7),
  ("accumsan convallis, ante lectus convallis est, vitae sodales","04/18/2022","rejected",14,"06/30/2022",4,14,7),
  ("et ultrices posuere cubilia Curae Phasellus","12/27/2021","ready",15,"12/29/2023",6,13,8),
  ("lacinia mattis. Integer eu lacus. Quisque imperdiet, erat","05/18/2023","accepted",17,"08/24/2022",10,9,9),
  ("Suspendisse sagittis. Nullam vitae diam. Proin dolor.","02/26/2023","rejected",8,"01/11/2022",5,1,3),
  ("In scelerisque scelerisque dui. Suspendisse ac metus vitae","10/23/2021","accepted",13,"08/17/2022",7,5,4),
  ("tortor at risus. Nunc ac sem ut","04/08/2024","ready",8,"05/04/2024",8,4,4);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("sit amet luctus vulputate,","03/06/2022","accepted",17,"02/10/2023",10,13,2),
  ("feugiat nec, diam. Duis mi enim,","07/16/2022","submitted",9,"07/30/2023",1,11,3),
  ("Quisque imperdiet, erat nonummy ultricies","02/05/2023","rejected",10,"05/06/2022",10,2,3),
  ("mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse","02/18/2024","rejected",10,"12/17/2023",4,4,5),
  ("sapien. Nunc pulvinar arcu et pede. Nunc sed","01/04/2022","ready",17,"04/08/2022",6,9,1),
  ("ultricies sem magna nec quam. Curabitur vel lectus.","08/15/2022","ready",11,"12/30/2022",2,6,3),
  ("neque. Nullam nisl. Maecenas malesuada fringilla","04/15/2024","in typesetting",19,"05/25/2023",10,7,1),
  ("quis, pede. Suspendisse dui. Fusce diam nunc,","12/31/2021","ready",19,"08/12/2024",1,4,5),
  ("consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam","01/23/2024","in typesetting",7,"07/06/2022",8,10,1),
  ("Donec non justo. Proin non massa non ante","11/01/2022","in typesetting",11,"12/18/2023",7,10,1);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("Proin vel arcu eu odio","11/12/2022","schedule for publication",13,"11/18/2021",2,9,6),
  ("erat eget ipsum. Suspendisse","04/02/2023","rejected",12,"12/26/2022",9,6,8),
  ("suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in","05/17/2022","ready",20,"08/30/2023",4,12,2),
  ("Proin non massa non ante bibendum ullamcorper. Duis","08/11/2024","submitted",15,"08/26/2022",8,10,2),
  ("lobortis quam a felis ullamcorper","06/08/2023","in typesetting",15,"08/27/2023",9,2,6),
  ("turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque","10/18/2023","accepted",14,"08/09/2023",7,12,3),
  ("lectus, a sollicitudin orci sem eget massa. Suspendisse","06/10/2023","submitted",7,"05/28/2022",4,2,6),
  ("non, sollicitudin a, malesuada id, erat. Etiam vestibulum","04/29/2023","ready",10,"02/24/2023",4,11,5),
  ("lectus pede et risus. Quisque libero lacus, varius et,","05/08/2022","ready",8,"09/15/2022",4,11,2),
  ("bibendum sed, est. Nunc laoreet lectus quis","07/24/2023","accepted",12,"05/23/2024",5,14,2);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("purus, in molestie tortor nibh sit amet orci. Ut","10/30/2022","ready",9,"07/19/2022",8,1,7),
  ("vulputate velit eu sem. Pellentesque ut ipsum ac","03/11/2023","under review",13,"07/20/2024",2,4,1),
  ("libero. Integer in magna. Phasellus dolor elit, pellentesque a,","02/11/2022","rejected",20,"08/28/2023",9,2,2),
  ("nec, mollis vitae, posuere at, velit. Cras lorem","08/23/2024","rejected",16,"11/13/2021",2,5,4),
  ("Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit.","08/22/2022","accepted",10,"08/23/2022",5,13,6),
  ("rutrum eu, ultrices sit amet, risus. Donec nibh enim,","08/25/2024","ready",11,"07/23/2024",10,1,4),
  ("tincidunt pede ac urna. Ut tincidunt","06/19/2022","accepted",18,"11/12/2021",9,11,5),
  ("fermentum fermentum arcu. Vestibulum ante ipsum primis","01/29/2023","under review",13,"01/22/2023",7,2,2),
  ("hendrerit a, arcu. Sed et libero.","07/17/2023","rejected",8,"03/16/2023",5,8,1),
  ("erat nonummy ultricies ornare, elit elit fermentum","05/04/2024","in typesetting",11,"07/04/2022",10,4,1);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("augue porttitor interdum. Sed auctor odio a","05/10/2023","rejected",8,"08/17/2024",7,1,4),
  ("et magnis dis parturient montes, nascetur","02/23/2024","in typesetting",18,"12/10/2022",5,7,4),
  ("cursus. Integer mollis. Integer tincidunt aliquam","08/27/2023","rejected",19,"12/10/2022",4,9,4),
  ("sagittis felis. Donec tempor, est ac mattis semper,","03/08/2023","ready",8,"03/11/2023",2,1,8),
  ("nec, cursus a, enim. Suspendisse aliquet, sem","07/02/2023","in typesetting",14,"01/07/2022",8,5,2),
  ("diam vel arcu. Curabitur ut odio vel est tempor bibendum.","05/25/2024","accepted",10,"08/12/2022",3,9,1),
  ("sem magna nec quam. Curabitur vel lectus.","11/06/2023","accepted",16,"12/06/2023",3,12,6),
  ("aliquet lobortis, nisi nibh","05/19/2024","under review",15,"01/31/2023",3,12,5),
  ("nec, imperdiet nec, leo.","11/29/2022","ready",16,"07/15/2023",8,10,9),
  ("a, scelerisque sed, sapien. Nunc pulvinar arcu et pede.","08/12/2024","accepted",11,"12/14/2021",5,5,2);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("diam lorem, auctor quis,","11/01/2021","rejected",7,"12/05/2023",5,9,8),
  ("non enim. Mauris quis turpis","01/23/2023","under review",6,"09/15/2023",1,12,9),
  ("semper egestas, urna justo faucibus lectus, a sollicitudin","01/23/2024","submitted",7,"07/22/2023",9,11,3),
  ("fermentum vel, mauris. Integer sem elit, pharetra","04/03/2022","ready",15,"11/16/2022",6,0,4),
  ("pulvinar arcu et pede. Nunc sed orci lobortis","05/19/2022","submitted",14,"04/05/2022",8,8,1),
  ("facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec","02/18/2023","submitted",20,"03/23/2023",3,3,2),
  ("in consequat enim diam vel","12/24/2021","rejected",6,"02/11/2024",3,13,7),
  ("placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla","02/04/2023","ready",18,"01/24/2023",10,13,9),
  ("interdum enim non nisi. Aenean","11/30/2021","schedule for publication",19,"10/23/2021",9,4,2),
  ("dictum placerat, augue. Sed molestie. Sed id risus","09/16/2023","in typesetting",18,"03/28/2022",9,6,1);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu","04/13/2023","in typesetting",5,"09/29/2023",4,13,1),
  ("euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet,","11/03/2022","ready",14,"02/06/2022",8,5,7),
  ("mauris erat eget ipsum.","04/05/2023","under review",12,"04/18/2022",8,5,2),
  ("habitant morbi tristique senectus","04/22/2024","rejected",7,"12/13/2021",2,7,2),
  ("et ipsum cursus vestibulum. Mauris","03/31/2023","under review",18,"03/14/2024",2,4,1),
  ("convallis ligula. Donec luctus aliquet odio. Etiam ligula","04/07/2022","under review",17,"03/23/2023",10,1,0),
  ("Sed id risus quis diam","12/21/2023","under review",19,"10/04/2022",4,8,4),
  ("neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris","03/20/2022","rejected",15,"07/23/2024",10,4,7),
  ("Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam","09/22/2023","in typesetting",7,"08/14/2023",1,12,5),
  ("convallis, ante lectus convallis","03/20/2023","ready",17,"04/13/2024",1,4,1);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis","10/05/2022","accepted",5,"01/19/2023",4,9,8),
  ("sit amet, risus. Donec nibh","04/07/2023","accepted",19,"04/09/2023",3,2,7),
  ("tellus id nunc interdum feugiat.","07/19/2022","accepted",19,"11/11/2023",10,4,1),
  ("Proin dolor. Nulla semper tellus id nunc interdum","09/30/2023","in typesetting",9,"08/29/2022",4,4,7),
  ("nec orci. Donec nibh.","02/22/2022","accepted",7,"07/04/2023",6,4,5),
  ("feugiat tellus lorem eu metus. In","02/17/2023","in typesetting",16,"04/22/2024",6,8,0),
  ("eu arcu. Morbi sit amet massa. Quisque porttitor","11/11/2023","in typesetting",14,"03/01/2023",9,6,8),
  ("dui. Fusce diam nunc, ullamcorper eu,","04/09/2023","rejected",13,"03/22/2024",7,4,3),
  ("Cras eget nisi dictum augue malesuada malesuada. Integer","05/01/2022","rejected",16,"10/22/2021",9,1,0),
  ("magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum","08/25/2022","ready",17,"04/26/2022",6,9,3);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("mauris sit amet lorem semper auctor. Mauris vel turpis.","12/18/2022","under review",10,"12/01/2022",3,12,1),
  ("Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc","01/25/2023","in typesetting",7,"04/13/2022",4,3,5),
  ("consequat purus. Maecenas libero est, congue a,","01/18/2022","rejected",19,"05/23/2022",6,9,8),
  ("eleifend, nunc risus varius orci, in consequat enim","09/20/2022","in typesetting",12,"07/23/2024",2,4,6),
  ("ut, pellentesque eget, dictum","02/11/2023","rejected",10,"12/03/2023",1,10,2),
  ("eu, odio. Phasellus at","02/22/2022","rejected",10,"11/19/2021",1,8,3),
  ("luctus aliquet odio. Etiam ligula tortor, dictum eu,","07/01/2024","accepted",17,"04/25/2024",6,10,3),
  ("blandit enim consequat purus.","01/04/2024","accepted",10,"07/23/2023",5,0,6),
  ("felis eget varius ultrices, mauris","10/04/2023","ready",17,"02/02/2022",6,8,2),
  ("Donec non justo. Proin non massa non","07/22/2022","under review",20,"03/18/2023",10,13,4);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("vitae semper egestas, urna justo","08/19/2022","rejected",14,"11/30/2022",1,13,6),
  ("mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare,","03/02/2024","under review",9,"08/17/2023",5,11,9),
  ("cursus. Integer mollis. Integer tincidunt aliquam arcu.","06/19/2022","accepted",19,"12/14/2022",4,2,0),
  ("egestas nunc sed libero. Proin sed turpis","05/30/2022","accepted",16,"03/13/2024",3,2,3),
  ("eget, venenatis a, magna. Lorem ipsum dolor sit","06/17/2024","in typesetting",10,"02/21/2022",9,10,5),
  ("Morbi quis urna. Nunc quis","07/19/2024","under review",9,"08/13/2024",3,13,1),
  ("nec luctus felis purus","01/06/2024","in typesetting",9,"06/04/2023",5,1,2),
  ("sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id","09/16/2022","accepted",14,"04/01/2023",1,7,0),
  ("tempor augue ac ipsum. Phasellus vitae mauris","03/08/2023","accepted",14,"10/21/2023",7,5,0),
  ("scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed,","11/25/2023","under review",11,"01/16/2024",2,4,3);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("porttitor tellus non magna. Nam ligula elit, pretium","12/23/2022","accepted",5,"08/07/2022",6,11,6),
  ("feugiat tellus lorem eu metus.","03/05/2022","rejected",13,"04/26/2022",3,9,6),
  ("varius. Nam porttitor scelerisque neque. Nullam nisl.","12/01/2021","under review",6,"06/16/2023",6,2,5),
  ("Donec egestas. Duis ac arcu. Nunc mauris.","11/16/2023","rejected",9,"03/04/2023",4,14,5),
  ("elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum","06/25/2022","ready",19,"08/21/2024",10,5,0),
  ("felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus.","07/12/2024","accepted",7,"02/27/2023",8,11,8),
  ("nulla. Cras eu tellus eu augue porttitor interdum.","05/05/2023","accepted",18,"01/04/2022",9,1,2),
  ("Nunc lectus pede, ultrices a, auctor non, feugiat nec,","10/31/2023","under review",11,"02/25/2024",9,4,7),
  ("tellus. Suspendisse sed dolor. Fusce","08/17/2023","schedule for publication",11,"12/21/2021",5,4,2),
  ("interdum enim non nisi. Aenean eget","03/29/2023","schedule for publication",12,"08/14/2022",7,11,1);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("a odio semper cursus. Integer mollis. Integer","01/10/2022","in typesetting",14,"03/05/2023",9,12,1),
  ("purus sapien, gravida non, sollicitudin a, malesuada id, erat.","08/01/2024","rejected",8,"12/04/2022",2,0,6),
  ("penatibus et magnis dis parturient montes, nascetur ridiculus mus.","08/07/2023","in typesetting",12,"12/08/2023",2,8,6),
  ("interdum enim non nisi. Aenean eget metus. In","03/14/2023","ready",18,"10/22/2021",8,7,4),
  ("hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit","02/29/2024","ready",8,"05/21/2022",2,9,6),
  ("eros turpis non enim. Mauris quis","05/28/2022","schedule for publication",10,"07/01/2023",4,6,2),
  ("egestas blandit. Nam nulla magna,","07/02/2023","under review",8,"09/10/2022",4,1,3),
  ("tristique senectus et netus et malesuada fames ac","02/23/2023","accepted",9,"05/07/2022",7,5,4),
  ("placerat, orci lacus vestibulum lorem, sit amet ultricies","10/12/2023","in typesetting",9,"12/18/2021",9,6,2),
  ("bibendum ullamcorper. Duis cursus, diam at","04/29/2022","submitted",20,"03/13/2024",2,10,9);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("sem. Pellentesque ut ipsum ac mi","12/15/2023","rejected",8,"01/31/2023",1,4,9),
  ("interdum. Sed auctor odio a purus. Duis","01/26/2024","in typesetting",17,"04/05/2022",3,7,1),
  ("sem semper erat, in","06/02/2024","in typesetting",19,"12/13/2022",7,10,1),
  ("sem ut dolor dapibus gravida. Aliquam tincidunt, nunc","09/21/2023","in typesetting",10,"07/22/2022",8,13,4),
  ("volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla.","04/04/2023","rejected",14,"10/24/2023",7,6,8),
  ("nec, eleifend non, dapibus rutrum, justo. Praesent luctus.","06/26/2023","rejected",10,"10/09/2023",2,3,6),
  ("vulputate, risus a ultricies adipiscing, enim mi tempor","12/18/2022","schedule for publication",7,"07/03/2023",10,1,8),
  ("penatibus et magnis dis","07/04/2023","ready",8,"06/24/2024",1,9,2),
  ("egestas. Sed pharetra, felis eget varius","01/20/2023","rejected",8,"10/14/2022",4,13,6),
  ("risus a ultricies adipiscing, enim mi tempor lorem, eget","06/13/2022","in typesetting",8,"05/11/2024",2,5,5);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("a feugiat tellus lorem eu metus. In lorem. Donec","12/21/2021","in typesetting",6,"03/05/2022",6,12,6),
  ("et malesuada fames ac turpis egestas. Fusce","03/29/2023","rejected",7,"03/20/2024",7,11,7),
  ("purus, accumsan interdum libero dui nec","06/01/2023","rejected",13,"05/29/2023",2,13,0),
  ("semper erat, in consectetuer ipsum nunc","01/26/2023","under review",11,"10/21/2022",5,12,7),
  ("litora torquent per conubia nostra, per inceptos hymenaeos. Mauris","12/25/2022","accepted",19,"03/21/2024",3,4,6),
  ("iaculis enim, sit amet ornare lectus justo eu","09/01/2023","accepted",17,"05/04/2024",6,7,9),
  ("lacinia orci, consectetuer euismod est arcu","04/17/2022","schedule for publication",19,"06/24/2023",2,12,4),
  ("egestas a, dui. Cras pellentesque.","08/27/2024","under review",11,"04/15/2024",4,7,7),
  ("Integer tincidunt aliquam arcu. Aliquam ultrices","11/15/2021","in typesetting",8,"06/21/2022",9,8,6),
  ("egestas. Fusce aliquet magna a neque. Nullam","01/31/2023","submitted",15,"12/27/2021",2,1,6);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("et magnis dis parturient montes, nascetur ridiculus mus. Proin vel","11/03/2021","under review",9,"10/14/2022",2,6,3),
  ("eros. Nam consequat dolor vitae dolor. Donec","10/15/2022","accepted",17,"06/21/2022",8,8,6),
  ("aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio.","08/04/2024","under review",11,"04/26/2023",5,12,6),
  ("nunc nulla vulputate dui, nec tempus mauris","01/10/2024","in typesetting",5,"10/18/2023",8,11,9),
  ("non enim commodo hendrerit. Donec porttitor tellus non magna. Nam","04/13/2022","in typesetting",13,"12/15/2022",8,6,2),
  ("penatibus et magnis dis parturient montes, nascetur ridiculus","11/24/2023","in typesetting",18,"02/25/2023",4,0,2),
  ("lorem, sit amet ultricies sem magna","11/27/2022","accepted",15,"10/21/2022",6,7,8),
  ("adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum.","10/22/2022","in typesetting",15,"02/09/2023",2,11,8),
  ("elit erat vitae risus. Duis a","05/06/2023","submitted",12,"03/19/2022",8,5,2),
  ("a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras","06/06/2022","submitted",19,"04/30/2022",3,13,6);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam","01/08/2024","accepted",15,"08/21/2023",7,13,8),
  ("egestas nunc sed libero. Proin sed turpis nec mauris blandit","03/04/2023","ready",15,"02/15/2022",4,10,8),
  ("in, dolor. Fusce feugiat. Lorem","05/20/2024","rejected",8,"05/13/2022",4,3,9),
  ("mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus.","03/25/2024","under review",11,"11/20/2021",2,13,5),
  ("ipsum leo elementum sem, vitae aliquam eros turpis","12/25/2021","rejected",16,"08/25/2022",10,2,8),
  ("justo sit amet nulla. Donec non justo. Proin non","11/24/2023","ready",8,"04/15/2022",2,9,4),
  ("Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer","11/22/2021","rejected",19,"08/10/2023",9,11,7),
  ("vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum","07/03/2022","rejected",5,"03/23/2022",2,1,4),
  ("amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing","01/28/2022","accepted",11,"06/05/2023",3,3,0),
  ("ornare, elit elit fermentum risus, at fringilla purus","11/12/2023","rejected",17,"02/23/2022",7,7,5);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum","02/28/2022","schedule for publication",19,"02/08/2023",2,8,1),
  ("egestas, urna justo faucibus","07/07/2022","under review",6,"08/15/2023",6,14,1),
  ("luctus lobortis. Class aptent taciti sociosqu ad litora torquent","07/16/2023","submitted",8,"03/02/2022",10,2,3),
  ("Sed molestie. Sed id risus","10/28/2023","ready",5,"08/28/2023",2,9,8),
  ("lectus justo eu arcu. Morbi sit amet massa. Quisque","08/13/2022","accepted",5,"05/23/2024",3,8,5),
  ("vitae nibh. Donec est mauris, rhoncus id,","05/31/2023","ready",14,"05/09/2023",2,10,8),
  ("nisi. Mauris nulla. Integer urna. Vivamus","06/04/2024","rejected",19,"07/19/2022",3,8,2),
  ("aliquet, metus urna convallis erat, eget tincidunt dui augue eu","12/09/2023","in typesetting",18,"03/23/2023",5,9,1),
  ("diam luctus lobortis. Class aptent taciti sociosqu ad litora","11/14/2023","in typesetting",8,"08/08/2024",5,4,8),
  ("Sed diam lorem, auctor quis,","04/20/2023","under review",15,"07/22/2024",8,12,3);
INSERT INTO Manuscript (title,date_received,status,page_count,date_received,RICode_RiCode,Editor_editor_id,Issue_issue_id)
VALUES
  ("aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum","07/16/2024","submitted",9,"10/04/2022",3,9,3),
  ("primis in faucibus orci luctus et ultrices posuere","08/07/2024","rejected",20,"11/27/2022",4,10,6),
  ("dui. Suspendisse ac metus vitae","01/27/2022","accepted",7,"06/20/2022",3,7,3),
  ("lorem lorem, luctus ut, pellentesque","06/02/2024","ready",13,"08/27/2024",3,8,9),
  ("diam vel arcu. Curabitur ut","02/09/2022","in typesetting",13,"11/18/2023",2,3,2),
  ("Quisque ornare tortor at risus. Nunc","04/03/2024","rejected",11,"11/28/2023",7,10,7),
  ("auctor velit. Aliquam nisl. Nulla eu neque pellentesque","04/05/2022","ready",16,"10/10/2022",3,6,4),
  ("eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer","10/03/2023","rejected",9,"11/02/2022",8,8,0),
  ("massa lobortis ultrices. Vivamus rhoncus. Donec","10/19/2022","in typesetting",7,"09/22/2022",4,5,8),
  ("est. Nunc laoreet lectus quis massa. Mauris vestibulum,","12/05/2022","ready",16,"04/13/2024",4,1,5);

-- number of Manuscript_author:: 300
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (42,4,4),
  (41,9,3),
  (118,45,2),
  (86,57,2),
  (81,1,1),
  (188,27,4),
  (183,33,4),
  (1,15,4),
  (50,21,3),
  (198,23,4);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (68,12,2),
  (189,3,3),
  (123,9,4),
  (74,5,1),
  (198,46,1),
  (104,4,2),
  (50,48,4),
  (16,16,1),
  (84,22,3),
  (64,31,3);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (60,32,1),
  (62,20,3),
  (175,12,4),
  (115,7,3),
  (38,51,3),
  (89,30,4),
  (78,45,2),
  (144,12,4),
  (160,23,2),
  (95,1,2);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (27,30,2),
  (43,46,3),
  (133,56,4),
  (166,48,4),
  (51,36,3),
  (187,29,4),
  (19,2,2),
  (188,28,3),
  (77,1,5),
  (27,20,5);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (148,5,1),
  (41,22,2),
  (90,47,2),
  (118,46,2),
  (190,26,3),
  (119,9,4),
  (76,34,4),
  (123,13,3),
  (93,52,1),
  (42,18,4);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (103,1,2),
  (4,57,4),
  (176,25,4),
  (103,37,2),
  (72,15,3),
  (159,13,3),
  (122,2,1),
  (42,47,4),
  (143,11,3),
  (151,13,3);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (116,9,4),
  (190,23,4),
  (177,46,2),
  (196,33,4),
  (195,21,1),
  (196,2,5),
  (82,54,5),
  (57,16,2),
  (13,46,5),
  (7,57,2);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (171,28,3),
  (144,38,4),
  (150,42,3),
  (135,22,3),
  (38,15,3),
  (95,34,3),
  (117,4,2),
  (90,1,2),
  (17,31,1),
  (115,33,5);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (153,17,1),
  (41,23,4),
  (71,18,4),
  (67,45,3),
  (187,5,2),
  (64,36,5),
  (105,57,2),
  (185,48,1),
  (98,44,2),
  (132,16,2);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (112,18,3),
  (29,22,4),
  (170,59,2),
  (186,17,2),
  (61,52,4),
  (35,46,4),
  (26,33,3),
  (6,8,4),
  (81,18,5),
  (164,24,3);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (170,39,1),
  (4,18,1),
  (129,51,2),
  (1,49,4),
  (69,47,4),
  (61,33,2),
  (97,24,1),
  (48,20,1),
  (71,41,2),
  (83,57,1);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (90,7,4),
  (93,40,1),
  (198,4,2),
  (113,21,3),
  (184,39,2),
  (92,8,1),
  (109,14,4),
  (32,25,3),
  (83,51,2),
  (162,25,3);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (41,25,2),
  (59,7,4),
  (4,39,1),
  (133,28,3),
  (122,35,3),
  (42,28,5),
  (10,25,4),
  (174,24,2),
  (190,13,5),
  (123,12,5);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (111,33,2),
  (92,15,1),
  (83,16,4),
  (93,13,2),
  (49,56,1),
  (118,38,4),
  (53,21,4),
  (189,53,3),
  (194,10,1),
  (79,13,2);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (57,23,4),
  (38,32,5),
  (180,50,2),
  (125,9,3),
  (31,39,5),
  (179,41,3),
  (95,12,2),
  (164,15,4),
  (73,3,2),
  (42,10,5);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (95,31,4),
  (44,54,4),
  (129,37,5),
  (64,49,5),
  (149,35,3),
  (139,9,3),
  (166,16,4),
  (136,8,3),
  (30,42,4),
  (104,17,1);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (98,17,4),
  (172,52,3),
  (158,39,5),
  (45,47,4),
  (36,31,2),
  (105,46,2),
  (60,40,4),
  (122,44,4),
  (54,5,3),
  (66,56,1);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (150,10,1),
  (193,11,4),
  (154,4,2),
  (137,5,5),
  (151,9,2),
  (46,0,4),
  (190,56,2),
  (189,52,4),
  (36,29,4),
  (33,19,1);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (131,36,4),
  (3,5,1),
  (28,25,4),
  (181,8,4),
  (11,25,1),
  (147,52,4),
  (86,3,3),
  (169,20,5),
  (196,39,2),
  (19,33,1);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (93,54,1),
  (66,54,4),
  (115,3,2),
  (12,31,5),
  (143,1,2),
  (179,13,5),
  (44,5,2),
  (34,9,3),
  (37,5,1),
  (195,42,4);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (27,25,2),
  (177,48,3),
  (181,31,1),
  (165,10,1),
  (122,32,1),
  (96,23,2),
  (27,54,1),
  (53,42,2),
  (69,55,1),
  (79,5,4);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (163,26,5),
  (137,46,3),
  (38,57,2),
  (7,48,3),
  (85,17,4),
  (164,11,3),
  (192,28,5),
  (82,16,2),
  (160,10,4),
  (191,59,1);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (61,5,3),
  (9,27,3),
  (81,20,2),
  (168,30,4),
  (87,21,3),
  (110,3,5),
  (87,18,2),
  (127,41,3),
  (15,1,5),
  (13,24,2);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (182,20,3),
  (153,21,2),
  (17,22,1),
  (48,42,3),
  (185,50,2),
  (2,21,5),
  (160,48,3),
  (47,13,5),
  (56,21,4),
  (153,12,4);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (58,30,3),
  (13,12,1),
  (135,48,3),
  (87,43,4),
  (144,39,3),
  (186,18,3),
  (49,10,1),
  (18,16,4),
  (128,25,1),
  (178,46,3);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (76,44,4),
  (127,15,2),
  (97,40,5),
  (104,18,1),
  (198,3,2),
  (55,48,2),
  (5,43,4),
  (153,14,5),
  (153,29,2),
  (164,42,4);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (183,42,4),
  (31,30,3),
  (61,44,2),
  (194,58,1),
  (133,15,3),
  (66,8,3),
  (96,15,5),
  (108,8,5),
  (101,45,1),
  (165,30,2);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (6,36,3),
  (109,49,2),
  (187,29,1),
  (89,32,2),
  (43,58,3),
  (196,20,1),
  (64,18,2),
  (18,52,3),
  (45,5,4),
  (158,34,2);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (172,48,3),
  (156,20,2),
  (80,28,4),
  (13,11,3),
  (36,15,4),
  (26,10,3),
  (161,5,5),
  (123,17,3),
  (159,40,3),
  (61,37,2);
INSERT INTO Manuscript_author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (139,57,4),
  (123,16,1),
  (91,52,2),
  (104,5,2),
  (7,2,5),
  (120,19,5),
  (32,15,3),
  (34,2,3),
  (75,25,5),
  (108,43,1);
