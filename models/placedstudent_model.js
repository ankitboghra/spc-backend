var db = require('../dbconnection'); //reference of dbconnection.js

var pst = {

    getAllPlacedStudent: function (callback) {

        return db.query("select * from tblPlacedStudent", callback);

    },
    getByOpeningIdStudentId: function (oid, sid, callback) {

        return db.query("select * from tblPlacedStudent where placedStudent_OpeningId=? and placedStudent_StudentId=?", [oid, sid], callback);
    },
    addPlacedStudent: function (ques, callback) {

        return db.query("INSERT INTO `tblPlacedStudent`(`placedStudent_OpeningId`, `placedStudent_StudentId`, `placedStudent_PackageOffered`, `placedStudent_DateOfOffer`, `placedStudent_Position`, `placedStudent_IsPpoOffered`, `placedStudent_IsOfferAccepted`) VALUES (?,?,?,?,?,?,?)",
            [pst.placedStudent_OpeningId, pst.placedStudent_StudentId, pst.placedStudent_PackageOffered, pst.placedStudent_DateOfOffer, pst.placedStudent_Position, pst.placedStudent_IsPpoOffered, pst.placedStudent_IsOfferAccepted], callback);
            
    },
    deletePlacedStudent: function (oid, sid, callback) {
        return db.query("delete from tblPlacedStudent where placedStudent_OpeningId=? and placedStudent_StudentId=?", [oid, sid], callback);
    },

    updatePlacedStudent: function (id, prog, callback) {
        return db.query("update tblPlacedStudent set `placedStudent_PackageOffered`=?, `placedStudent_DateOfOffer`=?, `placedStudent_Position`=?, `placedStudent_IsPpoOffered`=?, `placedStudent_IsOfferAccepted`=?  where `placedStudent_OpeningId`=?, `placedStudent_StudentId`=?",
        [pst.placedStudent_PackageOffered, pst.placedStudent_DateOfOffer, pst.placedStudent_Position, pst.placedStudent_IsPpoOffered, pst.placedStudent_IsOfferAccepted, pst.placedStudent_OpeningId, pst.placedStudent_StudentId], callback);
    }
};
module.exports = pst;