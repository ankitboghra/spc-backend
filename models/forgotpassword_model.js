var db=require('../dbconnection'); //reference of dbconnection.js
 
var forgotpass={
 
getAllforgotpass:function(callback){
 
return db.query("Select * from tblpasswordreset",callback);
 
},
 getforgotpassById:function(id,callback){
 
return db.query("select * from tblpasswordreset where passwordReset_StudentId=?",[id],callback);
 },
 addforgotpass:function(forgotpass,callback){
 return db.query("Insert into tblpasswordreset(passwordReset_StudentId,passwordReset_Otp,passwordReset_Timestamp)values(?,?,?)",
 [forgotpass.passwordReset_StudentId,forgotpass.passwordReset_Otp,forgotpass.passwordReset_Timestamp],callback);
},

 updateforgotpass:function(id,forgotpass,callback){
  return db.query("update tblpasswordreset set passwordReset_Otp=?,passwordReset_Timestamp=? where passwordReset_StudentId=?",
  [forgotpass.passwordReset_Otp,forgotpass.passwordReset_Timestamp,id],callback);
 }
 
};
 module.exports=forgotpass;