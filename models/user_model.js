var db=require('../dbconnection'); //reference of dbconnection.js
 
var user={
 
getAlluser:function(callback){
 
return db.query("Select * from tbluser",callback);
 
},
 getuserById:function(id,callback){
 
return db.query("select * from tbluser where user_StudentId=?",[id],callback);
 },
 
 adduser:function(user,callback){
 return db.query("Insert into tbluser(user_StudentId,user_TypeFlag,user_FirstName,user_MiddleName,user_LastName,user_Password,user_DateOfBirth,user_Gender,user_ContactNo,user_EmailId,user_AddressPermanent,user_AddressCurrent,user_ProgramId,user_JoinDate,user_SscYear,user_HscYear,user_QualifyingBoard,user_QualifyingPercentage,user_QualifyingDegree,user_Stream,user_Cpi,user_CurrentBacklog,user_TotalBacklog,user_IsPlaced,user_IsInterested,user_IsActive)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
 [user.user_StudentId,user.user_TypeFlag,user.user_FirstName,user.user_MiddleName,user.user_LastName,user.user_Password,user.user_DateOfBirth,user.user_Gender,user.user_ContactNo,user.user_EmailId,user.user_AddressPermanent,user.user_AddressCurrent,user.user_ProgramId,user.user_JoinDate,user.user_SscYear,user.user_HscYear,user.user_QualifyingBoard,user.user_QualifyingPercentage,user.user_QualifyingDegree,user.user_Stream,user.user_Cpi,user.user_CurrentBacklog,user.user_TotalBacklog,user.user_IsPlaced,user.user_IsInterested,user.user_IsActive],callback);
},

 deleteuser:function(id,callback){
  return db.query("delete from tbluser where user_StudentId=?",[id],callback);
 },

 updateuser:function(id,user,callback){
  return db.query("update tbluser set user_TypeFlag=?,user_FirstName=?,user_MiddleName=?,user_LastName=?,user_Password=?,user_DateOfBirth=?,user_Gender=?,user_ContactNo=?,user_EmailId=?,user_AddressPermanent=?,user_AddressCurrent=?,user_ProgramId=?,user_JoinDate=?,user_SscYear=?,user_HscYear=?,user_QualifyingBoard=?,user_QualifyingPercentage=?,user_QualifyingDegree=?,user_Stream=?,user_Cpi=?,user_CurrentBacklog=?,user_TotalBacklog=?,user_IsPlaced=?,user_IsInterested=?,user_IsActive=? where user_StudentId=?",
  [user.user_TypeFlag,user.user_FirstName,user.user_MiddleName,user.user_LastName,user.user_Password,user.user_DateOfBirth,user.user_Gender,user.user_ContactNo,user.user_EmailId,user.user_AddressPermanent,user.user_AddressCurrent,user.user_ProgramId,user.user_JoinDate,user.user_SscYear,user.user_HscYear,user.user_QualifyingBoard,user.user_QualifyingPercentage,user.user_QualifyingDegree,user.user_Stream,user.user_Cpi,user.user_CurrentBacklog,user.user_TotalBacklog,user.user_IsPlaced,user.user_IsInterested,user.user_IsActive,id],callback);
 }
 
};
 module.exports=user;