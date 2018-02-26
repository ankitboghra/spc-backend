-- Dependency on
--  tblNotification
--  tblUser

CREATE TABLE IF NOT EXISTS tblNotificationRecipient (
    notificationRecipient_NotificationId INT NOT NULL AUTO_INCREMENT,
    notificationRecipient_ReceiverStudentId VARCHAR(9) NOT NULL,
    notificationRecipient_Status boolean,
        -- 1=View; 2=Don`t view
    FOREIGN KEY (notificationRecipient_NotificationId) REFERENCES tblNotification(notification_Id),
    FOREIGN KEY (notificationRecipient_ReceiverStudentId) REFERENCES tblUser(user_StudentId),
    PRIMARY KEY (notificationRecipient_NotificationId, notificationRecipient_ReceiverStudentId)
);
