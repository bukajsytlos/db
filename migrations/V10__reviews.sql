CREATE TABLE `review` (
  `id`          INT(11) UNSIGNED      NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `text`        TEXT,
  `user_id`     MEDIUMINT(8) UNSIGNED NOT NULL,
  `rating`      TINYINT(1) UNSIGNED   NOT NULL,
  `create_time` TIMESTAMP             NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP             NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT `review_author` FOREIGN KEY (`user_id`) REFERENCES `login` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

CREATE TABLE `map_review` (
  `map_version_id` MEDIUMINT(8) UNSIGNED NOT NULL,
  `review_id`      INT(11) UNSIGNED      NOT NULL,
  PRIMARY KEY (`map_version_id`, `review_id`),
  CONSTRAINT `map_version_to_review` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `review_to_map_version` FOREIGN KEY (`map_version_id`) REFERENCES `map_version` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


CREATE TABLE `mod_review` (
  `mod_version_id` MEDIUMINT(8) UNSIGNED NOT NULL,
  `review_id`      INT(11) UNSIGNED      NOT NULL,
  PRIMARY KEY (`mod_version_id`, `review_id`),
  CONSTRAINT `mod_version_to_review` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `review_to_mod_version` FOREIGN KEY (`mod_version_id`) REFERENCES `mod_version` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;


CREATE TABLE `replay_review` (
  `replay_id` INT(10) UNSIGNED NOT NULL,
  `review_id` INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`replay_id`, `review_id`),
  CONSTRAINT `replay_to_review` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `review_to_replay` FOREIGN KEY (`replay_id`) REFERENCES `game_stats` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
