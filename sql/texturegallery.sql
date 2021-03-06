-- Adminer 4.2.0 MySQL dump

SET NAMES utf8mb4;
SET time_zone = '+00:00';

DROP TABLE IF EXISTS `Keyword`;
CREATE TABLE `Keyword` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `TgObject`;
CREATE TABLE `TgObject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `objecttype` char(1) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `filename` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `parentid` bigint(20) DEFAULT NULL,
  `author` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `abstract` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bookmark` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`),
  CONSTRAINT `TgObject_ibfk_1` FOREIGN KEY (`parentid`) REFERENCES `TgObject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `TGobjectKeywordRelation`;
CREATE TABLE `TGobjectKeywordRelation` (
  `keywordID` bigint(20) NOT NULL,
  `TgObjectID` bigint(20) NOT NULL,
  PRIMARY KEY (`keywordID`),
  KEY `TgObjectID` (`TgObjectID`),
  CONSTRAINT `TGobjectKeywordRelation_ibfk_5` FOREIGN KEY (`keywordID`) REFERENCES `Keyword` (`id`) ON DELETE CASCADE,
  CONSTRAINT `TGobjectKeywordRelation_ibfk_6` FOREIGN KEY (`TgObjectID`) REFERENCES `TgObject` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- 2015-03-03 00:46:19
