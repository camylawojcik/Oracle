PROCEDURE POPULA_LIMPEZA iS
    v_sql varchar2(1000);
    BEGIN
    v_sql:= 'BEGIN DBMS_UTILITY.EXEC_DDL_STATEMENT@dblink (''DROPTABLE table'');END;';
    EXECUTE IMMEDIATE v_sql;
	END;
