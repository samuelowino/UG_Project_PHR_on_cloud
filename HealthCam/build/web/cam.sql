/*
MySQL Data Transfer
Source Host: localhost
Source Database: cam
Target Host: localhost
Target Database: cam
Date: 10/9/2013 4:51:43 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for graph
-- ----------------------------
DROP TABLE IF EXISTS `graph`;
CREATE TABLE `graph` (
  `gid` int(11) NOT NULL,
  `x` int(11) NOT NULL,
  `maximum_value` int(11) NOT NULL,
  `user_value` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `disc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `name` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for medication
-- ----------------------------
DROP TABLE IF EXISTS `medication`;
CREATE TABLE `medication` (
  `mid` int(11) NOT NULL auto_increment,
  `tid` varchar(255) NOT NULL,
  `titname` varchar(255) NOT NULL,
  `minvalue` varchar(255) NOT NULL,
  `maxvalue` varchar(255) NOT NULL,
  `disc` varchar(255) NOT NULL,
  `tname` varchar(255) default NULL,
  PRIMARY KEY  (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for newtitle
-- ----------------------------
DROP TABLE IF EXISTS `newtitle`;
CREATE TABLE `newtitle` (
  `tid` int(11) NOT NULL auto_increment,
  `titname` varchar(255) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for relatedposts
-- ----------------------------
DROP TABLE IF EXISTS `relatedposts`;
CREATE TABLE `relatedposts` (
  `pid` int(11) NOT NULL auto_increment,
  `mid` varchar(255) NOT NULL,
  `postby` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `id` int(11) default NULL,
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for signup
-- ----------------------------
DROP TABLE IF EXISTS `signup`;
CREATE TABLE `signup` (
  `uid` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `gen` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `tok_id` int(11) NOT NULL auto_increment,
  `uid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `query` varchar(255) NOT NULL,
  `qdate` varchar(255) NOT NULL,
  PRIMARY KEY  (`tok_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `age` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `gender` varchar(255) default NULL,
  `mobile` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `pass` varchar(255) default NULL,
  `userid` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `graph` VALUES ('1', '30', '119', '110', 'systolic bp', 'normal');
INSERT INTO `graph` VALUES ('2', '30', '5', '4', 'missed medication', 'notify next of kin');
INSERT INTO `log` VALUES ('provider', 'provider', 'provider');
INSERT INTO `log` VALUES ('sta', 'sta', 'sta');
INSERT INTO `medication` VALUES ('1', '‚Wm¡¯+ð´TïhT', 'Í#ÆŠË%ÅA€?_@`Bà', '‚oî%¬qqjâúž', '»–LŠeüN.—&ÑãnË	±', 'šR¤W;WË¶ÀP·§>C3Q#O=j¼ v6)ø&\\Þ', null);
INSERT INTO `medication` VALUES ('2', '‚Wm¡¯+ð´TïhT', 'Í#ÆŠË%ÅA€?_@`Bà', 'öì€Ê„~óû÷rŸwi', 'jJ0yÅ,sÚŒGˆ¸‡ò', 'kŽÓí°÷ÝPÇ¶©Ô¤î zRÄWtqNÝj+×Û^qD™CµäÎ\r6L#z6', null);
INSERT INTO `medication` VALUES ('3', '‚Wm¡¯+ð´TïhT', 'Í#ÆŠË%ÅA€?_@`Bà', 'jJ0yÅ,sÚŒGˆ¸‡ò', 'èø½•‰rj\\Gî}3Š–(', 'zc:ƒTzœ¿w¤2YUµæL’Æ¨9RÝ¡z—lhÉœ“¶c­?F°ç\rñx}', null);
INSERT INTO `medication` VALUES ('4', 'e£UÂ€\" Ó“QÍz', '4yµ)¸ŒC3MzÿŠ†EW,ßim^«lpý>’Œëµ', '½\n”ò¼ýO\\àÇÓÁjÐ', '/L¯}ÙŽì›ƒ¸kß?ê?', '	¹P›q¥^›Jàâ¨…Õ.ún,/ÇèÁ §€ê‹', null);
INSERT INTO `medication` VALUES ('5', 'e£UÂ€\" Ó“QÍz', '4yµ)¸ŒC3MzÿŠ†EW,ßim^«lpý>’Œëµ', '/L¯}ÙŽì›ƒ¸kß?ê?', 'e£UÂ€\" Ó“QÍz', 'dgŒý–©‡\"Ùe; u¹xÔ3ä^·\r…û«´Ÿ¬…î', null);
INSERT INTO `medication` VALUES ('6', 'e£UÂ€\" Ó“QÍz', '4yµ)¸ŒC3MzÿŠ†EW,ßim^«lpý>’Œëµ', 'e£UÂ€\" Ó“QÍz', 'Ù“Ã#°è)¢%ì(', '~·òN‚Ö;ýÓ^^òLŠN', null);
INSERT INTO `medication` VALUES ('7', '±Íof‚%Sí¨afæê$j', 'sW\n_çÔxk8.\'î±', '½\n”ò¼ýO\\àÇÓÁjÐ', '%úéÂØŒºnÔ¡þLˆ', 'Ò¸$…ÞBrþ]™¨¯ÖßS', null);
INSERT INTO `medication` VALUES ('8', '±Íof‚%Sí¨afæê$j', 'sW\n_çÔxk8.\'î±', '¤W­{ÂMŽAJòøä', '€¸¾ã§§çfùÙÞ¤„|7Î', 'ï.Õð\"JÓB_–…', null);
INSERT INTO `medication` VALUES ('9', '±Íof‚%Sí¨afæê$j', 'sW\n_çÔxk8.\'î±', 'KSì€”¾vfG­öé5e', 'P×\\¡Œø', '`bð/(æûÞR¤uÃø¡`', null);
INSERT INTO `medication` VALUES ('10', '±Íof‚%Sí¨afæê$j', 'sW\n_çÔxk8.\'î±', 'Ø¥8AØa,×Ïß\n[Rí', 'P¦¹ÓØvÝÛÍ\\qÃNT9', '/av5ÏÉ¤àm‘ä¼ÒC', null);
INSERT INTO `newtitle` VALUES ('4', 'blood sugar');
INSERT INTO `newtitle` VALUES ('5', 'missed medication');
INSERT INTO `newtitle` VALUES ('6', 'systolic bp');
INSERT INTO `newtitle` VALUES ('7', 'example');
INSERT INTO `relatedposts` VALUES ('10', 'ü´|“?‡¤Ôúé/ý', 'S›V©ÒðéÆw¢& ËH1', 'ï.Õð\"JÓB_–…', '5{ª!s«>ÑTz¿DêyS”©íÐ\"b£bH4:”9^±', null);
INSERT INTO `relatedposts` VALUES ('11', 'ü´|“?‡¤Ôúé/ý', 'dÁlˆ9.ß´ìÑíòÑ', '>Žb OD³<7L8_¨', '5{ª!s«>ÑTz¿DêySºõþ<õO£vð2:eímÜ´', null);
INSERT INTO `relatedposts` VALUES ('12', '³€:<´ìâ\Z>€þ7>¬', '¼Ê²Ä~ÅðÏØõ°|j', '¯ûîµÖB®jÐ­¾»P˜ÐVl¹Zÿ¢»êŒŸâ¨$', '5{ª!s«>ÑTz¿DêySH‚³ÏÕh4d’ÏòhŸ˜é', null);
INSERT INTO `relatedposts` VALUES ('13', '³€:<´ìâ\Z>€þ7>¬', 'dÁlˆ9.ß´ìÑíòÑ', 'ŠwnÕbªÜº@—êOáùa¤', 'ÞLYù(\rÖk¯¶ºš	ÞÛAëáÒÆvÏ^˜yVBô', null);
INSERT INTO `relatedposts` VALUES ('14', '/L¯}ÙŽì›ƒ¸kß?ê?', '–þtwãë\rF£Ö7yÕëº', 'dgŒý–©‡\"Ùe; u¹xÔ3ä^·\r…û«´Ÿ¬…î', 'ÞLYù(\rÖk¯¶ºš	”©íÐ\"b£bH4:”9^±', null);
INSERT INTO `relatedposts` VALUES ('15', '‚Wm¡¯+ð´TïhT', 'dÁlˆ9.ß´ìÑíòÑ', '	¹P›q¥^›Jàâ¨…Õ.ún,/ÇèÁ §€ê‹', 'b&‹)ç®ØŽw5vY´\n“~+H¤VRÜÏ^¬Šm', null);
INSERT INTO `relatedposts` VALUES ('16', 'e£UÂ€\" Ó“QÍz', 'bªŸ©-uÞàú²ÄiP', 'Ó:é‡³¾ÒFQ~Òà,iS}q”5láî¥O-Œhy@', '9©úê!ÙùÕw!çD¡\"”‹:k: ÜÕe·n²[', null);
INSERT INTO `relatedposts` VALUES ('17', '±Íof‚%Sí¨afæê$j', '–þtwãë\rF£Ö7yÕëº', 'tÂ1,:Çøfª$.r«¥)#¹hß´ÊBžÙõ°x', '9©úê!ÙùÕw!çD¡\"ÑèÀÖ?ö­j YcÀn>', null);
INSERT INTO `relatedposts` VALUES ('18', '±Íof‚%Sí¨afæê$j', '‰²‹ü\Z”ý\n­wnvÐ', '©²*}¨ôÞàô:Ðð', '9©úê!ÙùÕw!çD¡\"*‰fï®¢+<%qØòÿ', null);
INSERT INTO `relatedposts` VALUES ('19', 'r­×/Då¡·µÃyûáb¬¬', '–þtwãë\rF£Ö7yÕëº', 'dgŒý–©‡\"Ùe; u¹xÔ3ä^·\r…û«´Ÿ¬…î', '#J=Ã³ò\"OöÓ[DéÑ«…SF¼žh­0¶˜', null);
INSERT INTO `relatedposts` VALUES ('20', 'Ù“Ã#°è)¢%ì(', 'dÁlˆ9.ß´ìÑíòÑ', '	¹P›q¥^›Jàâ¨…Õ.ún,/ÇèÁ §€ê‹', '*æ‚¤íCf­‚ñütCÈ,æÎeÑîe c.}®ÇÈ', null);
INSERT INTO `relatedposts` VALUES ('21', '„&&iÂxH\"›\\·`', '¼Ê²Ä~ÅðÏØõ°|j', '~·òN‚Ö;ýÓ^^òLŠN', '*æ‚¤íCf­‚ñütCÈ,…åióüšÂZXpôä\n', null);
INSERT INTO `relatedposts` VALUES ('22', '}d–áp…qwS¢©è­', 'bªŸ©-uÞàú²ÄiP', 'Ä>·6²Œø`ƒ Oâ¦Á´QÛ,9_¶7^ Gà~ž÷î', '{÷Üƒy°º0—µ“,ìj)Óg·Š‡|f_}', null);
INSERT INTO `signup` VALUES ('2', 'Vinoth', '24', 'male', 'vino', 'vino', 'vino@gmail.com', '9797979797', '29/04/2013');
INSERT INTO `signup` VALUES ('3', 'Balaji', '24', 'male', 'bala', 'bala', 'chennaisunday@gmail.com', '9566137117', '04/05/2013');
INSERT INTO `token` VALUES ('1', '/L¯}ÙŽì›ƒ¸kß?ê?', 'S›V©ÒðéÆw¢& ËH1', '+P[®«>®¯Í·¦ÑÄÑ', 'ßO:N^NÒ[@nI4yµ)¸ŒC3MzÿŠ†EW”*tµÊ ³YÙ3{Óð)±', 'Ò€áhk¾þ€s8ÕÖf]Ã—æÎeÑîe c.}®ÇÈ');
INSERT INTO `user` VALUES ('1', '24', 'balaece003@gmail.com', 'male', '9898989898', 'Palanivel', 'vel', 'vel');
