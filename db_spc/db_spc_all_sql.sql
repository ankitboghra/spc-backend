-- Creating and using database
CREATE DATABASE IF NOT EXISTS db_spc;
USE db_spc;

-- Order of tables
-- No dependencies:
-- tblProgram
-- tblCompany
-- tblJobProfile
-- tblPlacementSeason

-- Dependencies:
-- tblUser
-- tblAreaOfInterest
-- tblCompanyJobProfile
-- tblJobOpening
-- tblProgramOpening <---- One problem to solve
-- tblJobOpening
-- tblPlacedStudent
-- >>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



-- ____tblProgram_________________________________________________________
-- No dependencies

CREATE TABLE IF NOT EXISTS tblProgram (
    program_Id INT NOT NULL AUTO_INCREMENT,
    program_Name varchar(80) NOT NULL,
    program_IsActive bool NOT NULL DEFAULT 0,
        -- 0=Active; 1=Not active
    PRIMARY KEY (program_Id)
);

-- ____tblCompany_________________________________________________________
-- No dependency

CREATE TABLE IF NOT EXISTS tblCompany (
    company_Id INT NOT NULL AUTO_INCREMENT,
    company_Name varchar(80) NOT NULL UNIQUE,
    company_Address TEXT,
    company_Email varchar(60),
    company_CEO varchar(60),
    company_Founder varchar(60),
    company_Website varchar(40),
    company_Information TEXT,
    company_IsActive bool NOT NULL DEFAULT 0,
        -- 0=Active; 1=Not active
    PRIMARY KEY (company_Id)
);

-- ____tblJobProfile_________________________________________________________
-- No dependency
-- Insert one job profile as "Unclassified"

CREATE TABLE IF NOT EXISTS tblJobProfile (
    jobProfile_Id INT NOT NULL AUTO_INCREMENT,
    jobProfile_Name varchar(255) NOT NULL,
    PRIMARY KEY (jobProfile_Id)
);


-- ____tblPlacementSeason_________________________________________________________
-- No dependency

CREATE TABLE IF NOT EXISTS tblPlacementSeason (
    placementSeason_Id INT NOT NULL AUTO_INCREMENT,
    placementSeason_Year INT NOT NULL,
    PRIMARY KEY (placementSeason_Id, placementSeason_Year)
);

-- ____tblUser_________________________________________________________
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

-- ____tblAreaOfInterest_________________________________________________________
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

-- ____tblCompanyJobProfile_________________________________________________________
-- Dependency on
--  tblCompany
--  tblJobProfile

CREATE TABLE IF NOT EXISTS tblCompanyJobProfile (
    -- companyJobProfileId INT NOT NULL AUTO_INCREMENT,
    companyJobProfile_CompanyId int NOT NULL,
    companyJobProfile_JobProfileId int NOT NULL,
    CONSTRAINT constraintCompanyProfile UNIQUE (companyJobProfile_CompanyId, companyJobProfile_JobProfileId),
    FOREIGN KEY (companyJobProfile_CompanyId) REFERENCES tblCompany(company_Id),
    FOREIGN KEY (companyJobProfile_JobProfileId) REFERENCES tblJobProfile(jobProfile_Id),
    PRIMARY KEY (companyJobProfile_CompanyId, companyJobProfile_JobProfileId)
    -- PRIMARY KEY (companyJobProfileId)
);

-- ____tblJobOpening_________________________________________________________
-- dependency on
--  tblCompany
--  tblJobProfile
--  tblPlacementSeason

CREATE TABLE IF NOT EXISTS tblJobOpening (
    jobOpening_Id INT NOT NULL AUTO_INCREMENT,
    jobOpening_CompanyId int NOT NULL,
    jobOpening_JobProfileId int NOT NULL,

    jobOpening_HrContact varchar(255),
    jobOpening_HrName varchar(60),
    
    jobOpening_PackageForJob decimal(11,2),
    jobOpening_StipendForInternship decimal(11,2),
    
    jobOpening_RequirementInternship int NOT NULL DEFAULT 0,
    -- How man required
    jobOpening_RequirementInternshipJob int NOT NULL DEFAULT 0,
    -- How man required
    jobOpening_RequirementJob int NOT NULL DEFAULT 0,
    -- How man required

    jobOpening_RegistrationStartDate datetime,
    jobOpening_RegistrationEndDate datetime,
    jobOpening_Information TEXT,
        -- Rounds, Selection, Skills
    
    jobOpening_RequirementSscPercentage DECIMAL(5,2),
    jobOpening_RequirementHscPercentage DECIMAL(5,2),
    
    jobOpening_RequirementGraduationCpi DECIMAL(5,2),
    jobOpening_RequirementPostGraduationCpi DECIMAL(5,2),
    
    jobOpening_PlacementSeasonId int NOT NULL,
        -- Foreign key to placement season
    
    jobOpening_IsSummerInternship boolean DEFAULT false,

    FOREIGN KEY (jobOpening_CompanyId) REFERENCES tblCompany(company_Id),
    FOREIGN KEY (jobOpening_JobProfileId) REFERENCES tblJobProfile(jobProfile_Id),
    FOREIGN KEY (jobOpening_PlacementSeasonId) REFERENCES tblPlacementSeason(placementSeason_Id),
    PRIMARY KEY (jobOpening_Id)
);

-- ____tblProgramOpening_________________________________________________________
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

-- ____tblJobOpeningRegistration_________________________________________________________
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

-- ____tblPlacedStudent_________________________________________________________
-- Dependency on
--  tblUser
--  tblJobOpening

CREATE TABLE IF NOT EXISTS tblPlacedStudent (
    placedStudent_OpeningId INT NOT NULL,
    placedStudent_StudentId varchar(9) NOT NULL,
    placedStudent_PackageOffered decimal(11, 2),
    placedStudent_DateOfOffer date,
    placedStudent_Position varchar(255),
    placedStudent_IsPpoOffered boolean NOT NULL DEFAULT false,
    placedStudent_IsOfferAccepted boolean NOT NULL DEFAULT false,
    FOREIGN KEY (placedStudent_OpeningId) REFERENCES tblJobOpening(jobOpening_Id),
    FOREIGN KEY (placedStudent_StudentId) REFERENCES tblUser(user_StudentId),
    PRIMARY KEY (placedStudent_OpeningId, placedStudent_StudentId)
);
