var db = require('../dbconnection'); //reference of dbconnection.js

var ques = {

    getAllque: function (callback) {

        return db.query("SELECT * FROM `tblquestion`", callback);

    },
    getQueById: function (id, callback) {

        return db.query("SELECT * FROM `tblquestion` WHERE question_Id=?", [id], callback);
    },
    addQue: function (ques, callback) {

        return db.query("INSERT INTO `tblquestion`(`question_Title`, `question_Description`, `question_Solution`, `question_DifficultyLevel`, `question_IsActive`, `question_CreatorUserId`, `question_ApprovedByUserId`) VALUES (?,?,?,?,?,?,?)",
            [ques.question_Title, ques.question_Description, ques.question_Solution, ques.question_DifficultyLevel, ques.question_IsActive, ques.question_CreatorUserId, ques.question_ApprovedByUserId], callback);
    },
    deleteQue: function (id, callback) {
        return db.query("DELETE FROM `tblquestion` WHERE question_Id=?", [id], callback);
    },

    updateQue: function (id, ques, callback) {
        return db.query("UPDATE `tblquestion` SET `question_Title`=?,`question_Description`=?,`question_Solution`=?,`question_DifficultyLevel`=?,`question_IsActive`=?,`question_CreatorUserId`=?,`question_ApprovedByUserId`=? WHERE question_Id=?",
            [ques.question_Title, ques.question_Description, ques.question_Solution, ques.question_DifficultyLevel, ques.question_IsActive, ques.question_CreatorUserId, ques.question_ApprovedByUserId, id], callback);
    }
};
module.exports = ques;
