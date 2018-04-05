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
-- tblCompanyProfile
-- tblJobOpening
-- tblProgramOpening <---- One problem to solve
-- tblJobOpeningRegistration
-- tblPlacedStudent
-- tblDreamCompany
-- tblInterviewExperience
-- tblInterviewRound
-- tblInterviewRoundDetail

-- tblResume
-- tblNotification
-- tblNotificationRecipient
-- tblMessageTemplate

-- tblAllTags
-- tblQuestion
-- tblQuestionTag
-- tblCompanyQuestion
-- tblStudentProgress

-- tblPasswordReset

-- tblPolicy
-- >>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<



-- ____tblProgram_________________________________________________________
-- No dependencies

CREATE TABLE IF NOT EXISTS tblProgram (
    program_Id INT NOT NULL AUTO_INCREMENT,
    program_Name varchar(80) NOT NULL,
    program_IsActive bool NOT NULL DEFAULT 0,
        -- 1=Active; 2=Not active
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
        -- 1=Active; 2=Not active
    -- company_IsApproved boolean,
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
        -- 1=admin; 2=student; 4=spcMember; 6=spcMember+student;
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
    user_QualifyingBoard varchar(255),
    user_QualifyingPercentage decimal(5,2),
    user_QualifyingDegree varchar(60),
    user_Stream varchar(60),
        -- Stream of HSC
    user_Cpi decimal(4,2) NOT NULL DEFAULT 0,
    user_CurrentBacklog int NOT NULL DEFAULT 0,
    user_TotalBacklog int NOT NULL DEFAULT 0,
    user_IsPlaced boolean NOT NULL,
    user_IsInterested boolean NOT NULL DEFAULT 0,
        -- 1=Interested; 2=Not Interested
        -- Keep it or not ?
    user_IsActive boolean NOT NULL DEFAULT 0,
        -- 1=Active; 2=Not Active
    
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
    -- PRIMARY KEY (companyProfileId)
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

-- ____tblDreamCompany_________________________________________________________
-- Dependency on
--  tblCompany
--  tblPlacementSeason

CREATE TABLE IF NOT EXISTS tblDreamCompany (
    dreamCompany_CompanyId INT NOT NULL,
    dreamCompany_PlacementSeason_Id INT NOT NULL,
    FOREIGN KEY (dreamCompany_CompanyId) REFERENCES tblCompany(company_Id),
    FOREIGN KEY (dreamCompany_PlacementSeason_Id) REFERENCES tblPlacementSeason(placementSeason_Id),
    PRIMARY KEY (dreamCompany_CompanyId, dreamCompany_PlacementSeason_Id)
);

-- ____tblInterviewExperience_________________________________________________________
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
-- ____tblInterviewRound_________________________________________________________
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

-- ____tblInterviewRoundDetail_________________________________________________________
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

-- ____tblResume_________________________________________________________
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

-- ____tblNotification_________________________________________________________
-- dependency on
--  tblUser

CREATE TABLE IF NOT EXISTS tblNotification (
    notification_Id INT NOT NULL AUTO_INCREMENT,
    notification_SenderId varchar(9) NOT NULL,
    notification_Message TEXT,
    notification_Time TIMESTAMP,
    notification_ViaEmail boolean DEFAULT FALSE,
    notification_ViaPhone boolean DEFAULT FALSE,
    notification_ViaPortal boolean DEFAULT FALSE,
    FOREIGN KEY (notification_SenderId) REFERENCES tblUser(user_StudentId),
    PRIMARY KEY (notification_Id)
);

-- ____tblNotificationRecipient_________________________________________________________
-- Dependency on
--  tblNotification
--  tblUser

CREATE TABLE IF NOT EXISTS tblNotificationRecipient (
    notificationRecipient_NotificationId INT NOT NULL AUTO_INCREMENT,
    notificationRecipient_ReceiverStudentId VARCHAR(9) NOT NULL,
    notificationRecipient_Status boolean,
        -- 1=View; 2=Don`t view
    FOREIGN KEY (notificationRecipient_NotificationId) REFERENCES tblNotification(notification_Id),
    FOREIGN KEY (notificationRecipient_ReceiverStudentId) REFERENCES tblUser(user_StudentId),
    PRIMARY KEY (notificationRecipient_NotificationId, notificationRecipient_ReceiverStudentId)
);

-- ____tblMessageTemplate_________________________________________________________
-- Dependency on
--  tblUser

CREATE TABLE IF NOT EXISTS tblMessageTemplate (
    -- tblMessageTemplate_Id INT NOT NULL AUTO_INCREMENT,
    messageTemplate_UserId VARCHAR(9) NOT NULL,
    messageTemplate_MessageContent TEXT,
    FOREIGN KEY (messageTemplate_UserId) REFERENCES tblUser(user_StudentId),
    PRIMARY KEY (messageTemplate_UserId)
);

-- ____tblAllTags_________________________________________________________
-- No dependency

CREATE TABLE IF NOT EXISTS tblAllTags (
    allTags_Id INT NOT NULL AUTO_INCREMENT,
    allTags_TagName varchar(255) NOT NULL UNIQUE,
    PRIMARY KEY (allTags_Id)
);

-- ____tblQuestion_________________________________________________________
-- Dependency on
--  tblUser

CREATE TABLE IF NOT EXISTS tblQuestion (
    question_Id INT NOT NULL AUTO_INCREMENT,
    question_Title varchar(255) NOT NULL,
    question_Description TEXT NOT NULL,
    question_Solution TEXT,
    question_DifficultyLevel int,
        -- 1=Easy; 2=Medium; 3=Hard;
    question_IsActive boolean DEFAULT TRUE NOT NULL,
    question_CreatorUserId varchar(9) NOT NULL,
    question_ApprovedByUserId varchar(9),

    FOREIGN KEY (question_CreatorUserId) REFERENCES tblUser(user_StudentId),
    FOREIGN KEY (question_ApprovedByUserId) REFERENCES tblUser(user_StudentId),
    PRIMARY KEY (question_Id)
);

-- ____tblQuestionTag_________________________________________________________
-- Dependency on
-- tblAllTags
-- tblQuestion

CREATE TABLE IF NOT EXISTS tblQuestionTag (
    questionTag_QuestionId int NOT NULL,
    questionTag_TagId int NOT NULL,
    FOREIGN KEY (questionTag_QuestionId) REFERENCES tblQuestion(question_Id),
    FOREIGN KEY (questionTag_TagId) REFERENCES tblAllTags(allTags_Id)
);

-- ____tblCompanyQuestion_________________________________________________________
-- Dependency on
-- tblCompany
-- tblQuestion

CREATE TABLE IF NOT EXISTS tblCompanyQuestion (
    companyQuestion_QuestionId int NOT NULL,
    companyQuestion_CompanyId int NOT NULL,
    FOREIGN KEY (companyQuestion_QuestionId) REFERENCES tblQuestion(question_Id),
    FOREIGN KEY (companyQuestion_CompanyId) REFERENCES tblCompany(company_Id),
    PRIMARY KEY (companyQuestion_QuestionId, companyQuestion_CompanyId)
);

-- ____tblStudentProgress_________________________________________________________
-- Dependency on
--  tblUser
--  tblQuestion

CREATE TABLE IF NOT EXISTS tblStudentProgress (
    studentProgress_StudentId VARCHAR(9) NOT NULL,
    studentProgress_QuestionId int NOT NULL,
    studentProgress_Status int NOT NULL,
        -- 1=Mark as done; 2=Refer Later; 4=Facing problem;
    FOREIGN KEY (studentProgress_StudentId) REFERENCES tblUser(user_StudentId),
    FOREIGN KEY (studentProgress_QuestionId) REFERENCES tblQuestion(question_Id),
    PRIMARY KEY (studentProgress_StudentId, studentProgress_QuestionId)
);

-- ____tblPasswordReset_________________________________________________________
-- Dependency on
-- tblUser

CREATE TABLE IF NOT EXISTS tblPasswordReset (
    passwordReset_StudentId varchar(9) NOT NULL,
    passwordReset_Otp int,
    passwordReset_Timestamp timestamp,
    FOREIGN KEY (passwordReset_StudentId) REFERENCES tblUser(user_StudentId),
    PRIMARY KEY (passwordReset_StudentId)
);

-- ____tblSpcPolicy_________________________________________________________
-- dependency on
--  tblUser

CREATE TABLE IF NOT EXISTS tblSpcPolicy (
    spcPolicy_Id INT NOT NULL AUTO_INCREMENT,
    spcPolicy_PlacementSeasonId INT NOT NULL,
    spcPolicy_CriteareaOrCategory INT NOT NULL,
        -- 1=Category 1; 2=Category 2; 4=Switch; ...
    spcPolicy_Minimum DECIMAL(11,2),
    spcPolicy_Maximum DECIMAL(11,2),
    spcPolicy_SwitchAllowed boolean,
    spcPolicy_Multiplier DECIMAL(4,2),
    spcPolicy_Description VARCHAR(255),
    FOREIGN KEY (spcPolicy_PlacementSeasonId) REFERENCES tblPlacementSeason(placementSeason_Id),
    PRIMARY KEY (spcPolicy_Id)
);
