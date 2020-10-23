/*
Navicat MySQL Data Transfer

Source Server         : Connection
Source Server Version : 50171
Source Host           : localhost:3306
Source Database       : game_store

Target Server Type    : MYSQL
Target Server Version : 50171
File Encoding         : 65001

Date: 2013-12-31 00:24:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blogs
-- ----------------------------
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) NOT NULL,
  `author` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `content` text NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `introduction` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blogs
-- ----------------------------
INSERT INTO `blogs` VALUES ('1', 'Mid-winter classic', 'Admin', '2013-08-23', '“Even winter bleak has charms to me,” wrote Robert Burns. Seems like most filmmakers scribbled that memorable line of verse on a post-it note a long time ago. Snow-covered vistas are an irresistible visual, capably employed by directors from the Coen Brothers to Sam Raimi to Christopher Nolan to John Carpenter. Any movie set in a frosty environment has an automatic in with me, and one of my favorites is the little-seen 1987 thriller Dead Of Winter.<br> <center><a href=\"http://i.imgur.com/NOnHvSv.jpg\"><img width=\"200\" height=\"300\" src=\"http://i.imgur.com/NOnHvSv.jpg\"/></a></center><br>Mary Steenburgen plays an actress who is lured to a remote, snow-bound mansion, only to discover that she’s become ensnared in a lethal game of blackmail.  Shrill and largely helpless at first, she slowly turns the tables on her captors, outwitting them using her skills as a performer.  This throwback thriller (loosely based on the 1945 film My Name Is Julia Ross) plays like a feature-length version of Where’s Waldo for cinephiles: spot all the Hitchcock references! Some are obvious (shrieking violins as a knife plunges), but some are quite subtle (a tall glass of milk on a platter, as per Suspicion). Roddy McDowall steals the show as the droll, effete, eccentric manservant.  Meanwhile, the underrated Jan Rubes (so paternally benevolent in Witness) is deliciously evil in a hammy villain role, the sinuous tones of every syllable he speaks suggesting guile and charm in equal measures.<br>The movie nicely conveys the chill of winter, with whistling windstorms, snowglobe-style visuals and a sparse piano-based score.  But the entertaining tone makes the film a good deal less depressing than some of the other movies that utilize similar environments (downers like Fargo, A Simple Plan, et cetera, which used barren settings to mirror the bleak desperation of their characters).  Thematically, it plays much in the same key as Rob Reiner’s Misery – a violent but highly diverting cold-weather chiller.<br>So, when the mercury dips and you decide to stay in for the night, check out Dead Of Winter. A cup of hot chocolate in hand will help, too (just don’t let Roddy McDowall prepare it – trust me on this one).', 'blog-image1.jpg', '“Even winter bleak has charms to me,” wrote Robert Burns. Seems like most filmmakers scribbled that memorable line of verse on a post-it note a long time ago. Snow-covered vistas are an irresistible visual, capably employed by directors from the Coen Brothers to Sam Raimi to Christopher Nolan to John Carpenter. Any movie set in a frosty environment has an automatic in with me, and one of my favorites is the little-seen 1987 thriller Dead Of Winter.');
INSERT INTO `blogs` VALUES ('2', 'May The Odds Be Ever In Your Favor', 'Admin', '2013-08-23', 'March is kind of a bummer, isn’t it?  I mean, its great in a lot of ways, don’t get me wrong.  Saint Patrick’s Day is nice (if you’re Irish and/or like drinking).  Sometimes Easter is in March (and if not, April is by then fast approaching).  The weather isn’t yet the wretched heat of summer and no longer the brutal chill of winter.  But still, its not yet summer vacation (for you students) nor is it time for that much-needed string of holidays (Memorial Day, 4th of July, Labor Day) for those lucky enough to work in an office.  Sometimes the box office can be a bit dull too, given the lull between the end of Oscar season and the start of the big summer blockbusters.  For this reason and more, I present you with…<br> <center><a href=\"http://i.imgur.com/3Zy8u4e.jpg\"><img width=\"200\" height=\"300\" src=\"http://i.imgur.com/3Zy8u4e.jpg\"/></a></center><br>Five reasons why I seriously cannot wait for The Hunger Games (March 23)<br>1. The book is incredible.<br>If you haven’t read the book yet, I am not going to talk myself blue in the face trying to convince you why you should.  I’ve done that to enough of my friends and really, they are the ones missing out, so I’ll just save myself the effort from now on.  It’s sort of like trying to get someone to start watching Doctor Who.  You can drive yourself crazy talking it up for months, knowing how much the other person would love it if they just took a break from watching garbage like Grey’s Anatomy to watch an episode or two, eventually just trying not to write them off completely for ignoring your well-intentioned harassment.  Life is too short though, and you’re better off just letting people do their own (stupid) thing.<br>2. The trailer.<br>Guess what?  The trailer looks awesome.  If you don’t agree with me, you probably didn’t read the book yet.  See above.<br>3. The soundtrack.<br>Although only a few artists/songs have been announced, this is already looking like a promising collection so far, boasting tracks from Arcade Fire, The Decemberists, and Taylor Swift (don’t hate).<br>4. Jennifer Lawrence.<br>So far, I have only seen her in X-Men: First Class, but her performance in that was pretty excellent.  She certainly has the outside look of Katniss down, judging by the movie art and the trailers.  Here’s hoping she gets at what’s beneath the surface as well.<br>5. WOODY HARRELSON <3 HAYMITCH.<br>The whole movie could be a complete wreck (which I doubt) but it would still be worth seeing for this alone.  When I was reading the book, I had no knowledge of the casting choices, so I didn’t picture the characters as any actors in particular.  Once I finished the book and began to look up everything I could about the upcoming film, learning that Woody Harrelson would be playing Haymitch Abernathy was like being hit with a ton of bricks (in a good way).  Not only is he one of my favorite actors, but he is flat out perfect for the role.', 'blog-image2.jpg', 'March is kind of a bummer, isn’t it?  I mean, its great in a lot of ways, don’t get me wrong.  Saint Patrick’s Day is nice (if you’re Irish and/or like drinking).  Sometimes Easter is in March (and if not, April is by then fast approaching).  The weather isn’t yet the wretched heat of summer and no longer the brutal chill of winter.  But still, its not yet summer vacation (for you students) nor is it time for that much-needed string of holidays (Memorial Day, 4th of July, Labor Day) for those lucky enough to work in an office.  Sometimes the box office can be a bit dull too, given the lull between the end of Oscar season and the start of the big summer blockbusters.');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `CAT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CAT_Name` varchar(100) NOT NULL,
  `CAT_Description` text,
  `CAT_Image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CAT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', 'TBSSSSS', 'A turn-based strategy (TBS) game is a strategy game (usually some type of wargame, especially a strategic-level wargame) where players take turns when playing. This is distinguished from real time strategy where all players play simultaneously.', null);
INSERT INTO `categories` VALUES ('2', 'RGP', 'A role-playing game (RPG and sometimes roleplaying game ) is a game in which players assume the roles of characters in a fictional setting. ', 'rgp.jpg');
INSERT INTO `categories` VALUES ('3', 'AC', 'The action game is a video game genre that emphasizes physical challenges, including hand–eye coordination and reaction-time.', 'ac.jpg');
INSERT INTO `categories` VALUES ('4', 'PSS', 'This is a list of games for the Sony PlayStation Portable handheld game console, both released and in development.', null);

-- ----------------------------
-- Table structure for games
-- ----------------------------
DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CAT_ID` int(11) NOT NULL,
  `SUP_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` double DEFAULT NULL,
  `Quantity` int(100) DEFAULT NULL,
  `IssueDate` date DEFAULT NULL,
  `Description` text,
  `Image` text,
  `Cover` varchar(200) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CoverThump` varchar(200) DEFAULT NULL,
  `Trailer` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `CAT_ID` (`CAT_ID`),
  KEY `SUP_ID` (`SUP_ID`),
  CONSTRAINT `games_ibfk_3` FOREIGN KEY (`CAT_ID`) REFERENCES `categories` (`CAT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `games_ibfk_4` FOREIGN KEY (`SUP_ID`) REFERENCES `suppliers` (`SUP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of games
-- ----------------------------
INSERT INTO `games` VALUES ('1', '1', '2', 'Resident Evil', '50', '10', '2006-10-06', 'The eponymous first game in the series was released in 1996 as a survival horror video game, but the franchise has since grown to encompass other video game genres.', 'Resident Evil.jpg', null, '4', null, '//www.youtube.com/embed/j-hXQ1oEn84?rel=0');
INSERT INTO `games` VALUES ('2', '2', '1', 'Final Fantasy X', '40', '10', '2003-06-10', 'Final Fantasy X  is a role-playing video game developed and published by Square (now Square Enix) as the tenth entry in the Final Fantasy series. Originally released in 2001 for Sony\'s PlayStation 2.', 'ffx_2.jpg', null, '1', null, '//www.youtube.com/embed/7i23ZDoxClk?rel=0');
INSERT INTO `games` VALUES ('3', '4', '3', 'Grand Theft Auto: San Andreas', '30', '5', '2005-12-15', 'Grand Theft Auto: San Andreas is a 2004 open world action-adventure video game developed by Rockstar North in the United Kingdom and published by Rockstar Games', 'Grand Theft Auto San Andreas.jpg', null, '2', null, '//www.youtube.com/embed/8PfFKlWlE48?rel=0');
INSERT INTO `games` VALUES ('4', '2', '4', 'God of War', '33', '10', '2003-07-20', 'Dude, remember this game? It\'s a shame that The Mark of Kri is one of the forgotten gems in the PS2 catalog.', 'god of war.jpg', null, '1', null, '//www.youtube.com/embed/BmGks4bjlmo?rel=0');
INSERT INTO `games` VALUES ('5', '2', '5', 'God of War II', '45', '6', '2004-05-12', 'Sony\'s San Diego studio created a fun, awesome adventure game that channeled our love of beat-‘em-ups. ', 'god of war 2.jpg', null, '4', null, '//www.youtube.com/embed/JID1u9qiMjQ?rel=0');
INSERT INTO `games` VALUES ('6', '2', '5', 'Final Fantasy 7', '21', '10', '2000-12-01', 'Sony\'s San Diego studio created a fun, awesome adventure game that channeled our love of beat-‘em-ups. ', 'Final-Fantasy-7.png', null, '2', null, '//www.youtube.com/embed/BCr7y4SLhck?rel=0');
INSERT INTO `games` VALUES ('7', '4', '1', 'Fire Emblem', '79', '8', '2001-06-10', 'SOCOM II was just more SOCOM -- which isn\'t a bad thing. In fact, it was an awesome thing. Featuring 22 multip', 'fire emblem.jpg', null, '1', null, '//www.youtube.com/embed/MVbeoSPqRs4?rel=0');
INSERT INTO `games` VALUES ('8', '3', '2', 'Fire Emblem 4', '12', '10', '2012-09-12', 'While the single-player was a bit overly brutal, the community that Zipper built around SOCOM II set an example that developers still struggle to meet even seven years later.', 'Fire_Emblem_4.jpg', null, '2', null, '//www.youtube.com/embed/BCr7y4SLhck?rel=0');
INSERT INTO `games` VALUES ('9', '2', '3', 'God of War III', '60', '4', '2011-10-10', 'SEALS are awesome? Because Navy SEALS are totally awesome, even if there\'s no Michael Biehn or Charlie Sheen to be found.', 'god of war 3.jpg', null, '4', null, '//www.youtube.com/embed/BCr7y4SLhck?rel=0');
INSERT INTO `games` VALUES ('10', '4', '1', 'Metal Gear Solid 3: Snake Eater', '70', '10', '2003-09-26', 'Released in 2006 just before the arrival of the PlayStation 3, Okami was one of the PlayStation 2\'s last hurrahs. ', 'Metal-Gear-Solid-3.jpg', null, '0', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('11', '1', '2', 'Fate/Stay Night Realta Nua', '66', '6', '2006-05-13', 'We had never seen anything quite like this beautiful Japanese watercolor painting come to life; it really felt like an interactive work of art. ', 'realta_nua.jpg', null, '2', null, '//www.youtube.com/embed/7LWo3DCR1i0?rel=0');
INSERT INTO `games` VALUES ('12', '3', '1', 'Breath of Fire: Dragon Quarter ', '67', '10', '2008-11-11', 'While the visuals are what grabbed us at first, it soon became apparent that every aspect of Okami had been crafted with the utmost care by developer Clover.', 'Breath_of_Fire_-_Dragon_Quarter_Coverart.png', null, '2', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('13', '3', '2', 'Wild Arms 4 ', '65', '5', '2008-09-12', 'With a quest that offered dozens of hours of adventure and loads of auxiliary business to take care of, this was also one of the biggest games we\'d ever been blessed with. ', 'PS2 Wild Arms 4.jpg', null, '1', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('15', '1', '3', 'Yu-Gi-Oh! GX: The Beginning of Destiny', '80', '6', '2004-08-14', 'The lovable characters and exciting plot twists kept us hooked the entire time.', 'Yu-gi.jpg', null, '1', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('16', '4', '5', 'Red Ninja: End of Honor', '90', '7', '2006-03-12', 'Although it perhaps most closely resembled a Zelda game with its epic adventure, giant bosses, and puzzle bits, Okami was in no way a copycat and definitely had its own identity', 'Red Ninja End of Honor.jpg', null, '1', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('17', '2', '3', 'Tenchu 3: wrath of heaven', '56', '2', '2007-12-19', 'IGN actually awarded Game of the Year to Okami in 2006 over The Legend of Zelda: Twilight Princess -- a decision we stand behind today.', 'tenchu 3 wrath of heaven.jpg', null, '1', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('18', '3', '2', 'Tenchu: Fatal Shadows', '21', '10', '2010-11-12', 'Gamers were definitely divided on Capcom\'s unpredic le, stylized, and sometimes downright psychotic adventure game, Killer 7', 'TenChu.jpg', null, '1', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('19', '1', '4', 'WWE SmackDown! vs. RAW 2007', '34', '3', '2002-08-19', 'It\'s a bizarre journey into a surreal world where nothing is exactly as it seems and profanity, sex, and bloodshed are commonplace.', 'WWE SmackDown! Here Comes the Pain.jpg', null, '2', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('20', '4', '5', 'WWE SmackDown! Here Comes the Pain', '54', '11', '2008-10-29', 'It had a bold vision with a story of terrorism, the illegal trafficking of children, the sale of harvested human organs, and schizophrenia that kept us guessing until the very end. ', 'WWE_smackdown_vs_raw2007.jpg', null, '2', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('21', '1', '3', 'DOA2: Hardcore', '67', '6', '2001-11-11', 'During cutscenes, characters point-blank shoot innocent victims directly in their shocked faces, spraying blood in every direction. Heads are exploded and decapitated.', 'Hardcore.jpg', null, '2', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('22', '3', '1', 'kingdom hearts', '69', '8', '2003-04-17', 'Body parts fly in every direction. Just about every character has something eye-poppingly profane to say -- sometimes with racial implications.', 'kingdom hearts.jpg', null, '0', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('23', '3', '5', 'Wolrd Series of Poker: Tournament Of Champions\r\n', '90', '7', '2005-11-28', ' there are cinematics that feature full-blown sex sequences. The cel-shaded visuals -- a novelty at the time -- successfully blended cartoon images with very adult themes.', 'Wolrd Series of Poker.jpg', null, '0', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('24', '4', '1', 'Namco x Capcom (NTSC/English)\r\n', '67', '9', '2007-12-30', 'Killer 7 was so brutally off-the-wall it practically demanded your attention.', 'Namco x Capcom.jpg', null, '0', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('25', '2', '3', 'Nitro Bile', '55', '10', '2001-01-11', 'Survival horror was all the rage in the early 2000s, and Silent Hill 2 was among one of the titles pushing the movement forward.', 'Nitro Bike.jpg', null, '1', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('26', '4', '2', 'samurai', '47', '11', '2004-03-17', 'Rather than be a sequel to the original PlayStation game, Silent Hill 2 cast you as James Sunderland ', 'samurai.jpg', null, '1', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('28', '3', '2', 'Grand Theft Auto: San Andreas', '78', '12', '2006-09-09', 'Players would navigate James around town never knowing what was about to pop out at them', 'Grand Theft Auto San Andreas.jpg', null, '2', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('29', '2', '3', 'Soulcalibur II', '67', '12', '2005-11-25', 'there was combat in the game, Silent Hill 2 was more about unraveling this mystery and just surviving the living hell you had gotten yourself into by besting puzzles.', 'Soulcalibur II.jpg', null, '2', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');
INSERT INTO `games` VALUES ('30', '4', '1', 'The Mark of Kri', '45', '5', '2013-10-15', 'Crazy nurses, Pyramid Head, and more creepy moments than you could shake a stick at defined this title.', 'Mark Of Kri, The COVER.jpg', null, '2', null, '//www.youtube.com/embed/H2cY5pIdkj8?rel=0');

-- ----------------------------
-- Table structure for game_userorder
-- ----------------------------
DROP TABLE IF EXISTS `game_userorder`;
CREATE TABLE `game_userorder` (
  `Id` int(11) NOT NULL,
  `USERORDER_ID` int(11) NOT NULL,
  PRIMARY KEY (`Id`,`USERORDER_ID`),
  KEY `USERORDER_ID` (`USERORDER_ID`),
  CONSTRAINT `fk_game_user` FOREIGN KEY (`Id`) REFERENCES `games` (`Id`),
  CONSTRAINT `game_userorder_ibfk_1` FOREIGN KEY (`USERORDER_ID`) REFERENCES `user_order` (`USERORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of game_userorder
-- ----------------------------

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `ORDERDETAIL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAMES` varchar(100) DEFAULT NULL,
  `DELIVERY` varchar(100) DEFAULT NULL,
  `PRICE` float(8,2) DEFAULT NULL,
  PRIMARY KEY (`ORDERDETAIL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES ('1', '', '', null);

-- ----------------------------
-- Table structure for subscribe
-- ----------------------------
DROP TABLE IF EXISTS `subscribe`;
CREATE TABLE `subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subscribe
-- ----------------------------

-- ----------------------------
-- Table structure for subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subscriptions
-- ----------------------------
INSERT INTO `subscriptions` VALUES ('2', 'kimlt1989@gmail.com');
INSERT INTO `subscriptions` VALUES ('3', 'kimlt1989@gmail.com');

-- ----------------------------
-- Table structure for suppliers
-- ----------------------------
DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `SUP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUP_Name` varchar(50) NOT NULL,
  `SUP_Address` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`SUP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of suppliers
-- ----------------------------
INSERT INTO `suppliers` VALUES ('1', 'Sony Company', '22 Tran Quang Dieu HCM');
INSERT INTO `suppliers` VALUES ('2', 'CapCom Company', '22 Ly Thai To HCM');
INSERT INTO `suppliers` VALUES ('3', 'Comado', '108 Cach Mang Thang 8 HCM');
INSERT INTO `suppliers` VALUES ('4', 'Xinao', '305 Tran Van Dang HCM');
INSERT INTO `suppliers` VALUES ('5', 'Vina', '218 Nguyen Huy HCM');

-- ----------------------------
-- Table structure for type_users
-- ----------------------------
DROP TABLE IF EXISTS `type_users`;
CREATE TABLE `type_users` (
  `TYPEUSER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAMES` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TYPEUSER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of type_users
-- ----------------------------
INSERT INTO `type_users` VALUES ('1', 'normal');
INSERT INTO `type_users` VALUES ('2', 'admin');
INSERT INTO `type_users` VALUES ('3', 'mod');

-- ----------------------------
-- Table structure for userorder_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `userorder_orderdetail`;
CREATE TABLE `userorder_orderdetail` (
  `USERORDER_ID` int(11) NOT NULL,
  `ORDERDETAIL_ID` int(11) NOT NULL,
  PRIMARY KEY (`USERORDER_ID`,`ORDERDETAIL_ID`),
  KEY `FK_USERORDER_ORDERDETAIL2` (`ORDERDETAIL_ID`),
  CONSTRAINT `userorder_orderdetail_ibfk_1` FOREIGN KEY (`USERORDER_ID`) REFERENCES `user_order` (`USERORDER_ID`),
  CONSTRAINT `userorder_orderdetail_ibfk_2` FOREIGN KEY (`ORDERDETAIL_ID`) REFERENCES `order_details` (`ORDERDETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userorder_orderdetail
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPEUSER_ID` int(11) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `FIRSTNAME` varchar(100) DEFAULT NULL,
  `LASTNAME` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `GENDER` tinyint(1) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(400) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `FK_RELATIONSHIP_7` (`TYPEUSER_ID`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`TYPEUSER_ID`) REFERENCES `type_users` (`TYPEUSER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '3', 'admin', '123', 'admin', 'admin', '1989-03-07', '0', '0972262923', '01 than nhan trung', 'kimlt1989@gmail.com');
INSERT INTO `users` VALUES ('4', '2', 'admin', 'admin', 'Kim', 'Ly', '1989-03-07', '1', '0972262923', '01 than nhan trung', 'kimlt1989@gmail.com');
INSERT INTO `users` VALUES ('5', '1', 'mod', 'mod', 'Kim', 'Ly', '1989-03-07', '1', '0972262923', '01 than nhan trung', 'kimlt1989@gmail.com');
INSERT INTO `users` VALUES ('6', '1', 'kim', '123', 'Kim', 'Ly', '1989-03-07', '0', '0972262923', '01 than nhan trung', 'kimlt1989@gmail.com');
INSERT INTO `users` VALUES ('7', '1', 'vinh', '123', 'vinh', 'tran', '1989-03-07', '1', '0972262923', '01 than nhan trung', 'kimlt1989@gmail.com');
INSERT INTO `users` VALUES ('8', '1', 'vi', '123', 'vi', 'ku', '1989-03-07', '1', '0972262923', '01 than nhan trung', 'kimlt1989@gmail.com');
INSERT INTO `users` VALUES ('9', '1', 'test', 'test', 'test', 'test', '1999-01-03', '1', '234346567484', '', 'thanhdp10@saigontech.edu.vn');

-- ----------------------------
-- Table structure for user_order
-- ----------------------------
DROP TABLE IF EXISTS `user_order`;
CREATE TABLE `user_order` (
  `USERORDER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `CONFIRM` tinyint(1) DEFAULT NULL,
  `GAMEIDS` varchar(300) NOT NULL,
  PRIMARY KEY (`USERORDER_ID`),
  KEY `FK_RELATIONSHIP_5` (`USER_ID`),
  CONSTRAINT `user_order_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_order
-- ----------------------------
INSERT INTO `user_order` VALUES ('1', '7', 'test01 test01', '0972262923', '01 than nhan trung', '1', '21');
INSERT INTO `user_order` VALUES ('2', '4', 'Kim', '0972262923', '01 than nhan trung', '0', '16');
INSERT INTO `user_order` VALUES ('3', '5', 'Kim ', '0972262923', '01 than nhan trung', '0', '1');
INSERT INTO `user_order` VALUES ('4', '4', 'Kim ', '0972262923', '01 than nhan trung', '0', '16');
INSERT INTO `user_order` VALUES ('5', '5', 'Kim ', '0972262923', '01 than nhan trung', '0', '1');
INSERT INTO `user_order` VALUES ('6', '4', 'Kim ', '0972262923', '01 than nhan trung', '0', '16');
INSERT INTO `user_order` VALUES ('7', '7', 'Kim ', '0972262923', '01 than nhan trung', '0', '1');
INSERT INTO `user_order` VALUES ('8', '4', 'Kim ', '0972262923', '01 than nhan trung', '0', '16');
INSERT INTO `user_order` VALUES ('9', '8', 'Kim ', '0972262923', '01 than nhan trung', '0', '1');
INSERT INTO `user_order` VALUES ('10', '4', 'Kim ', '0972262923', '01 than nhan trung', '0', '16');
INSERT INTO `user_order` VALUES ('11', '9', 'test test', '234346567484', '', '1', '4;');
INSERT INTO `user_order` VALUES ('12', '9', 'test test', '234346567484', '', '1', '3;');
INSERT INTO `user_order` VALUES ('13', '9', 'test test', '234346567484', '', '1', '1;2;');
