-- dependency on
--  tblUser

CREATE TABLE IF NOT EXISTS tblNotification (
    notification_Id INT NOT NULL AUTO_INCREMENT,
    notification_SenderId varchar(9) NOT NULL,
    notification_Message TEXT,
    notification_Time TIMESTAMP,
    notification_ViaEmail boolean DEFAULT FALSE,
    notification_ViaPhone boolean DEFAULT FALSE,
    notification_ViaPortal boolean DEFAULT FALSE,
    FOREIGN KEY (notification_SenderId) REFERENCES tblUser(user_StudentId),
    PRIMARY KEY (notification_Id)
);