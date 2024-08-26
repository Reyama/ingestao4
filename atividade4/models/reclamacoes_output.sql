select 
    empregados.*,  -- Select all columns from the update_empregados table
    recl.*    -- Select all columns from the reclamacoes table
from 
    {{ ref('update_empregados') }} as empregados
inner join 
    {{ source('public','reclamacoes') }} as recl
on 
    empregados.cnpj = recl.cnpj_if