var express = require('express');
var router = express.Router();
var changePassword = require('../models/changePassword_model');
router.get('/:id?', function (req, res, next) {

  if (req.params.id) {

    changePassword.getUserById(req.params.id, function (err, rows) {

      if (err) {
        res.json(err);
      }
      else {
        res.json(rows);
      }
    });
  }
  else {

    changePassword.getAllUser(function (err, rows) {

      if (err) {
        res.json(err);
      }
      else {
        res.json(rows);
      }

    });
  }
});

router.put('/:id', function (req, res, next) {

  changePassword.updatePassword(req.params.id, req.body, function (err, rows) {

    if (err) {
      res.json(err);
    }
    else {
      res.status(200).json(rows);
    }
  });
});

module.exports = router;