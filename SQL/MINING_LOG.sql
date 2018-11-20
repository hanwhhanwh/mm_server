-- DROP TABLE IF EXISTS `MINING_LOG`;

CREATE TABLE `MINING_LOG`
(
	`mining_log_no` BIGINT NOT NULL AUTO_INCREMENT COMMENT '채굴로그 번호'
	, `mining_log_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '로그시각'
	, `miner_no` INT NOT NULL COMMENT '장비 번호'
	, `coin_no` INT NOT NULL COMMENT '코인 번호'
	, `pool_no` INT NOT NULL COMMENT '채굴풀 번호'
	, `miner_sw_no` INT NOT NULL COMMENT '채굴 S/W 번호'
	, `running_time` INT NOT NULL COMMENT '채굴 S/W 동작 시간 (분)'
	, `total_hash` FLOAT NOT NULL COMMENT '총해쉬 값'
	, `hash_unit` TINYINT NOT NULL COMMENT '해쉬 단위 : 0-H, 1-KH, 2-MH, 3-GH'
	, `submitted_shares` INT NOT NULL COMMENT '승인된 쉐어 수'
	, `invalid_shares` INT NOT NULL COMMENT '잘못된 쉐어 수'
	, `rejected_shares` INT NOT NULL COMMENT '거절된 쉐어 수'

	, PRIMARY KEY (`mining_log_no`)
)
COMMENT='채굴로그'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;


-- 채굴장비별 현황 확인을 위한 색인
CREATE INDEX IX_MINER_NO ON `MINING_LOG` ( `miner_no`, `coin_no`, `mining_log_no` );
