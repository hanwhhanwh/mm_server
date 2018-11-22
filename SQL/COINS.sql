-- DROP TABLE IF EXISTS `COINS`;

CREATE TABLE IF NOT EXISTS `COINS`
(
	`coin_no` INT	NOT NULL AUTO_INCREMENT COMMENT '코인번호'
	, `coin_name` VARCHAR (50) NOT NULL COMMENT '이름	'
	, `coin_acronym` VARCHAR (10) NOT NULL COMMENT '코인 약어(Monero = XMR)'
	, `hash_unit` TINYINT NOT NULL COMMENT '해쉬 단위 : 0-H, 1-KH, 2-MH, 3-GH'
	, `homepage` VARCHAR (200) NULL COMMENT '홈페이지'
	, `miner_sw` VARCHAR(200) NULL COMMENT '대표적인 채굴 S/W'
	, `reg_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '코인정보 등록시각'
	, `mod_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '코인정보 정보 수정시각'

	, PRIMARY KEY (`coin_no`)
)
COMMENT='코인정보 관리 테이블'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;

INSERT INTO `COINS` ( coin_name, coin_acronym, hash_unit, miner_sw ) VALUES 
		( '이더리움(Ethereum)', 'ETH', 1, 'ethminer' )
		, ( '모네로(Monero)', 'XMR', 0, 'xmr-stak' )
		, ( '비트코인 노바(Bitcoin Nova)', 'BTN', 0, 'xmr-stak' )
		, ( '이더소셜(Ethersocial)', 'ESC', 1, 'ethminer' )
		, ( '칼리스토(Calisto)', 'CLO', 1, 'ethminer' )
		, ( 'Blood Donation Coin-Brazilian Coin', 'BBRC', 0, 'xmr-stak' )
		;