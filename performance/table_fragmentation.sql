      select owner,table_name,round((blocks*8),2)/1024/1024||'kb' "Fragmented size", round((num_rows*avg_row_len/1024),2)||'kb' "Actual size", round((blocks*8),2)-round((num_rows*avg_row_len/1024),2)||'kb',
((round((blocks*8),2)-round((num_rows*avg_row_len/1024),2))/round((blocks*8),2))*100 -10 "reclaimable space % " from dba_tables 
where OWNER LIKE 'RPC'
and table_name ='table_name';
