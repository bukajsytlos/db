CREATE TABLE `emotions` (
    `id` INT NOT NULL,
    `emotion` ENUM('like', 'dislike') NOT NULL,
    `context_type` ENUM('map', 'replay', 'mod'),
    `context_id` INT NOT NULL COMMENT 'foreign key of context, e.g. map id, replay id, mod id',
    `author_id` INT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`author_id`)
        REFERENCES `auth_user` (`id`)
);

DROP TRIGGER IF EXISTS `emotions_BEFORE_INSERT`;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `emotions_BEFORE_INSERT` BEFORE INSERT ON `emotions` FOR EACH ROW
BEGIN
  SET NEW.updated_at = NOW();
END
$$

DELIMITER ;
