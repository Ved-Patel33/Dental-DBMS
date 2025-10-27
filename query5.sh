#!/bin/sh
username=$1
password=$2
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 -s "$username/$password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.cs.torontomu.ca)
(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

PROMPT >>> Top 3 Highest-Earning Treatments

SELECT * FROM(
    SELECT 
        t.treatmentName AS "Treatment Name",
        SUM(fr.amount) AS "Total Earnings ($)"
    FROM 
        Treatment t, Appointment_Treatment at, Financial_Record fr
    WHERE t.treatmentID = at.treatmentID
        AND at.apptTreatID = fr.apptTreatID
    GROUP BY 
        t.treatmentName
    ORDER BY 
        SUM(fr.amount) DESC
)
WHERE ROWNUM <= 3;

exit;
EOF

