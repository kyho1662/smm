# database : prj

# Dump of table music
# ------------------------------------------------------------

DROP TABLE IF EXISTS `music`;

CREATE TABLE `music` (
  `music_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `singer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`music_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `music` WRITE;



INSERT INTO `music` (`url`, `title`, `genre`, `singer`)
VALUES
	("https://www.youtube.com/embed/TgOu00Mf3kI", "eight", '팝', '아이유');
/*!40000 ALTER TABLE `music` ENABLE KEYS */;

UNLOCK TABLES;