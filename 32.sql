CREATE DATABASE TEAM32;
USE TEAM32
CREATE TABLE Members
(
  Age int NOT NULL,
  DOB int NOT NULL,
  First_Name varchar(50) NOT NULL,
  Last_Name varchar(50) NOT NULL,
  Party_First_Name varchar(400) NOT NULL,
  Party_Middle_Name varchar(300) NOT NULL,
  Party_Last_Name varchar(300) NOT NULL,
  Constituency_name varchar(100) NOT NULL,
  PRIMARY KEY(First_Name,Last_Name)
);

CREATE TABLE Contact
(
  contact VARCHAR(10) NOT NULL,
  Member_First_Name varchar(50) NOT NULL,
  Member_Last_Name varchar(50) NOT NULL,
  FOREIGN KEY(Member_First_Name,Member_Last_Name) REFERENCES Members(First_Name, Last_Name) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Opponents
(
  Constituency_name varchar(100) NOT NULL,
  Term int NOT NULL,
  First_Name varchar(50) NOT NULL,
  Last_Name varchar(50) NOT NULL,
  First_Name_schema varchar(50) NOT NULL,
  Last_Name_schema varchar(50) NOT NULL,
  Party_First_Name varchar(50) NOT NULL,
  Party_Middle_Name varchar(50) NOT NULL,
  Party_Last_Name varchar(50) NOT NULL,
  PRIMARY KEY(Party_First_Name,Party_Middle_Name,Party_Last_Name,First_Name_schema,Last_Name_schema,First_Name,Last_Name)
);

CREATE TABLE Constituency
(
  Constituency_name varchar(100) NOT NULL,
Term int NOT NULL,
  Winner_First_Name varchar(50) NOT NULL,
  Winner_Last_Name varchar(50) NOT NULL,
   First_Name_schema varchar(50) NOT NULL,
  Last_Name_schema varchar(50) NOT NULL,
  PRIMARY KEY (Constituency_name,Term)
);

CREATE TABLE Winner
(
  Constituency_name varchar(100) NOT NULL,
  Term int NOT NULL,
  FName varchar(50) NOT NULL,
  LName varchar(50) NOT NULL,
  Party_First_Name varchar(40) NOT NULL,
  Party_Middle_Name varchar(30) NOT NULL,
  Party_Last_Name varchar(30) NOT NULL,
  PRIMARY KEY(Term,FName,LName),
  FOREIGN KEY (Constituency_name,Term) REFERENCES Constituency(Constituency_name,Term) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Policies
(
  Budget_Allocated int NOT NULL,
  Budget_Utilized int NOT NULL,
  Policy_Name varchar(100) NOT NULL,
  Scam_amount int NOT NULL,
  Success_Rate int NOT NULL,
  Winner_First_Name varchar(50) NOT NULL,
  Winner_Last_Name varchar(50) NOT NULL,
  Term int NOT NULL,
  PRIMARY KEY (Policy_Name),
  FOREIGN KEY (Term,Winner_First_Name,Winner_Last_Name) REFERENCES Winner(Term,FName, LName) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Swindle
(
  How_it_happened varchar(100) NOT NULL,
  Why_it_happened varchar(100) NOT NULL,
  Scam_Amount varchar(20) NOT NULL,
  First_Name varchar(50) NOT NULL,
  Last_Name varchar(50) NOT NULL,
  Winner_First_Name varchar(50) NOT NULL,
  Winner_Last_Name varchar(50) NOT NULL,
  Term int NOT NULL,
  PRIMARY KEY(First_Name,Last_Name,How_it_happened,Why_it_happened),
FOREIGN KEY (Term,Winner_First_Name,Winner_Last_Name) REFERENCES Winner(Term,FName, LName) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Participate_For
(
  Constituency_name varchar(100) NOT NULL,
  Term int NOT NULL,
  Winner_First_Name varchar(50) NOT NULL,
  Winner_Last_Name varchar(50) NOT NULL,
  Opponent_First_Name varchar(50) NOT NULL,
  Opponent_Last_Name varchar(50) NOT NULL,
  PRIMARY KEY(Constituency_name,Term,Opponent_First_Name,Opponent_Last_Name),
  FOREIGN KEY (Term,Winner_First_Name,Winner_Last_Name) REFERENCES Winner(Term,FName, LName) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Will_Implement
(
  Winner_First_Name varchar(50) NOT NULL,
  Winner_Last_Name varchar(50) NOT NULL,
  Policy_Name varchar(100) NOT NULL,
  Term int NOT NULL,
  PRIMARY KEY(Policy_Name,Term),
  FOREIGN KEY (Term,Winner_First_Name,Winner_Last_Name) REFERENCES Winner(Term,FName, LName) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Policy_Name) REFERENCES Policies(Policy_Name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Supporters
(
  Percentage_s int NOT NULL,
  Age_group varchar(15) NOT NULL,
  Reason varchar(10) NOT NULL,
  Which_Schema varchar(10) NOT NULL,
  Term int NOT NULL,
  Winner_First_Name varchar(50) NOT NULL,
  Winner_Last_Name varchar(50) NOT NULL,
  PRIMARY KEY (Age_Group,Winner_First_Name,Winner_Last_Name,Term),
  FOREIGN KEY (Term,Winner_First_Name,Winner_Last_Name) REFERENCES Winner(Term,FName, LName) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Support_in_Election_for
(
  Constituency_name varchar(100) NOT NULL,
  Term int NOT NULL,
  Member_First_Name varchar(50) NOT NULL,
  Member_Last_Name varchar(50) NOT NULL,
  PRIMARY KEY (Member_First_Name, Member_Last_Name,Term),
  FOREIGN KEY (Constituency_name,Term) REFERENCES Constituency(Constituency_name,Term) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Member_First_Name, Member_Last_Name) REFERENCES Members(First_Name, Last_Name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Will_Gain
(
  Age_Group varchar(15) NOT NULL,
  Term int NOT NULL,
  Winner_First_Name varchar(50) NOT NULL,
  Winner_Last_Name varchar(50) NOT NULL,
  PRIMARY KEY (Winner_First_Name,Winner_Last_Name,Term,Age_Group),
  FOREIGN KEY (Age_Group) REFERENCES Supporters(Age_group) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (Term,Winner_First_Name,Winner_Last_Name) REFERENCES Winner(Term,FName, LName) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Included_In
(
  Winner_First_Name varchar(50) NOT NULL,
  Winner_Last_Name varchar(50) NOT NULL,
  Term int NOT NULL,
  Swindle_First_Name varchar(50) NOT NULL,
  Swindle_Last_Name varchar(50) NOT NULL,
  
  PRIMARY KEY (Winner_First_Name,Winner_Last_Name,Term,Swindle_First_Name,Swindle_Last_Name),
  FOREIGN KEY (Term,Winner_First_Name,Winner_Last_Name) REFERENCES Winner(Term,FName, LName) ON DELETE CASCADE ON UPDATE CASCADE);

INSERT INTO Constituency VALUES('Sirpur','2015','Ponnurangam','Krishna','Free','WiFi'),
('Asifbad','2015','Harula','Raghava','OldAge','Pension')
,('Chennur','2015','Kalvakuntla','Tarak','Full','Electricity')
,('Jagityal','2015','Vennam','JayaShankar','90%','Employement')
,('Karimnagar','2015','Paraala','Rahul','Free','WiFi')
,('Vemulavada','2015','Revanth','Reddy','StreetLamps','Efficient')
,('Chennur','2010','Kalvakuntla','Tarak','Full','Electricity')
,('Jagityal','2010','Vennam','JayaShankar','90%','Employement')
,('Chikadpalli','2015','Kalvakuntla','Kavita','Full','Ration');

INSERT INTO Winner VALUES ('Sirpur','2015','Ponnurangam','Krishna','Telangana','Rashtra','Samiti'),
('Asifbad','2015','Harula','Raghava','Bharatiya','Janata','Party'),
('Chennur','2015','Kalvakuntla','Tarak','Telugu','Desam','Party'),
('Jagityal','2015','Vennam','JayaShankar','All','India','Party'),
('Karimnagar','2015','Paraala','Rahul','All','India','Party'),
('Vemulavada','2015','Revanth','Reddy','All','India','Party'),
('Chennur','2010','Kalvakuntla','Tarak','Telugu','Desam','Party'),
('Jagityal','2010','Vennam','JayaShankar','All','India','Party'),
('Chikadpalli','2015','Kalvakuntla','Kavita','All','India','Party');

INSERT INTO Policies VALUES ('1000000','250000','RaithuBandhu','750000','64','Ponnurangam','Krishna','2015');
INSERT INTO Policies VALUES ('777000','700000','Kalyanalakshmi','77000','78','Harula','Raghava','2015');
INSERT INTO Policies VALUES ('6300','1000','TreePlantation','5200','94','Kalvakuntla','Tarak','2015');
INSERT INTO Policies VALUES ('40000','33000','Haritaharan','7000','67','Vennam','JayaShankar','2015');
INSERT INTO Policies VALUES ('100','98','Railway','2','58','Paraala','Rahul','2015');
INSERT INTO Policies VALUES ('77777','77000','Nohunger','777','94','Revanth','Reddy','2015');
INSERT INTO Policies VALUES ('6300','1000','CoffeePlantation','5200','52','Kalvakuntla','Tarak','2010');
INSERT INTO Policies VALUES ('33300000','21000000','Saree','12300000','74','Kalvakuntla','Kavita','2015');
INSERT INTO Policies VALUES ('40000','33000','Haritaharanm','7000','28','Vennam','JayaShankar','2010');

INSERT INTO Opponents VALUES('Sirpur','2015','Karanam','Malleswari','Free','WiFi','Telugu','Desam','Party');
INSERT INTO Opponents VALUES ('Asifbad','2015','Sachin','Chaudari','OldAge','Pension','Telugu','Desam','Party');
INSERT INTO Opponents VALUES ('Chennur','2015','Srihitha','Reddy','Full','Electricity','Telangana','Rashtra','Samiti');
INSERT INTO Opponents VALUES ('Jagityal','2010','Keerthi','Reddy','Full','Employment','Bharatiya','Janata','Party');
INSERT INTO Opponents VALUES ('Sirpur','2015','Nandamuri','Ramarao','Free','WiFi','All','India','Party');
INSERT INTO Opponents VALUES ('Sirpur','2015','Riyaan','Shah','Free','WiFi','Bharatiya','Janta','Party');
INSERT INTO Opponents VALUES ('Jagityal','2010','Veera','Reddy','Full','Employment','Telangana','Rahtra','Samiti');
INSERT INTO Opponents VALUES ('Chennur','2010','Harula','Raghava','Full','Electricity','Bharatiya','Janata','Party');

INSERT INTO Members
VALUES       ('18','20042004','Ramana','Rey','Telangana','Rashtra','Samiti','Sirpur'),
             ('22','20032000','Rahul','Ramakrishna','All','India','Party','Asifbad'),
             ('42','24131980','Revanth','Girish','Telugu','Desam','Party','Chikadpalli'),
             ('14','20082008','Harini','Vikram','Telugu','Desam','Party','Jagityal');

             INSERT INTO Supporters
VALUES       ('94','22-32','Job','employment','2015','Vennam','JayaShankar'),
             ( '77','40-60','Money','Pension','2015','Harula','Raghava'),
             ('92','61-72','Money','Pension','2015','Harula','Raghava');

             INSERT INTO Contact 
VALUES       ('123456789','Ramana','Rey'),
             ('9441346252','Rahul','Ramakrishna'),
             ('9490016085','Revanth','Girish'),
             ('7658903454','Harini','Vikram');

             INSERT INTO Will_Implement 
VALUES       ('Ponnurangam','Krishna','RaithuBandhu','2015'),
             ('Harula','Raghava','Kalyanalakshmi','2015'),
             ('Kalvakuntla','Tarak','TreePlantation','2015'),
             ('Vennam','JayaShankar','Haritaharan','2015'),
             ('Paraala','Rahul','Railway','2015'),
             ('Revanth','Reddy','Nohunger','2015'),
             ('Kalvakuntla','Tarak','CoffeePlantation','2010'),
             ('Kalvakuntla','Kavita','Saree','2015'),
             ('Vennam','JayaShankar','Haritaharanm','2010');
             INSERT INTO Will_Gain
VALUES       ('22-32','2015','Vennam','JayaShankar'),
             ('40-60','2015','Harula','Raghava'),
             ('61-72','2015','Harula','Raghava');
             INSERT INTO Support_in_Election_for
VALUES       ('Sirpur','2015','Ramana','Rey'),
             ('Asifbad','2015','Rahul','Ramakrishna'),
             ('Chikadpalli','2015','Revanth','Girish'),
             ('Jagityal','2010','Harini','Vikram');
 
             INSERT INTO Swindle
VALUES      ('Backtable','Vehicle','1000000','Irugula','Hanish','Ponnurangam','Krishna','2015'),
            ('FakeVillage','Powerplant','148888888','Kihika','Priyya','Harula','Raghava','2015'),
            ('Soldhighprice','Coal','13444','Earth','Pit','Kalvakuntla','Tarak','2015'),
            ('FakeTaxes','Monthly','10000000','Hope','Reddy','Vennam','JayaShankar','2010'),
            ('NoPaying','Taxes','1244556','Moksha','Rao','Paraala','Rahul','2015');
            INSERT INTO Included_In
VALUES      ('Ponnurangam','Krishna','2015','Irugula','Hanish'),
            ('Harula','Raghava','2015','Kihika','Priyya'),
            ('Kalvakuntla','Tarak','2015','Earth','Pit'),
            ('Vennam','JayaShankar','2010','Hope','Reddy'),
            ('Paraala','Rahul','2015','Moksha','Rao');

            INSERT INTO Participate_For
VALUES      ('Sirpur','2015','Ponnurangam','Krishna','Karanam','Malleswari'),
            ('Asifbad','2015','Harula','Raghava','Sachin','Chaudhari'),
            ('Chennur','2015','Kalvakuntla','Tarak','Srihitha','Reddy'),
            ('Jagityal','2010','Vennam','JayaShankar','Keerthi','Reddy'),
            ('Sirpur','2015','Ponnurangam','Krishna','Nandamuri','Ramarao'),
            ('Sirpur','2015','Ponnurangam','Krishna','Riyaan','Shah'),
            ('Jagityal','2010','Vennam','JayaShankar','Veera','Reddy'),
            ('Chennur','2010','Kalvakuntla','Tarak','Harula','Raghava');