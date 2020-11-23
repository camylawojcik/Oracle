   select
   <CAMPOS DA TABELA>
   , count(src1), count(src2)
   from (
         select a.*, 1 src1, to_number(null) src2 from xxx a
         union all
         select b.*, to_number(null) src1, 2 src2 from xxxxxx P b
   )
   group by <CAMPOS DA TABELA>
   having count(src1) <> count(src2)
