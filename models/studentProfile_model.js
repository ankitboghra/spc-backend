var db = require('../dbconnection'); //reference of dbconnection.js

var sprofile = {

    getAllStudentProfile: function (callback) {
        return db.query("Select * from tbluser", callback);
    },
    getStudentProfileById: function (id, callback) {
        return db.query("select * from tbluser where user_Id=?", [id], callback);
    },
    addStudentProfile: function (sprofile, callback) {
        return db.query("INSERT INTO tbluser (user_StudentId, user_TypeFlag, user_FirstName, user_MiddleName, user_LastName, user_Password, user_DateOfBirth, user_Gender, user_ContactNo, user_EmailId, user_AddressPermanent, user_AddressCurrent, user_ProgramId, user_JoinDate, user_SscYear, user_HscYear, user_QualifyingBoard, user_QualifyingPercentage, user_QualifyingDegree, user_Stream, user_Cpi, user_CurrentBacklog, user_TotalBacklog, user_IsPlaced, user_IsInterested, user_IsActive) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
            [sprofile.user_StudentId, sprofile.user_TypeFlag, sprofile.user_FirstName, sprofile.user_MiddleName, sprofile.user_LastName, sprofile.user_Password, sprofile.user_DateOfBirth, sprofile.user_Gender, sprofile.user_ContactNo, sprofile.user_EmailId, sprofile.user_AddressPermanent, sprofile.user_AddressCurrent, sprofile.user_ProgramId, sprofile.user_JoinDate, sprofile.user_SscYear, sprofile.user_HscYear, sprofile.user_QualifyingBoard, sprofile.user_QualifyingPercentage, sprofile.user_QualifyingDegree, sprofile.user_Stream, sprofile.user_Cpi, sprofile.user_CurrentBacklog, sprofile.user_TotalBacklog, sprofile.user_IsPlaced, sprofile.user_IsInterested, sprofile.user_IsActive], callback);
    },
    deleteStudentProfile: function (id, callback) {
        return db.query("delete from tbluser where company_Id=?", [id], callback);
    },
    updateStudentProfile: function (id, sprofile, callback) {
        return db.query("update tbluser set user_TypeFlag=?, user_FirstName=?, user_MiddleName=?, user_LastName=?, user_Password=?, user_DateOfBirth=?, user_Gender=?, user_ContactNo=?, user_EmailId=?, user_AddressPermanent=?, user_AddressCurrent=?, user_ProgramId=?, user_JoinDate=?, user_SscYear=?, user_HscYear=?, user_QualifyingBoard=?, user_QualifyingPercentage=?, user_QualifyingDegree=?, user_Stream=?, user_Cpi=?, user_CurrentBacklog=?, user_TotalBacklog=?, user_IsPlaced=?, user_IsInterested=?, user_IsActive=? where user_StudentId=?",
            [sprofile.user_StudentId, sprofile.user_TypeFlag, sprofile.user_FirstName, sprofile.user_MiddleName, sprofile.user_LastName, sprofile.user_Password, sprofile.user_DateOfBirth, sprofile.user_Gender, sprofile.user_ContactNo, sprofile.user_EmailId, sprofile.user_AddressPermanent, sprofile.user_AddressCurrent, sprofile.user_ProgramId, sprofile.user_JoinDate, sprofile.user_SscYear, sprofile.user_HscYear, sprofile.user_QualifyingBoard, sprofile.user_QualifyingPercentage, sprofile.user_QualifyingDegree, sprofile.user_Stream, sprofile.user_Cpi, sprofile.user_CurrentBacklog, sprofile.user_TotalBacklog, sprofile.user_IsPlaced, sprofile.user_IsInterested, sprofile.user_IsActive, id], callback);
    }
};
module.exports = sprofile;