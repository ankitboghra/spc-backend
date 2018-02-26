-- Dependency on
--  tblUser
--  tblJobProfile

CREATE TABLE IF NOT EXISTS tblResume (
    -- resume_Id INT NOT NULL AUTO_INCREMENT,
    resume_StudentId varchar(9) NOT NULL,
        -- Foreign key to userStudentId
    resume_JobProfileId int,
        -- Foreign key to jobProfileId
    FOREIGN KEY (resume_StudentId) REFERENCES tblUser(user_StudentId),
    FOREIGN KEY (resume_JobProfileId) REFERENCES tblJobProfile(jobProfile_Id),
    -- PRIMARY KEY (resume_Id)
    PRIMARY KEY (resume_StudentId, resume_JobProfileId)
);