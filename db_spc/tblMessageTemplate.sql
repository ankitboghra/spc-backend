-- Dependency on
--  tblUser

CREATE TABLE IF NOT EXISTS tblMessageTemplate (
    messageTemplate_Id INT NOT NULL AUTO_INCREMENT,
    messageTemplate_UserId VARCHAR(9) NOT NULL,
    messageTemplate_MessageContent TEXT,
    FOREIGN KEY (messageTemplate_UserId) REFERENCES tblUser(user_StudentId),
    PRIMARY KEY (messageTemplate_Id)
);