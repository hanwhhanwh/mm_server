/**
 * @summary WiSun 중계기 서버 Lib : 로깅 처리를 위한 모듈
 * @author hanwh@hunature.net
 * @date 2018-07-14
 */

const fs = require('fs'); // 파일 시스템
const { createLogger, format, transports } = require('winston');
require('winston-daily-rotate-file');

const env = process.env.NODE_ENV || 'development';
const LOG_DIR = 'log';
const logDir = 'log';
const tsFormat = () => (new Date()).toLocaleTimeString();
const myFormat = format.combine(
    format.timestamp()
    , format.printf(info => `${info.timestamp} ${info.level}: ${info.message}`)
    //, format.colorize()
);


// winston 로깅 처리
if (!fs.existsSync(LOG_DIR)) {
    fs.mkdirSync(LOG_DIR);
};
  
const winstonDailyRotateFile = new (transports.DailyRotateFile)({
    filename: 'log/gateway-%DATE%.log',
    timestamep: tsFormat,
    datePattern: 'YYYYMMDD',
    handleExceptions: true,
    prepend: true,
    // format: format.combine( 
    //     format.splat()
    //     , format.json()
    // ), 
    format: myFormat,
    level: env === 'development' ? 'debug' : 'info',
    zippedArchive: true,
    maxSize: '20m',
    maxFiles: '30d'
});

const logger = createLogger({
    level: 'info'
    //, format: winstone.format.json()
    , transports: [
        new transports.Console({
                format: myFormat
                // format: format.combine( 
                //     format.splat()
                //     , format.simple()
                // )
                , handleExceptions: true
                , level: env === 'development' ? 'debug' : 'error'
            })
        , winstonDailyRotateFile
    ]
    , exitOnError: false, // do not exit on handled exceptions
});

// Call exceptions.handle with a transport to handle exceptions
// logger.exceptions.handle( [
//     new transports.File({
//         filename: 'log/exceptions.log'
//         , format: myFormat
//     })
//     , new transports.Console({
//         format: myFormat })
// ] );

module.exports = logger;