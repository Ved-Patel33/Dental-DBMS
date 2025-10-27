#!/bin/sh
username=$1
password=$2
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 -s "$username/$password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle12c.cs.torontomu.ca)
(Port=1521))(CONNECT_DATA=(SID=orcl12c)))" <<EOF

PROMPT >>> Secretaries working on certain days

SELECT DISTINCT
    e.empID AS "Employee ID", 
    e.efirst_name || ' ' || e.elast_name AS "Full Name",
    e.eemail
FROM Employee e, Schedule sch, Secretary sec
WHERE (sch.work_date = DATE '2025-10-10' OR sch.work_date = DATE '2024-1-17')
    AND sch.empid = e.empid
    AND sec.empid = e.empid
ORDER BY e.empID ASC;

exit;
EOF

