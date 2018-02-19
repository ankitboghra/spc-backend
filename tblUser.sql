-- dependency on
--  tblProgram

CREATE TABLE IF NOT EXISTS tblUser (
    user_StudentId varchar(9) NOT NULL,
    user_TypeFlag int NOT NULL,
        -- 1=admin; 2=student; 3=spcMember; 4=spcMember+student;
    user_FirstName varchar(60) NOT NULL,
    user_MiddleName varchar(60),
    user_LastName varchar(60),
    user_Password varchar(40) NOT NULL,
    user_DateOfBirth date,
    user_Gender varchar(1) CHECK (userGender IN ('M', 'F', 'O')),
    user_ContactNo varchar(15),
    user_EmailId varchar(60) NOT NULL,
    user_AddressPermanent TEXT,
    user_AddressCurrent TEXT,
    user_ProgramId int NOT NULL,
        -- Foreign key
    user_JoinDate date NOT NULL,
    user_SscYear year(4),
    user_HscYear year(4),
    user_QualifyingBoard decimal(5,2),
    user_QualifyingPercentage decimal(5,2),
    user_QualifyingDegree varchar(60),
    user_Stream varchar(60),
        -- Stream of HSC
    user_Cpi decimal(4,2) NOT NULL DEFAULT 0,
    user_CurrentBacklog int NOT NULL DEFAULT 0,
    user_TotalBacklog int NOT NULL DEFAULT 0,
    user_IsPlaced boolean NOT NULL,
    user_IsInterested boolean NOT NULL DEFAULT 0,
        -- 0=Interested; 1=Not Interested
        -- Keep it or not ?
    user_IsActive boolean NOT NULL DEFAULT 0,
        -- 0=Active; 1=Not Active
    
    FOREIGN KEY (user_ProgramId) REFERENCES tblProgram(program_Id),
    PRIMARY KEY (user_StudentId)
);