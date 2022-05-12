use Workout;
/*
SET FOREIGN_KEY_CHECKS = 0; 
DROP table Users; 
SET FOREIGN_KEY_CHECKS = 1;
*/
create table Users
(
UserID int AUTO_INCREMENT NOT NULL,
ProfileID int NOT Null,
User_StatusID int  NOT NULL DEFAULT 3,
User_Name nvarchar(255) not null,
Password nvarchar (50) not null,
Display_Name nvarchar(50) not null,
Avatar_Location longtext null,
Creation_Date datetime NULL,
Last_Edit_Date datetime NULL,
Registed_By nvarchar (50) default 'System',
UserKey nvarchar(255) not null default  (UUID()),
CONSTRAINT PK_User PRIMARY KEY (UserID)
);

ALTER TABLE `Users` ADD CONSTRAINT `fk_Status_User_User` FOREIGN KEY ( `User_StatusID` ) REFERENCES `User_Status` ( `User_StatusID` ) ;
ALTER TABLE `Users` ADD CONSTRAINT `fk_Profile_User` FOREIGN KEY ( `ProfileID` ) REFERENCES `Profiles` ( `ProfileID` ) ;

delimiter //
create trigger Insert_Trigger_User  BEFORE INSERT on Users
FOR EACH ROW
BEGIN
  SET new.Creation_Date := (SELECT Now());
  SET new.Last_Edit_Date := (SELECT Now());
END
//

delimiter //
create trigger Update_Trigger_User  BEFORE UPDATE on Users
FOR EACH ROW
BEGIN
  SET new.Last_Edit_Date := (SELECT Now());
END
//


