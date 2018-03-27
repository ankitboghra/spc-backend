var db = require('../dbconnection'); //reference of dbconnection.js

var ird = {

    getRoundDetails: function (callback) {

        return db.query("SELECT * FROM `tblinterviewrounddetail`", callback);

    },
    getDetailByRoundId: function (rid, callback) {

        return db.query("SELECT * FROM `tblinterviewrounddetail` WHERE interviewRoundDetail_InterviewRoundId=?", [rid], callback);
    },
    getDetailByRoundIdStudId: function (rid, sid, callback) {

        return db.query("SELECT * FROM `tblinterviewrounddetail` WHERE interviewRoundDetail_InterviewRoundId=?, interviewRoundDetail_StudentId=?", [rid, sid], callback);
    },
    addRoundDetail: function (callback) {
        //Do not pass RoundId, Its auto incremented
        return db.query("INSERT INTO `tblinterviewrounddetail`(`interviewRoundDetail_InterviewRoundId`, `interviewRoundDetail_StudentId`, `interviewRoundDetail_Status`) VALUES (?,?,?)",
            [ird.interviewRoundDetail_InterviewRoundId, ird.interviewRoundDetail_StudentId, ird.interviewRoundDetail_Status], callback);
    },
    deleteStudentFromRound: function (rid, sid, callback) {
        return db.query("DELETE FROM `tblinterviewrounddetail` WHERE interviewRoundDetail_InterviewRoundId=? AND interviewRoundDetail_StudentId=?", [rid, sid], callback);
    },

    updateStatus: function (rid, sid, callback) {
        return db.query("UPDATE `tblinterviewrounddetail` SET `interviewRoundDetail_Status`=? WHERE `interviewRoundDetail_InterviewRoundId`=?,`interviewRoundDetail_StudentId`=?",
            [ird.interviewRoundDetail_Status, rid, sid], callback);
    }
};
module.exports = ird;