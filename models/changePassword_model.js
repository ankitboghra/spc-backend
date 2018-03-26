var db=require('../dbconnection'); //reference of dbconnection.js
 
var changePassword={
  updatePassword:function(id,changePassword,callback){
  return db.query("update tbluser set user_Password=? where user_StudentId=?",[changePassword.user_Password,id],callback);
 },
 getAllUser:function(callback){
 
    return db.query("Select * from tbluser",callback);
     
    },
    getUserById:function(id,callback){
 
        return db.query("select * from tbluser where user_StudentId=?",[id],callback);
         }
};
 module.exports = changePassword;