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