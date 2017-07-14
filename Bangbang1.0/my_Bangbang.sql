DROP DATABASE IF EXISTS `my_bangbang`;
CREATE DATABASE `my_bangbang` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE my_bangbang;

CREATE TABLE `user` (
  `userId` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) DEFAULT '',
  `password` VARCHAR(20) DEFAULT NULL,
  `repassword` VARCHAR(30) DEFAULT NULL,
  `email` VARCHAR(20) DEFAULT NULL,
  `sex` VARCHAR(10) DEFAULT '男',
  `signature` VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY  (`userId`),
  UNIQUE (`username`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='用户表';
INSERT INTO `user` VALUES (1,'tigger','628628','628628','','男','');
INSERT INTO `user` VALUES (2,'zz','628628','628628','','男','');
INSERT INTO `user` VALUES (3,'bluecat','628628','628628','','男','');
INSERT INTO `user` VALUES (4,'yy','628628','628628','','男','');


CREATE TABLE `account` (
  `userId` INT(11) DEFAULT NULL,
  `bang` INT(11) DEFAULT '0',
  PRIMARY KEY  (`userId`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='用户表';
INSERT INTO `account` VALUES (1,'44');
INSERT INTO `account` VALUES (2,'30');
INSERT INTO `account` VALUES (3,'20');
INSERT INTO `account` VALUES (4,'10');


CREATE TABLE `message` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) DEFAULT NULL,
  `content` TEXT,
  `userId` INT(11) DEFAULT NULL,
  `date` DATETIME DEFAULT NULL,
  `critique` INT(11) DEFAULT '0',
  `zan` INT(11) DEFAULT '0',
  PRIMARY KEY  (`Id`),
  KEY `userId` (`userId`)
) ENGINE=INNODB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文章表';
INSERT INTO `message` VALUES (1,'拉布拉多犬走丢','米白色的拉布拉多犬，个性忠诚、大气、憨厚，于昨天下午5点左右走失，联系方式021-1234567',1,'2016-10-19 10:58',1,1);
INSERT INTO `message` VALUES (2,'我的狗狗萌萌不见了','有见到的吗，谢啦！',2,'2016-10-19 10:58',0,1);
INSERT INTO `message` VALUES (3,'我的索尼笔记本啊','有见到的吗，谢啦！',3,'2016-11-19 10:58',0,1);
INSERT INTO `message` VALUES (4,'嘿嘿，晒一下狗狗','就问你们羡慕不羡慕 哈哈',4,'2016-10-29 10:58',0,1);

CREATE TABLE `critique` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `AId` INT(11) DEFAULT NULL,
  `content` TEXT,
  `image` TEXT,
  `userId` INT(11) DEFAULT NULL,
  `date` DATETIME DEFAULT NULL,
  `answer` INT(11) DEFAULT '0',
  `zan` INT(11) DEFAULT '0',
  `oppose` INT(11) DEFAULT '0',
  
  PRIMARY KEY  (`Id`),
  KEY `AId` (`AId`)
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='评论表';
INSERT INTO `critique` VALUES (1,1,'是啊，太冷了，我还好！！！','',1,'2016-10-20 12:20',3,1,0);
INSERT INTO `critique` VALUES (2,1,'多加衣服','',1,'2016-10-30 19:20',0,0,0);

CREATE TABLE `criclick` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `AId` INT(11) DEFAULT NULL,
  `userId` INT(11) DEFAULT NULL,
  `zanclick` INT(11) DEFAULT '0',
  `opclick` INT(11) DEFAULT '0',
  PRIMARY KEY  (`Id`),
  KEY `AId` (`AId`)
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='评论表';
INSERT INTO `criclick` VALUES (1,1,1,0,0);
INSERT INTO `criclick` VALUES (2,2,1,0,0);

CREATE TABLE `answer` (
  `Id` INT(11) NOT NULL AUTO_INCREMENT,
  `AId` INT(11) DEFAULT NULL,
  `content` TEXT,
  `userId` INT(11) DEFAULT NULL,
  `date` DATETIME DEFAULT NULL,
  PRIMARY KEY  (`Id`),
  KEY `AId` (`AId`)
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='评论表';
INSERT INTO `answer` VALUES (1,1,'多穿点衣服',1,'2016-10-30 12:20');
INSERT INTO `answer` VALUES (2,1,'多穿点',2,'2016-10-30 12:20');
INSERT INTO `answer` VALUES (3,1,'加衣服',3,'2016-10-30 12:20');

ALTER TABLE `critique` ADD CONSTRAINT `cri_ibfk_1` FOREIGN KEY (`AId`) REFERENCES `message` (`Id`);
ALTER TABLE `answer` ADD CONSTRAINT `ans_ibfk_1` FOREIGN KEY (`AId`) REFERENCES `critique` (`Id`);
ALTER TABLE `criclick` ADD CONSTRAINT `cli_ibfk_1` FOREIGN KEY (`AId`) REFERENCES `critique` (`Id`);
ALTER TABLE `message` ADD CONSTRAINT `mes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);
ALTER TABLE `account` ADD CONSTRAINT `act_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);