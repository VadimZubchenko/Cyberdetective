# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Database: cyberdetective
# Generation Time: 2018-05-13 19:09:53 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table dialog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dialog`;

CREATE TABLE `dialog` (
  `DialogID` int(11) NOT NULL,
  `DialogText` varchar(1000) DEFAULT NULL,
  `React` varchar(1000) DEFAULT NULL,
  `NpcID` int(11) NOT NULL,
  PRIMARY KEY (`DialogID`),
  KEY `NpcID` (`NpcID`),
  CONSTRAINT `dialog_ibfk_1` FOREIGN KEY (`NpcID`) REFERENCES `npc` (`NpcID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `dialog` WRITE;
/*!40000 ALTER TABLE `dialog` DISABLE KEYS */;

INSERT INTO `dialog` (`DialogID`, `DialogText`, `React`, `NpcID`)
VALUES
	(1,'\"How\'s life!? I\'m C-638 Robby. Welcome to Eureka! Please, be informed, the Body World exhibition is under construction, because we have received a new group of showpieces recently. Would you like to buy a entry ticket?','1',7),
	(2,'\"Here you are. Thanks a lot.\"','yes',7),
	(3,'\" \'Tears in Rain\' monologue in Blade Runner makes me sad. Oh, please don\'t ask me why.\"','2',7),
	(4,'\"Oh eee, there\' s a moment in the movie where the dying replicant Roy Batty says: \"I\'ve seen things you people wouldn\'t believe. Attack ships on fire off the shoulder of Orion. I watched C-beams glitter in the dark near the Tannh?user Gate. All those moments will be lost in time, like tears in rain. Time to die.It makes me sad, sad, sad, sad, sad. Oh sorry, sir. Please say something good. \'To be, or not to be\'\"','why',7),
	(5,'\"Oh, Great Scott! I feel better. Life is good! We have a great exhibitions. I would recommend you to go to The Art of Origami.\"','be',7),
	(6,'\"Oh, no! I don\'t want to die like Roy in Blade Runner. Sorry, I must cool down right now for a while. See you, buddy!\"','not be',7),
	(7,'\"See you next time.\"','3',7),
	(8,'\"Hello! I\'m guide Leon and welcome to the History of The Robotics!  Would you like to buy a detailed tour around the exhibition?\"','1',9),
	(9,'\"Thank you a lot. So, in this hall we have exhibited 6 generations of robots. After the fifth generation, they have been called androids. There has been no difference at all between humans and androids for the last 100 years and they even have their own dream. The engineers programmed the same dream into all of the androids with the capability to see a dream. It\'s about an owl origami as a sign of their origin, but after the 6th generation this information has been restricted, because under right circumstances it can be used to abuse the rights of androids. I hope you\'ve enjoyed the tour! Please enjoy the rest of the exhibition.\"','yes',9),
	(10,'\"Oh sure, I understand. You seem like a professional in this field. Have a nice time!\"','no',9),
	(11,'\" I don\'t understand.\"','what',9),
	(12,'\"How\'s it going? I\'m guide Rachael. Welcome to the Art of The Origami exhibition! Do you happen to have a sheet of paper with you?\"','1',10),
	(13,'\"Sorry, but I can\'t give the tickets away for free. Please come again when you have some credits with you.\"','no wallet',7),
	(14,'\"Oh, great! You can use the paper to make your own origami. So, there are 7 different origami models exhibited in the hall: on the southern side there are Elephant, Owl and Bull, on the western side there are Swan and Dragon, on the northern side there are Mammoth and  Unicorn . Hmmmm... and... one important thing! Eureka appreciates recycling, so if you decide to change your origami to another one, you can use the table at the center of the exhibition and fold the origami back into the paper you used.\"','yes',10),
	(15,'\"Oh sure, I understand. Try to find a sheet of paper and come back!\"','no',10),
	(16,'\"How is it going? I\'m curator of the Science Center Eureka. Sorry, but at this time I can\'t say \'Welcome to Body World!\' to you, because the exhibition is still under construction.\"','1',8),
	(17,'\"My wife is divorcing me because I won\'t stop smoking. Am I wrong? Do you have any cigarettes you could give to me?\"','2',8),
	(18,'\"Oh, thank goodness! Could you stand here while I\'m smoking outside?\"','yes',8),
	(19,'\"Oh, I understand.\"','no',8),
	(20,'\"Sorry, sir. I\'m busy. Feel free to explore the exhibitions that are open.\"','3',8),
	(21,'\"Now it\'s fixed! Enjoy......oh  nooo.....something......is happening........with........me......again.......at this moment I have to say this: \'I\'ve seen things you people wouldn\'t believe. Attack ships on fire off the shoulder of Orion. I watched C-beams glitter in the dark near the Tannh?user Gate. All those moments will be lost in time, like tears in rain. Time to die.\' Why......why......why....who knows....who knows....who knows? Why do you have that bloody origami, why, why, why? Surely, you know what I am.\"','owl origami',11),
	(22,'\"Hello.  I\'m the head of security of Masons\' Research Facility, Joel Lawson. We need your help. One of our scientist, Jeremiah Freeman, has gone missing.  Nobody has seen him for the past two days and his residence have been reported to be empty too. Jeremy and his work are very important for Masons\' corporation, so If you solve the case, we\'ll be ready to offer you a high ranking position in the Masons\' security. You should start looking for clues in Freeman\'s office in the 3rd floor.\"','1',1),
	(23,'\"Bob Norris, the janitor, is waiting you outside the Freeman\'s office to tell you what he knows.\"','2',1),
	(24,'\"You could try talking with Freeman\'s coworkers if they happen to know something.\"','3',1),
	(25,'\"Hello, I\'m Bob Norris. You must be the detective Anderson. Mr. Joel Lawson asked me to wait you here and tell you what I know about Freeman\'s disappearing. Honestly, I don\'t know a lot, but maybe you can figure out something.\"','1',2),
	(26,'\"Last time I saw Freeman was three days ago in the afternoon, when he left the facility as usual, just to not show up in the next morning.\"','2',2),
	(27,'\"The last time I cleaned Freeman\'s office was the four days ago, so it should be in the same condition as it was when he left it last time.\"','3',2),
	(29,'\"Hey! I\'m Cole Cooke, the man in charge in the scrap yard and I don\'t like when random people are wandering around here. Please, don\'t waste my time and leave if you have no business here.\"','1',6),
	(30,'\"It\'s none of my business, man. I know nothing about that stuff. I know, I seem like a weirdo, but I prefer not to stick my nose into other people\'s business.  All that you\'re saying seems like a long, long row of integers for me.\"','freeman',6),
	(31,'\"Origami? Are you kidding me? I\'m not a child. Oh my god, my mama always said, \'Life was like a box of chocolates. You never know what you\'re gonna get.\' I hate a owls.\"','owl',6),
	(32,'\"Oh, I hate that movie. I always burst into tears during last scene. Mama always said, dying was a part of life. I sure wish it wasn\'t. All what you\'re saying seem like a long row of integers. What else do you want from me, nerd.\"','blade runner',6),
	(33,'\"Oh, sorry, man. Wait a minute, wait a minute? What\'s hap... Brrr...Drrr...Sch...Zzzz...Zzzz...I\'mmm gggoing slightly maaad? \'I\'ve seen things you people wouldn\'t believe. Attack ships on fire off the shoulder of Orion. I watched C-beams glitter in the dark near the Tannh?user Gate. All those moments will be lost in time, like tears in rain. Time to die.\' Why......why......why....who knows....who knows....who knows? Why are you showing me that origami, why, why, why? You know what I am? Oh, please don\'t tell anybody what has just happened with me. I\'m really afraid what they\'ll do with me if they find out what I am. Is said that we, androids, don\'t have any rights to live longer than you, people. I think I know why you are here. You are here because that scientist. His body was brought there by Bob Norris, who works as janitor for Masons\' Research Facility. Here. You can have his spare work key he has given me for safe keep. Just please, don\'t tell anyone the truth about me.\"','tearsinrain',6),
	(34,'\"Get lost.\"','2',6),
	(35,'\"Hello, I\'m Carlton Olhouser. I know you are here to ask about Freeman. I have important work to do so let\'s get this over with.\"','1',5),
	(36,'\"I have no idea what could had happen to him. Lately he seemed to be more paranoid than, normally giving wierd looks around. I wouldn\'t be surprised if he had gone missing by his own iniatiative.\"','2',5),
	(37,'\"I think I heard him going on about some shady dealings of Maple Electronics. Can\'t really remember what it was about tho\'.\"','3',5),
	(38,'\"How do you do, sir? I\'m Julyan Pender. You must be here \r\nlooking into Freeman\'s disappearing? I haven\'t heard anything\r\nabout him for the past few days.\"','1',3),
	(39,'\"Freeman was working on datamining some files, but I have no idea about what. Our works didn\'t really cross that much.\"','2',3),
	(40,'\"There was some whispers about Freeman wanting \r\nto move over to work for Maple Electronics or  \r\nGensoukyo Zaibatsu. He also seemed to be trying \r\nto avoid Lawson for whichever reason. \" ','3',3),
	(41,'\"Good day, sir. I am Lexia Beverley. I assume you are the detective Lawson called to look for Freeman. I\'m happy to tell you what I know about him.\"','1',4),
	(42,'\"I have been working with Freeman in few projects, mostly to do with android production development. Masons had set their sight on taking over Maple Electronics in the android manucaturing, before the whole android outburst.\"\r\n','2',4),
	(43,'\"Freeman is such hard worker. He basicly lives in his office and is always the last one to leave in the evening. I hope nothing bad has happened to him.\"','3',4),
	(44,'\"If you find something related to Freeman\'s disappear, come show it to me.\"','4',1),
	(45,'\"Sorry, I don\'t understand, what you are trying to say?\"','else',1),
	(46,'\"A file? Let me take a look... Bob Norris is a spy, eh? Looks like I have failed big time. Anyway, this seems to solve the case more than enough. I\'ll have Norris taken into custody and start shorting out the details. Congratulation, you seem to have solved the case. Masons are grateful to you and as promised, you\'ll be incorporated into Masons will be started promptly.\"','evidence',1),
	(47,'\"Now it\'s fixed! Enjoy... oh no... I hate this \'Tears in Rain\' scene. Sorry, I\'ve got to go.\"','tearsinrain',11),
	(48,'\"All what you\'re saying seem  like a long row of integers. Please, stay away from me.\"','3',6),
	(49,'\"I assume an explanation is in order. First of all, my name is Ray and I\'m an android. For whichever reason a codeword \'TEARSINRAIN\' always makes us feel remarkably strange and in addition to that if we also see an owl origami while hearing that codeword, we start repeating the \'Tears in Rain\' monologue from that \'Blade Runner\' movie. We have no idea why it happens, but it makes us feel very unpleasant, so I hope you won\'t go around doing it for the others who are like me.\"','explain',11);

/*!40000 ALTER TABLE `dialog` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table direction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `direction`;

CREATE TABLE `direction` (
  `DirectionID` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  PRIMARY KEY (`DirectionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `direction` WRITE;
/*!40000 ALTER TABLE `direction` DISABLE KEYS */;

INSERT INTO `direction` (`DirectionID`, `Description`)
VALUES
	('d','down'),
	('e','east'),
	('enter car','enter car'),
	('enter cyberspace','enter cyberspace'),
	('eureka','Eureka'),
	('exit car','exit car'),
	('exit cyberspace','exit cyberspace'),
	('home','Home'),
	('masons','Masons'),
	('n','north'),
	('s','south'),
	('scrapyard','Scrapyard'),
	('u','up'),
	('w','west'),
	('warehouse','Warehouse');

/*!40000 ALTER TABLE `direction` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table location
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `LocationID` int(11) NOT NULL,
  `Description` varchar(40) NOT NULL,
  `Details` varchar(255) NOT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;

INSERT INTO `location` (`LocationID`, `Description`, `Details`)
VALUES
	(1,'Bedroom','Messy bedroom. Flickering neon lights shinefrom the street through a window.'),
	(2,'Office','A sturdy desk resides in the middle of the room. This is where I do most of my paperwork.'),
	(3,'2nd floor stairs','Empty stairway. Walls could use some new paint.'),
	(4,'3rd floor stairs','There\'s a notification board on the wall.'),
	(5,'1st floor stairs','Street level. Glass window of the door is cracked and cold air flows in from outside.'),
	(6,'Front of home','A walkway leads North and South. My car is parked here.'),
	(7,'Walkway North','There are some people sleeping on the ground here. Not a nice sight.'),
	(8,'Walkway South','There are damages caused by the recent riots.'),
	(9,'Alleyway','Dead end. Not much in here but trash cans, not that people bother using them. This place is littered with garbage.'),
	(10,'Roadblock','The security forces have blocked the road due to rioting.'),
	(11,'Car','My car is old but loyal. Where should I go now?'),
	(12,'Front of Masons','Big glass doors lead to the building. My car is parked here.'),
	(13,'Masons alleyway West','Everything is so clean compared to my home street.'),
	(14,'Masons alleyway East','This is where the staff goes for a smoke i guess. There\'s a door saying \'Personnel only\'.'),
	(15,'Loading area of Masons','This is where trucks load their goods in. Big elevating doors are closed.'),
	(16,'Mason\'s lobby','Place is nice and tidy. There\'s two couches and a table between them.'),
	(17,'Security','Lot\'s of monitors on the walls. They show feed from all around the complex.'),
	(18,'Cafeteria','Worker\'s cafeteria. Everything is expensive.'),
	(19,'Dining tables','Cafeteria\'s dining tables. Nobody\'s here at this time of the day. Someone has left some trash behind though.'),
	(20,'Elevators 1st floor','A plastic plant is placed next to the elevator.'),
	(21,'Elevators 3rd floor','Another plastic plant. Even Mason\'s can\'t afford real ones, it seems.'),
	(22,'Hallway','Offices on both sides of hallway. Hallway continues to East.'),
	(23,'Hallway','Offices on both sides.'),
	(24,'Freeman\'s office','A clean office with a desk and some diplomas on the wall. No sight of the professor.'),
	(25,'Pender\'s office','Office of Julyan Pender, Freeman\'s colleague.'),
	(26,'Beverley\'s office','This office belongs to Lexia Beverley. She does not seem to be very keen about cleaning.'),
	(27,'Olhouser\'s office','Same kind of office like the others. Computer and desk.'),
	(28,'Hallway','There\'s only a janitor\'s closet here.'),
	(29,'Janitor\'s closet','Janitor\'s equipment is neatly placed.'),
	(30,'Front of warehouse','Area seems shady. A small warehouse with sturdy looking door on it.'),
	(31,'West of the warehouse','Nothing much here. Place seems to be abandoned.'),
	(32,'East of the warehouse','There is just garbage.'),
	(33,'North of the warehouse','The north wall of warehouse has a broken window.'),
	(34,'Warehouse','It is quite dark and empty, but there is a large red stain on the floor.'),
	(35,'Front of Eureka','The Science center has seen better days.'),
	(36,'Eureka lobby','There is info desk here. A robot waves to me.'),
	(37,'Hall','Eureka\'s halls are large and open. The hall continues to north. There is a robotics room in West.'),
	(38,'Hall','This hall leads to bodyworld, movie theater and an origami workshop.'),
	(39,'Robotics room','The history of robotics exhibition. There are all kinds of robots displayed.'),
	(40,'Origami room','The art of origami exhibition. I didn\'t know you could craft these just from a piece of paper.'),
	(41,'Movie theater','The theater plays a movie called \'Blade Runner\'.'),
	(42,'Bodyworld','The main exhibition. Dead bodies are displayed. Gross, if you ask me. The exhibition room continues to west and east.'),
	(43,'Bodyworld East','There are plastinated bodies here.'),
	(44,'Bodyworld West','\'The cycle of life\'. Show is about blood vessels in differently aged bodies.'),
	(45,'Front of scrapyard','Piles of scrap everywhere. I can see a small building in the middle.'),
	(46,'Scrap metal piles 1','Now I am surrounded by trash. Great.'),
	(47,'Scrap metal piles 2','Yep. It\'s trash. I can probably make a small pathway to somewhere.'),
	(48,'Scrap metal piles 3','This is electrical waste. I can see old battery fluids leaking to ground.'),
	(49,'Scrap metal piles 4','The piles keep getting taller.'),
	(50,'Scrap metal piles 5','I can\'t go further here.'),
	(51,'Cyberspace','An endless grid opens before my eyes. I have to complete an invisible maze to find what I\'m looking for. Wrong direction would just lead me back here.'),
	(52,'Cyberspace','I guess I am on a right route'),
	(53,'Cyberspace','I guess I am on a right route'),
	(54,'Cyberspace','I guess I am on a right route'),
	(55,'Cyberspace','I guess I am on a right route'),
	(56,'Cyberspace','I guess I am on a right route'),
	(57,'Cyberspace','I guess I am on a right route'),
	(58,'Cyberspace','I guess I am on a right route'),
	(59,'Cyberspace','I guess I am on a right route'),
	(60,'Cyberspace','I guess I am on a right route'),
	(61,'Cyberspace','I found my way through'),
	(62,'Cyberspace','An endless grid opens before my eyes. I have to complete an invisible maze to find what I\'m looking for. Wrong direction would just lead me back here.'),
	(63,'Cyberspace','I guess I am on a right route'),
	(64,'Cyberspace','I guess I am on a right route'),
	(65,'Cyberspace','I guess I am on a right route'),
	(66,'Cyberspace','I guess I am on a right route'),
	(67,'Cyberspace','I guess I am on a right route'),
	(68,'Cyberspace','I guess I am on a right route'),
	(69,'Cyberspace','I guess I am on a right route'),
	(70,'Cyberspace','I found my way through'),
	(71,'Cyberspace','An endless grid opens before my eyes. I have to complete an invisible maze to find what I\'m looking for. Wrong direction would just lead me back here.'),
	(72,'Cyberspace','I guess I am on a right route'),
	(73,'Cyberspace','I guess I am on a right route'),
	(74,'Cyberspace','I guess I am on a right route'),
	(75,'Cyberspace','I guess I am on a right route'),
	(76,'Cyberspace','I guess I am on a right route'),
	(77,'Cyberspace','I guess I am on a right route'),
	(78,'Cyberspace','I guess I am on a right route'),
	(79,'Cyberspace','I guess I am on a right route'),
	(80,'Cyberspace','I guess I am on a right route'),
	(81,'Cyberspace','I guess I am on a right route'),
	(82,'Cyberspace','I guess I am on a right route'),
	(83,'Cyberspace','I guess I am on a right route'),
	(84,'Cyberspace','I guess I am on a right route'),
	(85,'Cyberspace','I guess I am on a right route'),
	(86,'Cyberspace','I found my way through'),
	(87,'Living room','A small living room with sofa, TV and a table next to the kitchen corner.'),
	(88,'Cyberscape','I guess I am on a right route'),
	(89,'Nowhere','I\'m not supposed to be here');

/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table npc
# ------------------------------------------------------------

DROP TABLE IF EXISTS `npc`;

CREATE TABLE `npc` (
  `NpcID` int(11) NOT NULL,
  `NpcName` varchar(40) DEFAULT NULL,
  `LocationID` int(11) DEFAULT NULL,
  PRIMARY KEY (`NpcID`),
  KEY `LocationID` (`LocationID`),
  CONSTRAINT `npc_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `npc` WRITE;
/*!40000 ALTER TABLE `npc` DISABLE KEYS */;

INSERT INTO `npc` (`NpcID`, `NpcName`, `LocationID`)
VALUES
	(1,'Joel Lawson',17),
	(2,'Bob Norris',23),
	(3,'Julyan Pender',25),
	(4,'Lexia Beverley',26),
	(5,'Carlton Olhouser',27),
	(6,'Cole Cooke',50),
	(7,'Robby',36),
	(8,'Kurt Donald',38),
	(9,'Leon',39),
	(10,'Rachael',40),
	(11,'Ray',NULL);

/*!40000 ALTER TABLE `npc` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table object
# ------------------------------------------------------------

DROP TABLE IF EXISTS `object`;

CREATE TABLE `object` (
  `ObjectID` int(11) NOT NULL,
  `ObjectTypeID` varchar(255) NOT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `PlayerID` int(11) DEFAULT NULL,
  `Available` tinyint(1) DEFAULT NULL,
  `Takeable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ObjectID`),
  KEY `ObjectTypeID` (`ObjectTypeID`),
  KEY `LocationID` (`LocationID`),
  KEY `PlayerID` (`PlayerID`),
  CONSTRAINT `object_ibfk_1` FOREIGN KEY (`ObjectTypeID`) REFERENCES `objecttype` (`ObjectTypeID`),
  CONSTRAINT `object_ibfk_2` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`),
  CONSTRAINT `object_ibfk_3` FOREIGN KEY (`PlayerID`) REFERENCES `player` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `object` WRITE;
/*!40000 ALTER TABLE `object` DISABLE KEYS */;

INSERT INTO `object` (`ObjectID`, `ObjectTypeID`, `LocationID`, `PlayerID`, `Available`, `Takeable`)
VALUES
	(1,'bed',1,NULL,1,0),
	(2,'drawer',1,NULL,1,0),
	(3,'mug',1,NULL,1,1),
	(4,'blackwallet',1,NULL,1,1),
	(5,'jacket',1,NULL,0,1),
	(6,'clock',1,NULL,1,1),
	(7,'sofa',87,NULL,1,0),
	(8,'table',87,NULL,1,0),
	(9,'news1',87,NULL,1,1),
	(10,'book',87,NULL,1,1),
	(11,'officedesk',2,NULL,1,0),
	(12,'phone',2,NULL,1,0),
	(13,'drawer',2,NULL,1,0),
	(14,'oldfiles',2,NULL,0,1),
	(15,'board',4,NULL,1,0),
	(16,'slppl',7,NULL,1,0),
	(17,'tcan',9,NULL,1,0),
	(18,'trash',9,NULL,1,0),
	(19,'news2',9,NULL,0,1),
	(20,'fence',10,NULL,1,0),
	(21,'plants',12,NULL,1,0),
	(22,'tcan',14,NULL,1,0),
	(23,'news3',14,NULL,0,1),
	(24,'stub',14,NULL,1,1),
	(25,'boxes',15,NULL,1,0),
	(26,'pack',15,NULL,1,1),
	(27,'couch',16,NULL,1,0),
	(28,'lobbytable',16,NULL,1,0),
	(29,'smonitor',17,NULL,1,0),
	(30,'counter',18,NULL,1,0),
	(31,'dtables',19,NULL,1,0),
	(32,'news2',19,NULL,1,1),
	(33,'shaker',19,NULL,1,1),
	(34,'plants',20,NULL,1,0),
	(35,'plants',21,NULL,1,0),
	(36,'officedesk',24,NULL,1,0),
	(37,'computer',24,NULL,1,0),
	(38,'pen',24,NULL,1,1),
	(39,'drawer',24,NULL,1,0),
	(40,'note',24,NULL,0,1),
	(41,'officedesk',25,NULL,1,0),
	(42,'computeroff',25,NULL,1,0),
	(43,'paper',25,NULL,1,1),
	(44,'globe',25,NULL,1,0),
	(45,'officedesk',26,NULL,1,0),
	(46,'computeroff',26,NULL,1,0),
	(47,'paper',26,NULL,1,1),
	(48,'stapler',26,NULL,1,1),
	(49,'emptycan',26,NULL,1,1),
	(50,'officedesk',27,NULL,1,0),
	(51,'computeroff',27,NULL,1,0),
	(52,'drawer',27,NULL,1,0),
	(53,'shelf',27,NULL,1,0),
	(54,'toycar',27,NULL,1,1),
	(55,'broom',29,NULL,1,0),
	(56,'towels',29,NULL,1,0),
	(57,'laptop',29,NULL,0,0),
	(58,'news4',31,NULL,1,1),
	(59,'shoe',32,NULL,1,1),
	(60,'trash',32,NULL,1,0),
	(61,'bwindow',33,NULL,1,0),
	(62,'bwindow',34,NULL,1,0),
	(63,'brownwallet',34,NULL,1,1),
	(64,'pack',34,NULL,1,1),
	(65,'hand',34,NULL,1,0),
	(66,'infodesk',36,NULL,1,0),
	(67,'extinguisher',37,NULL,1,0),
	(68,'chair',38,NULL,1,0),
	(69,'curjac',38,NULL,0,0),
	(70,'key1',38,NULL,0,1),
	(71,'gen1',39,NULL,1,0),
	(72,'gen2',39,NULL,1,0),
	(73,'gen3',39,NULL,1,0),
	(74,'gen4',39,NULL,1,0),
	(75,'gen5',39,NULL,1,0),
	(76,'gen6',39,NULL,1,0),
	(77,'bullmodel',40,NULL,1,0),
	(78,'bullorigami',NULL,NULL,1,1),
	(79,'dragonmodel',40,NULL,1,0),
	(80,'dragonorigami',NULL,NULL,1,1),
	(81,'elephantmodel',40,NULL,1,0),
	(82,'elephantorigami',NULL,NULL,1,1),
	(83,'mammothmodel',40,NULL,1,0),
	(84,'mammothorigami',NULL,NULL,1,1),
	(85,'owlmodel',40,NULL,1,0),
	(86,'owlorigami',NULL,NULL,1,1),
	(87,'swanmodel',40,NULL,1,0),
	(88,'swanorigami',NULL,NULL,1,1),
	(89,'unicornmodel',40,NULL,1,0),
	(90,'unicornorigami',NULL,NULL,1,1),
	(91,'popcorn',41,NULL,1,1),
	(92,'bottle',41,NULL,1,1),
	(93,'seat',41,NULL,1,0),
	(94,'button',41,NULL,1,0),
	(95,'E83',42,NULL,1,0),
	(96,'K49',42,NULL,1,0),
	(97,'led',42,NULL,1,1),
	(98,'dropper',42,NULL,1,1),
	(99,'J31',43,NULL,1,0),
	(100,'V35',43,NULL,1,0),
	(101,'gloves',43,NULL,1,1),
	(102,'mice',43,NULL,1,1),
	(103,'L73',44,NULL,1,0),
	(104,'A22',44,NULL,1,0),
	(105,'table',44,NULL,1,0),
	(106,'eurekapc',44,NULL,1,0),
	(107,'screwdriver',47,NULL,1,1),
	(108,'pliers',48,NULL,1,1),
	(109,'key2',50,NULL,0,1),
	(110,'hint1',51,NULL,1,0),
	(111,'files1',61,NULL,1,0),
	(112,'hint2',62,NULL,1,0),
	(113,'files2',70,NULL,1,0),
	(114,'hint3',71,NULL,1,0),
	(115,'files3',86,NULL,1,0),
	(116,'table',40,NULL,1,0),
	(117,'evidence',NULL,NULL,1,1);

/*!40000 ALTER TABLE `object` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table objecttype
# ------------------------------------------------------------

DROP TABLE IF EXISTS `objecttype`;

CREATE TABLE `objecttype` (
  `ObjectTypeID` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Refname` varchar(255) DEFAULT NULL,
  `Details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ObjectTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `objecttype` WRITE;
/*!40000 ALTER TABLE `objecttype` DISABLE KEYS */;

INSERT INTO `objecttype` (`ObjectTypeID`, `Description`, `Refname`, `Details`)
VALUES
	('A22','display A22','A22','A display showing the plastinated vlood vessels of a old person. It used to belong to a 78-years old female. I have to try cutting my salt consumption.'),
	('bed','a bed','bed','An undone bed.'),
	('blackwallet','a black wallet','black wallet','A dark leatherette wallet. There\'s some credits in it.'),
	('board','a notification board','notification board','A notification board with some messages on it. One of them is advertising for a almost unused oven mitten.'),
	('book','a book','book','A science fiction novel named Neuromancer.'),
	('bottle','an empty bottle','bottle','An empty glass bottle.'),
	('boxes','cardboard boxes','boxes','Some cardboard boxes left here. Seems too heavy to carry around.'),
	('broom','a broom','broom','A broom for some heavy sweeping.'),
	('brownwallet','a brown wallet','brown wallet','A brown leather wallet. Among some credits in the wallet, there\'s a ID-card of it\'s owner: Jeremiah Freeman, 63-years old male.'),
	('bullmodel','a bull model','bull model','A model of bull origami with an instruction on how to make your own.'),
	('bullorigami','a bull origami','bull origami','A bull origami made from a clean sheet of paper.'),
	('button','a button','button','A button to call Eureka\'s employee in case of some problem.'),
	('bwindow','a broken window','window','A broken window with a large enough hole to fit through. '),
	('chair','a chair','chair','A chair with four legs and one back.'),
	('clock','a clock','clock','A digital alarm clock made of plastic.'),
	('computer','a computer','computer','A personal computer which can be used to enter the cyberscape.'),
	('computeroff','a computer','computer','A computer that has been turned off. I don\'t think the owner would appreciate me using it.'),
	('couch','couches','couch','Elegant looking couches.'),
	('counter','cafeteria counter','counter','The counter of the cafeteria. There\'s some synthetic snack for sale.'),
	('curjac','a coat','coat','A coat belonging to Eureka\'s curator. There\'s a deep pocket on it.'),
	('dragonmodel','a dragon model','dragon model','A model of dragon origami with an instruction on how to make your own.'),
	('dragonorigami','a dragon origami','dragon origami','A dragon origami made from a clean sheet of paper.'),
	('drawer','a drawer','drawer','A drawer which might contain something in it.'),
	('dropper','a dropper','dropper','An empty dropper. No idea what this has been used on.'),
	('dtables','dining tables','tables','Long dining tables made of fibreglass.'),
	('E83','display E83','E83','A display showing the plastinated musculature of a young athlete. It used to belong to a 28-years old male. Muscles like that could be useful.'),
	('elephantmodel','an elephant model','elephant model','A model of elephant origami with an instruction on how to make your own.'),
	('elephantorigami','an elephant origami','elephant origami','An elephant origami made from a clean sheet of paper.'),
	('emptycan','an empty can','can','An empty can of some kind of drink.'),
	('eurekapc','computer','computer','This must be connected into Eureka\'s database. It seems to have cyberscape entrance capacity.'),
	('evidence','evidence','evidence','Copy of the files on Norri\'s laptop. These should be enough to work as evidence agaisnt Norris.'),
	('extinguisher','a fire extinguisher','extinguisher','Just in case there\'s ever a fire.'),
	('fence','aluminium fences','fence','Alumium fences set up to block the access into the area.'),
	('files1','Freeman files','files','Few files stand out. Seems like Freeman has been digging about Maple Electronics? dealing of deceased bodies to science center Eureka. Freeman have also received an invitation for a secret meeting by an old warehouse in the western side of the city.'),
	('files2','Eureka files','files','The files contain information about deceased bodies. All of them have been delivered from hospitals around the city. Expect the J31. It was delivered from a scrapyard in the western part of the city.'),
	('files3','Norris files','files','The files reveal a secret: Norris is a spy for Maple Electronics\'. The situation reports reveal his suspicions of being almost found out by Freeman and his plan to take him out at the warehouse and sending the body to Eureka from the scrapyard.'),
	('gen1','a Gen1 display','gen1','The display tells about the first generation of robots. They seem to have been really simple machine with narrow set of functions programmed into them.'),
	('gen2','a Gen2 display','gen2','The display tells about the second generation of robots. They were still just machines but with significantly improved processing power.'),
	('gen3','a Gen3 display','gen3','The display tells about the third generation of robots. This is the point when the robots were started to shape like humanoids. They started to have satisfactory level of artificial intelligence for basic social interactions.'),
	('gen4','a Gen4 display','gen4','The display tells about the fourth generation of robots. There was leaps in the AI development but still nowhere near the models of these days.'),
	('gen5','a Gen5 display','gen5','The display tells about the fifth generation of robots. This is when robots were starting to become androids. Their appearance resembled a mannequin and from inside they were fully mechanical. Their AI reached the level of simple-minded person.'),
	('gen6','a Gen6 display','gen6','The display about the sixth generation of robots. The current pinnacle of androids. Same appearance as any human and their bodies made of synthetic flesh and organs. Only their brains are made with implants and their AI is the same level as a true human.'),
	('globe','a globe','globe','A globe showing the world map.'),
	('gloves','gloves','gloves','A pair of gloves. Not really my size.'),
	('hand','a severed hand','hand','What a gruesome view. A severed hand, cut from elbow. What happened here?'),
	('hint1','a string of code','code','A string of code standing out from the surroundings: \'4wn2e3s\''),
	('hint2','a string of code','code','A string of code standing out from the surroundings: \'artWfmNgaEbSrENrgaWjkpS\''),
	('hint3','a string of code','code','A string of code standing out from the surroundings: \'Have you seen a swan in Sweden?\''),
	('infodesk','an info desk','desk','A desk which has a counter on it. This is where people buy tickets to get inside.'),
	('J31','display J31','J31','A display showing the plastinated nervous system of a old person. It used to belong to a 63-years old male. It seems to be missing some of it\'s right arm.'),
	('jacket','a jacket','jacket','A dark leather trench coat.'),
	('K49','display K49','K49','A display showing the plastinated musculatere of an average person. It used to belong to a 29-years old male.'),
	('key1','Eureka key','eureka key','A key with huge \'E\' on the handle.'),
	('key2','Masons key','masons key','A key which is suppsoed to work in Masons\' Research Facility.'),
	('L73','display L73','L73','A display showing the plastinated vlood vessels of a child. It used to belong to a 8-years old male. It saddens me to see someone had died so young.'),
	('laptop','a laptop','laptop','A laptop with capability for cyberspace entrance.'),
	('led','a LED torch','torch','A LED torch which seems to have ran out of power.'),
	('lobbytable','a short table','table','An elegant looking short table between the couches.'),
	('mammothmodel','a mammoth model','mammoth model','A model of mammoth origami with an instruction on how to make your own.'),
	('mammothorigami','a mammoth origami','mammoth origami','A mammoth origami made from a clean sheet of paper.'),
	('mice','a plastinated mice','mice','Why would someone just leave something like this lying around?'),
	('mug','a mug','mug','A ceramic mug tinted by coffee.'),
	('news1','a newspaper','newspaper','Yesterday\'s newspaper. The main articles talk about the increasing revolt against the androids, a new exhibition being constructed in Eureka, a hazardous chemical fog approaching the city from the south.'),
	('news2','last week\'s newspaper','newspaper','Last week\'s newspaper. The main article talks about discord between Masons and Maple Electronics.'),
	('news3','few weeks old newspaper','newspaper','Few weeks old newspaper. There\'s a article about Maple Electronics considering discontinueing their android production.'),
	('news4','month old newspaper','newspaper','Month old newspaper. There\'s a huge headline about an android killing a human.'),
	('note','a note','note','A note with \'Banan4\' written on it.'),
	('officedesk','a office desk','desk','A office desk, excellent platform for paperwork.'),
	('oldfiles','old files','old files','Just some old files from my previous cases.'),
	('owlmodel','a owl model','owl model','A model of owl origami with an instruction on how to make your own.'),
	('owlorigami','a owl origami','owl origami','An owl origami made from a clean sheet of paper.'),
	('pack','a cigarette pack','cigarette pack','Pack of Nico-Pop brand cigarettes.'),
	('paper','sheet of paper','paper','A clean sheet of paper.'),
	('pen','a pen','pen','A ballpoint pen with a lot of ink still in it.'),
	('phone','a phone with an answering machine','phone','The answering machine has received a message: \'Hello. This is Chief security officer of Masons\' Research Facility. We are in dire need of your services at Masons\' Reseach Facility. We request you to come to the facility as soon as possible.'),
	('plants','plastic plants','plants','Some plastic plants to bring the place more alive.'),
	('pliers',' a pair of pliers','pliers','A pair of pliers for when you need some exra grip.'),
	('popcorn','a popcorn bag','popcorn','An empty bag of popcorn.'),
	('screwdriver','a scredriver','screwdriver','A screwdriver for tightening loose screws.'),
	('seat','seats','seat','Empty seats to sit in to enjoy a movie.'),
	('shaker','a salt shaker','shaker','A salt shaker to add flavor.'),
	('shelf','a shelf','shelf','A shelf on the wall used as surface to hold items.'),
	('shoe','an old shoe','shoe','A well-worn shoe missing it\'s pair.'),
	('slppl','sleeping people','people','Underprivileged people that the megacorporations haven\'t determined to be worthy resource for them. '),
	('smonitor','security monitor\'s','monitors','Monitor\'s showing the live feed around the facility. Not much seems to be happening around.'),
	('sofa','a sofa','sofa','My old faithful sofa which has offered more night\'s sleep than any bed.'),
	('stapler','a stapler','stapler','An empty stapler.'),
	('stub','a cigarette stub','stub','All that\'s left from a cigarette.'),
	('swanmodel','a swan model','swan model','A model of swan origami with an instruction on how to make your own.'),
	('swanorigami','a swan origami','swan origami','A swan origami made from a clean sheet of paper.'),
	('table','a table','table','A table used as surface for working and holding objects.'),
	('tcan','a trash can','trash can','A trash can full of worthless junk. '),
	('towels','some towels','towels','Pile of clean towels.'),
	('toycar','a toy car','toy car','You are never too old to play with one of these. '),
	('trash','some trash','trash','Disgusting.'),
	('unicornmodel','a unicorn model','unicorn model','A model of unicorn origami with an instruction on how to make your own.'),
	('unicornorigami','a unicorn origami','unicorn origami','A unicorn origami made from a clean sheet of paper.'),
	('V35','display V35','V35','A display showing the plastinated nervous system of a young person. It used to belong to a 20-years old female.');

/*!40000 ALTER TABLE `objecttype` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table passage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `passage`;

CREATE TABLE `passage` (
  `PassageID` int(11) NOT NULL,
  `Source` int(11) NOT NULL,
  `Destination` int(11) NOT NULL,
  `Locked` tinyint(1) NOT NULL,
  `Locknote` varchar(255) DEFAULT NULL,
  `DirectionID` varchar(255) NOT NULL,
  PRIMARY KEY (`PassageID`),
  KEY `Source` (`Source`),
  KEY `DirectionID` (`DirectionID`),
  KEY `Destination` (`Destination`),
  CONSTRAINT `passage_ibfk_1` FOREIGN KEY (`Source`) REFERENCES `location` (`LocationID`),
  CONSTRAINT `passage_ibfk_2` FOREIGN KEY (`DirectionID`) REFERENCES `direction` (`DirectionID`),
  CONSTRAINT `passage_ibfk_3` FOREIGN KEY (`Destination`) REFERENCES `location` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `passage` WRITE;
/*!40000 ALTER TABLE `passage` DISABLE KEYS */;

INSERT INTO `passage` (`PassageID`, `Source`, `Destination`, `Locked`, `Locknote`, `DirectionID`)
VALUES
	(1,1,87,0,NULL,'s'),
	(2,87,1,0,NULL,'n'),
	(3,87,2,0,NULL,'e'),
	(4,2,87,0,NULL,'w'),
	(5,2,3,1,'if I unlock the door','e'),
	(6,3,2,1,'if I unlock the door','w'),
	(7,3,4,0,NULL,'u'),
	(8,3,5,0,NULL,'d'),
	(9,4,3,0,NULL,'d'),
	(10,5,3,0,NULL,'u'),
	(11,5,6,1,'if I  unlock the door','e'),
	(12,6,5,1,'if I unlock the door','w'),
	(13,6,11,0,NULL,'enter car'),
	(14,6,7,0,NULL,'n'),
	(15,6,8,0,NULL,'s'),
	(16,7,6,0,NULL,'s'),
	(17,7,9,0,NULL,'n'),
	(18,8,6,0,NULL,'n'),
	(19,8,10,0,NULL,'s'),
	(20,9,7,0,NULL,'s'),
	(21,10,8,0,NULL,'n'),
	(22,89,12,0,NULL,'masons'),
	(23,89,30,0,NULL,'warehouse'),
	(24,89,35,0,NULL,'eureka'),
	(25,89,45,0,NULL,'scrapyard'),
	(26,12,13,0,NULL,'w'),
	(27,12,14,0,NULL,'e'),
	(28,12,11,0,NULL,'enter car'),
	(29,13,12,0,NULL,'s'),
	(30,13,15,0,NULL,'n'),
	(31,14,12,0,NULL,'s'),
	(32,14,15,0,NULL,'n'),
	(33,15,13,0,NULL,'w'),
	(34,15,14,0,NULL,'e'),
	(35,16,12,0,NULL,'s'),
	(36,16,17,0,NULL,'n'),
	(37,16,19,0,NULL,'e'),
	(38,17,16,0,NULL,'s'),
	(39,17,18,0,NULL,'e'),
	(40,17,20,0,NULL,'n'),
	(41,18,17,0,NULL,'w'),
	(42,18,19,0,NULL,'s'),
	(43,19,18,0,NULL,'n'),
	(44,19,16,0,NULL,'w'),
	(45,20,17,0,NULL,'s'),
	(46,20,21,0,NULL,'u'),
	(47,21,20,0,NULL,'d'),
	(48,21,22,0,NULL,'e'),
	(49,21,28,0,NULL,'s'),
	(50,22,21,0,NULL,'w'),
	(51,22,23,0,NULL,'e'),
	(52,22,26,0,NULL,'n'),
	(53,22,27,0,NULL,'s'),
	(54,23,22,0,NULL,'w'),
	(55,23,24,0,NULL,'n'),
	(56,23,25,0,NULL,'s'),
	(57,24,23,0,NULL,'s'),
	(58,25,23,0,NULL,'n'),
	(59,26,22,0,NULL,'s'),
	(60,27,22,0,NULL,'n'),
	(61,28,21,0,NULL,'n'),
	(62,28,29,1,'if I had the key to unlock the door','s'),
	(63,29,28,0,NULL,'n'),
	(64,30,31,0,NULL,'w'),
	(65,30,32,0,NULL,'e'),
	(66,30,11,0,NULL,'enter car'),
	(67,30,34,1,'but the door in that direction seems to be locked from inside','n'),
	(68,31,30,0,NULL,'s'),
	(69,31,33,0,NULL,'n'),
	(70,32,30,0,NULL,'s'),
	(71,32,33,0,NULL,'n'),
	(72,33,32,0,NULL,'e'),
	(73,33,31,0,NULL,'w'),
	(74,33,34,0,NULL,'s'),
	(75,34,30,1,'if I unlock the door','s'),
	(76,34,33,0,NULL,'n'),
	(77,35,36,0,NULL,'n'),
	(78,36,35,0,NULL,'s'),
	(79,36,37,1,'if I buy a ticket','n'),
	(80,37,36,0,NULL,'s'),
	(81,37,38,0,NULL,'n'),
	(82,38,37,0,NULL,'s'),
	(83,38,40,0,NULL,'w'),
	(84,38,41,0,NULL,'e'),
	(85,38,42,1,'if I had the key to unlock the door','n'),
	(86,39,37,0,NULL,'e'),
	(87,40,38,0,NULL,'e'),
	(88,41,38,0,NULL,'w'),
	(89,42,38,0,NULL,'s'),
	(90,42,43,0,NULL,'e'),
	(91,42,44,0,NULL,'w'),
	(92,43,42,0,NULL,'w'),
	(93,44,42,0,NULL,'e'),
	(94,45,11,0,NULL,'enter car'),
	(95,45,46,0,NULL,'e'),
	(96,46,45,0,NULL,'w'),
	(97,46,47,0,NULL,'s'),
	(98,47,46,0,NULL,'n'),
	(99,47,48,0,NULL,'e'),
	(100,48,47,0,NULL,'w'),
	(101,48,49,0,NULL,'s'),
	(102,49,50,0,NULL,'s'),
	(103,50,49,0,NULL,'n'),
	(104,51,52,0,NULL,'w'),
	(105,53,54,0,NULL,'w'),
	(106,54,55,0,NULL,'w'),
	(107,55,56,0,NULL,'n'),
	(108,56,57,0,NULL,'e'),
	(109,57,58,0,NULL,'e'),
	(110,58,59,0,NULL,'s'),
	(111,59,60,0,NULL,'s'),
	(112,60,61,0,NULL,'s'),
	(113,62,63,0,NULL,'w'),
	(114,63,64,0,NULL,'n'),
	(115,64,65,0,NULL,'e'),
	(116,65,66,0,NULL,'s'),
	(117,66,67,0,NULL,'e'),
	(118,67,68,0,NULL,'n'),
	(119,68,69,0,NULL,'w'),
	(120,69,70,0,NULL,'s'),
	(121,71,72,0,NULL,'e'),
	(122,72,73,0,NULL,'u'),
	(123,73,74,0,NULL,'s'),
	(124,74,75,0,NULL,'e'),
	(125,75,76,0,NULL,'e'),
	(126,76,77,0,NULL,'n'),
	(127,77,78,0,NULL,'s'),
	(128,78,79,0,NULL,'w'),
	(129,79,80,0,NULL,'n'),
	(130,80,81,0,NULL,'n'),
	(131,81,82,0,NULL,'s'),
	(132,82,83,0,NULL,'w'),
	(133,83,84,0,NULL,'e'),
	(134,88,85,0,NULL,'e'),
	(135,85,86,0,NULL,'n'),
	(136,24,51,1,'if I unlock the computer with a correct password','enter cyberspace'),
	(137,61,24,0,NULL,'exit cyberspace'),
	(138,44,62,0,NULL,'enter cyberspace'),
	(139,70,44,0,NULL,'exit cyberspace'),
	(140,89,71,0,NULL,'enter cyberspace'),
	(141,86,29,0,NULL,'exit cyberspace'),
	(142,37,39,0,NULL,'w'),
	(143,49,48,0,NULL,'n'),
	(144,52,53,0,NULL,'w'),
	(145,12,16,0,NULL,'n'),
	(146,11,6,0,NULL,'home'),
	(147,84,88,0,NULL,'d'),
	(148,52,51,0,NULL,'e'),
	(149,52,51,0,NULL,'n'),
	(150,52,51,0,NULL,'s'),
	(151,52,51,0,NULL,'u'),
	(152,52,51,0,NULL,'d'),
	(153,53,51,0,NULL,'e'),
	(154,53,51,0,NULL,'n'),
	(155,53,51,0,NULL,'s'),
	(156,53,51,0,NULL,'u'),
	(157,53,51,0,NULL,'d'),
	(158,54,51,0,NULL,'e'),
	(159,54,51,0,NULL,'n'),
	(160,54,51,0,NULL,'s'),
	(161,54,51,0,NULL,'u'),
	(162,54,51,0,NULL,'d'),
	(163,55,51,0,NULL,'s'),
	(164,55,51,0,NULL,'w'),
	(165,55,51,0,NULL,'e'),
	(166,55,51,0,NULL,'u'),
	(167,55,51,0,NULL,'d'),
	(172,56,51,0,NULL,'d'),
	(173,56,51,0,NULL,'n'),
	(174,56,51,0,NULL,'s'),
	(175,56,51,0,NULL,'w'),
	(176,56,51,0,NULL,'u'),
	(177,56,51,0,NULL,'d'),
	(178,57,51,0,NULL,'n'),
	(179,57,51,0,NULL,'s'),
	(180,57,51,0,NULL,'w'),
	(181,57,51,0,NULL,'u'),
	(182,57,51,0,NULL,'d'),
	(183,58,51,0,NULL,'n'),
	(184,58,51,0,NULL,'w'),
	(185,58,51,0,NULL,'e'),
	(186,58,51,0,NULL,'u'),
	(187,58,51,0,NULL,'d'),
	(188,59,51,0,NULL,'n'),
	(189,59,51,0,NULL,'w'),
	(190,59,51,0,NULL,'e'),
	(191,59,51,0,NULL,'u'),
	(192,59,51,0,NULL,'d'),
	(193,60,51,0,NULL,'n'),
	(194,60,51,0,NULL,'w'),
	(195,60,51,0,NULL,'e'),
	(196,60,51,0,NULL,'u'),
	(197,60,51,0,NULL,'d'),
	(198,63,62,0,NULL,'s'),
	(199,63,62,0,NULL,'w'),
	(200,63,62,0,NULL,'e'),
	(201,63,62,0,NULL,'u'),
	(202,63,62,0,NULL,'d'),
	(203,64,62,0,NULL,'n'),
	(204,64,62,0,NULL,'s'),
	(205,64,62,0,NULL,'w'),
	(206,64,62,0,NULL,'u'),
	(207,64,62,0,NULL,'d'),
	(208,65,62,0,NULL,'n'),
	(209,65,62,0,NULL,'w'),
	(210,65,62,0,NULL,'e'),
	(211,65,62,0,NULL,'u'),
	(212,65,62,0,NULL,'d'),
	(213,66,62,0,NULL,'n'),
	(214,66,62,0,NULL,'s'),
	(215,66,62,0,NULL,'w'),
	(216,66,62,0,NULL,'u'),
	(217,66,62,0,NULL,'d'),
	(218,67,62,0,NULL,'s'),
	(219,67,62,0,NULL,'w'),
	(220,67,62,0,NULL,'e'),
	(221,67,62,0,NULL,'u'),
	(222,67,62,0,NULL,'d'),
	(223,68,62,0,NULL,'n'),
	(224,68,62,0,NULL,'s'),
	(225,68,62,0,NULL,'e'),
	(226,68,62,0,NULL,'u'),
	(227,68,62,0,NULL,'d'),
	(228,69,62,0,NULL,'n'),
	(229,69,62,0,NULL,'w'),
	(230,69,62,0,NULL,'e'),
	(231,69,62,0,NULL,'u'),
	(232,69,62,0,NULL,'d'),
	(233,72,71,0,NULL,'n'),
	(234,72,71,0,NULL,'s'),
	(235,72,71,0,NULL,'w'),
	(236,72,71,0,NULL,'e'),
	(237,73,71,0,NULL,'n'),
	(238,73,71,0,NULL,'w'),
	(239,73,71,0,NULL,'e'),
	(240,73,71,0,NULL,'u'),
	(241,73,71,0,NULL,'d'),
	(242,74,71,0,NULL,'n'),
	(243,74,71,0,NULL,'s'),
	(244,74,71,0,NULL,'w'),
	(245,74,71,0,NULL,'u'),
	(246,74,71,0,NULL,'d'),
	(247,75,71,0,NULL,'n'),
	(248,75,71,0,NULL,'s'),
	(249,75,71,0,NULL,'w'),
	(250,75,71,0,NULL,'u'),
	(251,75,71,0,NULL,'d'),
	(252,76,71,0,NULL,'s'),
	(253,76,71,0,NULL,'w'),
	(254,76,71,0,NULL,'e'),
	(255,76,71,0,NULL,'u'),
	(256,76,71,0,NULL,'d'),
	(257,77,71,0,NULL,'n'),
	(258,77,71,0,NULL,'w'),
	(259,77,71,0,NULL,'e'),
	(260,77,71,0,NULL,'u'),
	(261,77,71,0,NULL,'d'),
	(262,78,71,0,NULL,'n'),
	(263,78,71,0,NULL,'s'),
	(264,78,71,0,NULL,'e'),
	(265,78,71,0,NULL,'u'),
	(266,78,71,0,NULL,'d'),
	(267,79,71,0,NULL,'s'),
	(268,79,71,0,NULL,'w'),
	(269,79,71,0,NULL,'e'),
	(270,79,71,0,NULL,'u'),
	(271,79,71,0,NULL,'d'),
	(272,80,71,0,NULL,'s'),
	(273,80,71,0,NULL,'w'),
	(274,80,71,0,NULL,'e'),
	(275,80,71,0,NULL,'u'),
	(276,80,71,0,NULL,'d'),
	(277,81,71,0,NULL,'n'),
	(278,81,71,0,NULL,'w'),
	(279,81,71,0,NULL,'e'),
	(280,81,71,0,NULL,'u'),
	(281,81,71,0,NULL,'d'),
	(282,82,71,0,NULL,'n'),
	(283,82,71,0,NULL,'s'),
	(284,82,71,0,NULL,'e'),
	(285,82,71,0,NULL,'u'),
	(286,82,71,0,NULL,'d'),
	(287,83,71,0,NULL,'n'),
	(288,83,71,0,NULL,'s'),
	(289,83,71,0,NULL,'w'),
	(290,83,71,0,NULL,'u'),
	(291,83,71,0,NULL,'d'),
	(292,72,71,0,NULL,'d'),
	(293,84,71,0,NULL,'n'),
	(294,84,71,0,NULL,'s'),
	(295,84,71,0,NULL,'w'),
	(296,84,71,0,NULL,'e'),
	(297,84,71,0,NULL,'u'),
	(298,88,71,0,NULL,'n'),
	(299,88,71,0,NULL,'s'),
	(300,88,71,0,NULL,'w'),
	(301,88,71,0,NULL,'u'),
	(302,88,71,0,NULL,'d'),
	(303,85,71,0,NULL,'s'),
	(304,85,71,0,NULL,'w'),
	(305,85,71,0,NULL,'e'),
	(306,85,71,0,NULL,'u'),
	(307,85,71,0,NULL,'d'),
	(308,51,24,0,NULL,'exit cyberspace'),
	(309,62,44,0,NULL,'exit cyberspace'),
	(310,71,29,0,NULL,'exit cyberspace'),
	(311,35,11,0,NULL,'enter car');

/*!40000 ALTER TABLE `passage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table player
# ------------------------------------------------------------

DROP TABLE IF EXISTS `player`;

CREATE TABLE `player` (
  `PlayerID` int(11) NOT NULL,
  `LocationID` int(11) NOT NULL,
  PRIMARY KEY (`PlayerID`),
  KEY `LocationID` (`LocationID`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;

INSERT INTO `player` (`PlayerID`, `LocationID`)
VALUES
	(1,1);

/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
