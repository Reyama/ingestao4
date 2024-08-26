with filled_segmento as (
    select 
        empreg.*, 
        -- empty strings are NULL and then use COALESCE to fill the segmento value
        -- check first if the value from the table empregados exists, if not, tests if the value from banco is null
        coalesce(nullif(empreg.segmento, ''), banc.segmento) as segmento_full
    from 
        {{ source('public','empregados') }} as empreg
    left join 
        {{ source('public','bancos') }} as banc
    on 
        empreg.cnpj = banc.cnpj
),

filled_cnpj as (
    select 
        fs.*, 
        -- empty strings are NULL and then use COALESCE to fill the cnpj value
        coalesce(nullif(fs.cnpj, ''), banc.cnpj) as cnpj_full
    from 
        filled_segmento as fs
    left join 
        {{ source('public','bancos') }} as banc
    on 
        fs.nome = banc.nome
)

select 
    -- Select all columns, using the filled values
    cnpj_full as cnpj,
    segmento_full as segmento,
    employer_name,
    reviews_count,
    culture_count,
    salaries_count,
    benefits_count,
    employer_website,
    employer_headquarters,
    employer_founded,
    employer_industry,
    employer_revenue,
    url,
    geral,
    cultura_e_valores,
    diversidade_e_inclusao,
    qualidade_de_vida,
    alta_lideranca,
    remuneracao_e_beneficios,
    oportunidades_de_carreira,
    recomendam_para_outras_pessoas,
    perspectiva_positiva_da_empresa,
    nome,
    match_percent
from 
    filled_cnpj