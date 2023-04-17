DROP DATABASE IF EXISTS `WebSecurityDB`;

CREATE DATABASE `WebSecurityDB`;
USE `WebSecurityDB`;
SET NAMES utf8;
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE
) ENGINE=InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users` VALUES (1, 'admin@gmail.com', '100205', CURRENT_TIMESTAMP);
INSERT INTO `users` VALUES (2, 'john_paul@something.com', 'nicetryhacker!', CURRENT_TIMESTAMP);
INSERT INTO `users` VALUES (3, 'Bent@hotmail.com', 'bentbent', CURRENT_TIMESTAMP);
INSERT INTO `users` VALUES (4, 'Bob@yahoo.dk', 'bobtest', CURRENT_TIMESTAMP);
INSERT INTO `users` VALUES (5, 'test', 'password', CURRENT_TIMESTAMP);
INSERT INTO `users` VALUES (6, 'admin', 'admin', CURRENT_TIMESTAMP);

CREATE TABLE `roles` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `users_roles` (
    `user_id` INT NOT NULL,
    `role_id` INT NOT NULL,
    INDEX `user_fk_idx` (`user_id`),
    INDEX `role_fk_idx` (`role_id`),
    CONSTRAINT `role_fk` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
    CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

INSERT INTO `roles` VALUES (1,'USER');
INSERT INTO `roles` VALUES (2, 'ADMIN');

INSERT INTO `users_roles` VALUES (1, 1);
INSERT INTO `users_roles` VALUES (2, 1);
INSERT INTO `users_roles` VALUES (3, 1);
INSERT INTO `users_roles` VALUES (4, 1);
INSERT INTO `users_roles` VALUES (5, 1);
INSERT INTO `users_roles` VALUES (6, 1);
INSERT INTO `users_roles` VALUES (6, 2);
