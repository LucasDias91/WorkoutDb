use Workout;
/*
SET FOREIGN_KEY_CHECKS = 0; 
DROP table Students; 
SET FOREIGN_KEY_CHECKS = 1;
*/
create table Students
(
  StudentID int AUTO_INCREMENT NOT NULL,
  UserID int Not null,
  GenderID int null,
  First_Name nvarchar(50) not null,
  Last_Name nvarchar (50) null,
  Email nvarchar (255) NULL,
  Cpf nvarchar(11) null,
  Phone nvarchar(11) null,
  Mobile nvarchar(11) NULL,
  Birth_Date Date null,
  Creation_Date dateTime NULL,
  Last_Edit_Date datetime NULL,
  Active bool NOT NULL default true,
  CONSTRAINT PK_Student PRIMARY KEY (StudentID)
);

delimiter //
create trigger Insert_Trigger_Student  BEFORE INSERT on Students
FOR EACH ROW
BEGIN
  SET new.Creation_Date := (SELECT UTC_TIMESTAMP());
  SET new.Last_Edit_Date := (SELECT UTC_TIMESTAMP());
END
//

delimiter //
create trigger Update_Trigger_Student  BEFORE UPDATE on Students
FOR EACH ROW
BEGIN
  SET new.Last_Edit_Date := (SELECT UTC_TIMESTAMP());
END
//

ALTER TABLE `Students` ADD CONSTRAINT `fk_Student_User` FOREIGN KEY ( `UserID` ) REFERENCES `Users` ( `UserID` ) ;
ALTER TABLE `Students` ADD CONSTRAINT `fk_Student_Gender` FOREIGN KEY ( `GenderID` ) REFERENCES `Genders` ( `GenderID` ) ;