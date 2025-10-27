#!/bin/sh
username=$1
password=$2
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 -s "$username/$password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.cs.torontomu.ca)
(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

PROMPT >>> Patients Who Attended but Never Missed Appointments:
SELECT DISTINCT 
    p.patientID,
    p.pfirst_name || ' ' || p.plast_name AS patient_name
FROM 
    Patient p
JOIN 
    Appointment a ON p.patientID = a.patientID
WHERE a.status = 'Attended'
MINUS
SELECT DISTINCT 
    p.patientID,
    p.pfirst_name || ' ' || p.plast_name AS patient_name
FROM 
    Patient p
JOIN 
    Appointment a ON p.patientID = a.patientID
WHERE a.status = 'Missed'
ORDER BY patient_name;

exit;
EOF

