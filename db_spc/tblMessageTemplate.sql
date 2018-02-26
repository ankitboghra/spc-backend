-- Dependency on
--  tblUser

CREATE TABLE IF NOT EXISTS tblMessageTemplate (
    -- tblMessageTemplate_Id INT NOT NULL AUTO_INCREMENT,
    tblMessageTemplate_UserId VARCHAR(9) NOT NULL,
    tblMessageTemplate_MessageContent TEXT,
    FOREIGN KEY (tblMessageTemplate_UserId) REFERENCES tblUser(user_StudentId),
    PRIMARY KEY (tblMessageTemplate_UserId)
);
