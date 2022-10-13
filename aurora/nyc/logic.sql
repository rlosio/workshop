--
-- Renato Losio @ reInvent 2021
-- Drawing the New York City skyline with Amazon Aurora Serverless v2
-- 

DROP TABLE IF EXISTS nyc;

CREATE TABLE `nyc`
(`id` bigint(20) NOT NULL AUTO_INCREMENT,
`datetime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
`value` float DEFAULT NULL,
PRIMARY KEY (`id`));

DROP PROCEDURE IF EXISTS draw_block;

DELIMITER $$

CREATE PROCEDURE draw_block(IN x INT)
BEGIN

    -- working for x seconds
    WHILE MOD(UNIX_TIMESTAMP(),60) <= x DO 	
    	  INSERT INTO `nyc` (`datetime`,`value`) VALUES (
      	  FROM_UNIXTIME(UNIX_TIMESTAMP('2021-10-01 01:00:00')+FLOOR(RAND()*31536000)),
      	  ROUND(RAND()*100,2));
    END WHILE;
 
    -- padding to one minute
    SELECT SLEEP(60-x);
  
END$$
DELIMITER ;


DROP PROCEDURE IF EXISTS wait_minute;


DELIMITER $$

CREATE PROCEDURE wait_minute()
BEGIN
  -- we start at the beginning of the minute
  while MOD(UNIX_TIMESTAMP(),60) > 1 DO
     SELECT SLEEP(1);
  END WHILE;
END$$

DELIMITER ;

