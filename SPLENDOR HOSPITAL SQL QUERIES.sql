CREATE DATABASE Splendor_Specialist_Hospital;

USE Splendor_Specialist_Hospital;


CREATE TABLE Patients(
PatientID INT PRIMARY KEY IDENTITY (1,1),
 FullNmae VARCHAR (100) NOT NULL,
Gender CHAR (1) CHECK (gender IN ('M', 'F')) NOT NULL ,
DateOfBirth DATE NOT NULL,
MaritalStatus CHAR (1)  CHECK (MaritalStatus IN ('M', 'S', 'D')) NOT NULL,
Address VARCHAR (150) NOT NULL,
State VARCHAR (30) NOT NULL,
Phone_Number CHAR (11) UNIQUE NOT NULL,
EmailAddress VARCHAR (100) UNIQUE NOT NULL,
HMOInsurance VARCHAR (20)
);

SELECT * FROM Patients;

ALTER TABLE Patients
DROP COLUMN HMOInsurance;


CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY IDENTITY (01,1),
DepartmentName VARCHAR (30) NOT NULL
);

SELECT * FROM Departments;

CREATE TABLE Doctors(
DoctorID INT PRIMARY KEY IDENTITY  (100,1),
FullNmae VARCHAR (100) NOT NULL,
DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
PhoneNumber CHAR (11) NOT NULL,
EmailAddress VARCHAR (50) NOT NULL,
Speciality VARCHAR (50) NOT NULL
);

SELECT * FROM Doctors;


ALTER TABLE Doctors
DROP COLUMN Speciality;


ALTER TABLE Doctors
ADD DeaprtmentName VARCHAR (100);


CREATE TABLE Medical_Records(
RecordID INT PRIMARY KEY IDENTITY (1,1),
DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID) NOT NULL,
PatientID INT FOREIGN KEY REFERENCES Patients(PatientID) NOT NULL, 
AdmissionDate DATE NOT NULL,
DiagnosisHistory TEXT NOT NULL,
Treatment TEXT, 
AdmissionType VARCHAR (50) CHECK (AdmissionType IN ('Emergency', 'Regular')),
DoctorsID INT FOREIGN KEY REFERENCES Doctors(DoctorID) NOT NULL
);

SELECT * FROM Medical_Records;



CREATE TABLE Appointments (
AppointmentID INT PRIMARY KEY IDENTITY (1,1),
PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
DoctorID INT FOREIGN KEY REFERENCES Doctors(DoctorID),
AppointmentDate DATE,
AppointmentTime TIME NOT NULL, 
AppointmentStatus VARCHAR (50)  CHECK (AppointmentStatus IN('Scheduled', 'Cancelled', 'Completed'))
);

CREATE TABLE Payments ( 
PaymentID INT PRIMARY KEY IDENTITY (1,1),
PatientID INT FOREIGN KEY REFERENCES Patients(PatientID),
DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
Amount DECIMAL (20,2),
PaymentMethod CHAR (50)  CHECK (PaymentMethod IN ('Credit', 'Card', 'Cash','Insurance')) NOT NULL,
PaymentDate DATE
);



 SELECT * FROM Payments;
 SELECT * FROM Patients;

 


 INSERT INTO Patients (FullNmae, Gender, DateOfBirth, MaritalStatus, Address, State, Phone_Number, EmailAddress, HMOInsurance)
 VALUES( 'Khadijat Kalu', 'F', '1987-04-12','M', '12 Ago Palace Estate', 'Lagos','09045112390', 'khadikal@gmail.com', 'HMO1');

 INSERT INTO Patients (FullNmae, Gender, DateOfBirth, MaritalStatus, Address, State, Phone_Number, EmailAddress, HMOInsurance)
 VALUES('Noah Abdul', 'M', '1993-04-04', 'M', '56 Cele str', 'Benue', '08123909985', 'abdulnoah@gmail.com', 'HMO2'),
  ('Aina Oge', 'F', '1989-10-23', 'S', '34 Otta RD', 'Ogun', '09023667623', 'ogeaina@gmail.com', 'HMO3'),
  ('David Akpan', 'M', '1998-11-30','S', '106 Canoe', 'Akwa ibom', '07087980990','davidakpan10@gmail.com',  'HMO4'),
  ( 'Juliet Bauchi', 'F', '1896-09-25', 'S', '34 Branco', 'Bayelsa', '07012003962', 'julietbauchi198@gmail.com', 'HMO5'),
  ('Henry Iheikwe', 'M', '1990-12-25', 'M', '45 Ajao Estate', 'Imo', '08123787654', 'henryikwe@gmail.com', 'HMO1');

INSERT INTO Patients (FullNmae, Gender, DateOfBirth, MaritalStatus, Address, State, Phone_Number, EmailAddress, HMOInsurance)
 VALUES( 'Sandra Joe', 'F', '1995-07-14', 'S', '53 Ugbowo', 'Abia', '07023657676', 'sandrajoe422@gmail.com', 'HMO5'),
 ('Patience Udoh', 'F', '1995-02-21', 'M', '19 Oshodi', 'Anambra', '08098765432', 'udohpat@gmail.com', 'HMO4'),
 ('Eunice Ebebe', 'F', '1893-11-22', 'M', '18 Egun str', 'Akwa ibom', '08176502323', 'euniceebebe@gmail.com', 'HMO3'),
 ('Amarachi Eze', 'F', '2000-10-01', 'S', '21 Ladipo', 'Abia', '09045547689', 'amaraeze@gmail.com', 'HMO2'),
 ('Musa Ahmed', 'M', '1994-09-21', 'M', '45B Ajao Estate', 'Kaduna', '07019234567', 'ahmedmusa223@gmail.com', 'HMO2'),
 ( 'Richard Efe', 'M', '1990-08-24', 'S', '98 Charity', 'Delta', '08176099323', 'richardefe@gmail.com','HMO3'),
 ( 'Mariam Adegoke', 'F', '1997-10-23', 'M', '45 Oja', 'Oyo', '07098763445', 'mariam456@gmail.com', 'HMO4'),
 ( 'Israel Ibrahim', 'M', '1992-08-25', 'S', '89 Ishaga', 'Kwara', '07023667623', 'israelibah@gmail.com', 'HMO5'),
 ( 'Judith Ibe', 'F', '1992-07-30', 'S', '109 Olaiya' , 'Cross river', '08164197654', 'judyibe@gmail.com', 'HMO1');

 INSERT INTO Patients (FullNmae, Gender, DateOfBirth, MaritalStatus, Address, State, Phone_Number, EmailAddress, HMOInsurance)
 VALUES( 'Isaac Daniel' ,'M', '1972-05-21', 'M', '83 Ogodu', 'Osun', '07019230001', 'isaacdan@gmail.com', 'HMO1'),
 ('Osas Ogedegbe', 'M', '1993-04-04', 'S', 'Ugbowo Estate', 'Edo', '07095109234', 'osasog200@gmail.com', 'HMO2'),
 ( 'Chidi Celestine', 'M', '2002-10-27', 'S', '56 Amen Estate', 'Anambra', '07063196323', 'chidicele@gmail.com', 'HMO3'),
 ( 'Emmanuel Elijah', 'M', '1999-01-10', 'S', '90 Alimosho', 'Abuja', '08187765445', 'emmajah@gmail.com', 'HMO4'),
 ( 'Chidinma Justin', 'F', '1999-11-21', 'M', '45 Ikorodu', 'Delta', '08159197597', 'chidinma@gmail.com', 'HMO5');


  
SELECT * FROM Patients;

-- INSERTING VALUES INTO DEPARTMENTS TABLE

INSERT INTO Departments ( DepartmentName)
VALUES ('Obsterics and  Gynaecology'),
( 'Cardiology'),
('Ophthalmology'),
('Accident and emergenct (A & E'),
('Surgery'),
('Book-keeping & Finance');

SELECT * FROM Departments;

---

SELECT * FROM Doctors;

-- INSERTING VALUES INTO DOCTORS' TABLE
INSERT INTO Doctors (FullNmae, DepartmentID, PhoneNumber, EmailAddress,DeaprtmentName) 
VALUES ('Professor Sarah Obaseki', 1, '08123324554', 'sarahsplendor@gmail.com', 'Obsterics and  Gynaecology'),
( 'Dr. Edet Samson', 2, '07098890098', 'edetsplendor@gmail.com', 'Cardiology'),
( 'Dr. Solomon Ehiwaro', 3, '09177879900', 'solomonsplendor@gmail.com', 'Ophthalmology'),
( 'Professor Victory Daniel', 4, '09078684888', 'victorysplendor@gmail.com', ' Accident and emergenct (A & E'),
('Dr. Sodiq Muhammed', 5, '08190807060', 'sodiqsplendor@gmail.com', 'Surgery'),
('Accountant Ambrose Mary', 6, '08165033201', 'marysplendor@gmail.com', 'Book-keeping & Finance');


-- INSERTING VALUES INTO MEDICAL RECORDS TABLE

SELECT * FROM Medical_Records; 

INSERT INTO Medical_Records (DepartmentID, PatientID, AdmissionDate, DiagnosisHistory, Treatment, AdmissionType, DoctorsID)
VALUES ( 1, 30, '2024-08-20', 'Hypertension - High blood pressure ', 'Constant headache, nausea, body pain, drowsiness Go to pharmacy for drugs','Regular', 102 );

INSERT INTO Medical_Records (DepartmentID, PatientID, AdmissionDate, DiagnosisHistory, Treatment, AdmissionType, DoctorsID)
VALUES (5, 6, '2024-10-02', 'Appendix Sudden pain around navel loss of appetite fever', 'open appendectomy', 'Emergency', 104);

INSERT INTO Medical_Records (DepartmentID, PatientID, AdmissionDate, DiagnosisHistory, Treatment, AdmissionType, DoctorsID)
VALUES (1, 1, '2024-05-18',  'Prenatal care' , 'Blood tests ultra sounds & vaccinations ', 'Regular', 102);

-- CHANGE DOCTOR'S ID FOR PRENATAL CARE
UPDATE Medical_Records
SET DoctorsID = 100
WHERE RecordID= 7;

-- CHANGE DOCTOR'S ID FOR HYPERTENSION
UPDATE Medical_Records
SET DoctorsID = 101
WHERE RecordID= 5;

UPDATE Medical_Records
SET DepartmentID = 2
WHERE RecordID= 5;

SELECT * FROM Medical_Records;

INSERT INTO Medical_Records (DepartmentID, PatientID, AdmissionDate, DiagnosisHistory, Treatment, AdmissionType, DoctorsID)
VALUES ( 4, 25, '2024-03-21', 'Breathing difficulties', 'chest pain tightness short of breath', 'Emergency', 103);


INSERT INTO Medical_Records (DepartmentID, PatientID, AdmissionDate, DiagnosisHistory, Treatment, AdmissionType, DoctorsID)
VALUES ( 3, 27, '2024-09-14', 'Glaucoma', 'blur vision oral medications', 'Regular' , 102);

INSERT INTO Medical_Records (DepartmentID, PatientID, AdmissionDate, DiagnosisHistory, Treatment, AdmissionType, DoctorsID)
VALUES ( 2, 34, '2024-01-20', 'Heart failure', 'fatigue shortness of breath pain in back neck jaw', 'Emergency', 101); 

INSERT INTO Medical_Records (DepartmentID, PatientID, AdmissionDate, DiagnosisHistory, Treatment, AdmissionType, DoctorsID)
VALUES (1, 5, '2024-04-04', 'Uterine fibroids', 'Heavy menstrual bleeding pelvic pain frequent urination', 'Regular', 100),
( 5, 29, '2024-10-19', 'Oncological surgery tumor removal', 'swelling pain changes in appetite', 'Emergency', 104),
(4, 38, '2024-02-11', 'Burns', 'redness swelling severe pain',  'Emergency', 103), 
( 3, 35, '2024-06-02', 'Conjunctivitis pink eye', 'eye redness itching discharge burning', 'Emergency', 102);

INSERT INTO Medical_Records (DepartmentID, PatientID, AdmissionDate, DiagnosisHistory, Treatment, AdmissionType, DoctorsID)
VALUES ( 4, 3, '2024-09-13', 'Stroke', 'Body weakness vision problems loss of balance trouble speaking', 'Regular', 103),
(5, 28, '2024-07-11', 'Infertility treatment', ' mood swings bloating abdominal discomfort', 'Regular', 104),
(3, 31, '2024-07-01',  'Eye injuries and trauma', 'Pain redness swelling blurred vision eye discharge', 'Emergency', 102),
( 1, 26, '2024-01-02', 'Amenorrheab Menstrual Disorder', 'Absence of periods', 'Emergency', 100),
(1, 33, '2024-03-30', 'Endometriosis', 'Painful periods pain during intercourse heavy bleeding pelvic pain', 'Regular' ,100),
(2, 3, '2024- 04-21', 'Arrhythmias irregular heartbeats', 'fainting dizziness chest discomfort', 'Emergency', 101),
(5,37, '2024- 10-25', 'Cholecystectomy removall of the gallbladder', 'pain in upper right abdomen vomittingdigestive issues', 'Regular', 104),
(3, 2, '2024-05-17', 'Astigmatism', 'blurred vision eye strain headaches', 'Regular', 102), 
(4, 36, '2024-05-31', 'Poisoning', 'nausea vomiting loss of conciousness', 'Emergency', 103),
(5, 26, '2024-06-24', 'Hip replacement surgery', 'pain in groin area difficulty walking stiffness in hip joint', 'Regular', 104);

-- INSERT VALUES INTO APPOINTMENTS TABLE

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, AppointmentStatus)
VALUES (1,  30, 101, '2024-08-20', '10:30:00', 'Scheduled');

--SHOWING ERRORS, HAD TO TURN ON IDENTITY INSERT

SET IDENTITY_INSERT Appointments ON;

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, AppointmentStatus)
VALUES (2, 6, 104, '2024-10-03', '08:00:00', 'Completed'),
(4, 25, 103, '2024-03-22', '10:10:00', 'Scheduled'),
(5, 27, 102, '2024-09-16', '03:15:00', 'Scheduled'),
 (6, 34, 101, '2024-01-21', '02:20:00', 'Completed'),
(7, 5, 100, '2024-04-06', '09:00:00', 'Scheduled'),
(8, 29, 104, '2024-10-22', '08:00:00', 'completed'),
(9, 38, 103, '2024-02-11', '11:04:21', 'Completed'),
(10, 35, 102, '2024-02-12', '12:00:00','Scheduled'),
 ( 11, 3, 103, '2024-09-15', '01:10:00', 'Scheduled'),
 (12, 28, 104, '2024-07-13', '10:35:00', 'Scheduled'),
 (13, 31, 102, '2024-07-01', '02:17:00', 'Completed'),
 (14, 26, 100, '2024-01-02','01:00:00', 'Scheduled'),
 (15, 33, 100, '2024-03-30', '03:23:25', 'Completed'),
 (16, 3, 101, '2024-04-21', '11:27:32', 'Completed'),
 (17, 37, 104, '2024-10-27', '04:10:00', 'Scheduled'),
 (18, 2, 102, '2024-05-19', '01:15:00', 'Scheduled'),
 (19, 36, 103, '2024-05-31', '07:12:00', 'Completed'),
(20, 26, 104, '2024-06-28', '12:00:00', 'Scheduled');

-- TO SELECT ALL TABLES AND VIEW RECORDS

SELECT * FROM Appointments;
SELECT * FROM Medical_Records;
SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Departments;



