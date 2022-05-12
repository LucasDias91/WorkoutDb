use Workout;

/*
SET FOREIGN_KEY_CHECKS = 0; 
DROP table Roles; 
SET FOREIGN_KEY_CHECKS = 1;
*/

create table Roles
(
  RoleID int AUTO_INCREMENT NOT NULL,
  Role nvarchar (50) NOT NULL,
  Creation_Date dateTime NULL,
  Last_Edit_Date datetime NULL,
  Active bool NOT NULL default true,
  CONSTRAINT PK_Role PRIMARY KEY (RoleID)
);


delimiter //
create trigger Insert_Trigger_Role  BEFORE INSERT on Roles
FOR EACH ROW
BEGIN
  SET new.Creation_Date := (SELECT NOW());
  SET new.Last_Edit_Date := (SELECT NOW());
END
//

delimiter //
create trigger Update_Trigger_Role BEFORE UPDATE on Roles
FOR EACH ROW
BEGIN
  SET new.Last_Edit_Date := (SELECT NOW());
END
//

INSERT INTO Roles (Role) VALUES ('Student');




