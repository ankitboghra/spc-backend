var db = require('../dbconnection'); //reference of dbconnection.js

var ie = {

    getAllExperience: function (callback) {

        return db.query("select * from tblInterviewExperience", callback);

    },
    getExperienceBySidOid: function (oid, sid, callback) {

        return db.query("select * from tblInterviewExperience where interviewExperience_OpeningId=? and interviewExperience_StudentId=?", [oid, sid], callback);
    },
    addInterviewExperience: function (ques, callback) {

        return db.query("INSERT INTO `tblinterviewexperience`(`interviewExperience_StudentId`, `interviewExperience_OpeningId`, `interviewExperience_Description`, `interviewExperience_ApprovedBy`, `interviewExperience_Time`) VALUES (?,?,?,?,?)",
            [ie.interviewExperience_StudentId, ie.interviewExperience_OpeningId, ie.interviewExperience_Description, ie.interviewExperience_ApprovedBy, ie.interviewExperience_Time], callback);

    },
    deleteInterviewExperience: function (oid, sid, callback) {
        return db.query("DELETE FROM `tblinterviewexperience` WHERE interviewExperience_OpeningId=? AND interviewExperience_StudentId=?", [oid, sid], callback);
    },

    updateInterviewExperience: function (id, prog, callback) {
        return db.query("UPDATE `tblinterviewexperience` SET `interviewExperience_Description`=?,`interviewExperience_ApprovedBy`=?,`interviewExperience_Time`=? WHERE interviewExperience_OpeningId=? AND interviewExperience_StudentId=?",
            [ie.interviewExperience_Description, ie.interviewExperience_ApprovedBy, ie.interviewExperience_Time, ie.interviewExperience_OpeningId, ie.interviewExperience_StudentId], callback);
    }
};
module.exports = ie;