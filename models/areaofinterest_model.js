var db=require('../dbconnection'); //reference of dbconnection.js
 
var areaofinterest={
 
getAllareaofinterest:function(callback){
 
return db.query("Select * from tblareaofinterest",callback);
 
},
 getareaofinterestById:function(id,callback){
 
return db.query("select * from tblareaofinterest where areaOfInterest_Id=?",[id],callback);
 },
 addareaofinterest:function(areaofinterest,callback){
 return db.query("Insert into tblareaofinterest(areaOfInterest_StudentId,areaOfInterest_JobProfileId,areaOfInterest_Weight)values(?,?,?)",
 [areaofinterest.areaOfInterest_StudentId,areaofinterest.areaOfInterest_JobProfileId,areaofinterest.areaOfInterest_Weight],callback);
 },
 deleteareaofinterest:function(id,callback){
  return db.query("delete from tblareaofinterest where areaOfInterest_Id=?",[id],callback);
 },

 updateareaofinterest:function(id,areaofinterest,callback){
  return db.query("update tblareaofinterest set areaOfInterest_StudentId=?,areaOfInterest_JobProfileId=?,areaOfInterest_Weight=? where areaOfInterest_Id=?",
  [areaofinterest.areaOfInterest_StudentId,areaofinterest.areaOfInterest_JobProfileId,areaofinterest.areaOfInterest_Weight,id],callback);
 }
 
};
 module.exports=areaofinterest;