-- Dependency on
--  tblProgram
--  tblUser
--  tblJobOpenings

CREATE TABLE IF NOT EXISTS tblProgramOpening (
    programOpening_OpeningId INT NOT NULL,
    programOpening_ProgramId INT NOT NULL,
    programOpening_Batch date,

    FOREIGN KEY (programOpening_OpeningId) REFERENCES tblJobOpening(jobOpening_Id),
    FOREIGN KEY (programOpening_ProgramId) REFERENCES tblProgram(program_Id),
    -- FOREIGN KEY (programOpeningBatch) REFERENCES tblUser(userJoinDate),
    -- Some problem here
    PRIMARY KEY (programOpening_OpeningId, programOpening_ProgramId)
);
