-- Dependency on
--  tblJobOpening

CREATE TABLE IF NOT EXISTS tblInterviewRound (
    interviewRound_Id INT NOT NULL AUTO_INCREMENT,
        -- Needed to reference easily in tblInterviewRoundDetails
    interviewRound_JobOpeningId INT NOT NULL,
    interviewRound_RoundNumber INT NOT NULL,
    interviewRound_Description varchar(255) NOT NULL,
    interviewRound_Timestamp TIMESTAMP,

    FOREIGN KEY (interviewRound_JobOpeningId) REFERENCES tblJobOpening(jobOpening_Id),
    -- PRIMARY KEY (interviewRound_JobOpeningId, interviewRound_RoundNumber)
    PRIMARY KEY (interviewRound_Id)
);
