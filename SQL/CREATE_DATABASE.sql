-- CREATE Miner monitor server DataBase
CREATE DATABASE `MM_SERVER`;

-- 신규 사용자 계정 'mm_server' 생성
CREATE USER 'mm_server'@'localhost' IDENTIFIED BY 'mm_server!23$';

-- 신규 사용자 계정 'mm_server'에 MM_SERVER DB에 대한 모든 권한 부여
GRANT ALL PRIVILEGES ON MM_SERVER.* TO 'mm_server'@'localhost';

FLUSH PRIVILEGES;


SHOW GRANTS FOR 'mm_server'@'localhost';