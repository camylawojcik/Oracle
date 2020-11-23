SELECT
  CLIENT_INFO,
  STATUS,
  S.SID,
  S.SERIAL#,
  TO_CHAR(S.LOGON_TIME,'dd/mm/yyyy hh24:mi') START_TIME,
  S.USERNAME,
  S.PROGRAM,
  S.MACHINE,
  SQ.SQL_TEXT,
  S.TIME_REMAINING_MICRO,
  S.SQL_ADDRESS
FROM
  V$SESSION S,
  V$SQL SQ
WHERE
  SQ.ADDRESS    =S.SQL_ADDRESS (+)
--AND STATUS      ='ACTIVE'
AND S.PROGRAM  IS NOT NULL
ORDER BY
  CPU_TIME DESC,
  DISK_READS;
  
ALTER SYSTEM KILL SESSION '302,20141';

select s.sid, s.serial#, p.spid, s.username, s.schemaname
    , s.program, s.terminal, s.osuser
 from v$session s
 join v$process p
   on s.paddr = p.addr
where s.type != 'BACKGROUND';


select object_name, s.sid, s.serial#, p.spid 
from v$locked_object l, dba_objects o, v$session s, v$process p
where l.object_id = o.object_id and l.session_id = s.sid and s.paddr = p.addr;
