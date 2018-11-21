-- DROP TABLE IF EXISTS `MINING_LOG_DETAILS`;

CREATE TABLE `MINING_LOG_DETAILS`
(
	`mining_log_no` BIGINT NOT NULL AUTO_INCREMENT COMMENT '채굴로그 번호'
	, `index_no` INT NOT NULL COMMENT '순서 번호'
	, `hashrate` INT NOT NULL DEFAULT 0 COMMENT '해쉬 값'
	, `temperature` INT NOT NULL DEFAULT 0 COMMENT '온도값'
	, `fan_speed` INT NOT NULL DEFAULT 0 COMMENT '팬 속도 (%)'
	, `power` INT NOT NULL DEFAULT 0 COMMENT '사용 전력값'

	, PRIMARY KEY (`mining_log_no`, `index_no`)
)
COMMENT='채굴 상세 로그'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;
