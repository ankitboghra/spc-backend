var express = require('express');
var router = express.Router();
var sprofile=require('../models/studentProfile_model');

router.get('/:id?',function(req,res,next){

    if(req.params.id){
 
        sprofile.getStudentProfileById(req.params.id,function(err,rows){
         
            if(err)
            {
            res.json(err);
            }
            else{
            res.json(rows);
            }
        });
    }else{
         
        sprofile.getAllStudentProfile(function(err,rows){
         
            if(err)
            {
                res.json(err);
            }
            else
            {
                res.json(rows);
            }
         
        });
    }
});

router.post('/',function(req,res,next){

    sprofile.addStudentProfile(req.body,function(err,count){
        if(err)
        {
            res.json(err);
        }
        else
        {
            res.json(req.body);
        }
    });
});

router.delete('/:id',function(req,res,next){
 
    sprofile.deleteStudentProfile(req.params.id,function(err,count){
    
        if(err)
        {
            res.json(err);
        }
        else
        {
            res.json(count);
        }
    
    });
});
router.put('/:id',function(req,res,next){
 
    sprofile.updateStudentProfile(req.params.id,req.body,function(err,rows){
        
        if(err)
        {
            res.json(err);
        }
        else
        {
            res.status(200).json(rows);
        }
    });
});
module.exports = router;