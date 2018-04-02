var db = require('../dbconnection'); //reference of dbconnection.js

var ir = {

    getAllRoundDetails: function (callback) {
        return db.query("SELECT * FROM `tblinterviewround`", callback);
    },
    getDetailById: function (id, callback) {
        return db.query("SELECT `interviewRound_Id`, `interviewRound_JobOpeningId`, `interviewRound_RoundNumber`, `interviewRound_Description`, `interviewRound_Timestamp` FROM `tblinterviewround` WHERE interviewRound_Id=?", [id], callback);
    },
    addRound: function (callback) {
        //Do not pass RoundId, Its auto incremented
        return db.query("INSERT INTO `tblinterviewround`(`interviewRound_JobOpeningId`, `interviewRound_RoundNumber`, `interviewRound_Description`, `interviewRound_Timestamp`) VALUES (?,?,?,?)",
            [ir.interviewRound_JobOpeningId, ir.interviewRound_RoundNumber, ir.interviewRound_Description, ir.interviewRound_Timestamp], callback);
    },
    deleteRound: function (id, callback) {
        return db.query("DELETE FROM `tblinterviewround` WHERE interviewRound_Id=?", [id], callback);
    },
    updateRound: function (id, callback) {
        return db.query("UPDATE `tblinterviewround` SET `interviewRound_JobOpeningId`=?,`interviewRound_RoundNumber`=?,`interviewRound_Description`=?,`interviewRound_Timestamp`=? WHERE interviewRound_Id=?",
            [ir.interviewRound_JobOpeningId, ir.interviewRound_RoundNumber, ir.interviewRound_Description, ir.interviewRound_Timestamp, id], callback);
    }
};
module.exports = ir;