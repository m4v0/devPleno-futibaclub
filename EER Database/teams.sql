/*
 Navicat Premium Data Transfer

 Source Server         : MySQL Localhost
 Source Server Type    : MySQL
 Source Server Version : 50552
 Source Host           : localhost
 Source Database       : db-bets-main

 Target Server Type    : MySQL
 Target Server Version : 50552
 File Encoding         : utf-8

 Date: 01/29/2018 19:01:21 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `teams`
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `flag_img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `teams`
-- ----------------------------
BEGIN;
INSERT INTO `teams` VALUES ('1', 'Fluminense', 'https://s.glbimg.com/es/sde/f/equipes/2015/07/21/fluminense_60x60.png'), ('2', 'Santos', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/santos_60x60.png'), ('3', 'Flamengo', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/flamengo_60x60.png'), ('4', 'Atlético', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/atletico_mg_60x60.png'), ('5', 'Palmeiras', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/palmeiras_60x60.png'), ('6', 'Vasco da Gama', 'https://s.glbimg.com/es/sde/f/equipes/2016/07/29/Vasco-65.png'), ('7', 'Corinthians', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/corinthians_60x60.png'), ('8', 'Chapecoense', 'https://s.glbimg.com/es/sde/f/equipes/2015/08/03/Escudo-Chape-165.png'), ('9', 'Cruzeiro', 'https://s.glbimg.com/es/sde/f/equipes/2015/04/29/cruzeiro_65.png'), ('10', 'São Paulo', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/sao_paulo_60x60.png'), ('11', 'Coritiba - PR', 'https://s.glbimg.com/es/sde/f/equipes/2017/03/27/coritiba65.png'), ('12', 'AtlÃ©tico - GO', 'https://s.glbimg.com/es/sde/f/organizacoes/2017/04/10/Atletico-GO-65.png'), ('13', 'Grêmio - RS', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/gremio_60x60.png'), ('14', 'Botafogo', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/botafogo_60x60.png'), ('15', 'Bahia - BA', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/bahia_60x60.png'), ('16', 'Atlético - PR', 'https://s.glbimg.com/es/sde/f/equipes/2015/06/24/atletico-pr_2015_65.png'), ('17', 'Ponte Preta', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/ponte_preta_60x60.png'), ('18', 'Sport - PE', 'https://s.glbimg.com/es/sde/f/equipes/2015/07/21/sport65.png'), ('19', 'Avaí­', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/avai_60x60_.png'), ('20', 'Vitória', 'https://s.glbimg.com/es/sde/f/equipes/2014/04/14/vitoria_60x60.png');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
