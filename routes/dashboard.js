/**
 * @summary Mining Monitor Server : dashboard route
 * @file	dashboard.js
 * @author hbesthee@naver.com
 * @date 2018-11-30
 */

var express = require('express');
var router = express.Router();

/* GET Dashboard page. */
router.get('/dashboard', function(req, res, next) {
  res.render('dashboard', { title: 'Mining Monitor Server - Dashboard' });
});

module.exports = router;
