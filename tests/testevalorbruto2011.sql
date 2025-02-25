-- WITH pd AS ( 
--     SELECT * 
--     FROM {{ ref('int_erp__pedido_detalhe_por_produto') }}
-- ),
-- p AS (
--     SELECT * 
--     FROM {{ ref('int_erp__pedidos') }}
-- ),
-- pdt AS (
--     SELECT
--         pd.ID_PEDIDO_DETALHE,
--         p.ID_PEDIDO,
--         p.DATA_DE_VENDA,  -- Conversão aqui
--         pd.QTDE,
--         pd.PRECO_UNITARIO
--     FROM pd
--     LEFT JOIN p 
--         ON pd.ID_PEDIDO = p.ID_PEDIDO
-- )
-- 
-- SELECT SUM(QTDE * PRECO_UNITARIO) AS valor2011
-- FROM pdt
-- WHERE EXTRACT(YEAR FROM DATA_DE_VENDA) = 2011


-- TESTE SEM INT


 WITH pd AS ( 
     SELECT * 
     FROM {{ ref('stg_erp__vendas_por_pedido_detalhe') }}
 ),
 p AS (
     SELECT * 
     FROM {{ ref('stg_erp__vendas_por_pedido') }}
 ),
 pdt AS (
     SELECT
         pd.ID_PEDIDO_DETALHE,
         p.ID_PEDIDO,
         p.DATA_DE_VENDA,  -- Conversão aqui
         pd.QTDE,
         pd.PRECO_UNITARIO
     FROM pd
     LEFT JOIN p 
         ON pd.ID_PEDIDO = p.ID_PEDIDO
 )
 
 SELECT SUM(QTDE * PRECO_UNITARIO) AS valor2011
 FROM pdt
 WHERE EXTRACT(YEAR FROM DATA_DE_VENDA) = 2011