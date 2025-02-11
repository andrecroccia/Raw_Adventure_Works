WITH 
mp AS (
    SELECT * FROM {{ ref('stg_erp__motivo_venda_pedido') }}
),
mt AS (
    SELECT * FROM {{ ref('stg_erp__motivo_venda_tipo') }}
),
mp_mt AS (
    SELECT 
        mp.ID_PEDIDO,
        mp.ID_MOTIVO,
        
        mt.MOTIVO_DE_VENDA,
        mt.MOTIVO_TIPO
        
    FROM mp
    INNER JOIN mt ON mp.ID_MOTIVO = mt.ID_MOTIVO
)

SELECT * FROM mp_mt


