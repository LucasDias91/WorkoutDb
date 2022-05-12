use Workout;

/*
SET FOREIGN_KEY_CHECKS = 0; 
DROP table Genders; 
SET FOREIGN_KEY_CHECKS = 1;
*/

create table Genders
(
  GenderID int AUTO_INCREMENT NOT NULL,
  Gender nvarchar (255) NOT NULL,
  Creation_Date dateTime NULL,
  Last_Edit_Date datetime NULL,
  Active bool NOT NULL default true,
  CONSTRAINT PK_Gender PRIMARY KEY (GenderID)
);

delimiter //
create trigger Insert_Trigger_Gender BEFORE INSERT on Genders
FOR EACH ROW
BEGIN
  SET new.Creation_Date := (SELECT Now());
  SET new.Last_Edit_Date := (SELECT Now());
END
//

delimiter //
create trigger Update_Trigger_Gender BEFORE UPDATE on Genders
FOR EACH ROW
BEGIN
  SET new.Last_Edit_Date := (SELECT Now());
END
//

INSERT INTO Genders (Gender) VALUES ('Masculino');

