-- Database `ej_lotto`
CREATE DATABASE IF NOT EXISTS `ej_lotto`;
USE `ej_lotto`;
-- Table `ej_draw`
DROP TABLE IF EXISTS `ej_draw`;
CREATE TABLE `ej_draw` (
    `date` date NOT NULL,
    `n1` int(2) NOT NULL,
    `n2` int(2) NOT NULL,
    `n3` int(2) NOT NULL,
    `n4` int(2) NOT NULL,
    `n5` int(2) NOT NULL,
    `en1` int(2) NOT NULL,
    `en2` int(2) NOT NULL,
    PRIMARY KEY (`date`)
) ENGINE = InnoDB DEFAULT CHARSET = utf -8;
-- Table `ej_row`
DROP TABLE IF EXISTS `ej_row`;
CREATE TABLE `ej_row` (
    `row_id` int(7) NOT NULL AUTO_INCREMENT,
    `n1` int(2) NOT NULL,
    `n2` int(2) NOT NULL,
    `n3` int(2) NOT NULL,
    `n4` int(2) NOT NULL,
    `n5` int(2) NOT NULL,
    PRIMARY KEY (`row_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf -8;