-- No dependency

CREATE TABLE IF NOT EXISTS tblAllTags (
    allTags_Id INT NOT NULL AUTO_INCREMENT,
    allTags_TagName varchar(255) NOT NULL UNIQUE,
    PRIMARY KEY (allTags_Id)
);