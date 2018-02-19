-- Dependency on
--  tblUser
--  tblJobOpening

CREATE TABLE IF NOT EXISTS tblJobOpeningRegistration (
    jobOpeningRegistration_OpeningId INT NOT NULL,
    jobOpeningRegistration_StudentId varchar(9),
    jobOpeningRegistration_Timestamp timestamp,
    FOREIGN KEY (jobOpeningRegistration_OpeningId) REFERENCES tblJobOpening(jobOpening_Id),
    FOREIGN KEY (jobOpeningRegistration_StudentId) REFERENCES tblUser(user_StudentId),
    PRIMARY KEY (jobOpeningRegistration_OpeningId, jobOpeningRegistration_StudentId)
);