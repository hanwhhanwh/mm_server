/**
 * @summary Mining Monitor Server : main index route
 * @author hbesthee@naver.com
 * @date 2018-11-30
 */

var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Mining Monitor Server' });
});

module.exports = router;
