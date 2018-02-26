-- No dependency

CREATE TABLE IF NOT EXISTS tblCompany (
    company_Id INT NOT NULL AUTO_INCREMENT,
    company_Name varchar(80) NOT NULL UNIQUE,
    company_Address TEXT,
    company_Email varchar(60),
    company_CEO varchar(60),
    company_Founder varchar(60),
    company_Website varchar(40),
    company_Information TEXT,
    company_IsActive bool NOT NULL DEFAULT 0,
        -- 1=Active; 2=Not active
    -- company_IsApproved boolean,
    PRIMARY KEY (company_Id)
);
