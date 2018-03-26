var db = require('../dbconnection'); //reference of dbconnection.js

var prog = {

    getAllprog: function (callback) {

        return db.query("Select * from tblprogram", callback);

    },
    getprogById: function (id, callback) {

        return db.query("select * from tblprogram where program_Id=?", [id], callback);
    },

    addprog: function (prog, callback) {
        return db.query("Insert into tblprogram(program_Name,program_IsActive)values(?,?)",
            [prog.program_Name, prog.program_IsActive], callback);
    },
    deleteprog: function (id, callback) {
        return db.query("delete from tblprogram where program_Id=?", [id], callback);
    },

    updateprog: function (id, prog, callback) {
        return db.query("update tblprogram set program_Name=?,program_IsActive=? where program_Id=?",
            [prog.program_Name, prog.program_IsActive, id], callback);
    }

};
module.exports = prog;