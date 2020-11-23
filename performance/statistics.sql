EXEC dbms_stats.gather_table_stats('xxx','tablename',cascade=>TRUE);


--Na projeção da primeira consulta, deve-se observar a data de atualização das estatísticas das tabelas do seu ambiente:

SELECT STAT.OWNER AS "Schema proprietário",
        STAT.TABLE_NAME AS "Nome do objeto",
        STAT.OBJECT_TYPE AS "Tipo do objeto",
        STAT.NUM_ROWS AS "Quant. de Linhas",
        STAT.LAST_ANALYZED AS "Última coleta"
   FROM SYS.DBA_TAB_STATISTICS STAT
  WHERE STAT.OWNER NOT IN ('SYS', 'SYSTEM', 'SYSMAN', 'DBSNMP')
ORDER BY LAST_ANALYZED;

--Já na projeção da segunda (abaixo), é possível saber quando as estatísticas dos índices foram coletadas pela última vez:

SELECT STAT.OWNER AS "Schema proprietário",
        STAT. TABLE_NAME AS "Nome do objeto",
        STAT.OBJECT_TYPE AS "Tipo do objeto",
        STAT.NUM_ROWS AS "Quant. de Linhas",
        STAT.LAST_ANALYZED AS "Última coleta"
   FROM SYS.DBA_IND_STATISTICS STAT
  WHERE STAT.OWNER NOT IN ('SYS', 'SYSTEM', 'SYSMAN', 'DBSNMP')
ORDER BY LAST_ANALYZED;
