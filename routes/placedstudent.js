var express = require('express');
var router = express.Router();
var pst = require('../models/placedstudent_model');

// router.get('/:oid/:sid', function (req, res, next) {
router.get('/:oid?/:sid?', function (req, res, next) {

    if (req.params.oid && req.params.sid) {

        pst.getByOpeningIdStudentId.getQueById(req.params.oid, req.params.sid, function (err, rows) {

            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }
    else {

        pst.getAllstudent(function (err, rows) {

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

    pst.addPlacedStudent(req.body, function (err, result) {
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

router.delete('/:oid?/:sid?', function (req, res, next) {

    pst.deletePlacedStudent(req.params.oid, req.params.sid, function (err, count) {

        if (err) {
            res.json(err);
        }
        else {
            res.json(count);
        }

    });
});
router.put('/:oid?/:sid?', function (req, res, next) {

    pst.updatePlacedStudent(req.params.oid, req.params.sid, function (err, rows) {

        if (err) {
            res.json(err);
        }
        else {
            res.status(200).json(rows);
        }
    });
});
module.exports = router;