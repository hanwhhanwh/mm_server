/**
 * @summary Mining Monitor Server : express 생성 및 초기화 처리를 위한 모듈
 * @author hbesthee@naver.com
 * @date 2018-11-21
 */
"use strict"


const path = require('path')
    , http = require('http')
    , express = require('express')
    , bodyParser = require('body-parser')
    , cookieParser = require('cookie-parser')
    , expressSession = require('express-session')
    , expressErrorHandler = require('express-error-handler')
    , multer = require('multer') // multi-part form 지원
    , fs = require('fs') // 파일 시스템
    , cors = require('cors') // ajax 요청했을 때, CORS(다중 서버 접속) 지원
    , serveStatic = require('serve-static');

let config = require("./config.json");

let app = express();

// view engine setup
app.set('views', path.join(__dirname, '../views'));
app.set('view engine', 'ejs');
    
const router = require('./router.js');



//// express middle-ware loading...
app.use(cookieParser());
app.use(cors());
app.use(bodyParser.urlencoded( { extended: false } ));
app.use(bodyParser.json());
app.use(serveStatic(path.join(__dirname, '../public')));
//console.log('root = ' + path.join(__dirname, '../public'));

app.use(expressSession({
    secret: 'wisun#!$()_*#@',
    resave: false,
    saveUninitialized: true
}));

app.use('/', router);

// let errorHandler = expressErrorHandler( {
//     static: {
//         '404': '/public/404.html'
//     }
// })

// app.use(expressErrorHandler.httpError(404));
// app.use(errorHandler);

app.all('/', function(req, res, next) {
    // set origin policy etc so cross-domain access wont be an issue
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With,  Content-Type, Accept");
    if ( ((res.statusCode >= 400) && (res.statusCode < 600)) )
    {
        res.setHeader('Content-Type', 'text/html; charset=utf8');
        logger.error('Express error : ' + res.statusCode);
    }

    next();
});

// init express
app.set('port', process.env.PORT || config.host_port);



module.exports = app;