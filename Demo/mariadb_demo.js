/**
 * @summary MariaDB 연결 및 관련 예제
 * @author hbesthee@naver.com
 * @date 2018-11-21
 */

const net = require('net');
const mysql = require('mysql');

const config = require('../lib/config.json');

var connection = mysql.createConnection({
	host: config.db_host_ip,
	port: config.db_host_port,
	user: config.db_login_id,
	password: config.db_login_passwd,
	database: config.db_name
});

connection.connect();

let strQuery = "\
SELECT \
	miner_no, miner_name, miner_ip, reg_date, mod_date, miner_spec \
FROM MINERS AS M \
WHERE 1 = 1\
	AND M.miner_name = ?\
;";

let objWhere = { miner_no: 2 };

console.log(strQuery);
connection.query(strQuery, ['miner #02'], function (err, rows, fields) {
	connection.end();
	if (!err) {
		console.log(rows);
		console.log(fields);
		var result = 'rows : ' + JSON.stringify(rows) + '<br><br>' +
			'fields : ' + JSON.stringify(fields);
		console.log(result);
	} else {
		console.log('query error : ' + err);
	}
});
