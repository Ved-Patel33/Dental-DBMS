#!/bin/sh
username=$1
password=$2
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 -s "$username/$password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.cs.torontomu.ca)
(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

-- Patient Table Population
INSERT ALL
  INTO Patient (patientID, pfirst_name, plast_name, pDOB, paddress, pphone, pemail, medical_history)
       VALUES (1, 'John', 'Doe', TO_DATE('1985-06-15','YYYY-MM-DD'), '123 Main St, Toronto', '4165551234', 'john.doe@dentist.com', 'Allergic to penicillin')
  INTO Patient (patientID, pfirst_name, plast_name, pDOB, paddress, pphone, pemail, medical_history)
       VALUES (2, 'Jane', 'Smith', TO_DATE('1990-11-02','YYYY-MM-DD'), '456 Queen St, Toronto', '4165555678', 'jane.smith@dentist.com', 'No known allergies')
  INTO Patient (patientID, pfirst_name, plast_name, pDOB, paddress, pphone, pemail, medical_history)
       VALUES (3, 'Ahmed', 'Khan', TO_DATE('2000-03-21','YYYY-MM-DD'), '789 King St, Toronto', '4165559876', 'ahmed.khan@dentist.com', 'History of gum disease')
  INTO Patient (patientID, pfirst_name, plast_name, pDOB, paddress, pphone, pemail, medical_history)
       VALUES (4, 'Sara', 'Ali', TO_DATE('1995-08-10','YYYY-MM-DD'), '321 Bloor St, Toronto', '4165556543', 'sara.ali@dentist.com', 'Braces')
  INTO Patient (patientID, pfirst_name, plast_name, pDOB, paddress, pphone, pemail, medical_history)
       VALUES (5, 'Liam', 'Brown', TO_DATE('2002-12-05','YYYY-MM-DD'), '654 Yonge St, Toronto', '4165554321', 'liam.brown@dentist.com', 'Sensitive teeth')
SELECT * FROM dual;

-- Appointment Table Population
INSERT ALL
  INTO Appointment (appointmentID, patientID, appointment_date, status)
       VALUES (1, 1, TO_DATE('2025-10-10','YYYY-MM-DD'), 'Attended')
  INTO Appointment (appointmentID, patientID, appointment_date, status)
       VALUES (2, 2, TO_DATE('2025-10-12','YYYY-MM-DD'), 'Upcoming')
  INTO Appointment (appointmentID, patientID, appointment_date, status)
       VALUES (3, 3, TO_DATE('2025-10-11','YYYY-MM-DD'), 'Missed')
  INTO Appointment (appointmentID, patientID, appointment_date, status)
       VALUES (4, 4, TO_DATE('2025-10-15','YYYY-MM-DD'), 'Upcoming')
  INTO Appointment (appointmentID, patientID, appointment_date, status)
       VALUES (5, 5, TO_DATE('2025-10-14','YYYY-MM-DD'), 'Attended')
SELECT * FROM dual;
INSERT INTO Appointment (appointmentID, patientID, appointment_date, status)
VALUES (6, 1, TO_DATE('2025-10-20', 'YYYY-MM-DD'), 'Upcoming');
INSERT INTO Appointment (appointmentID, patientID, appointment_date, status)
VALUES (7, 1, TO_DATE('2025-11-01', 'YYYY-MM-DD'), 'Upcoming');


-- Employee Table Population
INSERT INTO Employee (empID, efirst_name, elast_name, ephone_num, eemail) VALUES (1, 'Sarah', 'Johnson', '4165550101', 'sarah.johnson@dentalclinic.com');
INSERT INTO Employee (empID, efirst_name, elast_name, ephone_num, eemail) VALUES (2, 'Michael', 'Chen', '4165550102', 'michael.chen@dentalclinic.com');
INSERT INTO Employee (empID, efirst_name, elast_name, ephone_num, eemail) VALUES (3, 'Emily', 'Rodriguez', '6475550103', 'emily.rodriguez@dentalclinic.com');
INSERT INTO Employee (empID, efirst_name, elast_name, ephone_num, eemail) VALUES (4, 'David', 'Thompson', '6475550104', 'david.thompson@dentalclinic.com');
INSERT INTO Employee (empID, efirst_name, elast_name, ephone_num, eemail) VALUES (5, 'Lisa', 'Park', '9055550105', 'lisa.park@dentalclinic.com');
INSERT INTO Employee (empID, efirst_name, elast_name, ephone_num, eemail) VALUES (6, 'James', 'Wilson', '9055550106', 'james.wilson@dentalclinic.com');
INSERT INTO Employee (empID, efirst_name, elast_name, ephone_num, eemail) VALUES (7, 'Maria', 'Garcia', '4375550107', 'maria.garcia@dentalclinic.com');
INSERT INTO Employee (empID, efirst_name, elast_name, ephone_num, eemail) VALUES (8, 'Robert', 'Brown', '4375550108', 'robert.brown@dentalclinic.com');

-- Secretary Table Population
INSERT INTO Secretary (sec_id, empID) VALUES (1, 1);
INSERT INTO Secretary (sec_id, empID) VALUES (2, 2);

-- Dental Staff Table Population
INSERT INTO Dental_Staff (dental_id, empID) VALUES (1, 3);
INSERT INTO Dental_Staff (dental_id, empID) VALUES (2, 4);
INSERT INTO Dental_Staff (dental_id, empID) VALUES (3, 5);

-- BillingAdmin Table Population
INSERT INTO Billing_Admin (billing_admin_id, empID) VALUES (1, 6);
INSERT INTO Billing_Admin (billing_admin_id, empID) VALUES (2, 7);

-- Part Time Table Population
INSERT INTO Part_Time (hourly_wage, empID) VALUES (22.50, 1);
INSERT INTO Part_Time (hourly_wage, empID) VALUES (24.00, 2);
INSERT INTO Part_Time (hourly_wage, empID) VALUES (28.75, 5);

-- Full Time Table Population
INSERT INTO Full_Time (salary, empID) VALUES (65000, 3);
INSERT INTO Full_Time (salary, empID) VALUES (72000, 4);
INSERT INTO Full_Time (salary, empID) VALUES (58000, 6);
INSERT INTO Full_Time (salary, empID) VALUES (62000, 7);
INSERT INTO Full_Time (salary, empID) VALUES (68000, 8);

-- Schedule Table Population
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2025-10-10', 1);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2025-10-10', 2);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2025-10-10', 3);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2025-10-10', 4);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2025-10-11', 5);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2025-10-11', 6);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2025-10-11', 7);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2025-10-11', 1);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2025-10-12', 3);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2025-10-12', 4);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2025-10-12', 6);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2025-10-12', 8);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2024-01-12', 2);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2024-01-17', 1);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2024-01-17', 5);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2024-01-17', 7);
INSERT INTO Schedule (work_date, empID) VALUES (DATE '2024-01-17', 8);

-- Treatment Table Population 
INSERT ALL
  INTO Treatment (treatmentID, treatmentName, cost)
       VALUES (1, 'Teeth Cleaning', 120.00)
  INTO Treatment (treatmentID, treatmentName, cost)
       VALUES (2, 'Cavity Filling', 200.00)
  INTO Treatment (treatmentID, treatmentName, cost)
       VALUES (3, 'Root Canal', 750.00)
  INTO Treatment (treatmentID, treatmentName, cost)
       VALUES (4, 'Braces Adjustment', 150.00)
  INTO Treatment (treatmentID, treatmentName, cost)
       VALUES (5, 'Tooth Extraction', 300.00)
SELECT * FROM dual;

-- Appointment_Treatment Table Population
INSERT ALL
  INTO Appointment_Treatment (apptTreatID, appointmentID, treatmentID)
       VALUES (1, 1, 1)
  INTO Appointment_Treatment (apptTreatID, appointmentID, treatmentID)
       VALUES (2, 2, 2)
  INTO Appointment_Treatment (apptTreatID, appointmentID, treatmentID)
       VALUES (3, 3, 3)
  INTO Appointment_Treatment (apptTreatID, appointmentID, treatmentID)
       VALUES (4, 4, 4)
  INTO Appointment_Treatment (apptTreatID, appointmentID, treatmentID)
       VALUES (5, 5, 5)
SELECT * FROM dual;

-- Financial_Record Table Population
INSERT ALL
  INTO Financial_Record (billID, apptTreatID, amount, status)
       VALUES (1, 1, 120.00, 'Paid')
  INTO Financial_Record (billID, apptTreatID, amount, status)
       VALUES (2, 2, 200.00, 'Pending')
  INTO Financial_Record (billID, apptTreatID, amount, status)
       VALUES (3, 3, 750.00, 'Overdue')
  INTO Financial_Record (billID, apptTreatID, amount, status)
       VALUES (4, 4, 150.00, 'Paid')
  INTO Financial_Record (billID, apptTreatID, amount, status)
       VALUES (5, 5, 300.00, 'Pending')
SELECT * FROM dual;

PROMPT >>> Tables Populated Successfully
Exit;
EOF

