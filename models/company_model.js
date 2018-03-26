var db=require('../dbconnection'); //reference of dbconnection.js
 
var company={
 
    getAllCompany:function(callback){    
        return db.query("Select * from tblcompany",callback);    
    },
    getCompanyById:function(id,callback){    
        return db.query("select * from tblcompany where company_Name=?",[id],callback);
    },
    addCompany:function(company,callback){
     return db.query("Insert into tblcompany(company_Name,company_Address,company_Email,company_CEO,company_Founder,company_Website,company_Information,company_IsActive)values(?,?,?,?,?,?,?,?)",
     [company.company_Name,company.company_Address,company.company_Email,company.company_CEO,company.company_Founder,  company.company_Website,company.company_Information,company.company_IsActive],callback);
     },
     deleteCompany:function(id,callback){
      return db.query("delete from tblcompany where company_Id=?",[id],callback);
     },
    updateCompany:function(id,company,callback){
      return db.query("update tblcompany set company_Name=?,company_Address=?,company_Email=?,company_CEO=?,company_Founder=?,company_Website=?,company_Information=?,company_IsActive=? where company_Id=?",
      [company.company_Name,company.company_Address,company.company_Email,company.company_CEO,company.company_Founder,  company.company_Website,company.company_Information,company.company_IsActive,id],callback);
     }
    
};
 module.exports=company;