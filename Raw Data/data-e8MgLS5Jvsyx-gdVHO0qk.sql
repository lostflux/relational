DROP TABLE IF EXISTS `myTable`;

CREATE TABLE `myTable` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `title` TEXT default NULL,
  `date_received` varchar(255),
  `status` TEXT default NULL,
  `page_count` mediumint default NULL,
  `date_received` varchar(255),
  `RICode_RiCode` mediumint default NULL,
  `Editor_editor_id` mediumint default NULL,
  `Issue_issue_id` mediumint default NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("ornare, lectus ante dictum mi, ac","10/02/2023","lacus.",14,"05/19/2022",4,13,4),
  ("eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer","04/01/2023","sed",15,"09/08/2023",4,4,1),
  ("netus et malesuada fames ac turpis egestas.","05/23/2022","eu,",14,"04/21/2024",10,12,6),
  ("sapien. Nunc pulvinar arcu et pede. Nunc sed","09/30/2022","nibh.",18,"05/23/2023",3,13,0),
  ("nibh sit amet orci. Ut sagittis","12/16/2021","ac",19,"12/10/2021",6,14,8),
  ("sem mollis dui, in sodales elit erat vitae","05/03/2022","dui,",10,"11/23/2023",6,5,0),
  ("ipsum dolor sit amet, consectetuer adipiscing","02/19/2023","facilisi.",9,"06/29/2024",4,1,2),
  ("erat semper rutrum. Fusce dolor quam, elementum","09/10/2022","Pellentesque",12,"01/23/2024",2,9,6),
  ("magna. Suspendisse tristique neque venenatis lacus. Etiam bibendum fermentum","01/13/2023","congue",13,"09/24/2023",6,3,4),
  ("ipsum dolor sit amet, consectetuer adipiscing elit. Etiam","11/15/2023","Integer",18,"11/08/2021",3,1,4);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("at auctor ullamcorper, nisl arcu iaculis enim,","04/20/2022","in",7,"12/07/2023",7,11,6),
  ("sit amet, consectetuer adipiscing elit. Aliquam","06/13/2024","massa.",13,"07/04/2022",6,2,2),
  ("et magnis dis parturient montes, nascetur ridiculus","08/21/2022","nec,",7,"05/04/2022",5,3,5),
  ("laoreet ipsum. Curabitur consequat, lectus sit","04/20/2024","mattis",17,"06/30/2024",1,9,4),
  ("sapien. Cras dolor dolor,","06/23/2024","velit.",12,"01/06/2024",6,11,1),
  ("nisi. Mauris nulla. Integer urna. Vivamus","05/19/2024","Curae",17,"06/23/2022",2,4,9),
  ("amet, consectetuer adipiscing elit.","07/20/2022","eget",12,"11/05/2021",1,12,4),
  ("facilisis lorem tristique aliquet. Phasellus fermentum","09/10/2023","vulputate",6,"10/03/2023",2,0,6),
  ("nibh sit amet orci. Ut sagittis lobortis mauris. Suspendisse","12/15/2023","Maecenas",14,"02/27/2024",7,12,7),
  ("lobortis quam a felis ullamcorper viverra. Maecenas iaculis aliquet","09/13/2023","odio,",5,"07/23/2023",4,10,5);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("velit in aliquet lobortis, nisi nibh","12/03/2023","non",11,"12/30/2023",8,11,8),
  ("Mauris magna. Duis dignissim tempor arcu. Vestibulum ut","04/08/2024","a",20,"12/27/2023",6,4,9),
  ("sapien. Nunc pulvinar arcu et pede. Nunc sed orci","03/06/2023","velit.",9,"06/27/2022",9,3,7),
  ("in, cursus et, eros. Proin ultrices. Duis volutpat","02/28/2022","parturient",18,"08/16/2023",10,9,4),
  ("volutpat. Nulla dignissim. Maecenas ornare egestas ligula. Nullam","06/12/2023","dolor.",10,"06/19/2023",8,5,7),
  ("Maecenas malesuada fringilla est. Mauris eu turpis. Nulla aliquet.","09/23/2023","quam",8,"03/01/2022",9,6,5),
  ("ultrices a, auctor non, feugiat","06/17/2023","Nunc",10,"11/05/2022",7,7,4),
  ("ornare egestas ligula. Nullam feugiat placerat velit.","01/20/2024","faucibus",12,"02/05/2023",7,6,7),
  ("ipsum porta elit, a feugiat","11/07/2021","Curabitur",9,"12/17/2022",5,14,8),
  ("augue id ante dictum cursus. Nunc mauris elit,","04/11/2023","habitant",13,"06/19/2023",5,9,0);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("et arcu imperdiet ullamcorper. Duis at lacus. Quisque purus","01/07/2024","eu,",7,"01/04/2024",9,11,2),
  ("convallis dolor. Quisque tincidunt pede ac urna.","09/20/2022","rutrum",12,"04/03/2024",5,9,3),
  ("rutrum eu, ultrices sit amet,","08/15/2024","Fusce",8,"04/15/2023",2,10,5),
  ("suscipit nonummy. Fusce fermentum fermentum arcu. Vestibulum ante","08/12/2022","Sed",11,"05/26/2023",6,7,0),
  ("eu, odio. Phasellus at augue","08/15/2023","massa.",9,"11/28/2023",9,8,3),
  ("facilisis. Suspendisse commodo tincidunt nibh. Phasellus","05/04/2023","massa",15,"06/26/2023",7,2,4),
  ("Sed nunc est, mollis non, cursus non,","03/07/2024","a,",11,"09/17/2023",3,5,5),
  ("id, libero. Donec consectetuer mauris","03/19/2023","Nullam",8,"12/23/2022",5,7,3),
  ("auctor odio a purus. Duis elementum, dui quis","11/17/2022","Etiam",7,"06/26/2022",3,6,8),
  ("mauris a nunc. In at pede. Cras vulputate","04/05/2023","lorem,",17,"08/27/2022",6,10,1);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("magna et ipsum cursus","06/22/2024","erat",7,"11/12/2022",3,0,1),
  ("aptent taciti sociosqu ad litora torquent per conubia","11/20/2022","Sed",15,"07/11/2022",5,4,3),
  ("rutrum urna, nec luctus felis purus ac tellus. Suspendisse","06/19/2023","in",17,"03/16/2024",5,5,7),
  ("mus. Proin vel arcu eu odio tristique pharetra.","08/29/2022","dui,",19,"12/26/2023",5,11,4),
  ("Sed id risus quis diam","03/24/2024","leo.",15,"11/10/2021",9,6,0),
  ("dis parturient montes, nascetur ridiculus mus. Donec","03/05/2024","semper",9,"11/23/2022",4,13,3),
  ("risus. Donec egestas. Aliquam nec enim. Nunc","08/18/2022","ullamcorper",12,"12/02/2022",4,3,4),
  ("dui, nec tempus mauris erat eget ipsum. Suspendisse sagittis.","08/29/2022","vitae",7,"09/19/2023",2,2,7),
  ("Nulla aliquet. Proin velit. Sed","10/15/2022","orci.",19,"04/30/2024",4,9,5),
  ("et ipsum cursus vestibulum. Mauris magna. Duis","10/01/2023","Nunc",11,"02/21/2023",8,5,0);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("euismod urna. Nullam lobortis quam a","07/05/2022","bibendum",12,"11/18/2022",9,10,9),
  ("a, arcu. Sed et libero.","10/15/2023","Cras",9,"07/26/2022",1,5,6),
  ("euismod urna. Nullam lobortis","05/09/2024","consectetuer",10,"03/16/2024",7,12,5),
  ("neque sed sem egestas blandit.","12/02/2023","ac",16,"01/29/2022",8,7,0),
  ("leo. Vivamus nibh dolor,","12/24/2023","tristique",7,"01/18/2023",7,8,8),
  ("Mauris vestibulum, neque sed dictum eleifend, nunc risus varius orci,","01/21/2022","vel,",20,"08/09/2022",8,13,8),
  ("luctus felis purus ac tellus. Suspendisse sed dolor. Fusce mi","11/19/2023","orci",10,"06/10/2024",8,8,4),
  ("amet, consectetuer adipiscing elit. Etiam laoreet,","05/20/2024","molestie",19,"05/20/2022",2,8,0),
  ("Donec tincidunt. Donec vitae erat vel pede","02/10/2022","magna.",8,"01/23/2024",3,12,3),
  ("commodo at, libero. Morbi accumsan laoreet ipsum.","12/03/2023","semper",15,"10/21/2022",6,9,2);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("luctus lobortis. Class aptent taciti","01/12/2023","felis.",11,"07/23/2024",2,9,2),
  ("tincidunt. Donec vitae erat vel pede blandit congue. In","09/15/2023","porttitor",12,"03/21/2022",9,2,9),
  ("sem semper erat, in consectetuer","07/12/2022","Aliquam",14,"11/24/2021",1,4,3),
  ("tempus eu, ligula. Aenean euismod mauris eu","11/21/2021","a,",8,"11/01/2022",5,8,5),
  ("nec metus facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula.","06/13/2023","tristique",5,"05/19/2024",9,5,1),
  ("velit. Cras lorem lorem, luctus ut,","03/06/2024","est",10,"11/16/2021",5,8,0),
  ("ut erat. Sed nunc est, mollis non, cursus","05/17/2024","sed",8,"08/03/2023",4,12,8),
  ("Duis ac arcu. Nunc mauris. Morbi non sapien molestie orci","08/24/2023","tempor",5,"01/06/2024",1,8,3),
  ("Aliquam fringilla cursus purus.","07/25/2024","massa.",5,"04/01/2024",4,14,1),
  ("vitae sodales nisi magna sed dui.","03/10/2022","at",18,"04/22/2022",10,1,8);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor.","11/15/2022","convallis",20,"06/20/2023",6,1,7),
  ("Pellentesque habitant morbi tristique senectus et netus et","02/27/2023","felis",18,"03/14/2022",10,11,7),
  ("nonummy ipsum non arcu.","02/28/2022","Integer",16,"02/25/2024",7,1,6),
  ("arcu et pede. Nunc sed orci lobortis","07/25/2022","pede",7,"05/24/2022",8,11,4),
  ("dignissim pharetra. Nam ac nulla. In tincidunt","06/26/2024","a,",6,"05/25/2022",7,6,8),
  ("rhoncus. Proin nisl sem, consequat nec, mollis","07/15/2022","luctus",10,"09/17/2022",9,5,1),
  ("non lorem vitae odio","04/27/2023","sit",14,"12/14/2023",7,13,3),
  ("sit amet lorem semper auctor. Mauris","03/26/2023","pede.",12,"12/22/2022",8,9,2),
  ("non enim. Mauris quis turpis vitae purus gravida sagittis.","11/08/2022","Cras",19,"07/08/2023",7,8,2),
  ("sapien. Cras dolor dolor, tempus non, lacinia at,","04/10/2023","dictum",16,"05/26/2024",2,2,6);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("magna sed dui. Fusce aliquam, enim nec","12/09/2022","nibh.",10,"05/05/2024",8,6,2),
  ("adipiscing. Mauris molestie pharetra","01/05/2022","erat",11,"02/22/2024",7,6,3),
  ("lacus. Etiam bibendum fermentum metus. Aenean","06/12/2024","justo",16,"04/05/2024",2,6,2),
  ("tortor at risus. Nunc ac sem ut dolor","01/24/2023","pharetra.",16,"09/25/2022",8,7,3),
  ("nec, diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis","02/05/2024","eros",6,"12/19/2021",1,2,5),
  ("dis parturient montes, nascetur ridiculus","01/26/2024","orci.",13,"11/04/2021",4,6,0),
  ("a sollicitudin orci sem eget massa. Suspendisse","08/03/2022","Etiam",16,"03/25/2022",4,11,3),
  ("et, rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus","12/11/2022","eget",18,"08/01/2023",8,10,8),
  ("ante dictum cursus. Nunc mauris elit, dictum eu, eleifend","07/08/2022","egestas.",13,"12/09/2021",5,1,1),
  ("In mi pede, nonummy ut, molestie in,","10/31/2023","Etiam",9,"11/21/2021",1,10,5);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("Quisque imperdiet, erat nonummy ultricies ornare, elit","03/31/2022","morbi",19,"10/10/2022",4,4,2),
  ("sed, facilisis vitae, orci. Phasellus dapibus quam quis diam.","08/11/2023","gravida",12,"12/06/2023",10,3,2),
  ("mauris id sapien. Cras dolor dolor, tempus non,","01/28/2023","tellus",12,"05/29/2023",10,5,2),
  ("tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla","05/24/2024","nec",8,"08/03/2023",6,12,3),
  ("libero lacus, varius et, euismod","08/12/2024","netus",17,"01/04/2023",5,2,6),
  ("facilisi. Sed neque. Sed","08/05/2023","Nulla",11,"09/09/2023",2,4,2),
  ("est ac facilisis facilisis, magna","09/15/2022","aptent",15,"03/15/2022",5,2,2),
  ("lacinia. Sed congue, elit sed consequat auctor, nunc","01/22/2022","ultrices",15,"10/18/2022",5,7,0),
  ("dignissim pharetra. Nam ac nulla.","12/08/2021","dolor,",5,"04/26/2024",6,11,2),
  ("Proin sed turpis nec mauris blandit mattis. Cras eget","03/09/2022","enim",10,"12/04/2021",8,5,9);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("nunc nulla vulputate dui, nec tempus mauris erat eget ipsum.","12/02/2023","aliquet",13,"07/15/2024",6,11,4),
  ("Donec vitae erat vel","03/22/2024","viverra.",8,"11/23/2021",4,14,3),
  ("augue, eu tempor erat neque non quam.","10/29/2023","nec,",10,"06/30/2024",7,2,2),
  ("vestibulum nec, euismod in, dolor.","03/17/2024","mattis.",11,"08/31/2023",9,9,8),
  ("fringilla mi lacinia mattis. Integer","11/25/2023","tempus,",14,"08/04/2024",4,2,9),
  ("egestas. Duis ac arcu. Nunc mauris.","08/15/2023","vestibulum,",16,"06/03/2023",6,10,8),
  ("Donec luctus aliquet odio. Etiam ligula tortor,","02/14/2023","vulputate,",11,"02/09/2023",5,9,0),
  ("elementum sem, vitae aliquam eros","03/21/2023","ridiculus",14,"12/05/2021",6,6,6),
  ("nulla. Integer urna. Vivamus molestie","03/10/2024","faucibus",10,"06/07/2024",5,2,6),
  ("pede blandit congue. In scelerisque scelerisque dui.","08/15/2024","Nullam",7,"09/20/2023",2,5,3);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("Nam ac nulla. In tincidunt congue turpis. In","05/30/2022","amet,",6,"07/04/2022",5,3,1),
  ("augue malesuada malesuada. Integer id magna et ipsum","03/10/2023","nascetur",19,"12/17/2021",3,5,5),
  ("sem molestie sodales. Mauris blandit enim consequat purus.","06/26/2022","et",6,"08/21/2022",4,12,7),
  ("lacus. Cras interdum. Nunc sollicitudin commodo ipsum.","07/24/2024","ac,",18,"04/30/2023",3,9,8),
  ("ultrices. Vivamus rhoncus. Donec est. Nunc ullamcorper,","11/19/2023","suscipit,",10,"12/07/2021",7,10,7),
  ("luctus et ultrices posuere cubilia Curae","02/16/2023","a,",6,"01/27/2023",8,5,8),
  ("dolor. Fusce mi lorem, vehicula et, rutrum","03/27/2024","sed,",17,"08/20/2023",5,12,0),
  ("tincidunt, nunc ac mattis ornare, lectus ante","01/01/2024","magna",11,"12/28/2022",6,3,7),
  ("Duis ac arcu. Nunc mauris. Morbi","02/26/2022","iaculis",12,"03/29/2023",2,6,7),
  ("ante ipsum primis in faucibus orci luctus et ultrices","03/08/2022","ac",6,"09/14/2023",9,0,6);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("aliquet diam. Sed diam","12/01/2021","cursus.",16,"11/11/2023",7,10,9),
  ("Duis risus odio, auctor vitae, aliquet","11/20/2022","felis",19,"02/09/2024",7,12,5),
  ("In nec orci. Donec nibh.","03/11/2023","Quisque",19,"05/14/2023",5,1,8),
  ("sem, vitae aliquam eros turpis non enim. Mauris quis turpis","09/20/2023","iaculis",20,"10/27/2021",2,12,6),
  ("Integer vulputate, risus a ultricies adipiscing,","11/28/2022","elit,",16,"02/26/2023",7,2,7),
  ("mollis nec, cursus a, enim. Suspendisse aliquet,","01/24/2023","scelerisque",17,"10/10/2022",3,3,7),
  ("ante. Maecenas mi felis, adipiscing fringilla, porttitor","11/24/2021","arcu.",18,"01/18/2023",10,12,8),
  ("ut, pellentesque eget, dictum","05/15/2022","Nullam",10,"05/24/2022",1,6,4),
  ("in consectetuer ipsum nunc id enim. Curabitur massa. Vestibulum","09/02/2023","sagittis",19,"02/08/2023",1,11,7),
  ("malesuada. Integer id magna et ipsum","06/05/2022","libero",10,"05/08/2024",8,13,3);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("ullamcorper magna. Sed eu eros.","04/04/2024","id",7,"12/26/2023",2,13,0),
  ("laoreet ipsum. Curabitur consequat, lectus","10/05/2023","velit",12,"12/25/2022",4,13,2),
  ("Aliquam ornare, libero at auctor ullamcorper,","11/20/2023","eget",12,"04/02/2023",10,1,3),
  ("ornare placerat, orci lacus vestibulum","02/01/2024","magnis",17,"12/29/2022",8,13,7),
  ("rhoncus. Proin nisl sem, consequat nec, mollis vitae,","03/19/2023","ultrices",8,"05/17/2022",7,7,4),
  ("quam quis diam. Pellentesque habitant morbi tristique","01/30/2022","molestie",17,"11/27/2023",7,5,5),
  ("dolor, tempus non, lacinia at, iaculis quis, pede.","11/25/2022","Donec",6,"04/17/2022",5,8,2),
  ("Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac risus. Morbi","09/05/2022","mollis",8,"07/04/2022",3,2,7),
  ("egestas lacinia. Sed congue, elit sed","04/03/2024","in",12,"04/12/2022",6,8,1),
  ("consectetuer adipiscing elit. Etiam laoreet, libero et tristique","04/26/2024","ligula",20,"01/07/2024",7,12,2);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("ultricies ligula. Nullam enim. Sed","08/17/2022","vel",12,"07/17/2022",8,6,9),
  ("malesuada vel, venenatis vel, faucibus","02/17/2023","euismod",9,"02/25/2024",5,1,2),
  ("lobortis augue scelerisque mollis. Phasellus libero mauris, aliquam eu,","07/16/2023","Suspendisse",10,"03/06/2022",5,13,3),
  ("egestas, urna justo faucibus lectus, a sollicitudin orci sem","08/18/2023","arcu",11,"04/13/2022",2,1,4),
  ("non lorem vitae odio sagittis semper. Nam tempor","01/18/2023","nibh",9,"11/23/2022",6,2,6),
  ("ultrices posuere cubilia Curae","12/20/2023","at,",14,"08/20/2022",10,3,6),
  ("fringilla euismod enim. Etiam gravida molestie arcu. Sed eu nibh","07/15/2024","dignissim",9,"12/19/2021",2,7,4),
  ("lectus pede et risus. Quisque libero","11/13/2023","et",9,"02/02/2022",3,7,2),
  ("ornare lectus justo eu arcu. Morbi sit amet","01/12/2023","ut",5,"06/07/2023",1,3,1),
  ("vitae, posuere at, velit. Cras lorem","03/13/2022","luctus",19,"11/19/2022",4,5,3);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("aliquet, sem ut cursus luctus, ipsum leo elementum sem, vitae","06/11/2023","nunc",13,"07/11/2022",7,10,6),
  ("Nullam enim. Sed nulla ante, iaculis nec, eleifend","02/05/2023","ornare,",13,"08/02/2022",2,11,4),
  ("nibh dolor, nonummy ac,","07/30/2023","est,",16,"04/03/2024",4,12,7),
  ("vel est tempor bibendum. Donec","03/24/2024","lacus.",16,"01/25/2022",1,12,9),
  ("Ut nec urna et arcu imperdiet ullamcorper.","10/03/2023","eu",13,"04/14/2024",5,4,5),
  ("Proin eget odio. Aliquam vulputate ullamcorper","05/05/2022","Nullam",17,"05/08/2022",6,10,9),
  ("fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet, erat","07/16/2023","sociis",20,"08/03/2023",8,11,5),
  ("neque tellus, imperdiet non, vestibulum nec, euismod in, dolor. Fusce","02/16/2024","Aliquam",12,"06/21/2022",9,4,7),
  ("nulla. Integer vulputate, risus a ultricies","05/04/2024","et,",12,"05/01/2023",9,5,2),
  ("accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis","01/06/2023","sit",18,"05/19/2023",5,2,1);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("ligula. Aliquam erat volutpat. Nulla dignissim.","11/19/2023","cursus",18,"02/19/2022",9,11,7),
  ("cursus et, eros. Proin ultrices. Duis volutpat nunc","12/14/2023","turpis.",10,"02/21/2023",8,6,8),
  ("nisl. Quisque fringilla euismod enim. Etiam gravida molestie","02/20/2024","pretium",18,"04/19/2024",2,13,7),
  ("orci tincidunt adipiscing. Mauris molestie pharetra","09/07/2022","erat",14,"08/25/2022",7,8,0),
  ("et malesuada fames ac turpis egestas. Fusce aliquet magna","12/25/2021","sagittis",19,"01/12/2023",2,13,8),
  ("elit. Aliquam auctor, velit eget laoreet posuere,","03/01/2022","lectus",17,"04/10/2024",4,13,3),
  ("ante. Vivamus non lorem vitae odio","06/29/2022","dapibus",13,"03/12/2024",9,8,1),
  ("mollis lectus pede et","08/11/2022","nec",9,"10/15/2023",5,1,6),
  ("tempor augue ac ipsum. Phasellus","07/03/2023","Proin",15,"12/27/2023",6,7,2),
  ("pulvinar arcu et pede. Nunc sed orci","07/25/2022","Nunc",18,"06/11/2024",6,11,2);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("Ut nec urna et","06/07/2023","tellus",13,"02/17/2023",1,9,1),
  ("faucibus id, libero. Donec consectetuer mauris","07/25/2023","lobortis",18,"05/08/2024",8,13,1),
  ("elit fermentum risus, at fringilla","02/23/2022","nec,",14,"01/02/2024",2,7,4),
  ("at pede. Cras vulputate velit eu sem. Pellentesque","01/07/2024","Nulla",18,"11/07/2023",4,11,5),
  ("lorem, vehicula et, rutrum eu, ultrices sit amet,","05/18/2023","dictum",13,"04/18/2024",8,11,9),
  ("cursus luctus, ipsum leo elementum sem, vitae aliquam","12/08/2023","massa.",14,"11/24/2021",9,4,6),
  ("interdum feugiat. Sed nec metus","08/22/2022","dui.",9,"05/20/2022",3,8,2),
  ("tempus scelerisque, lorem ipsum sodales purus, in molestie tortor","08/15/2024","malesuada",5,"06/24/2023",4,9,5),
  ("porttitor tellus non magna. Nam","03/21/2022","Nunc",17,"04/20/2023",4,2,5),
  ("euismod ac, fermentum vel, mauris. Integer","08/25/2024","parturient",5,"07/06/2023",1,11,9);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("id enim. Curabitur massa. Vestibulum accumsan neque et nunc.","05/31/2022","molestie",12,"05/30/2022",3,10,4),
  ("Ut semper pretium neque. Morbi quis","01/03/2023","dolor",14,"07/31/2022",4,9,0),
  ("nulla. Cras eu tellus eu augue porttitor interdum.","01/28/2024","neque.",13,"09/22/2023",7,0,5),
  ("Morbi sit amet massa. Quisque porttitor eros","04/26/2023","ipsum.",12,"03/12/2023",3,13,5),
  ("Nunc commodo auctor velit. Aliquam nisl.","10/31/2022","nulla",12,"02/07/2024",3,6,9),
  ("dictum ultricies ligula. Nullam enim. Sed","11/03/2023","lobortis",15,"05/17/2022",7,14,0),
  ("libero et tristique pellentesque, tellus sem mollis","05/13/2022","lacinia",6,"03/02/2023",2,13,4),
  ("libero est, congue a, aliquet vel, vulputate","08/08/2023","a",19,"04/28/2024",10,11,1),
  ("a feugiat tellus lorem eu metus. In lorem. Donec","07/24/2022","tempor",15,"06/14/2022",3,4,2),
  ("orci sem eget massa. Suspendisse eleifend. Cras sed","03/14/2023","eget,",6,"11/25/2022",5,12,8);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("fringilla est. Mauris eu turpis. Nulla aliquet.","07/19/2024","diam",6,"02/09/2022",6,8,0),
  ("pellentesque a, facilisis non, bibendum sed, est. Nunc laoreet","12/27/2021","ut",13,"06/08/2024",8,1,1),
  ("metus. Vivamus euismod urna. Nullam lobortis","06/02/2023","Cras",20,"08/14/2023",2,5,2),
  ("non lorem vitae odio sagittis","10/08/2022","vel,",10,"12/14/2023",10,9,1),
  ("Nulla facilisi. Sed neque. Sed","09/23/2023","pellentesque",8,"09/30/2023",6,6,8),
  ("leo. Morbi neque tellus, imperdiet non, vestibulum nec, euismod","03/26/2023","ante",7,"05/08/2023",6,6,5),
  ("lectus rutrum urna, nec luctus felis purus","02/17/2023","auctor",12,"12/28/2023",5,13,4),
  ("ligula. Aenean gravida nunc sed pede.","10/01/2023","egestas",19,"05/13/2024",4,3,2),
  ("Quisque tincidunt pede ac urna. Ut","06/23/2023","faucibus",15,"03/10/2022",1,8,0),
  ("in felis. Nulla tempor augue ac ipsum.","01/04/2022","Cras",17,"01/01/2024",5,13,7);
