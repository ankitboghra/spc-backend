-- Dependency on
--  tblUser
--  tblJobProfile

CREATE TABLE IF NOT EXISTS tblAreaOfInterest (
    areaOfInterest_Id INT NOT NULL AUTO_INCREMENT,
    areaOfInterest_StudentId varchar(9) NOT NULL,
        -- foreign key to userStudentId
    areaOfInterest_JobProfileId int NOT NULL,
        -- foreign key to jobProfileId
    areaOfInterest_Weight int NOT NULL DEFAULT 3,
    CONSTRAINT checkWeight CHECK (areaOfInterest_Weight BETWEEN 1 and 5),
    PRIMARY KEY (areaOfInterest_Id),
    FOREIGN KEY (areaOfInterest_StudentId) REFERENCES tblUser(user_StudentId),
    FOREIGN KEY (areaOfInterest_JobProfileId) REFERENCES tblJobProfile(jobProfile_Id)    
);