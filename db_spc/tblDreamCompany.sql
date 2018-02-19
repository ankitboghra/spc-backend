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