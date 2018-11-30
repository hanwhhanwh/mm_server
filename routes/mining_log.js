/**
 * @summary Mining Monitor Server : mining_log route
 * @file	mining_log.js
 * @author hbesthee@naver.com
 * @date 2018-11-30
 */

var express = require('express');
var router = express.Router();

/** POST: MINING_LOG insert 
 * POST로 받은 JSON 데이터를 파싱하여 MINING_LOG 및 MINING_LOG_DETAILS 테이블에 추가합니다.
*/
router.post('/mining_log', function(req, res, next) {
	res.render('index', { title: 'Mining Monitor Server' });
});


/**	대시보드 */
router.get('/mining_log', function(req, res, next) {
	res.render('mining_log', { title: 'Mining Monitor Server - Mining Log' });
});
  
  module.exports = router;
