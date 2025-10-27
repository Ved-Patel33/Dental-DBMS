#!/bin/sh
username=$1
password=$2
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 -s "$username/$password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.cs.torontomu.ca)
(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

PROMPT >>> Average Treatment Cost and Outstanding Balance Report

SELECT 
    t.treatmentName AS "Treatment Type",
    ROUND(AVG(fr.amount), 2) AS "Average Cost ($)",
    COUNT(CASE WHEN fr.status = 'Pending' THEN 1 END) AS "Pending Bills",
    COUNT(CASE WHEN fr.status = 'Overdue' THEN 1 END) AS "Overdue Bills"
FROM 
    Treatment t
JOIN 
    Appointment_Treatment at ON t.treatmentID = at.treatmentID
JOIN 
    Financial_Record fr ON at.apptTreatID = fr.apptTreatID
GROUP BY 
    t.treatmentName
ORDER BY 
    "Average Cost ($)" DESC;

exit;
EOF

