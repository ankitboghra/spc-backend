var express = require('express');
var router = express.Router();
var ir = require('../models/interviewround_model');

router.get('/:id?', function (req, res, next) {

    if (req.params.id) {

        ir.getDetailById(req.params.id, function (err, rows) {

            if (err) {
                res.json(err);
            }
            else {
                res.json(rows);
            }
        });
    }
    else {

        ir.getAllRoundDetails(function (err, rows) {

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

    ir.addRound(req.body, function (err, result) {
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

router.delete('/:id', function (req, res, next) {

    ir.deleteRound(req.params.id, function (err, count) {

        if (err) {
            res.json(err);
        }
        else {
            res.json(count);
        }

    });
});
router.put('/:id', function (req, res, next) {

    ir.updateRound(req.params.id, function (err, rows) {

        if (err) {
            res.json(err);
        }
        else {
            res.status(200).json(rows);
        }
    });
});
module.exports = router;