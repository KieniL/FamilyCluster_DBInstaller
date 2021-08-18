CREATE TABLE $ANSPAR_DB.`category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO $ANSPAR_DB.category (description) VALUES ("test");


CREATE TABLE $AUTH_DB.`users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `already_logged_in` tinyint(1) DEFAULT '0',
  `logged_in` tinyint(1) DEFAULT '0',
  `next_verification` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `username` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into $AUTH_DB.users (username, password, created_at, updated_at) values ("test", "$2a$10$JrVzYgwuR80rRdSKblw0Ie7Mzz9r2Nuv0ouDzs8R463pcaqhTJ35G", "2021-07-20 10:39:00", "2021-07-20 10:39:00");