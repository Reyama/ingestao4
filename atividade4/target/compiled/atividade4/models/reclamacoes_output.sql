select 
    empregados.*,  -- Select all columns from the update_empregados table
    recl.*    -- Select all columns from the reclamacoes table
from 
    "ingestao"."public"."update_empregados" as empregados
inner join 
    "ingestao"."public"."reclamacoes" as recl
on 
    empregados.cnpj = recl.cnpj_if