Select user, sum(blocks*8172)/1024/1024 MEM_GB
from v$sort_usage  
group by user;
