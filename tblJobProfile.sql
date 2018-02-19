-- No dependency
-- Insert one job profile as "Unclassified"

CREATE TABLE IF NOT EXISTS tblJobProfile (
    jobProfile_Id INT NOT NULL AUTO_INCREMENT,
    jobProfile_Name varchar(255) NOT NULL,
    PRIMARY KEY (jobProfile_Id)
);
