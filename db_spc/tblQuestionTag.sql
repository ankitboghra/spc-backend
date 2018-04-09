-- Dependency on
-- tblAllTags
-- tblQuestion

CREATE TABLE IF NOT EXISTS tblQuestionTag (
    questionTag_QuestionId int NOT NULL,
    questionTag_TagId int NOT NULL,
    FOREIGN KEY (questionTag_QuestionId) REFERENCES tblQuestion(question_Id),
    FOREIGN KEY (questionTag_TagId) REFERENCES tblAllTags(allTags_Id)
);

-- Alteration
ALTER TABLE `tblquestiontag`
  ADD CONSTRAINT `tblquestiontag_ibfk_3` FOREIGN KEY (`questionTag_QuestionId`) REFERENCES `tblquestion` (`question_Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tblquestiontag_ibfk_4` FOREIGN KEY (`questionTag_TagId`) REFERENCES `tblalltags` (`allTags_Id`) ON DELETE CASCADE