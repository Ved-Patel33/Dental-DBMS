#!/bin/sh
username=$1
password=$2
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 -s "$username/$password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.cs.torontomu.ca)
(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

PROMPT >>> Unassigned employees’ number of work days

SELECT 
    e.empID,
    e.efirst_name,
    elast_name,
    e.ephone_num,
    COUNT(s.work_date) AS scheduled_days
FROM Employee e, Schedule s
WHERE NOT EXISTS (
    SELECT 1 FROM Secretary WHERE empID = e.empID
)
AND NOT EXISTS (
    SELECT 1 FROM Dental_Staff WHERE empID = e.empID
)
AND NOT EXISTS (
    SELECT 1 FROM Billing_Admin WHERE empID = e.empID
)
AND e.empid = s.empid
GROUP BY e.empID, e.efirst_name, e.elast_name, e.ephone_num
HAVING COUNT(s.work_date) > 0
ORDER BY scheduled_days DESC;

exit;
EOF

