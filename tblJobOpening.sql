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
