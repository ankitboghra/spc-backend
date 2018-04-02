-- Dependency on
-- tblCompany
-- tblQuestion

CREATE TABLE IF NOT EXISTS tblCompanyQuestion (
    companyQuestion_QuestionId int NOT NULL,
    companyQuestion_CompanyId int NOT NULL,
    FOREIGN KEY (companyQuestion_QuestionId) REFERENCES tblQuestion(question_Id),
    FOREIGN KEY (companyQuestion_CompanyId) REFERENCES tblCompany(company_Id),
    PRIMARY KEY (companyQuestion_QuestionId, companyQuestion_CompanyId)
);