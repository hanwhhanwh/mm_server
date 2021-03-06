-- DROP TABLE IF EXISTS `USERS`;

CREATE TABLE IF NOT EXISTS `USERS`
(
	`user_no` SMALLINT NOT NULL AUTO_INCREMENT COMMENT '사용자 번호'
	, `user_id` VARCHAR(50) NOT NULL COMMENT '로그인 아이디'
	, `user_name` VARCHAR(100) NOT NULL COMMENT '사용자 이름'
	, `passwd` VARBINARY(128) NOT NULL COMMENT '비밀번호; 해쉬 함수 결과; SHA512'
	, `email` VARCHAR(50) NOT NULL COMMENT '이메일'
	, `phone` VARCHAR(20) NOT NULL COMMENT '핸드폰'
	, `level` TINYINT NOT NULL COMMENT '권한 레벨'
	, `reg_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '사용자 등록시각'
	, `mod_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '사용자 정보 수정시각'
	, `etc` MEDIUMTEXT NULL COMMENT '기타 부가 정보'

	, PRIMARY KEY (`user_no`)
)
COMMENT='사용자 정보'
COLLATE='utf8_general_ci'
ENGINE=InnoDB;


INSERT INTO `USERS` ( `user_id`, `user_name`, `passwd`, `email`, `phone`, `level`, `reg_date`, `mod_date` ) VALUES 
		( 'admin', 'Administrator', password( '(admin_2018)' ), 'hbesthee@naver.com', '000-0000-0000', 1, NOW(), NOW() )
;