-- Dependency on
--  tblUser
--  tblInterviewRound

CREATE TABLE IF NOT EXISTS tblInterviewRoundDetail (
    interviewRoundDetail_InterviewRoundId INT NOT NULL,
    interviewRoundDetail_StudentId VARCHAR(9) NOT NULL,
    interviewRoundDetail_Status INT,
        -- 1=Absent; 2=Selected; 4=Rejected;
    FOREIGN KEY (interviewRoundDetail_InterviewRoundId) REFERENCES tblInterviewRound(interviewRound_Id),
    FOREIGN KEY (interviewRoundDetail_StudentId) REFERENCES tblUser(user_StudentId),
    PRIMARY KEY (interviewRoundDetail_InterviewRoundId, interviewRoundDetail_StudentId)
);
