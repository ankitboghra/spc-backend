-- No dependencies

CREATE TABLE IF NOT EXISTS tblProgram (
    program_Id INT NOT NULL AUTO_INCREMENT,
    program_Name varchar(80) NOT NULL,
    program_IsActive bool NOT NULL DEFAULT 0,
        -- 1=Active; 2=Not active
    PRIMARY KEY (program_Id)
);
