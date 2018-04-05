-- dependency on
--  tblUser

CREATE TABLE IF NOT EXISTS tblSpcPolicy (
    spcPolicy_Id INT NOT NULL AUTO_INCREMENT,
    spcPolicy_PlacementSeasonId INT NOT NULL,
    spcPolicy_CriteareaOrCategory INT NOT NULL,
        -- 1=Category 1; 2=Category 2; 4=Switch; ...
    spcPolicy_Minimum DECIMAL(11,2),
    spcPolicy_Maximum DECIMAL(11,2),
    -- spcPolicy_SwitchAllowed INT,
    spcPolicy_Multiplier DECIMAL(4,2),
    spcPolicy_Description VARCHAR(255),
    FOREIGN KEY (spcPolicy_PlacementSeasonId) REFERENCES tblPlacementSeason(placementSeason_Id),
    PRIMARY KEY (spcPolicy_Id)
);
