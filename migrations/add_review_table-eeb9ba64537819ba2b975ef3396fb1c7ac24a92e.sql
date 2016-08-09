CREATE TABLE IF NOT EXISTS `review_content` (
    `id` MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
    `text` TEXT NOT NULL COMMENT 'Content of the Review',
    `rating` ENUM('1', '2', '3', '4', '5') NOT NULL COMMENT 'Rating in Stars',
    `user_id` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'Author of the Rating',
    `create_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `update_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `login` (`id`)
);

CREATE TABLE IF NOT EXISTS `review_map` (
  `id` MEDIUMINT(8) UNSIGNED NOT NULL,
  `map_id` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'Id of the Map',
  `map_version_id` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'Id of the map version',
  `review_id` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'Id of the Review',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`review_id`) REFERENCES `review_content` (`id`),
  FOREIGN KEY (`map_id`) REFERENCES `map` (`id`),
  FOREIGN KEY (`map_version_id`) REFERENCES `map_version` (`id`)
);

CREATE TABLE IF NOT EXISTS `review_mod` (
  `id` MEDIUMINT(8) UNSIGNED NOT NULL,
  `mod_id` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'Name of the target, a github repository name',
  `review_id` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'Id of the Review',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`review_id`) REFERENCES `review_content` (`id`),
  FOREIGN KEY (`mod_id`) REFERENCES `table_mod` (`id`)
);

CREATE TABLE IF NOT EXISTS `review_replay` (
    `id` MEDIUMINT(8) UNSIGNED NOT NULL,
    `replay_id` BIGINT(20) UNSIGNED NOT NULL COMMENT 'UID of Game Replays',
    `review_id` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'Name of the target, a github repository name',
    PRIMARY KEY (`id`),
    FOREIGN KEY (`review_id`) REFERENCES `review_content` (`id`),
    FOREIGN KEY (`replay_id`) REFERENCES `game_replays` (`UID`)
);
