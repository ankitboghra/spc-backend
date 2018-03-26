var express = require('express');
var router = express.Router();
var areaofinterest=require('../models/areaofinterest_model');

router.get('/:id?',function(req,res,next){
 
if(req.params.id){
 
areaofinterest.getareaofinterestById(req.params.id,function(err,rows){
 
if(err)
  {
  res.json(err);
  }
  else{
  res.json(rows);
  }
  });
 }
 else{
 
areaofinterest.getAllareaofinterest(function(err,rows){
 
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

areaofinterest.addareaofinterest(req.body,function(err,count){
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
 
areaofinterest.deleteareaofinterest(req.params.id,function(err,count){
 
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
 
areaofinterest.updateareaofinterest(req.params.id,req.body,function(err,rows){
 
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