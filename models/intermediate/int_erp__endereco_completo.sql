WITH
paises AS (
    SELECT * FROM {{ ref('stg_erp__pais') }}
),

estados AS (
    SELECT * FROM {{ ref('stg_erp__estado') }}
),

enderecos AS (
    SELECT * FROM {{ ref('stg_erp__endereco') }} )
,

estados_paises AS (
    SELECT  
        e.estado_id,
        e.estado_sigla,
        e.nome_do_estado,
        e.territorio_id,
        e.pais_do_estado,
        p.nome_pais
    FROM estados e
    INNER JOIN paises p ON e.pais_do_estado = p.pais_id ) ,
    
    endereco_completo as (
    SELECT 
    en.endereco_id,
    en.endereco,
    en.endereco2,
    en.cidade,
    en.estado,
    ep.estado_sigla,
    ep.nome_do_estado,
    ep.nome_pais
FROM enderecos en
INNER JOIN estados_paises ep ON en.estado = ep.estado_id )

select *
from endereco_completo