# Splendor-Specialist-Hospital-Database-
## Project Description
This project, Splendor Hospital Database, is a comprehensive database solution designed to enhance healthcare analytics and streamline hospital management. The DB contains 5 interconnected tables. The project also aims to contribute to improved healthcare outcomes via data-driven strategies. Join me in exploring data  potential in health sector. 
## Project Overview
This respository contains the **Database design and Implementation** project for **Splendor Specialist Hospital**, an innovative database solution designed to enhance the management and analysis of  healthcare data within the hospital. This comprehensive database project compelted by Love Friday in October, 2024 conains five interconnected tables: **Patients, Departments, Doctors, Medical Records, and Appointments**. 

Each table plays a crucial role in capturing essentail information. The **patients table ** stores key details about individuals receiving care, while the **Doctors table** contains profiles of healthcare professionals. The **Medical Records table** ensures that patients histories and treatment details are meticulously documented, facilitating continuity of care. The **Appointments table** manages schedulling, tracking patients visits and ensuring efficient use of resources. Finally, the **Departments table** organizes the various specialties within the hospital, allowing for streamlined operations and cordination among different areas of care. 

The relational structure of the database not only promotes data integrity but also enables complex queries that can yield valuable insights. By analyzing this interconnected data, healthcare professionals can improve patient outcomes, optimize appointment scheduling, and enhance departmental collaboration. The **Splendor Specialist Hospital** database stands as a vital tool for data-driven decision-making in the healthcare sector, ultimately aimimg to elevate the quality of care provided to patients. 

---

##Table of Contents
1. [Introduction](#introduction)
2. [Database Design Process](#database-design-process)
   - [Requirements Gathering](#requirement-gathering)
   - [Conceptual Design](#conceptual-design)
   - [Logical Design](#logical-design)
   - [Physical Design](#physical-design)
3. [Database Schema and Implementation](#database-schema-and-implementation)
    - [Patients Table](#patients-table)
    - [Departments Table](#departments-table)
    - [Medical Records Table](#medical-records-table)
    - [Doctors Table](#doctors-table)
    - [Appointments Table](#appointments-table)
 4. [Normalization](#normalization)
   - [First Normal Form](#first-normal-form)
   - [Second Normal Form](#second-normal-form)
   - [Third Normal Form](#third-normal-form)
5. [Justification of Design Choices and Conclusion](#justification-of-design-choices-and-conclusion)

---
## Introduction
Splendor Analytics Consultancy has been engaged to design and implement a comprehensive database system for Splendor Specialist Hospital. The goal is to create a robust, scalable, and efficient solution for managing the hospital's critical data, including patient information, doctor details, medical records, appointments, and departmental data. This system is vital for enhancing operational efficiency, ensuring data integrity, and providing seamless access to essential information for medical staff and administrators.

In today's healthcare landscape, effective data management is crucial for both patient care and administrative operations. Splendor Analytics Consultancy is committed to delivering a seamless experience for patients while ensuring that healthcare providers have immediate access to the information. To this end, the database system will streamline patient registration, appointment scheduling, and medical records management. 

Upon registration at Splendor Specialist Hospital, a patient must provide essential personal information, including their full name, address, date of birth, and other details. Patient's  emailaddress will serve as their username while they create password for secure access into their patient portal, enabling them to manage their healthcare journey effectively. The system is designed to store this data securely, ensuring compliance with privacy regulations and maintain communication between patients and hospital. 

Once registered, patients are to book appointments through the patient portal. The database system will facilitate real-time checks of doctor availability, allowing patients to schedule their visits without unnecessary delays. Appointment details will be stored, including date and time of the appointment, the relevant department, the status of the appointment (scheduled, canceled, or completed), and the assigned doctor. Upon a patient's arrival for their scheduled appointment, doctors will have immediate access to the patient's medical records. This includes past appointments, diagnoses, medications, and known allergies, allowing for a comprehensive review of the patient’s health history. Healthcare providers can update these records with new diagnoses and medications during the consultation, ensuring that the patient's medical history remains current and accurate. Following the appointment, the status will be updated to reflect its completion, and patients will have the opportunity to provide feedback or reviews for the doctor, contributing to continuous improvement in care quality.

By leveraging industry best practices and advanced database design techniques, this report provides a detailed overview of the database structure, the implementation process, and the
rationale behind each decision, ensuring the system meets the hospital's current and future needs. With this new database system, Splendor Analytics Consultancy is poised to enhance patient care, streamline operations, and maintain a high standard of medical services, ultimately benefiting both patients and healthcare providers.

---

## Database Design Process
###  Requirements Gathering
In the initial phase of our project, I collaborated closely with various stakeholders at Splendor Specialist Hospital, including administrative staff, healthcare providers, and IT personnel, to capture their specific needs and expectations for the new database system. This collaborative approach was crucial for understanding the intricacies of hospital operations and ensuring that the proposed solution aligns with the operational workflow. The primary requirements gathered include comprehensive patient and doctor details, including names, contact information, and relevant medical specialties.

One of the key aspects identified was the management of medical records, which encompasses detailed information about patient diagnoses, prescriptions, and treatment histories. To facilitate efficient healthcare delivery, the database must support seamless appointment scheduling and tracking, allowing patients to manage their visits and doctors to have real-time access to their schedules. Additionally, an organizational structure for various hospital departments is necessary to ensure that appointments are correctly categorized and that patient information is easily retrievable based on departmental requirements.

In line with these requirements, we implemented key data points reflecting patient data sampling, which will be elaborated upon in Chapter 3 (Database Schema and Implementation). This sampling ensures that the data collected is representative and meets the diverse needs of the hospital’s patient demographic.

### Conceptual Design 
Using an Entity- Relation (ER) Model, the following entities were defined; 
- **Patients**: Personal and contact details 
- **Departments**: Organizational structure for medical departments
- **Doctors**: Specialties and availability 
- **Medical Record**: Histrical records of diagnosis and medication 
- **Appointments**: Scheduling and status
- 
### Logical Design 
The logical design phase involved translating the conceptual ER model into a structured format suitable for implementation in a relational database. This included defining specific tables for each entity identified earlier, ensuring that all relationships among entities are established correctly. For instance, the Appointments table is linked to both the Patients and Doctors tables through foreign keys, which helps maintain data integrity and referential integrity throughout the database.

Appropriate primary keys were established for each table, ensuring that each record can be uniquely identified. For example, the PatientID serves as the primary key in the Patients table, while the AppointmentID uniquely identifies each appointment in the Appointments table. This design enhances data retrieval efficiency and supports the implementation of business rules, such as ensuring that a patient cannot book overlapping appointments with the same doctor.

### Physical Design
In the final phase, we implemented the physical design of the database using **T-SQL** within **SQL Server**. This involved selecting appropriate data types for each attribute, establishing constraints to ensure data accuracy, and creating indexes to optimize query performance. This meticulous approach to physical design ensures that the system not only meets current operational needs but is also scalable for future growth.

By aligning our design and implementation strategies with the specific requirements gathered from stakeholders, Splendor Analytics Consultancy is committed to delivering a robust database solution that enhances the operational efficiency of Splendor Specialist Hospital  while ensuring high-quality patient care.

---
## Database Schema and Implementation 
### Patients Table

| Column            | Data Type           | Constraints                        |
|-------------------|---------------------|------------------------------------|
| Patient_ID        | INT                 | PRIMARY KEY, AUTO- INCREMENT       |
| Full_Name         | VARCHAR (100)       | NOT NULL                           |
| Gender            | CHAR (1)            | CHECK IN ('M', 'F'), NOT NULL      |
| Date_Of_Birth     | DATE                | NOT NULL                           |
| Marital_Status    | CHAR (1)            | CHECCK IN ('M', 'S', 'D'), NOT NULL|
| Address           | VARCHAR (150)       | NOT NULL                           |
| State             | VARCHAR (30)        | NOT NULL                           |
| Phone_Number      | CHAR (11)           | UNIQUE, NOT NULL                   |
| Email_Address     | VARCHAR (100)       | UNIQUE, NOT NULL                   |
|HMO_Insurance      | VARCHAR (20)        |                                    |

### Departments Table

| Column            | Data Type           | Constraints                        |
|-------------------|---------------------|------------------------------------|
| Department_ID     | INT                 | PRIMARY KEY, AUTO- INCREMENT       |
| Department_Name   | VARCHAR (30)        | NOT NULL                           |

### Doctors Table

| Column            | Data Type           | Constraints                        |
|-------------------|---------------------|------------------------------------|
| Doctors_ID        | INT                 | PRIMARY KEY, AUTO- INCREMENT       |
| Full_Name         | VARCHAR (100)       | NOT NULL                           |
| Department_ID     | INT                 | FOREIGN KEY REFERENCES Departments |    
| PhoneNumber       | CHAR (11)           | NOT NULL                           |
| Email_Address     | VARCHAR (50)        | NOT NULL                           |
|Speciality         | VARCHAR (50)        | NOT NULL                           |

### Medical Records Table

| Column            | Data Type           | Constraints                        |
|-------------------|---------------------|------------------------------------|
| Record_ID         | INT                 | PRIMARY KEY, AUTO- INCREMENT       |
| Department_ID     | INT                 | FOREIGN KEY REFERENCES Departments |
| Patient_ID        | INT                 | FOREIGN KEY REFERENCES Patients    |
| AdmissionDate     | DATE                | NOT NULL                           |
| Diagnosis_History | TEXT                |     NOT NULL                       |
| Treatment         | TEXT                |                                    |
| AdmissionType     | VARCHAR (50)        | CHECK IN('Emergency', 'Regular')   |
| DoctorsID         | INT                 | FOREIGN KEY REFERENCES Doctors     |

### Appointments Table

| Column            | Data Type           | Constraints                                   |
|-------------------|---------------------|---------------------------------------------- |
| AppointmentID     | INT                 | PRIMARY KEY, AUTO- INCREMENT                  | 
| Patient_ID        | INT                 | FOREIGN KEY REFERENCES Patients               |
| DoctorID          | INT                 | FOREIGN KEY REFERENCES Doctors                |
| Appointment_Date  | DATE                |                                               |
| DAppointment_Time | TIME                |     NOT NULL                                  |
| AppointmentStatus | TEXT                | CHECK IN('Scheduled','Cancelled','Completed') |                                          

---

## Normalization 

### First Normal Form (1NF)
- Ensures that each column in a table contains only  atomicity values, meaning that each entry must be indivisible. This eliminates any repeating groups within a single column, allowing for a clearer structure.
- **For example**:The patients table contains separate columns such as Email Address and Phone number. This design adheres to 1NF as each column holds a single piece of information. 

### Second Normal Form (2NF)
- Eliminates partial dependencies by ensuring that non-key attributes depend fully on the primary key.
- For example: In the medical records table, attributes such as Diagnosis history and Treatment are fully dependent on Record_ID, the primary key of the table. This ensures that no partial dependencies exist, fulfilling the requirements of 2NF.  

### Third Normal Form (3NF)
- Eliminates transitive dependencie, ensuring data integrity by linking related tables through foreign keys.
- For example: The patients table does not store Department name, which belongs to the departments table. By ensuring that such relationships are maintained in their respective tables, the design adheres to 3NF, promoting data integrity and reducing redundancy. 
  
---

## Justification of Design Choices and Conclusion


  



