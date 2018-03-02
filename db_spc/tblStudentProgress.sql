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
