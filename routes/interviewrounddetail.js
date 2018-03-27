var express = require('express');
var router = express.Router();
var ird = require('../models/interviewrounddetail_model');

router.get('/:rid?/:sid?', function (req, res, next) {

    if (req.params.rid && req.params.sid) {
        //Detail of a particular student of particular round
        ird.getDetailByRoundIdStudId(req.params.rid, req.params.sid, function (err, rows) {

            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }
    else if (req.params.rid) {
        //Details of all students of a Round

        ird.getDetailByRoundId(req.params.rid, function (err, rows) {

            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }
    else {
        //All rounds all students
        ird.getRoundDetails(function (err, rows) {

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

    ird.addRoundDetail(req.body, function (err, result) {
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

router.delete('/:rid/:sid', function (req, res, next) {

    ird.deleteStudentFromRound(req.params.id, function (err, count) {

        if (err) {
            res.json(err);
        }
        else {
            res.json(count);
        }

    });
});
router.put('/:rid/:sid', function (req, res, next) {

    ird.updateStatus(req.params.rid, req.params.sid, function (err, rows) {

        if (err) {
            res.json(err);
        }
        else {
            res.status(200).json(rows);
        }
    });
});
module.exports = router;