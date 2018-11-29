-- DROP TABLE IF EXISTS `MINERS`;

CREATE TABLE IF NOT EXISTS `MINERS`
(
	`miner_no` INT NOT NULL AUTO_INCREMENT COMMENT '장비 번호'
	, `miner_name` VARCHAR(100) NOT NULL COMMENT '장비 이름'
	, `miner_ip` INT UNSIGNED NOT NULL COMMENT '장비 IP'
	, `reg_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '장비 등록시각'
	, `mod_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '장비 정보 수정시각'
	, `miner_spec` LONGTEXT NULL DEFAULT NULL COMMENT '장비 상세 사양'

	, PRIMARY KEY (`miner_no`)
)
COMMENT='장비 정보 관리 테이블'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

INSERT INTO `MINERS` ( miner_name, miner_ip, reg_date, mod_date, miner_spec ) VALUES 
		( 'miner #00', INET_ATON('192.168.0.100'), NOW(), NOW(), NULL )
		, ( 'miner #01', INET_ATON('192.168.0.101'), NOW(), NOW(), NULL )
		, ( 'miner #02', INET_ATON('192.168.0.102'), NOW(), NOW(), NULL )
		, ( 'miner #03', INET_ATON('192.168.0.103'), NOW(), NOW(), NULL )
		;