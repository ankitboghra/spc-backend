var express = require('express');
var router = express.Router();
var forgot = require('../models/forgotpassword_model');

router.get('/:id?', function (req, res, next) {

  if (req.params.id) {

    forgot.getforgotpassById(req.params.id, function (err, rows) {

      if (err) {
        res.json(err);
      }
      else {
        res.json(rows);
      }
    });
  }
  else {

    forgot.getAllforgotpass(function (err, rows) {

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

  forgot.addforgotpass(req.body, function (err, count) {
    if (err) {
      res.json(err);
    }
    else {
      res.json(req.body);
    }
  });
});


router.put('/:id', function (req, res, next) {

  forgot.updateforgotpass(req.params.id, req.body, function (err, rows) {

    if (err) {
      res.json(err);
    }
    else {
      res.status(200).json(rows);
    }
  });
});
module.exports = router;