CREATE TABLE `reviews` (
    `id` INT NOT NULL,
    `review` TEXT NOT NULL COMMENT 'editable review test from a user',
    `context_type` ENUM('map', 'replay', 'mod'),
    `context_id` INT NOT NULL COMMENT 'foreign key of context, e.g. map id, replay id, mod id',
    `author_id` INT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`author_id`)
        REFERENCES `auth_user` (`id`)
);

DROP TRIGGER IF EXISTS `reviews_BEFORE_INSERT`;
DELIMITER $$
CREATE DEFINER = CURRENT_USER TRIGGER `reviews_BEFORE_INSERT` BEFORE INSERT ON `reviews` FOR EACH ROW
BEGIN
  SET NEW.updated_at = NOW();
END
$$

DELIMITER ;
