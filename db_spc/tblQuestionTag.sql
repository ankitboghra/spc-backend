-- Dependency on
-- tblAllTags
-- tblQuestion

CREATE TABLE IF NOT EXISTS tblQuestionTag (
    questionTag_QuestionId int NOT NULL,
    questionTag_TagId int NOT NULL,
    FOREIGN KEY (questionTag_QuestionId) REFERENCES tblQuestion(question_Id),
    FOREIGN KEY (questionTag_TagId) REFERENCES tblAllTags(allTags_Id)
);