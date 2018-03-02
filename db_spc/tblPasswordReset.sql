-- Dependency on
-- tblUser

CREATE TABLE IF NOT EXISTS tblPasswordReset (
    passwordReset_StudentId varchar(9) NOT NULL,
    passwordReset_Otp int,
    passwordReset_Timestamp timestamp,
    FOREIGN KEY (passwordReset_StudentId) REFERENCES tblUser(user_StudentId),
    PRIMARY KEY (passwordReset_StudentId)
);