/*
  Script to insert test data into the database 
  Author: Ke Lou, Amittai Siavava
 */


-- First, clear all data (if any) from the tables

DELETE FROM Manuscript_Author;
DELETE FROM Journal_has_RICodes;
DELETE FROM Reviewer_has_Manuscript;
DELETE FROM Manuscript;
DELETE FROM RICodes;
DELETE FROM Issue;
DELETE FROM Editor;
DELETE FROM Reviewer;
DELETE FROM Affiliation;
DELETE FROM Journal;
DELETE FROM Author;

SET SQL_SAFE_UPDATES = 0;
-- Reset auto-increment counters
ALTER TABLE Manuscript  AUTO_INCREMENT = 1;
ALTER TABLE RICodes     AUTO_INCREMENT = 1;
ALTER TABLE Issue       AUTO_INCREMENT = 1;
ALTER TABLE Editor      AUTO_INCREMENT = 1;
ALTER TABLE Reviewer    AUTO_INCREMENT = 1;
ALTER TABLE Affiliation AUTO_INCREMENT = 1;
ALTER TABLE Journal     AUTO_INCREMENT = 1;
ALTER TABLE Author      AUTO_INCREMENT = 1;

-- Insert data into the tables
-- number of issues: 10
INSERT INTO Issue (year,period,publication_date)
VALUES
  (2022,1,"2022-01-12"),
  (2022,2,"2022-08-03"),
  (2024,3,"2022-04-20"),
  (2022,4,"2023-06-21"),
  (2023,1,"2023-07-05"),
  (2022,2,"2023-10-16"),
  (2023,3,"2022-12-17"),
  (2023,4,"2022-12-19"),
  (2022,1,"2023-07-12"),
  (2023,2,"2022-01-08");

SELECT * FROM Issue;

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
  ("Journal of Computer Science"),
  ("Journal of Psychology"),
  ("Journal of Computer Science"),
  ("Journal of AI"),
  ("Journal of Combinatorics"),
  ("Journal of Statistics"),
  ("Journal of Probability"),
  ("Journal of Finance"),
  ("Journal of Management"),
  ("Journal of Marketing"),
  ("Journal of Accounting"),
  ("Journal of Medicine");

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
  ("dolor@outlook.org","Waters","Cassandra",1),
  ("dummyeditor@what.com", "Dummy", "Editor",7);

INSERT INTO Editor (email,l_name,f_name,Journal_journal_id)
VALUES
  ("a.scelerisque.sed@yahoo.edu","Burks","Joel",1),
  ("mollis@hotmail.com","Gutierrez","Kennan",4),
  ("orci@google.edu","Swanson","Lara",3),
  ("tristique.aliquet@yahoo.net","Eaton","Colin",6),
  ("felis.orci@hotmail.couk","Leach","Brianna",7);

-- number of manuscript: 200 
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id,page_number)
VALUES
  ("fringilla euismod enim. Etiam gravida molestie arcu.","2021-11-13","in typesetting",6,"2021-04-05",3,2,9,1),
  ("eu, ultrices sit amet, risus. Donec","2022-06-11","schedule for publication",17,"2024-07-06",8,4,3,27),
  ("convallis dolor. Quisque tincidunt pede ac urna. Ut","2021-09-25","accepted",8,"2022-01-24",4,12,4,5),
  ("augue porttitor interdum. Sed auctor","2021-12-18","in typesetting",18,"2021-02-23",7,2,3,13),
  ("a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis","2022-04-17","rejected",18,"2021-12-19",6,1,10,22),
  ("non massa non ante bibendum ullamcorper. Duis cursus,","2022-06-04","rejected",8,"2024-06-19",9,1,5,50),
  ("mollis. Integer tincidunt aliquam arcu. Aliquam ultrices","2021-04-11","rejected",7,"2021-01-31",10,12,4,57),
  ("neque. In ornare sagittis felis. Donec","2024-06-09","under review",12,"2022-04-15",3,10,9,77),
  ("luctus felis purus ac tellus. Suspendisse sed","2021-08-15","rejected",12,"2021-06-23",5,10,10,81),
  ("dapibus quam quis diam. Pellentesque","2021-12-16","accepted",14,"2022-09-23",10,3,10,100);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("mauris ipsum porta elit, a feugiat tellus lorem eu","2024-01-07","rejected",15,"2021-09-15",6,8,4),
  ("Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec,","2021-12-05","in typesetting",8,"2024-05-27",6,4,10),
  ("sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices","2024-07-27","in typesetting",15,"2022-09-23",6,4,1),
  ("turpis. Aliquam adipiscing lobortis risus.","2022-12-21","under review",11,"2022-05-20",7,8,3),
  ("neque vitae semper egestas, urna justo","2021-08-28","submitted",19,"2022-06-24",6,1,8),
  ("fermentum convallis ligula. Donec luctus aliquet odio.","2021-05-21","schedule for publication",16,"2021-08-12",7,4,5),
  ("sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices","2022-02-01","submitted",15,"2024-04-30",3,13,9),
  ("Duis volutpat nunc sit amet","2022-07-04","under review",15,"2024-05-26",4,11,9),
  ("mi lacinia mattis. Integer eu","2024-02-03","accepted",10,"2024-06-09",5,12,8),
  ("leo. Cras vehicula aliquet libero. Integer in magna.","2021-08-19","schedule for publication",12,"2022-09-26",8,8,4);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("tincidunt pede ac urna. Ut tincidunt","2022-04-15","under review",11,"2021-03-03",3,1,5),
  ("placerat, augue. Sed molestie. Sed id","2021-11-21","under review",19,"2022-04-27",4,8,7),
  ("sollicitudin a, malesuada id,","2022-05-25","under review",7,"2021-02-19",1,6,6),
  ("est ac mattis semper, dui lectus rutrum urna,","2022-01-01","in typesetting",11,"2024-08-31",8,1,7),
  ("accumsan convallis, ante lectus convallis est, vitae sodales","2022-04-18","rejected",14,"2022-06-30",4,14,7),
  ("et ultrices posuere cubilia Curae Phasellus","2021-12-27","ready",15,"2021-12-29",6,13,8),
  ("lacinia mattis. Integer eu lacus. Quisque imperdiet, erat","2021-05-18","accepted",17,"2022-08-24",10,9,9),
  ("Suspendisse sagittis. Nullam vitae diam. Proin dolor.","2021-02-26","rejected",8,"2022-01-11",5,1,3),
  ("In scelerisque scelerisque dui. Suspendisse ac metus vitae","2021-10-23","accepted",13,"2022-08-17",7,5,4),
  ("tortor at risus. Nunc ac sem ut","2024-04-08","ready",8,"2024-05-04",8,4,4);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("sit amet luctus vulputate,","2022-03-06","accepted",17,"2021-02-10",10,13,2),
  ("feugiat nec, diam. Duis mi enim,","2022-07-16","submitted",9,"2021-07-30",1,11,3),
  ("Quisque imperdiet, erat nonummy ultricies","2021-02-05","rejected",10,"2022-05-06",10,2,3),
  ("mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse","2024-02-18","rejected",10,"2021-12-17",4,4,5),
  ("sapien. Nunc pulvinar arcu et pede. Nunc sed","2022-01-04","ready",17,"2022-04-08",6,9,1),
  ("ultricies sem magna nec quam. Curabitur vel lectus.","2022-08-15","ready",11,"2022-12-30",2,6,3),
  ("neque. Nullam nisl. Maecenas malesuada fringilla","2024-04-15","in typesetting",19,"2021-05-25",10,7,1),
  ("quis, pede. Suspendisse dui. Fusce diam nunc,","2021-12-31","ready",19,"2024-08-12",1,4,5),
  ("consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam","2024-01-23","in typesetting",7,"2022-07-06",8,10,1),
  ("Donec non justo. Proin non massa non ante","2022-11-01","in typesetting",11,"2021-12-18",7,10,1);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("Proin vel arcu eu odio","2022-11-12","schedule for publication",13,"2021-11-18",2,9,6),
  ("erat eget ipsum. Suspendisse","2021-04-02","rejected",12,"2022-12-26",9,6,8),
  ("suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in","2022-05-17","ready",20,"2021-08-30",4,12,2),
  ("Proin non massa non ante bibendum ullamcorper. Duis","2024-08-11","submitted",15,"2022-08-26",8,10,2),
  ("lobortis quam a felis ullamcorper","2021-06-08","in typesetting",15,"2021-08-27",9,2,6),
  ("turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque","2021-10-18","accepted",14,"2021-08-09",7,12,3),
  ("lectus, a sollicitudin orci sem eget massa. Suspendisse","2021-06-10","submitted",7,"2022-05-28",4,2,6),
  ("non, sollicitudin a, malesuada id, erat. Etiam vestibulum","2021-04-29","ready",10,"2021-02-24",4,11,5),
  ("lectus pede et risus. Quisque libero lacus, varius et,","2022-05-08","ready",8,"2022-09-15",4,11,2),
  ("bibendum sed, est. Nunc laoreet lectus quis","2021-07-24","accepted",12,"2024-05-23",5,14,2);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("purus, in molestie tortor nibh sit amet orci. Ut","2022-10-30","ready",9,"2022-07-19",8,1,7),
  ("vulputate velit eu sem. Pellentesque ut ipsum ac","2021-03-11","under review",13,"2024-07-20",2,4,1),
  ("libero. Integer in magna. Phasellus dolor elit, pellentesque a,","2022-02-11","rejected",20,"2021-08-28",9,2,2),
  ("nec, mollis vitae, posuere at, velit. Cras lorem","2024-08-23","rejected",16,"2021-11-13",2,5,4),
  ("Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit.","2022-08-22","accepted",10,"2022-08-23",5,13,6),
  ("rutrum eu, ultrices sit amet, risus. Donec nibh enim,","2024-08-25","ready",11,"2024-07-23",10,1,4),
  ("tincidunt pede ac urna. Ut tincidunt","2022-06-19","accepted",18,"2021-11-12",9,11,5),
  ("fermentum fermentum arcu. Vestibulum ante ipsum primis","2021-01-29","under review",13,"2021-01-22",7,2,2),
  ("hendrerit a, arcu. Sed et libero.","2021-07-17","rejected",8,"2021-03-16",5,8,1),
  ("erat nonummy ultricies ornare, elit elit fermentum","2024-05-04","in typesetting",11,"2022-07-04",10,4,1);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("augue porttitor interdum. Sed auctor odio a","2021-05-10","rejected",8,"2024-08-17",7,1,4),
  ("et magnis dis parturient montes, nascetur","2024-02-23","in typesetting",18,"2022-12-10",5,7,4),
  ("cursus. Integer mollis. Integer tincidunt aliquam","2021-08-27","rejected",19,"2022-12-10",4,9,4),
  ("sagittis felis. Donec tempor, est ac mattis semper,","2021-03-08","ready",8,"2021-03-11",2,1,8),
  ("nec, cursus a, enim. Suspendisse aliquet, sem","2021-07-02","in typesetting",14,"2022-01-07",8,5,2),
  ("diam vel arcu. Curabitur ut odio vel est tempor bibendum.","2024-05-25","accepted",10,"2022-08-12",3,9,1),
  ("sem magna nec quam. Curabitur vel lectus.","2021-11-06","accepted",16,"2021-12-06",3,12,6),
  ("aliquet lobortis, nisi nibh","2024-05-19","under review",15,"2021-01-31",3,12,5),
  ("nec, imperdiet nec, leo.","2022-11-29","ready",16,"2021-07-15",8,10,9),
  ("a, scelerisque sed, sapien. Nunc pulvinar arcu et pede.","2024-08-12","accepted",11,"2021-12-14",5,5,2);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("diam lorem, auctor quis,","2021-11-01","rejected",7,"2021-12-05",5,9,8),
  ("non enim. Mauris quis turpis","2021-01-23","under review",6,"2021-09-15",1,12,9),
  ("semper egestas, urna justo faucibus lectus, a sollicitudin","2024-01-23","submitted",7,"2021-07-22",9,11,3),
  ("fermentum vel, mauris. Integer sem elit, pharetra","2022-04-03","ready",15,"2022-11-16",6,10,4),
  ("pulvinar arcu et pede. Nunc sed orci lobortis","2022-05-19","submitted",14,"2022-04-05",8,8,1),
  ("facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec","2021-02-18","submitted",20,"2021-03-23",3,3,2),
  ("in consequat enim diam vel","2021-12-24","rejected",6,"2024-02-11",3,13,7),
  ("placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla","2021-02-04","ready",18,"2021-01-24",10,13,9),
  ("interdum enim non nisi. Aenean","2021-11-30","schedule for publication",19,"2021-10-23",9,4,2),
  ("dictum placerat, augue. Sed molestie. Sed id risus","2021-09-16","in typesetting",18,"2022-03-28",9,6,1);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu","2021-04-13","in typesetting",5,"2021-09-29",4,13,1),
  ("euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet,","2022-11-03","ready",14,"2022-02-06",8,5,7),
  ("mauris erat eget ipsum.","2021-04-05","under review",12,"2022-04-18",8,5,2),
  ("habitant morbi tristique senectus","2024-04-22","rejected",7,"2021-12-13",2,7,2),
  ("et ipsum cursus vestibulum. Mauris","2021-03-31","under review",18,"2024-03-14",2,4,1),
  ("convallis ligula. Donec luctus aliquet odio. Etiam ligula","2022-04-07","under review",17,"2021-03-23",10,1,1),
  ("Sed id risus quis diam","2021-12-21","under review",19,"2022-10-04",4,8,4),
  ("neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris","2022-03-20","rejected",15,"2024-07-23",10,4,7),
  ("Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam","2021-09-22","in typesetting",7,"2021-08-14",1,12,5),
  ("convallis, ante lectus convallis","2021-03-20","ready",17,"2024-04-13",1,4,1);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis","2022-10-05","accepted",5,"2021-01-19",4,9,8),
  ("sit amet, risus. Donec nibh","2021-04-07","accepted",19,"2021-04-09",3,2,7),
  ("tellus id nunc interdum feugiat.","2022-07-19","accepted",19,"2021-11-11",10,4,1),
  ("Proin dolor. Nulla semper tellus id nunc interdum","2021-09-30","in typesetting",9,"2022-08-29",4,4,7),
  ("nec orci. Donec nibh.","2022-02-22","accepted",7,"2021-07-04",6,4,5),
  ("feugiat tellus lorem eu metus. In","2021-02-17","in typesetting",16,"2024-04-22",6,8,1),
  ("eu arcu. Morbi sit amet massa. Quisque porttitor","2021-11-11","in typesetting",14,"2021-03-01",9,6,8),
  ("dui. Fusce diam nunc, ullamcorper eu,","2021-04-09","rejected",13,"2024-03-22",7,4,3),
  ("Cras eget nisi dictum augue malesuada malesuada. Integer","2022-05-01","rejected",16,"2021-10-22",9,1,1),
  ("magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum","2022-08-25","ready",17,"2022-04-26",6,9,3);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("mauris sit amet lorem semper auctor. Mauris vel turpis.","2022-12-18","under review",10,"2022-12-01",3,12,1),
  ("Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc","2021-01-25","in typesetting",7,"2022-04-13",4,3,5),
  ("consequat purus. Maecenas libero est, congue a,","2022-01-18","rejected",19,"2022-05-23",6,9,8),
  ("eleifend, nunc risus varius orci, in consequat enim","2022-09-20","in typesetting",12,"2024-07-23",2,4,6),
  ("ut, pellentesque eget, dictum","2021-02-11","rejected",10,"2021-12-03",1,10,2),
  ("eu, odio. Phasellus at","2022-02-22","rejected",10,"2021-11-19",1,8,3),
  ("luctus aliquet odio. Etiam ligula tortor, dictum eu,","2024-07-01","accepted",17,"2024-04-25",6,10,3),
  ("blandit enim consequat purus.","2024-01-04","accepted",10,"2021-07-23",5,10,6),
  ("felis eget varius ultrices, mauris","2021-10-04","ready",17,"2022-02-02",6,8,2),
  ("Donec non justo. Proin non massa non","2022-07-22","under review",20,"2021-03-18",10,13,4);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("vitae semper egestas, urna justo","2022-08-19","rejected",14,"2022-11-30",1,13,6),
  ("mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare,","2024-03-02","under review",9,"2021-08-17",5,11,9),
  ("cursus. Integer mollis. Integer tincidunt aliquam arcu.","2022-06-19","accepted",19,"2022-12-14",4,2,9),
  ("egestas nunc sed libero. Proin sed turpis","2022-05-30","accepted",16,"2024-03-13",3,2,3),
  ("eget, venenatis a, magna. Lorem ipsum dolor sit","2024-06-17","in typesetting",10,"2022-02-21",9,10,5),
  ("Morbi quis urna. Nunc quis","2024-07-19","under review",9,"2024-08-13",3,13,1),
  ("nec luctus felis purus","2024-01-06","in typesetting",9,"2021-06-04",5,1,2),
  ("sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id","2022-09-16","accepted",14,"2021-04-01",1,7,10),
  ("tempor augue ac ipsum. Phasellus vitae mauris","2021-03-08","accepted",14,"2021-10-21",7,5,1),
  ("scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed,","2021-11-25","under review",11,"2024-01-16",2,4,3);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("porttitor tellus non magna. Nam ligula elit, pretium","2022-12-23","accepted",5,"2022-08-07",6,11,6),
  ("feugiat tellus lorem eu metus.","2022-03-05","rejected",13,"2022-04-26",3,9,6),
  ("varius. Nam porttitor scelerisque neque. Nullam nisl.","2021-12-01","under review",6,"2021-06-16",6,2,5),
  ("Donec egestas. Duis ac arcu. Nunc mauris.","2021-11-16","rejected",9,"2021-03-04",4,14,5),
  ("elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum","2022-06-25","ready",19,"2024-08-21",10,5,1),
  ("felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus.","2024-07-12","accepted",7,"2021-02-27",8,11,8),
  ("nulla. Cras eu tellus eu augue porttitor interdum.","2021-05-05","accepted",18,"2022-01-04",9,1,2),
  ("Nunc lectus pede, ultrices a, auctor non, feugiat nec,","2021-10-31","under review",11,"2024-02-25",9,4,7),
  ("tellus. Suspendisse sed dolor. Fusce","2021-08-17","schedule for publication",11,"2021-12-21",5,4,2),
  ("interdum enim non nisi. Aenean eget","2021-03-29","schedule for publication",12,"2022-08-14",7,11,1);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("a odio semper cursus. Integer mollis. Integer","2022-01-10","in typesetting",14,"2021-03-05",9,12,1),
  ("purus sapien, gravida non, sollicitudin a, malesuada id, erat.","2024-08-01","rejected",8,"2022-12-04",2,10,6),
  ("penatibus et magnis dis parturient montes, nascetur ridiculus mus.","2021-08-07","in typesetting",12,"2021-12-08",2,8,6),
  ("interdum enim non nisi. Aenean eget metus. In","2021-03-14","ready",18,"2021-10-22",8,7,4),
  ("hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit","2024-02-29","ready",8,"2022-05-21",2,9,6),
  ("eros turpis non enim. Mauris quis","2022-05-28","schedule for publication",10,"2021-07-01",4,6,2),
  ("egestas blandit. Nam nulla magna,","2021-07-02","under review",8,"2022-09-10",4,1,3),
  ("tristique senectus et netus et malesuada fames ac","2021-02-23","accepted",9,"2022-05-07",7,5,4),
  ("placerat, orci lacus vestibulum lorem, sit amet ultricies","2021-10-12","in typesetting",9,"2021-12-18",9,6,2),
  ("bibendum ullamcorper. Duis cursus, diam at","2022-04-29","submitted",20,"2024-03-13",2,10,9);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("sem. Pellentesque ut ipsum ac mi","2021-12-15","rejected",8,"2021-01-31",1,4,9),
  ("interdum. Sed auctor odio a purus. Duis","2024-01-26","in typesetting",17,"2022-04-05",3,7,1),
  ("sem semper erat, in","2024-06-02","in typesetting",19,"2022-12-13",7,10,1),
  ("sem ut dolor dapibus gravida. Aliquam tincidunt, nunc","2021-09-21","in typesetting",10,"2022-07-22",8,13,4),
  ("volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla.","2021-04-04","rejected",14,"2021-10-24",7,6,8),
  ("nec, eleifend non, dapibus rutrum, justo. Praesent luctus.","2021-06-26","rejected",10,"2021-10-09",2,3,6),
  ("vulputate, risus a ultricies adipiscing, enim mi tempor","2022-12-18","schedule for publication",7,"2021-07-03",10,1,8),
  ("penatibus et magnis dis","2021-07-04","ready",8,"2024-06-24",1,9,2),
  ("egestas. Sed pharetra, felis eget varius","2021-01-20","rejected",8,"2022-10-14",4,13,6),
  ("risus a ultricies adipiscing, enim mi tempor lorem, eget","2022-06-13","in typesetting",8,"2024-05-11",2,5,5);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("a feugiat tellus lorem eu metus. In lorem. Donec","2021-12-21","in typesetting",6,"2022-03-05",6,12,6),
  ("et malesuada fames ac turpis egestas. Fusce","2021-03-29","rejected",7,"2024-03-20",7,11,7),
  ("purus, accumsan interdum libero dui nec","2021-06-01","rejected",13,"2021-05-29",2,13,1),
  ("semper erat, in consectetuer ipsum nunc","2021-01-26","under review",11,"2022-10-21",5,12,7),
  ("litora torquent per conubia nostra, per inceptos hymenaeos. Mauris","2022-12-25","accepted",19,"2024-03-21",3,4,6),
  ("iaculis enim, sit amet ornare lectus justo eu","2021-09-01","accepted",17,"2024-05-04",6,7,9),
  ("lacinia orci, consectetuer euismod est arcu","2022-04-17","schedule for publication",19,"2021-06-24",2,12,4),
  ("egestas a, dui. Cras pellentesque.","2024-08-27","under review",11,"2024-04-15",4,7,7),
  ("Integer tincidunt aliquam arcu. Aliquam ultrices","2021-11-15","in typesetting",8,"2022-06-21",9,8,6),
  ("egestas. Fusce aliquet magna a neque. Nullam","2021-01-31","submitted",15,"2021-12-27",2,1,6);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("et magnis dis parturient montes, nascetur ridiculus mus. Proin vel","2021-11-03","under review",9,"2022-10-14",2,6,3),
  ("eros. Nam consequat dolor vitae dolor. Donec","2022-10-15","accepted",17,"2022-06-21",8,8,6),
  ("aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio.","2024-08-04","under review",11,"2021-04-26",5,12,6),
  ("nunc nulla vulputate dui, nec tempus mauris","2024-01-10","in typesetting",5,"2021-10-18",8,11,9),
  ("non enim commodo hendrerit. Donec porttitor tellus non magna. Nam","2022-04-13","in typesetting",13,"2022-12-15",8,6,2),
  ("penatibus et magnis dis parturient montes, nascetur ridiculus","2021-11-24","in typesetting",18,"2021-02-25",4,10,2),
  ("lorem, sit amet ultricies sem magna","2022-11-27","accepted",15,"2022-10-21",6,7,8),
  ("adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum.","2022-10-22","in typesetting",15,"2021-02-09",2,11,8),
  ("elit erat vitae risus. Duis a","2021-05-06","submitted",12,"2022-03-19",8,5,2),
  ("a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras","2022-06-06","submitted",19,"2022-04-30",3,13,6);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam","2024-01-08","accepted",15,"2021-08-21",7,13,8),
  ("egestas nunc sed libero. Proin sed turpis nec mauris blandit","2021-03-04","ready",15,"2022-02-15",4,10,8),
  ("in, dolor. Fusce feugiat. Lorem","2024-05-20","rejected",8,"2022-05-13",4,3,9),
  ("mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus.","2024-03-25","under review",11,"2021-11-20",2,13,5),
  ("ipsum leo elementum sem, vitae aliquam eros turpis","2021-12-25","rejected",16,"2022-08-25",10,2,8),
  ("justo sit amet nulla. Donec non justo. Proin non","2021-11-24","ready",8,"2022-04-15",2,9,4),
  ("Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer","2021-11-22","rejected",19,"2021-08-10",9,11,7),
  ("vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum","2022-07-03","rejected",5,"2022-03-23",2,1,4),
  ("amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing","2022-01-28","accepted",11,"2021-06-05",3,3,10),
  ("ornare, elit elit fermentum risus, at fringilla purus","2021-11-12","rejected",17,"2022-02-23",7,7,5);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum","2022-02-28","schedule for publication",19,"2021-02-08",2,8,1),
  ("egestas, urna justo faucibus","2022-07-07","under review",6,"2021-08-15",6,14,1),
  ("luctus lobortis. Class aptent taciti sociosqu ad litora torquent","2021-07-16","submitted",8,"2022-03-02",10,2,3),
  ("Sed molestie. Sed id risus","2021-10-28","ready",5,"2021-08-28",2,9,8),
  ("lectus justo eu arcu. Morbi sit amet massa. Quisque","2022-08-13","accepted",5,"2024-05-23",3,8,5),
  ("vitae nibh. Donec est mauris, rhoncus id,","2021-05-31","ready",14,"2021-05-09",2,10,8),
  ("nisi. Mauris nulla. Integer urna. Vivamus","2024-06-04","rejected",19,"2022-07-19",3,8,2),
  ("aliquet, metus urna convallis erat, eget tincidunt dui augue eu","2021-12-09","in typesetting",18,"2021-03-23",5,9,1),
  ("diam luctus lobortis. Class aptent taciti sociosqu ad litora","2021-11-14","in typesetting",8,"2024-08-08",5,4,8),
  ("Sed diam lorem, auctor quis,","2021-04-20","under review",15,"2024-07-22",8,12,3);
INSERT INTO Manuscript (title,date_received,status,page_count,status_change_date,RICodes_code,Editor_editor_id,Issue_issue_id)
VALUES
  ("aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum","2024-07-16","submitted",9,"2022-10-04",3,9,3),
  ("primis in faucibus orci luctus et ultrices posuere","2024-08-07","rejected",20,"2022-11-27",4,10,6),
  ("dui. Suspendisse ac metus vitae","2022-01-27","accepted",7,"2022-06-20",3,7,3),
  ("lorem lorem, luctus ut, pellentesque","2024-06-02","ready",13,"2024-08-27",3,8,9),
  ("diam vel arcu. Curabitur ut","2022-02-09","in typesetting",13,"2021-11-18",2,3,2),
  ("Quisque ornare tortor at risus. Nunc","2024-04-03","rejected",11,"2021-11-28",7,10,7),
  ("auctor velit. Aliquam nisl. Nulla eu neque pellentesque","2022-04-05","ready",16,"2022-10-10",3,6,4),
  ("eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer","2021-10-03","rejected",9,"2022-11-02",8,8,10),
  ("massa lobortis ultrices. Vivamus rhoncus. Donec","2022-10-19","in typesetting",7,"2022-09-22",4,5,8),
  ("est. Nunc laoreet lectus quis massa. Mauris vestibulum,","2022-12-05","ready",16,"2024-04-13",4,1,5);



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
  ("auctor@aol.org","Axel","Bates",10),
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

SELECT * FROM Manuscript;
-- number of Reviewer_has_Manuscript:: 200
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (13,45,"2022-10-26",5,6,4,9,6,"2024-05-02"),
  (42,27,"2022-03-20",10,10,1,3,1,"2022-11-28"),
  (25,22,"2023-08-31",9,10,3,7,4,"2022-03-01"),
  (21,28,"2023-11-16",8,5,1,6,1,"2024-06-27"),
  (39,73,"2023-06-16",9,10,6,7,2,"2022-09-14"),
  (21,36,"2023-09-06",2,2,5,1,9,"2024-06-27"),
  (39,54,"2024-03-06",6,8,7,5,9,"2023-04-15"),
  (34,31,"2022-11-05",9,2,3,1,3,"2022-03-30"),
  (47,80,"2023-07-16",5,3,4,1,4,"2022-05-19"),
  (33,4,"2024-08-06",3,1,8,9,4,"2022-03-21");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (2,68,"2024-01-29",6,10,7,5,8,"2022-01-30"),
  (43,56,"2022-04-19",5,9,10,7,4,"2021-09-10"),
  (47,51,"2023-10-06",7,7,10,10,9,"2022-09-26"),
  (21,69,"2022-11-16",2,4,7,8,4,"2024-06-25"),
  (20,53,"2022-12-29",9,6,1,8,3,"2022-01-10"),
  (10,73,"2022-04-17",7,2,4,6,9,"2022-08-01"),
  (47,22,"2024-07-30",4,7,10,1,6,"2021-02-03"),
  (38,59,"2023-09-21",6,9,9,4,7,"2024-05-08"),
  (46,72,"2023-05-27",8,6,5,6,6,"2021-11-15"),
  (1,85,"2021-12-05",7,9,8,10,5,"2021-10-25");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (35,80,"2021-12-01",1,1,6,4,10,"2022-09-16"),
  (6,18,"2021-10-27",6,6,8,1,8,"2024-07-03"),
  (29,45,"2021-05-30",3,3,5,5,5,"2024-06-02"),
  (21,10,"2022-04-02",4,4,6,2,10,"2024-06-01"),
  (21,48,"2022-12-07",9,9,10,5,10,"2021-12-25"),
  (17,97,"2022-02-15",7,7,1,1,9,"2021-09-29"),
  (13,51,"2022-03-30",9,3,2,9,9,"2021-03-19"),
  (14,4,"2024-01-28",1,8,1,9,7,"2022-10-26"),
  (13,11,"2021-12-09",7,4,2,7,1,"2022-10-16"),
  (35,78,"2022-09-24",7,10,9,3,3,"2021-04-01");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (39,18,"2024-02-12",9,3,8,1,2,"2024-07-28"),
  (34,24,"2024-08-20",10,4,9,1,10,"2021-07-11"),
  (17,44,"2024-03-30",6,2,9,3,6,"2024-07-13"),
  (24,48,"2021-07-18",7,7,3,5,4,"2021-11-01"),
  (38,63,"2022-02-21",1,3,6,5,1,"2022-06-27"),
  (10,56,"2021-12-02",10,4,6,10,2,"2022-05-21"),
  (45,31,"2022-04-08",7,5,9,2,5,"2022-07-04"),
  (33,55,"2022-06-23",4,4,2,4,1,"2022-06-13"),
  (5,13,"2022-02-02",3,10,9,9,4,"2021-03-21"),
  (33,28,"2022-03-01",4,6,3,3,10,"2021-01-26");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (44,9,"2021-12-27",2,6,4,1,10,"2021-07-24"),
  (30,47,"2022-06-09",9,8,5,5,4,"2021-06-27"),
  (48,92,"2021-06-25",10,10,5,1,8,"2021-11-06"),
  (10,18,"2021-11-23",6,8,1,4,4,"2022-05-23"),
  (47,34,"2022-06-08",10,5,5,1,9,"2022-06-30"),
  (33,5,"2022-01-04",4,4,7,9,3,"2021-06-04"),
  (6,94,"2021-11-01",2,2,2,2,7,"2024-01-01"),
  (50,30,"2022-06-17",1,8,10,4,1,"2021-10-10"),
  (40,22,"2022-11-12",5,1,9,1,4,"2021-12-14"),
  (2,64,"2021-12-19",9,2,2,1,10,"2022-04-03");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (30,3,"2021-11-24",2,3,3,1,7,"2022-08-31"),
  (27,12,"2024-04-23",10,10,2,9,6,"2022-08-07"),
  (22,64,"2021-04-04",2,7,10,4,9,"2021-04-06"),
  (31,85,"2022-07-21",5,1,1,3,2,"2021-06-05"),
  (48,76,"2022-01-11",2,7,7,7,10,"2024-04-05"),
  (5,32,"2021-12-23",5,8,5,8,2,"2024-03-29"),
  (11,55,"2024-04-11",9,5,5,4,1,"2022-06-09"),
  (24,90,"2024-05-13",1,7,10,4,8,"2024-08-15"),
  (1,50,"2022-02-28",9,2,10,8,3,"2022-05-17"),
  (21,12,"2024-05-16",8,2,9,1,7,"2022-03-09");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (30,20,"2024-04-04",7,5,7,8,9,"2021-02-06"),
  (44,82,"2021-05-31",8,2,6,7,5,"2021-12-13"),
  (11,24,"2024-07-28",10,5,6,1,2,"2021-05-27"),
  (27,86,"2024-07-11",4,9,4,8,6,"2024-05-30"),
  (37,67,"2021-08-21",9,7,8,7,9,"2021-01-06"),
  (17,31,"2021-03-24",10,7,7,9,1,"2022-07-14"),
  (35,25,"2021-08-04",10,7,1,9,4,"2024-06-23"),
  (45,35,"2021-06-10",6,10,4,2,6,"2021-04-01"),
  (34,61,"2021-12-19",3,4,1,6,10,"2022-06-04"),
  (8,28,"2022-04-14",8,2,6,2,7,"2022-10-06");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (13,44,"2024-08-27",8,10,10,9,1,"2021-10-01"),
  (39,39,"2024-07-07",8,6,5,5,5,"2024-03-30"),
  (48,94,"2022-08-04",7,7,3,6,3,"2021-06-15"),
  (48,46,"2022-05-18",8,9,7,2,1,"2022-09-23"),
  (7,3,"2024-07-24",3,5,5,3,1,"2021-05-20"),
  (13,92,"2022-10-20",6,4,6,9,6,"2021-03-01"),
  (37,72,"2021-12-02",2,7,6,1,8,"2021-01-27"),
  (24,87,"2021-06-28",7,7,9,6,4,"2022-12-02"),
  (24,88,"2022-10-02",1,4,1,4,3,"2024-03-04");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (13,49,"2022-04-01",4,3,2,2,7,"2021-02-02"),
  (38,34,"2022-06-07",10,7,10,3,4,"2021-05-30"),
  (20,78,"2021-11-27",2,8,9,1,9,"2021-04-08"),
  (39,24,"2021-05-11",5,7,2,2,3,"2021-11-09"),
  (25,72,"2022-07-03",2,10,7,8,3,"2021-10-28"),
  (39,44,"2024-01-04",3,4,4,7,4,"2021-12-06"),
  (27,95,"2021-08-20",3,8,10,7,9,"2024-03-14"),
  (26,13,"2022-09-20",9,7,6,5,7,"2021-12-15"),
  (47,15,"2021-06-06",8,1,3,7,7,"2022-10-03"),
  (38,38,"2022-10-13",6,4,5,4,2,"2024-02-11");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (31,89,"2021-12-03",10,9,4,1,3,"2021-12-15"),
  (11,73,"2022-03-03",8,9,1,5,3,"2021-08-30"),
  (31,77,"2021-08-24",1,1,8,10,8,"2022-03-26"),
  (47,92,"2022-05-20",9,1,8,7,3,"2021-06-24"),
  (20,29,"2021-06-22",5,10,6,2,6,"2024-04-27"),
  (4,9,"2022-12-15",4,4,10,3,4,"2021-09-07"),
  (45,12,"2022-04-04",7,7,9,9,4,"2022-08-03"),
  (15,87,"2022-06-08",10,9,4,1,9,"2022-08-07"),
  (45,8,"2022-04-29",1,4,2,1,9,"2024-05-16"),
  (45,93,"2024-04-05",8,8,4,2,7,"2021-08-18");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (29,76,"2024-08-18",9,7,1,3,7,"2024-05-01"),
  (21,94,"2021-09-18",9,9,9,6,3,"2021-11-23"),
  (30,91,"2024-01-18",5,9,5,4,5,"2021-04-06"),
  (49,99,"2021-02-07",10,1,8,8,9,"2021-09-01"),
  (2,76,"2021-12-20",10,1,5,4,1,"2022-10-19"),
  (19,17,"2022-06-11",9,7,4,3,3,"2022-07-06"),
  (3,70,"2021-04-20",2,10,6,5,1,"2021-11-18"),
  (17,1,"2022-09-06",2,8,2,5,3,"2024-04-03"),
  (33,82,"2022-04-29",5,8,5,10,4,"2021-04-04"),
  (9,40,"2024-06-17",8,7,5,5,2,"2021-04-13");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (41,26,"2024-08-01",1,4,3,5,3,"2021-11-10"),
  (35,87,"2021-09-14",6,9,7,5,2,"2022-01-21"),
  (10,48,"2022-07-15",7,9,5,6,4,"2022-11-18"),
  (42,56,"2021-01-14",7,5,7,2,2,"2022-08-01"),
  (16,34,"2024-03-02",5,6,1,6,2,"2021-12-16"),
  (12,6,"2022-09-23",2,2,3,7,4,"2021-09-15"),
  (46,13,"2021-03-13",2,3,1,8,6,"2021-12-31"),
  (1,71,"2022-08-24",2,4,7,7,10,"2021-05-23"),
  (31,44,"2022-09-01",9,1,5,5,4,"2021-12-03"),
  (28,21,"2021-09-20",4,6,7,6,6,"2021-12-04");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (24,83,"2022-06-01",9,3,7,1,5,"2021-10-11"),
  (26,34,"2021-12-17",3,2,3,6,1,"2022-08-09"),
  (42,57,"2024-05-13",6,5,3,3,8,"2021-11-10"),
  (22,28,"2022-11-25",3,4,1,8,9,"2024-02-08"),
  (4,19,"2022-11-13",10,5,10,5,8,"2022-06-03"),
  (1,17,"2021-05-14",2,6,6,6,7,"2022-02-09"),
  (41,1,"2024-08-07",10,9,3,4,6,"2022-01-16"),
  (11,93,"2022-03-21",7,9,10,10,10,"2024-07-08"),
  (37,3,"2024-06-20",7,6,10,8,7,"2021-11-22");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (26,5,"2022-11-23",5,10,10,8,5,"2024-08-24"),
  (23,56,"2022-01-24",2,3,7,1,9,"2022-08-22"),
  (28,38,"2021-12-16",10,10,6,9,3,"2021-06-03"),
  (30,58,"2021-07-06",5,4,10,6,7,"2022-01-21"),
  (15,79,"2022-05-30",1,8,2,10,7,"2022-06-20"),
  (5,37,"2021-08-17",1,7,8,5,7,"2022-01-24"),
  (9,17,"2022-09-28",7,10,1,10,9,"2022-02-13"),
  (48,87,"2022-07-15",8,3,8,3,4,"2024-07-18"),
  (48,49,"2021-03-23",1,7,3,5,8,"2021-11-23"),
  (23,62,"2022-03-13",4,7,5,3,10,"2022-07-19");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (39,51,"2021-01-21",7,4,7,3,1,"2022-08-06"),
  (19,31,"2022-04-14",5,9,5,3,1,"2021-02-02"),
  (24,99,"2021-02-20",4,5,6,3,6,"2022-03-14"),
  (4,3,"2021-11-17",1,8,2,9,2,"2021-04-08"),
  (23,99,"2021-10-29",5,8,9,3,3,"2021-11-24"),
  (47,91,"2022-06-20",6,6,6,9,9,"2024-04-30"),
  (21,79,"2022-02-19",7,10,2,9,8,"2024-07-25"),
  (5,15,"2022-02-11",8,6,9,2,2,"2021-04-09"),
  (25,31,"2022-09-24",10,2,4,4,2,"2024-05-18"),
  (39,77,"2022-02-22",9,8,9,8,2,"2022-05-26");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (10,38,"2024-03-08",3,1,3,10,4,"2022-05-17"),
  (10,88,"2021-04-23",9,3,2,9,3,"2024-04-26"),
  (34,87,"2024-04-12",5,3,10,5,10,"2021-04-18"),
  (14,15,"2022-08-24",9,4,1,2,9,"2021-06-14"),
  (37,96,"2024-05-17",3,7,3,3,1,"2022-05-13"),
  (32,1,"2022-03-12",1,4,6,3,5,"2022-01-28"),
  (40,20,"2022-06-05",7,8,5,5,5,"2021-08-05"),
  (18,67,"2024-05-31",7,9,8,1,2,"2022-05-07"),
  (15,32,"2021-07-10",2,6,8,2,5,"2024-04-24");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (16,91,"2024-07-26",4,8,2,6,5,"2021-08-10"),
  (27,29,"2021-08-19",3,4,9,4,2,"2022-12-31"),
  (3,61,"2022-06-22",2,3,6,9,4,"2021-12-28"),
  (20,36,"2022-06-03",10,10,3,5,1,"2024-02-15"),
  (2,91,"2022-05-14",5,6,2,1,1,"2024-06-01"),
  (31,59,"2022-09-04",1,9,2,6,4,"2021-12-23"),
  (1,10,"2022-05-28",10,2,2,5,4,"2021-03-15"),
  (12,74,"2022-01-19",1,8,7,2,10,"2022-02-08"),
  (45,27,"2021-05-11",8,4,3,7,1,"2022-03-27");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (10,97,"2022-10-08",7,4,9,2,9,"2021-07-31"),
  (37,44,"2021-10-19",3,3,4,6,7,"2022-07-22"),
  (18,70,"2021-09-25",6,7,2,9,5,"2021-10-17"),
  (23,51,"2022-05-16",4,8,4,1,5,"2024-01-19"),
  (15,8,"2022-05-20",5,4,10,10,8,"2024-02-19"),
  (47,65,"2022-06-08",4,10,1,5,7,"2021-02-10"),
  (48,69,"2024-02-28",8,8,10,5,10,"2021-03-21"),
  (17,63,"2021-10-27",4,2,8,1,9,"2022-09-01"),
  (37,25,"2021-11-05",3,5,7,9,9,"2021-04-13");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (44,92,"2024-04-04",1,5,1,3,6,"2021-09-08"),
  (38,95,"2021-06-08",4,7,4,9,8,"2022-08-31"),
  (41,84,"2021-02-21",1,7,4,5,4,"2022-01-19"),
  (15,92,"2022-01-30",2,7,1,9,2,"2022-02-07"),
  (34,67,"2022-06-24",6,10,7,8,5,"2021-03-15"),
  (27,11,"2022-09-22",1,6,7,4,1,"2021-12-20"),
  (35,30,"2021-11-07",2,6,3,2,2,"2024-04-09"),
  (35,33,"2024-05-27",6,9,8,6,9,"2022-09-24"),
  (42,36,"2022-02-04",9,3,5,6,2,"2022-08-21");
INSERT INTO Reviewer_has_Manuscript (Reviewer_reviewer_id,Manuscript_manuscript_number,date_sent,Appropriateness,Clarity,Methodology,Experimental,Recommendation,feedback_date)
VALUES
  (26,89,"2022-02-28",5,7,6,4,3,"2021-02-18"),
  (28,9,"2022-01-21",5,5,4,2,9,"2021-10-06"),
  (29,98,"2022-12-20",5,8,10,4,8,"2022-03-06"),
  (24,51,"2021-04-08",3,8,5,8,3,"2022-03-12"),
  (12,86,"2021-05-14",10,4,9,1,10,"2024-08-26"),
  (16,75,"2021-10-07",7,3,6,1,10,"2021-01-22"),
  (38,2,"2022-02-10",5,6,4,9,8,"2022-01-21"),
  (30,71,"2022-03-05",8,6,5,10,1,"2022-10-05"),
  (42,26,"2024-07-03",2,3,5,5,1,"2021-06-01"),
  (30,38,"2022-12-15",8,8,6,8,10,"2021-08-01");

-- number of Journal_has_codes: 20
INSERT INTO Journal_has_RICodes (Journal_journal_id,RICodes_code)
VALUES
  (10,3),
  (1,3),
  (2,3),
  (3,1),
  (4,1),
  (5,1),
  (6,2),
  (7,4),
  (8,4),
  (9,5);
INSERT INTO Journal_has_RICodes (Journal_journal_id,RICodes_code)
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

-- number of Manuscript_Author:: 300
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
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
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
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
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
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
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
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
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (148,5,1),
  (41,22,2),
  (90,47,2),
  (190,26,3),
  (119,9,4),
  (76,34,4),
  (123,13,3),
  (93,52,1);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (176,25,4),
  (103,37,2),
  (72,15,3),
  (159,13,3),
  (122,2,1),
  (143,11,3),
  (151,13,3);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
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
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (171,28,3),
  (150,42,3),
  (135,22,3),
  (95,34,3),
  (117,4,2),
  (17,31,1),
  (115,33,5);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
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
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
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
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (170,39,1),
  (4,18,1),
  (129,51,2),
  (69,47,4),
  (61,33,2),
  (97,24,1),
  (48,20,1),
  (71,41,2),
  (83,57,1);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (90,7,4),
  (198,4,2),
  (113,21,3),
  (184,39,2),
  (92,8,1),
  (109,14,4),
  (32,25,3),
  (83,51,2),
  (162,25,3);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (59,7,4),
  (133,28,3),
  (122,35,3),
  (42,28,5),
  (10,25,4),
  (174,24,2),
  (190,13,5),
  (123,12,5);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (111,33,2),
  (83,16,4),
  (93,13,2),
  (49,56,1),
  (118,38,4),
  (53,21,4),
  (194,10,1),
  (79,13,2);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (57,23,4),
  (38,32,5),
  (180,50,2),
  (125,9,3),
  (31,39,5),
  (179,41,3),
  (164,15,4),
  (73,3,2);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (95,31,4),
  (44,54,4),
  (129,37,5),
  (149,35,3),
  (139,9,3),
  (136,8,3),
  (30,42,4),
  (104,17,1);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (98,17,4),
  (172,52,3),
  (158,39,5),
  (45,47,4),
  (36,31,2),
  (60,40,4),
  (122,44,4),
  (54,5,3),
  (66,56,1);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (150,10,1),
  (193,11,4),
  (154,4,2),
  (137,5,5),
  (151,9,2),
  (46,10,4),
  (190,56,2),
  (189,52,4),
  (36,29,4),
  (33,19,1);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
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
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (66,54,4),
  (115,3,2),
  (12,31,5),
  (143,1,2),
  (179,13,5),
  (44,5,2),
  (34,9,3),
  (37,5,1),
  (195,42,4);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (177,48,3),
  (181,31,1),
  (165,10,1),
  (96,23,2),
  (27,54,1),
  (53,42,2),
  (69,55,1),
  (79,5,4);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (163,26,5),
  (137,46,3),
  (38,57,2),
  (7,48,3),
  (85,17,4),
  (192,28,5),
  (82,16,2),
  (160,10,4),
  (191,59,1);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
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
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (182,20,3),
  (153,21,2),
  (48,42,3),
  (185,50,2),
  (2,21,5),
  (160,48,3),
  (47,13,5),
  (56,21,4),
  (153,12,4);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (58,30,3),
  (13,12,1),
  (87,43,4),
  (144,39,3),
  (186,18,3),
  (18,16,4),
  (128,25,1),
  (178,46,3);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (127,15,2),
  (97,40,5),
  (55,48,2),
  (5,43,4),
  (153,14,5);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (31,30,3),
  (66,8,3),
  (96,15,5),
  (108,8,5),
  (101,45,1),
  (165,30,2);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (6,36,3),
  (109,49,2),
  (89,32,2),
  (196,20,1),
  (64,18,2),
  (18,52,3),
  (158,34,2);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (156,20,2),
  (80,28,4),
  (13,11,3),
  (161,5,5);
INSERT INTO Manuscript_Author (Manuscript_manuscript_number,Author_author_id,Author_ordinal)
VALUES
  (139,57,4),
  (123,16,1),
  (91,52,2),
  (7,2,5),
  (120,19,5),
  (75,25,5),
  (108,43,1);
