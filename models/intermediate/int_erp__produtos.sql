WITH
produtos_categoria AS (
    SELECT * FROM {{ ref('stg_erp__produto_categoria') }} --pais
),

produtos_subcategoria AS (
    SELECT * FROM {{ ref('stg_erp__produto_subcategoria') }} --estado
),

produtos_fonte AS (
    SELECT * FROM {{ ref('stg_erp__produto') }} ) -- endereco
,

categoria_subcategoria AS (
    SELECT
    s.SUBCATEGORIA_ID  
    , s.CATEGORIA_ID
    , s.NOME_SUBCATEGORIA
    , c.NOME_CATEGORIA

    FROM produtos_subcategoria s
    left JOIN produtos_categoria c ON s.categoria_id = c.categoria_id ) ,
    
    produtos_lista as (
    SELECT 
    pl.PRODUTO_ID
    , pl.NOME_DO_PRODUTO
    , pl.NUMERO_DO_PRODUTO
    , cs.NOME_SUBCATEGORIA
    , cs.NOME_CATEGORIA

FROM produtos_fonte pl
left JOIN categoria_subcategoria cs ON pl.subcategoria_id = cs.SUBCATEGORIA_ID )

select *
from produtos_lista