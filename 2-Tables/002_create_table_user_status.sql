use Workout;

/*
SET FOREIGN_KEY_CHECKS = 0; 
DROP table User_Status; 
SET FOREIGN_KEY_CHECKS = 1;
*/

create table User_Status
(
  User_StatusID int AUTO_INCREMENT NOT NULL,
  User_Status nvarchar (50) NOT NULL,
  Creation_Date dateTime Null,
  Last_Edit_Date datetime NULL,
  Active bool NOT NULL default true,
  CONSTRAINT PK_User_Status PRIMARY KEY (User_StatusID)
);

delimiter //
create trigger Insert_Trigger_User_Status  BEFORE INSERT on User_Status
FOR EACH ROW
BEGIN
  SET new.Creation_Date := (SELECT  NOW());
  SET new.Last_Edit_Date := (SELECT  NOW());
END
//

delimiter //
create trigger Update_Trigger_User_Status  BEFORE UPDATE on User_Status
FOR EACH ROW
BEGIN
  SET new.Last_Edit_Date := (SELECT  NOW());
END
//

INSERT INTO User_Status (User_Status) VALUES ('Active');
INSERT INTO User_Status (User_Status) VALUES ('Inactive');
INSERT INTO User_Status (User_Status) VALUES ('Pending');




