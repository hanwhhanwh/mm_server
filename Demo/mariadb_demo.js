/**
 * @summary MariaDB 연결 및 관련 예제
 * @author hbesthee@naver.com
 * @date 2018-11-21
 */

const net = require('net');
const mysql = require('mysql');

const config = require('../lib/config.json');
const logger = require('../lib/logger.js');

