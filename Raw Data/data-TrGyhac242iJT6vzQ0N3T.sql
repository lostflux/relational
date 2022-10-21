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
  ("fringilla euismod enim. Etiam gravida molestie arcu.","11/13/2021","ittt",6,"04/05/2023",3,2,9),
  ("eu, ultrices sit amet, risus. Donec","06/11/2022","sfp",17,"07/06/2024",8,4,3),
  ("convallis dolor. Quisque tincidunt pede ac urna. Ut","09/25/2023","accepted",8,"01/24/2022",4,12,4),
  ("augue porttitor interdum. Sed auctor","12/18/2021","ittt",18,"02/23/2023",7,2,3),
  ("a, facilisis non, bibendum sed, est. Nunc laoreet lectus quis","04/17/2022","rejected",18,"12/19/2021",6,1,0),
  ("non massa non ante bibendum ullamcorper. Duis cursus,","06/04/2022","rejected",8,"06/19/2024",9,1,5),
  ("mollis. Integer tincidunt aliquam arcu. Aliquam ultrices","04/11/2023","rejected",7,"01/31/2023",10,12,4),
  ("neque. In ornare sagittis felis. Donec","06/09/2024","urrr",12,"04/15/2022",3,10,9),
  ("luctus felis purus ac tellus. Suspendisse sed","08/15/2023","rejected",12,"06/23/2023",5,10,0),
  ("dapibus quam quis diam. Pellentesque","12/16/2021","accepted",14,"09/23/2022",10,3,0);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("mauris ipsum porta elit, a feugiat tellus lorem eu","01/07/2024","rejected",15,"09/15/2023",6,8,4),
  ("Integer vitae nibh. Donec est mauris, rhoncus id, mollis nec,","12/05/2021","ittt",8,"05/27/2024",6,4,0),
  ("sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices","07/27/2024","ittt",15,"09/23/2022",6,4,1),
  ("turpis. Aliquam adipiscing lobortis risus.","12/21/2022","urrr",11,"05/20/2022",7,8,3),
  ("neque vitae semper egestas, urna justo","08/28/2023","submitted",19,"06/24/2022",6,1,8),
  ("fermentum convallis ligula. Donec luctus aliquet odio.","05/21/2023","sfp",16,"08/12/2023",7,4,5),
  ("sed dolor. Fusce mi lorem, vehicula et, rutrum eu, ultrices","02/01/2022","submitted",15,"04/30/2024",3,13,9),
  ("Duis volutpat nunc sit amet","07/04/2022","urrr",15,"05/26/2024",4,11,9),
  ("mi lacinia mattis. Integer eu","02/03/2024","accepted",10,"06/09/2024",5,12,8),
  ("leo. Cras vehicula aliquet libero. Integer in magna.","08/19/2023","sfp",12,"09/26/2022",8,8,4);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("tincidunt pede ac urna. Ut tincidunt","04/15/2022","urrr",11,"03/03/2023",3,1,5),
  ("placerat, augue. Sed molestie. Sed id","11/21/2023","urrr",19,"04/27/2022",4,8,7),
  ("sollicitudin a, malesuada id,","05/25/2022","urrr",7,"02/19/2023",1,6,6),
  ("est ac mattis semper, dui lectus rutrum urna,","01/01/2022","ittt",11,"08/31/2024",8,1,7),
  ("accumsan convallis, ante lectus convallis est, vitae sodales","04/18/2022","rejected",14,"06/30/2022",4,14,7),
  ("et ultrices posuere cubilia Curae Phasellus","12/27/2021","ready",15,"12/29/2023",6,13,8),
  ("lacinia mattis. Integer eu lacus. Quisque imperdiet, erat","05/18/2023","accepted",17,"08/24/2022",10,9,9),
  ("Suspendisse sagittis. Nullam vitae diam. Proin dolor.","02/26/2023","rejected",8,"01/11/2022",5,1,3),
  ("In scelerisque scelerisque dui. Suspendisse ac metus vitae","10/23/2021","accepted",13,"08/17/2022",7,5,4),
  ("tortor at risus. Nunc ac sem ut","04/08/2024","ready",8,"05/04/2024",8,4,4);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("sit amet luctus vulputate,","03/06/2022","accepted",17,"02/10/2023",10,13,2),
  ("feugiat nec, diam. Duis mi enim,","07/16/2022","submitted",9,"07/30/2023",1,11,3),
  ("Quisque imperdiet, erat nonummy ultricies","02/05/2023","rejected",10,"05/06/2022",10,2,3),
  ("mauris, rhoncus id, mollis nec, cursus a, enim. Suspendisse","02/18/2024","rejected",10,"12/17/2023",4,4,5),
  ("sapien. Nunc pulvinar arcu et pede. Nunc sed","01/04/2022","ready",17,"04/08/2022",6,9,1),
  ("ultricies sem magna nec quam. Curabitur vel lectus.","08/15/2022","ready",11,"12/30/2022",2,6,3),
  ("neque. Nullam nisl. Maecenas malesuada fringilla","04/15/2024","ittt",19,"05/25/2023",10,7,1),
  ("quis, pede. Suspendisse dui. Fusce diam nunc,","12/31/2021","ready",19,"08/12/2024",1,4,5),
  ("consectetuer adipiscing elit. Curabitur sed tortor. Integer aliquam","01/23/2024","ittt",7,"07/06/2022",8,10,1),
  ("Donec non justo. Proin non massa non ante","11/01/2022","ittt",11,"12/18/2023",7,10,1);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("Proin vel arcu eu odio","11/12/2022","sfp",13,"11/18/2021",2,9,6),
  ("erat eget ipsum. Suspendisse","04/02/2023","rejected",12,"12/26/2022",9,6,8),
  ("suscipit, est ac facilisis facilisis, magna tellus faucibus leo, in","05/17/2022","ready",20,"08/30/2023",4,12,2),
  ("Proin non massa non ante bibendum ullamcorper. Duis","08/11/2024","submitted",15,"08/26/2022",8,10,2),
  ("lobortis quam a felis ullamcorper","06/08/2023","ittt",15,"08/27/2023",9,2,6),
  ("turpis egestas. Aliquam fringilla cursus purus. Nullam scelerisque","10/18/2023","accepted",14,"08/09/2023",7,12,3),
  ("lectus, a sollicitudin orci sem eget massa. Suspendisse","06/10/2023","submitted",7,"05/28/2022",4,2,6),
  ("non, sollicitudin a, malesuada id, erat. Etiam vestibulum","04/29/2023","ready",10,"02/24/2023",4,11,5),
  ("lectus pede et risus. Quisque libero lacus, varius et,","05/08/2022","ready",8,"09/15/2022",4,11,2),
  ("bibendum sed, est. Nunc laoreet lectus quis","07/24/2023","accepted",12,"05/23/2024",5,14,2);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("purus, in molestie tortor nibh sit amet orci. Ut","10/30/2022","ready",9,"07/19/2022",8,1,7),
  ("vulputate velit eu sem. Pellentesque ut ipsum ac","03/11/2023","urrr",13,"07/20/2024",2,4,1),
  ("libero. Integer in magna. Phasellus dolor elit, pellentesque a,","02/11/2022","rejected",20,"08/28/2023",9,2,2),
  ("nec, mollis vitae, posuere at, velit. Cras lorem","08/23/2024","rejected",16,"11/13/2021",2,5,4),
  ("Nulla dignissim. Maecenas ornare egestas ligula. Nullam feugiat placerat velit.","08/22/2022","accepted",10,"08/23/2022",5,13,6),
  ("rutrum eu, ultrices sit amet, risus. Donec nibh enim,","08/25/2024","ready",11,"07/23/2024",10,1,4),
  ("tincidunt pede ac urna. Ut tincidunt","06/19/2022","accepted",18,"11/12/2021",9,11,5),
  ("fermentum fermentum arcu. Vestibulum ante ipsum primis","01/29/2023","urrr",13,"01/22/2023",7,2,2),
  ("hendrerit a, arcu. Sed et libero.","07/17/2023","rejected",8,"03/16/2023",5,8,1),
  ("erat nonummy ultricies ornare, elit elit fermentum","05/04/2024","ittt",11,"07/04/2022",10,4,1);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("augue porttitor interdum. Sed auctor odio a","05/10/2023","rejected",8,"08/17/2024",7,1,4),
  ("et magnis dis parturient montes, nascetur","02/23/2024","ittt",18,"12/10/2022",5,7,4),
  ("cursus. Integer mollis. Integer tincidunt aliquam","08/27/2023","rejected",19,"12/10/2022",4,9,4),
  ("sagittis felis. Donec tempor, est ac mattis semper,","03/08/2023","ready",8,"03/11/2023",2,1,8),
  ("nec, cursus a, enim. Suspendisse aliquet, sem","07/02/2023","ittt",14,"01/07/2022",8,5,2),
  ("diam vel arcu. Curabitur ut odio vel est tempor bibendum.","05/25/2024","accepted",10,"08/12/2022",3,9,1),
  ("sem magna nec quam. Curabitur vel lectus.","11/06/2023","accepted",16,"12/06/2023",3,12,6),
  ("aliquet lobortis, nisi nibh","05/19/2024","urrr",15,"01/31/2023",3,12,5),
  ("nec, imperdiet nec, leo.","11/29/2022","ready",16,"07/15/2023",8,10,9),
  ("a, scelerisque sed, sapien. Nunc pulvinar arcu et pede.","08/12/2024","accepted",11,"12/14/2021",5,5,2);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("diam lorem, auctor quis,","11/01/2021","rejected",7,"12/05/2023",5,9,8),
  ("non enim. Mauris quis turpis","01/23/2023","urrr",6,"09/15/2023",1,12,9),
  ("semper egestas, urna justo faucibus lectus, a sollicitudin","01/23/2024","submitted",7,"07/22/2023",9,11,3),
  ("fermentum vel, mauris. Integer sem elit, pharetra","04/03/2022","ready",15,"11/16/2022",6,0,4),
  ("pulvinar arcu et pede. Nunc sed orci lobortis","05/19/2022","submitted",14,"04/05/2022",8,8,1),
  ("facilisis lorem tristique aliquet. Phasellus fermentum convallis ligula. Donec","02/18/2023","submitted",20,"03/23/2023",3,3,2),
  ("in consequat enim diam vel","12/24/2021","rejected",6,"02/11/2024",3,13,7),
  ("placerat. Cras dictum ultricies ligula. Nullam enim. Sed nulla","02/04/2023","ready",18,"01/24/2023",10,13,9),
  ("interdum enim non nisi. Aenean","11/30/2021","sfp",19,"10/23/2021",9,4,2),
  ("dictum placerat, augue. Sed molestie. Sed id risus","09/16/2023","ittt",18,"03/28/2022",9,6,1);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("tortor. Nunc commodo auctor velit. Aliquam nisl. Nulla eu","04/13/2023","ittt",5,"09/29/2023",4,13,1),
  ("euismod in, dolor. Fusce feugiat. Lorem ipsum dolor sit amet,","11/03/2022","ready",14,"02/06/2022",8,5,7),
  ("mauris erat eget ipsum.","04/05/2023","urrr",12,"04/18/2022",8,5,2),
  ("habitant morbi tristique senectus","04/22/2024","rejected",7,"12/13/2021",2,7,2),
  ("et ipsum cursus vestibulum. Mauris","03/31/2023","urrr",18,"03/14/2024",2,4,1),
  ("convallis ligula. Donec luctus aliquet odio. Etiam ligula","04/07/2022","urrr",17,"03/23/2023",10,1,0),
  ("Sed id risus quis diam","12/21/2023","urrr",19,"10/04/2022",4,8,4),
  ("neque. Nullam nisl. Maecenas malesuada fringilla est. Mauris","03/20/2022","rejected",15,"07/23/2024",10,4,7),
  ("Aenean eget magna. Suspendisse tristique neque venenatis lacus. Etiam","09/22/2023","ittt",7,"08/14/2023",1,12,5),
  ("convallis, ante lectus convallis","03/20/2023","ready",17,"04/13/2024",1,4,1);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("dui augue eu tellus. Phasellus elit pede, malesuada vel, venenatis","10/05/2022","accepted",5,"01/19/2023",4,9,8),
  ("sit amet, risus. Donec nibh","04/07/2023","accepted",19,"04/09/2023",3,2,7),
  ("tellus id nunc interdum feugiat.","07/19/2022","accepted",19,"11/11/2023",10,4,1),
  ("Proin dolor. Nulla semper tellus id nunc interdum","09/30/2023","ittt",9,"08/29/2022",4,4,7),
  ("nec orci. Donec nibh.","02/22/2022","accepted",7,"07/04/2023",6,4,5),
  ("feugiat tellus lorem eu metus. In","02/17/2023","ittt",16,"04/22/2024",6,8,0),
  ("eu arcu. Morbi sit amet massa. Quisque porttitor","11/11/2023","ittt",14,"03/01/2023",9,6,8),
  ("dui. Fusce diam nunc, ullamcorper eu,","04/09/2023","rejected",13,"03/22/2024",7,4,3),
  ("Cras eget nisi dictum augue malesuada malesuada. Integer","05/01/2022","rejected",16,"10/22/2021",9,1,0),
  ("magna. Phasellus dolor elit, pellentesque a, facilisis non, bibendum","08/25/2022","ready",17,"04/26/2022",6,9,3);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("mauris sit amet lorem semper auctor. Mauris vel turpis.","12/18/2022","urrr",10,"12/01/2022",3,12,1),
  ("Pellentesque tincidunt tempus risus. Donec egestas. Duis ac arcu. Nunc","01/25/2023","ittt",7,"04/13/2022",4,3,5),
  ("consequat purus. Maecenas libero est, congue a,","01/18/2022","rejected",19,"05/23/2022",6,9,8),
  ("eleifend, nunc risus varius orci, in consequat enim","09/20/2022","ittt",12,"07/23/2024",2,4,6),
  ("ut, pellentesque eget, dictum","02/11/2023","rejected",10,"12/03/2023",1,10,2),
  ("eu, odio. Phasellus at","02/22/2022","rejected",10,"11/19/2021",1,8,3),
  ("luctus aliquet odio. Etiam ligula tortor, dictum eu,","07/01/2024","accepted",17,"04/25/2024",6,10,3),
  ("blandit enim consequat purus.","01/04/2024","accepted",10,"07/23/2023",5,0,6),
  ("felis eget varius ultrices, mauris","10/04/2023","ready",17,"02/02/2022",6,8,2),
  ("Donec non justo. Proin non massa non","07/22/2022","urrr",20,"03/18/2023",10,13,4);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("vitae semper egestas, urna justo","08/19/2022","rejected",14,"11/30/2022",1,13,6),
  ("mattis. Integer eu lacus. Quisque imperdiet, erat nonummy ultricies ornare,","03/02/2024","urrr",9,"08/17/2023",5,11,9),
  ("cursus. Integer mollis. Integer tincidunt aliquam arcu.","06/19/2022","accepted",19,"12/14/2022",4,2,0),
  ("egestas nunc sed libero. Proin sed turpis","05/30/2022","accepted",16,"03/13/2024",3,2,3),
  ("eget, venenatis a, magna. Lorem ipsum dolor sit","06/17/2024","ittt",10,"02/21/2022",9,10,5),
  ("Morbi quis urna. Nunc quis","07/19/2024","urrr",9,"08/13/2024",3,13,1),
  ("nec luctus felis purus","01/06/2024","ittt",9,"06/04/2023",5,1,2),
  ("sagittis. Nullam vitae diam. Proin dolor. Nulla semper tellus id","09/16/2022","accepted",14,"04/01/2023",1,7,0),
  ("tempor augue ac ipsum. Phasellus vitae mauris","03/08/2023","accepted",14,"10/21/2023",7,5,0),
  ("scelerisque mollis. Phasellus libero mauris, aliquam eu, accumsan sed,","11/25/2023","urrr",11,"01/16/2024",2,4,3);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("porttitor tellus non magna. Nam ligula elit, pretium","12/23/2022","accepted",5,"08/07/2022",6,11,6),
  ("feugiat tellus lorem eu metus.","03/05/2022","rejected",13,"04/26/2022",3,9,6),
  ("varius. Nam porttitor scelerisque neque. Nullam nisl.","12/01/2021","urrr",6,"06/16/2023",6,2,5),
  ("Donec egestas. Duis ac arcu. Nunc mauris.","11/16/2023","rejected",9,"03/04/2023",4,14,5),
  ("elit. Aliquam auctor, velit eget laoreet posuere, enim nisl elementum","06/25/2022","ready",19,"08/21/2024",10,5,0),
  ("felis, adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus.","07/12/2024","accepted",7,"02/27/2023",8,11,8),
  ("nulla. Cras eu tellus eu augue porttitor interdum.","05/05/2023","accepted",18,"01/04/2022",9,1,2),
  ("Nunc lectus pede, ultrices a, auctor non, feugiat nec,","10/31/2023","urrr",11,"02/25/2024",9,4,7),
  ("tellus. Suspendisse sed dolor. Fusce","08/17/2023","sfp",11,"12/21/2021",5,4,2),
  ("interdum enim non nisi. Aenean eget","03/29/2023","sfp",12,"08/14/2022",7,11,1);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("a odio semper cursus. Integer mollis. Integer","01/10/2022","ittt",14,"03/05/2023",9,12,1),
  ("purus sapien, gravida non, sollicitudin a, malesuada id, erat.","08/01/2024","rejected",8,"12/04/2022",2,0,6),
  ("penatibus et magnis dis parturient montes, nascetur ridiculus mus.","08/07/2023","ittt",12,"12/08/2023",2,8,6),
  ("interdum enim non nisi. Aenean eget metus. In","03/14/2023","ready",18,"10/22/2021",8,7,4),
  ("hendrerit id, ante. Nunc mauris sapien, cursus in, hendrerit","02/29/2024","ready",8,"05/21/2022",2,9,6),
  ("eros turpis non enim. Mauris quis","05/28/2022","sfp",10,"07/01/2023",4,6,2),
  ("egestas blandit. Nam nulla magna,","07/02/2023","urrr",8,"09/10/2022",4,1,3),
  ("tristique senectus et netus et malesuada fames ac","02/23/2023","accepted",9,"05/07/2022",7,5,4),
  ("placerat, orci lacus vestibulum lorem, sit amet ultricies","10/12/2023","ittt",9,"12/18/2021",9,6,2),
  ("bibendum ullamcorper. Duis cursus, diam at","04/29/2022","submitted",20,"03/13/2024",2,10,9);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("sem. Pellentesque ut ipsum ac mi","12/15/2023","rejected",8,"01/31/2023",1,4,9),
  ("interdum. Sed auctor odio a purus. Duis","01/26/2024","ittt",17,"04/05/2022",3,7,1),
  ("sem semper erat, in","06/02/2024","ittt",19,"12/13/2022",7,10,1),
  ("sem ut dolor dapibus gravida. Aliquam tincidunt, nunc","09/21/2023","ittt",10,"07/22/2022",8,13,4),
  ("volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus nulla.","04/04/2023","rejected",14,"10/24/2023",7,6,8),
  ("nec, eleifend non, dapibus rutrum, justo. Praesent luctus.","06/26/2023","rejected",10,"10/09/2023",2,3,6),
  ("vulputate, risus a ultricies adipiscing, enim mi tempor","12/18/2022","sfp",7,"07/03/2023",10,1,8),
  ("penatibus et magnis dis","07/04/2023","ready",8,"06/24/2024",1,9,2),
  ("egestas. Sed pharetra, felis eget varius","01/20/2023","rejected",8,"10/14/2022",4,13,6),
  ("risus a ultricies adipiscing, enim mi tempor lorem, eget","06/13/2022","ittt",8,"05/11/2024",2,5,5);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("a feugiat tellus lorem eu metus. In lorem. Donec","12/21/2021","ittt",6,"03/05/2022",6,12,6),
  ("et malesuada fames ac turpis egestas. Fusce","03/29/2023","rejected",7,"03/20/2024",7,11,7),
  ("purus, accumsan interdum libero dui nec","06/01/2023","rejected",13,"05/29/2023",2,13,0),
  ("semper erat, in consectetuer ipsum nunc","01/26/2023","urrr",11,"10/21/2022",5,12,7),
  ("litora torquent per conubia nostra, per inceptos hymenaeos. Mauris","12/25/2022","accepted",19,"03/21/2024",3,4,6),
  ("iaculis enim, sit amet ornare lectus justo eu","09/01/2023","accepted",17,"05/04/2024",6,7,9),
  ("lacinia orci, consectetuer euismod est arcu","04/17/2022","sfp",19,"06/24/2023",2,12,4),
  ("egestas a, dui. Cras pellentesque.","08/27/2024","urrr",11,"04/15/2024",4,7,7),
  ("Integer tincidunt aliquam arcu. Aliquam ultrices","11/15/2021","ittt",8,"06/21/2022",9,8,6),
  ("egestas. Fusce aliquet magna a neque. Nullam","01/31/2023","submitted",15,"12/27/2021",2,1,6);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("et magnis dis parturient montes, nascetur ridiculus mus. Proin vel","11/03/2021","urrr",9,"10/14/2022",2,6,3),
  ("eros. Nam consequat dolor vitae dolor. Donec","10/15/2022","accepted",17,"06/21/2022",8,8,6),
  ("aliquet. Phasellus fermentum convallis ligula. Donec luctus aliquet odio.","08/04/2024","urrr",11,"04/26/2023",5,12,6),
  ("nunc nulla vulputate dui, nec tempus mauris","01/10/2024","ittt",5,"10/18/2023",8,11,9),
  ("non enim commodo hendrerit. Donec porttitor tellus non magna. Nam","04/13/2022","ittt",13,"12/15/2022",8,6,2),
  ("penatibus et magnis dis parturient montes, nascetur ridiculus","11/24/2023","ittt",18,"02/25/2023",4,0,2),
  ("lorem, sit amet ultricies sem magna","11/27/2022","accepted",15,"10/21/2022",6,7,8),
  ("adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus. Cras interdum.","10/22/2022","ittt",15,"02/09/2023",2,11,8),
  ("elit erat vitae risus. Duis a","05/06/2023","submitted",12,"03/19/2022",8,5,2),
  ("a sollicitudin orci sem eget massa. Suspendisse eleifend. Cras","06/06/2022","submitted",19,"04/30/2022",3,13,6);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("nisi a odio semper cursus. Integer mollis. Integer tincidunt aliquam","01/08/2024","accepted",15,"08/21/2023",7,13,8),
  ("egestas nunc sed libero. Proin sed turpis nec mauris blandit","03/04/2023","ready",15,"02/15/2022",4,10,8),
  ("in, dolor. Fusce feugiat. Lorem","05/20/2024","rejected",8,"05/13/2022",4,3,9),
  ("mus. Aenean eget magna. Suspendisse tristique neque venenatis lacus.","03/25/2024","urrr",11,"11/20/2021",2,13,5),
  ("ipsum leo elementum sem, vitae aliquam eros turpis","12/25/2021","rejected",16,"08/25/2022",10,2,8),
  ("justo sit amet nulla. Donec non justo. Proin non","11/24/2023","ready",8,"04/15/2022",2,9,4),
  ("Suspendisse eleifend. Cras sed leo. Cras vehicula aliquet libero. Integer","11/22/2021","rejected",19,"08/10/2023",9,11,7),
  ("vitae, sodales at, velit. Pellentesque ultricies dignissim lacus. Aliquam rutrum","07/03/2022","rejected",5,"03/23/2022",2,1,4),
  ("amet lorem semper auctor. Mauris vel turpis. Aliquam adipiscing","01/28/2022","accepted",11,"06/05/2023",3,3,0),
  ("ornare, elit elit fermentum risus, at fringilla purus","11/12/2023","rejected",17,"02/23/2022",7,7,5);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("imperdiet nec, leo. Morbi neque tellus, imperdiet non, vestibulum","02/28/2022","sfp",19,"02/08/2023",2,8,1),
  ("egestas, urna justo faucibus","07/07/2022","urrr",6,"08/15/2023",6,14,1),
  ("luctus lobortis. Class aptent taciti sociosqu ad litora torquent","07/16/2023","submitted",8,"03/02/2022",10,2,3),
  ("Sed molestie. Sed id risus","10/28/2023","ready",5,"08/28/2023",2,9,8),
  ("lectus justo eu arcu. Morbi sit amet massa. Quisque","08/13/2022","accepted",5,"05/23/2024",3,8,5),
  ("vitae nibh. Donec est mauris, rhoncus id,","05/31/2023","ready",14,"05/09/2023",2,10,8),
  ("nisi. Mauris nulla. Integer urna. Vivamus","06/04/2024","rejected",19,"07/19/2022",3,8,2),
  ("aliquet, metus urna convallis erat, eget tincidunt dui augue eu","12/09/2023","ittt",18,"03/23/2023",5,9,1),
  ("diam luctus lobortis. Class aptent taciti sociosqu ad litora","11/14/2023","ittt",8,"08/08/2024",5,4,8),
  ("Sed diam lorem, auctor quis,","04/20/2023","urrr",15,"07/22/2024",8,12,3);
INSERT INTO `myTable` (`title`,`date_received`,`status`,`page_count`,`date_received`,`RICode_RiCode`,`Editor_editor_id`,`Issue_issue_id`)
VALUES
  ("aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum","07/16/2024","submitted",9,"10/04/2022",3,9,3),
  ("primis in faucibus orci luctus et ultrices posuere","08/07/2024","rejected",20,"11/27/2022",4,10,6),
  ("dui. Suspendisse ac metus vitae","01/27/2022","accepted",7,"06/20/2022",3,7,3),
  ("lorem lorem, luctus ut, pellentesque","06/02/2024","ready",13,"08/27/2024",3,8,9),
  ("diam vel arcu. Curabitur ut","02/09/2022","ittt",13,"11/18/2023",2,3,2),
  ("Quisque ornare tortor at risus. Nunc","04/03/2024","rejected",11,"11/28/2023",7,10,7),
  ("auctor velit. Aliquam nisl. Nulla eu neque pellentesque","04/05/2022","ready",16,"10/10/2022",3,6,4),
  ("eleifend vitae, erat. Vivamus nisi. Mauris nulla. Integer","10/03/2023","rejected",9,"11/02/2022",8,8,0),
  ("massa lobortis ultrices. Vivamus rhoncus. Donec","10/19/2022","ittt",7,"09/22/2022",4,5,8),
  ("est. Nunc laoreet lectus quis massa. Mauris vestibulum,","12/05/2022","ready",16,"04/13/2024",4,1,5);
