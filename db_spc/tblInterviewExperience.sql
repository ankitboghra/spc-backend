-- dependency on
--  tblUser

CREATE TABLE IF NOT EXISTS tblInterviewExperience (
    -- interviewExperience_Id INT NOT NULL AUTO_INCREMENT,
    interviewExperience_StudentId varchar(9) NOT NULL,
    interviewExperience_OpeningId int,
    interviewExperience_Description TEXT,
	interviewExperience_ApprovedBy varchar(9),
    interviewExperience_Time TIMESTAMP,
    
    FOREIGN KEY (interviewExperience_StudentId) REFERENCES tblUser(user_StudentId),
    FOREIGN KEY (interviewExperience_OpeningId) REFERENCES tblProgramOpening(programOpening_OpeningId),
	FOREIGN KEY (interviewExperience_ApprovedBy) REFERENCES tblUser(user_StudentId),
    -- PRIMARY KEY (interviewExperience_Id)
    PRIMARY KEY(interviewExperience_StudentId, interviewExperience_OpeningId)
);
