var express = require('express');
var router = express.Router();
var ie = require('../models/interviewexperience_model');

router.get('/:sid?/:oid?', function (req, res, next) {

  if (req.params.sid && req.params.oid) {

    ie.getExperienceBySidOid(req.params.oid, req.params.sid, function (err, rows) {

      if (err) {
        res.json(err);
      }
      else {
        res.json(rows);
      }
    });
  }
  else {

    ie.getAllExperience(function (err, rows) {

      if (err) {
        res.json(err);
      }
      else {
        res.json(rows);
      }

    });
  }
});

router.post('/', function (req, res, next) {

  ie.addInterviewExperience(req.body, function (err, result) {
    if (err) {
      res.json(err);
    }
    else {
      res.json(req.body);
      //res.end(JSON.stringify(result));
      //https://www.9lessons.info/2017/02/create-restful-api-nodejs-mysql.html  
    }
  });
});

router.delete('/:sid?/:oid?', function (req, res, next) {

  ie.deleteInterviewExperience(req.params.oid, req.params.sid, function (err, count) {

    if (err) {
      res.json(err);
    }
    else {
      res.json(count);
    }

  });
});
router.put('/:sid?/:oid?', function (req, res, next) {

  IE.updateInterviewExperience(req.params.oid, req.params.sid, req.body, function (err, rows) {

    if (err) {
      res.json(err);
    }
    else {
      res.status(200).json(rows);
    }
  });
});
module.exports = router;