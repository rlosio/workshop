CREATE TABLE `workshopdemo`
(`id` bigint(20) NOT NULL AUTO_INCREMENT,
`datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
`value` float DEFAULT NULL,
PRIMARY KEY (`id`));


DELIMITER $$
CREATE PROCEDURE load_workshopdemo()
BEGIN
  DECLARE i INT DEFAULT 0;
  WHILE i < 100000 DO
	INSERT INTO `workshopdemo` (`datetime`,`value`) VALUES (
  	FROM_UNIXTIME(UNIX_TIMESTAMP('2023-10-01 01:00:00')+FLOOR(RAND()*31536000)),
  	ROUND(RAND()*100,2));
	SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;

CALL load_workshopdemo();
SELECT sleep(5);
CALL load_workshopdemo();

