/**
 * @summary Mining Monitor 서버 메인 소스
 * @author hbesthee@naver.com
 * @date 2018-11-21
 */

const fs = require('fs');
const http = require('http');

let strConfigFileName = './lib/config.json';
if (!fs.existsSync(strConfigFileName)) { // config.json 파일이 없을 경우, 기본 설정 정보로 저장
    let objConfig = {
        "host_ip": "127.0.0.1"
        , "host_port": 8080
        , "adminId": "admin"
		, "adminPasswd": "mm_server!23$"
		, "db_host_ip": "127.0.0.1"
		, "db_host_port": 3306
		, "db_login_id": "mm_server"
		, "db_login_passwd": "mm_server!23$"
		, "db_name": "MM_SERVER"
    };
    fs.writeFileSync(strConfigFileName, JSON.stringify(objConfig, null, '\t'));
}

const app = require('./lib/express.js');
const logger = require('./lib/logger.js');


// start Mining Monitor web server
http.createServer(app).listen(app.get('port'), function() {
    logger.info('Started Mining Monitor server : ' + app.get('port'));
});
