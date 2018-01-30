/*
 Navicat Premium Data Transfer

 Source Server         : MySQL Localhost
 Source Server Type    : MySQL
 Source Server Version : 50552
 Source Host           : localhost
 Source Database       : futibaclub

 Target Server Type    : MySQL
 Target Server Version : 50552
 File Encoding         : utf-8

 Date: 01/29/2018 18:50:44 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text,
  `guessing_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_guessings1_idx` (`guessing_id`),
  KEY `fk_comments_users1_idx` (`user_id`),
  CONSTRAINT `fk_comments_guessings1` FOREIGN KEY (`guessing_id`) REFERENCES `guessings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comments_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `games`
-- ----------------------------
DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_a` varchar(245) DEFAULT NULL,
  `team_b` varchar(245) DEFAULT NULL,
  `result_a` int(11) DEFAULT NULL,
  `result_b` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `games`
-- ----------------------------
BEGIN;
INSERT INTO `games` VALUES ('1', 'São Paulo', 'Santos', null, null), ('2', 'Santos', 'Palmeiras', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `groups`
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `groups`
-- ----------------------------
BEGIN;
INSERT INTO `groups` VALUES ('1', 'Peladeiros'), ('2', 'Meu Grupo'), ('3', 'Zueira Facu'), ('4', 'Vamos lá mais um'), ('5', 'Amigos do Mavo'), ('6', 'Test1');
COMMIT;

-- ----------------------------
--  Table structure for `groups_users`
-- ----------------------------
DROP TABLE IF EXISTS `groups_users`;
CREATE TABLE `groups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_groups_users_users_idx` (`user_id`),
  KEY `fk_groups_users_group1_idx` (`group_id`),
  CONSTRAINT `fk_groups_users_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_groups_users_group1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `groups_users`
-- ----------------------------
BEGIN;
INSERT INTO `groups_users` VALUES ('1', '1', '1', 'owner'), ('2', '2', '2', 'owner'), ('3', '2', '1', 'user'), ('4', '1', '2', 'user'), ('5', '1', '3', 'owner'), ('6', '2', '3', 'user'), ('7', '1', '4', 'owner'), ('8', '2', '4', 'user'), ('9', '2', '5', 'owner'), ('11', '2', '6', 'owner'), ('12', '1', '6', 'user'), ('13', '1', '5', 'pending');
COMMIT;

-- ----------------------------
--  Table structure for `guessings`
-- ----------------------------
DROP TABLE IF EXISTS `guessings`;
CREATE TABLE `guessings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result_a` int(11) DEFAULT NULL,
  `result_b` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `game_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_guessings_group1_idx` (`group_id`),
  KEY `fk_guessings_games1_idx` (`game_id`),
  KEY `fk_guessings_users1_idx` (`user_id`),
  CONSTRAINT `fk_guessings_games1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_guessings_group1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_guessings_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `guessings`
-- ----------------------------
BEGIN;
INSERT INTO `guessings` VALUES ('1', '1', '2', '50', '1', '1', '1'), ('2', '3', '4', '100', '2', '1', '1'), ('3', '1', '4', null, '1', '2', '1'), ('4', '3', '2', null, '2', '2', '1');
COMMIT;

-- ----------------------------
--  Table structure for `teams`
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `flag_img` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `teams`
-- ----------------------------
BEGIN;
INSERT INTO `teams` VALUES ('1', 'Fluminense', 'https://s.glbimg.com/es/sde/f/equipes/2015/07/21/fluminense_60x60.png'), ('2', 'Santos', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/santos_60x60.png'), ('3', 'Flamengo', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/flamengo_60x60.png'), ('4', 'Atlético', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/atletico_mg_60x60.png'), ('5', 'Palmeiras', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/palmeiras_60x60.png'), ('6', 'Vasco da Gama', 'https://s.glbimg.com/es/sde/f/equipes/2016/07/29/Vasco-65.png'), ('7', 'Corinthians', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/corinthians_60x60.png'), ('8', 'Chapecoense', 'https://s.glbimg.com/es/sde/f/equipes/2015/08/03/Escudo-Chape-165.png'), ('9', 'Cruzeiro', 'https://s.glbimg.com/es/sde/f/equipes/2015/04/29/cruzeiro_65.png'), ('10', 'São Paulo', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/sao_paulo_60x60.png'), ('11', 'Coritiba - PR', 'https://s.glbimg.com/es/sde/f/equipes/2017/03/27/coritiba65.png'), ('12', 'AtlÃ©tico - GO', 'https://s.glbimg.com/es/sde/f/organizacoes/2017/04/10/Atletico-GO-65.png'), ('13', 'Grêmio - RS', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/gremio_60x60.png'), ('14', 'Botafogo', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/botafogo_60x60.png'), ('15', 'Bahia - BA', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/bahia_60x60.png'), ('16', 'Atlético - PR', 'https://s.glbimg.com/es/sde/f/equipes/2015/06/24/atletico-pr_2015_65.png'), ('17', 'Ponte Preta', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/ponte_preta_60x60.png'), ('18', 'Sport - PE', 'https://s.glbimg.com/es/sde/f/equipes/2015/07/21/sport65.png'), ('19', 'Avaí­', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/avai_60x60_.png'), ('20', 'Vitória', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/vitoria_60x60.png');
COMMIT;


-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(245) DEFAULT NULL,
  `email` varchar(245) DEFAULT NULL,
  `password` varchar(245) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
