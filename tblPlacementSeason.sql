-- No dependency

CREATE TABLE IF NOT EXISTS tblPlacementSeason (
    placementSeason_Id INT NOT NULL AUTO_INCREMENT,
    placementSeason_Year INT NOT NULL,
    PRIMARY KEY (placementSeason_Id, placementSeason_Year)
);