-- Dependency on
--  tblCompany
--  tblJobProfile

CREATE TABLE IF NOT EXISTS tblCompanyJobProfile (
    -- companyJobProfileId INT NOT NULL AUTO_INCREMENT,
    companyJobProfile_CompanyId int NOT NULL,
    companyJobProfile_JobProfileId int NOT NULL,
    CONSTRAINT constraintCompanyProfile UNIQUE (companyJobProfile_CompanyId, companyJobProfile_JobProfileId),
    FOREIGN KEY (companyJobProfile_CompanyId) REFERENCES tblCompany(company_Id),
    FOREIGN KEY (companyJobProfile_JobProfileId) REFERENCES tblJobProfile(jobProfile_Id),
    PRIMARY KEY (companyJobProfile_CompanyId, companyJobProfile_JobProfileId)
    -- PRIMARY KEY (companyProfileId)
);
