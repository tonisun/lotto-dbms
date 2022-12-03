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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

-- INSERT Test
INSERT INTO `ej_draw` (`date`, `n1`, `n2`, `n3`, `n4`, `n5`, `en1`, `en2`) VALUES 
(now(), 1, 2, 3, 4, 5, 12, 11);





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
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4;

CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_set_ej_all_rows`()
BEGIN
	DECLARE v_from INT DEFAULT 0;
    DECLARE v_n1 INT DEFAULT 0;
    DECLARE v_n2 INT DEFAULT 0;
    DECLARE v_n3 INT DEFAULT 0;
    DECLARE v_n4 INT DEFAULT 0;
    DECLARE v_n5 INT DEFAULT 0;
    
    SET v_from = 50;
    SET v_n1 = 1;

	L1: LOOP		
		IF v_n1 <= (v_from - 4) THEN
			SET v_n2 = v_n1 + 1;
			L2: LOOP
				IF v_n2 <= (v_from - 3) THEN
					SET v_n3 = v_n2 + 1;
					L3: LOOP
						IF v_n3 <= (v_from - 2) THEN
							SET v_n4 = v_n3 + 1;
							L4: LOOP
								IF v_n4 <= (v_from - 1) THEN
									SET v_n5 = v_n4 + 1;  
									L5: LOOP
										IF v_n5 <= v_from THEN
											INSERT INTO ej_lotto.ej_row (n1, n2, n3, n4, n5) VALUES (v_n1, v_n2, v_n3, v_n4, v_n5);
                                            SET v_n5 = v_n5 + 1;
										ELSE
											LEAVE L5;
										END IF;
									END LOOP;
                                    SET v_n4 = v_n4 + 1;
								ELSE
									LEAVE L4;
								END IF;
							END LOOP;
                            SET v_n3 = v_n3 + 1;
						ELSE
							LEAVE L3;
						END IF;
					END LOOP;
                    SET v_n2 = v_n2 + 1;
				ELSE
					LEAVE L2;
				END IF;
			END LOOP; 
            SET v_n1 = v_n1 + 1;
		ELSE
			LEAVE L1;
		END IF;
	END LOOP;
END