WITH
pessoa AS (
    SELECT * FROM {{ ref('stg_erp__pessoa') }}
),

funcionarios AS (
    SELECT * FROM {{ ref('stg_erp__pessoa_funcionario') }}
),

vendedores AS (
    SELECT * FROM {{ ref('stg_erp__pessoa_funcionario_vendas') }} )
,

joined AS (
    SELECT

         f.ID_FUNCIONARIO
        , p.NOME_CLIENTE as nome_funcionario
        , f.ID_NUMERO_NACIONAL
        , f.CARGO
        , f.DATA_NASCIMENTO

    FROM funcionarios f
    INNER JOIN pessoa p ON f.id_funcionario = p.id_pessoa ) ,
    
    joined_2 as (
    SELECT 

         v.ID_VENDEDOR
        , v.ID_TERRITORIO
        , j.nome_funcionario
        , j.cargo
        , j.data_nascimento

FROM vendedores v
INNER JOIN joined j ON v.id_vendedor = j.id_funcionario )

select *
from joined_2