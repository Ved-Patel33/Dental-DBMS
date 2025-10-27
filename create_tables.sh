#!/bin/sh
username=$1
password=$2
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 -s "$username/$password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.cs.torontomu.ca)
(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

SET ECHO OFF

CREATE TABLE Patient (
    patientID INT PRIMARY KEY,
    pfirst_name VARCHAR2(30) NOT NULL,
    plast_name VARCHAR2(30) NOT NULL,
    pDOB DATE NOT NULL,
    paddress VARCHAR2(100),
    pphone VARCHAR2(15),
    pemail VARCHAR2(100),
    medical_history CLOB);

CREATE TABLE Appointment (
    appointmentID INT PRIMARY KEY,
    patientID INT NOT NULL,
    appointment_date DATE NOT NULL,
    status VARCHAR2(20) CHECK (status IN ('Upcoming','Missed','Attended')),
    FOREIGN KEY (patientID) REFERENCES Patient(patientID));

CREATE TABLE Treatment (
    treatmentID INT PRIMARY KEY,
    treatmentName VARCHAR2(20) NOT NULL,
    cost DECIMAL(8,2) NOT NULL);

CREATE TABLE Appointment_Treatment (
    apptTreatID INT PRIMARY KEY,
    appointmentID INT NOT NULL,
    treatmentID INT NOT NULL,
    quantity INT DEFAULT 1,
    FOREIGN KEY (appointmentID) REFERENCES Appointment(appointmentID),
    FOREIGN KEY (treatmentID) REFERENCES Treatment(treatmentID));

CREATE TABLE Financial_Record (
    billID INT PRIMARY KEY,
    apptTreatID INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    status VARCHAR2(20) CHECK (status IN ('Pending','Paid','Overdue')),
    FOREIGN KEY (apptTreatID) REFERENCES Appointment_Treatment(apptTreatID));

CREATE TABLE Employee (
    empID INT PRIMARY KEY,
    efirst_name VARCHAR2(30) NOT NULL,
    elast_name VARCHAR2(30) NOT NULL,
    ephone_num VARCHAR2(15) NOT NULL,
    eemail VARCHAR2(100) NOT NULL);

CREATE TABLE Secretary (
    sec_id INT PRIMARY KEY,
    empID INT NOT NULL,
    FOREIGN KEY (empID) REFERENCES Employee(empID));
    
CREATE TABLE Dental_Staff (
    dental_id INT PRIMARY KEY,
    empID INT NOT NULL,
    FOREIGN KEY (empID) REFERENCES Employee(empID));

CREATE TABLE Billing_Admin (
    billing_admin_id INT PRIMARY KEY,
    empID INT NOT NULL,
    FOREIGN KEY (empID) REFERENCES Employee(empID));
    
CREATE TABLE Part_Time( 
    hourly_wage NUMBER NOT NULL,
    empID INT NOT NULL,
    FOREIGN KEY (empID) REFERENCES Employee(empID));
    
CREATE TABLE Full_Time(
    salary NUMBER NOT NULL,
    empID INT NOT NULL,
    FOREIGN KEY (empID) REFERENCES Employee(empID));
    
CREATE TABLE Schedule (
    work_date DATE,
    empID INT NOT NULL,
    FOREIGN KEY (empID) REFERENCES Employee(empID));

PROMPT >>> Tables Created Successfully
Exit;
EOF


