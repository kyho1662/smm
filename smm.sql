# database : prj

# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`email`, `name`, `password`)
VALUES
	('admin@gmail.com','admin','admin'),
    ('sam@gmail.com', 'sam', 'sam');
SET @user_id = LAST_INSERT_ID();
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table artist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `artist`;

CREATE TABLE `artist` (
  `artist_id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_name` varchar(255) NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;


INSERT INTO `artist` (`artist_name`)
VALUES
	("아이유");
SET @artist_id = LAST_INSERT_ID();

/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table music
# ------------------------------------------------------------

DROP TABLE IF EXISTS `music`;

CREATE TABLE `music` (
  `music_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `artist_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`music_id`),
  CONSTRAINT `FK_music_artist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `music` WRITE;

INSERT INTO `music` (`genre`, `title`, `artist_id`, `url`)
VALUES
	("POP", "에잇", @artist_id ,"https://www.youtube.com/embed/TgOu00Mf3kI");
SET @music_id = LAST_INSERT_ID();
/*!40000 ALTER TABLE `music` ENABLE KEYS */;

UNLOCK TABLES;

# Dump of table playlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `playlist`;

CREATE TABLE `playlist` (
  `playlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`playlist_id`),
   CONSTRAINT `FK_playlist_u  ser` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;


INSERT IGNORE INTO `playlist` (`playlist_name`, `user_id`)
VALUES
	("기본", @user_id);
SET @playlist_id = LAST_INSERT_ID();

/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

# Dump of table playlist_music
# ------------------------------------------------------------

DROP TABLE IF EXISTS `playlist_music`;

CREATE TABLE `playlist_music` (
  `playlist_id` int(11) NOT NULL,
  `music_id` int(11) NOT NULL,
  PRIMARY KEY (`playlist_id`,`music_id`),
  CONSTRAINT `FK_playlist_ur` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`),
  CONSTRAINT `FK_music_ur` FOREIGN KEY (`music_id`) REFERENCES `music` (`music_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `playlist_music` WRITE;
/*!40000 ALTER TABLE `playlist_music` DISABLE KEYS */;


INSERT IGNORE INTO `playlist_music` (`playlist_id`, `music_id`)
VALUES
	(@playlist_id, @music_id);

/*!40000 ALTER TABLE `playlist_music` ENABLE KEYS */;
UNLOCK TABLES;

