use Workout;

/*
SET FOREIGN_KEY_CHECKS = 0; 
DROP table Profiles; 
SET FOREIGN_KEY_CHECKS = 1;
*/

create table Profiles
(
  ProfileID int AUTO_INCREMENT NOT NULL,
  Profile nvarchar (50) NOT NULL,
  CreationDate dateTime  NULL,
  LastEditDate datetime  NULL,
  Active bool NOT NULL default true,
  CONSTRAINT PK_Profile PRIMARY KEY (ProfileID)
);


delimiter //
create trigger Insert_Trigger_Profile  BEFORE INSERT on Profiles
FOR EACH ROW
BEGIN
  SET new.CreationDate := (SELECT NOW());
  SET new.LastEditDate := (SELECT NOW());
END
//

delimiter //
create trigger Update_Trigger_Profile BEFORE UPDATE on Profiles
FOR EACH ROW
BEGIN
  SET new.LastEditDate := (SELECT NOW());
END
//

INSERT INTO Profiles (Profile) VALUES ('Administrator');
INSERT INTO Profiles (Profile) VALUES ('User');

