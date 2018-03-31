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
