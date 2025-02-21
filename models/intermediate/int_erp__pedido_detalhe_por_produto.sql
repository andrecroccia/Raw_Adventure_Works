WITH
produtos AS ( SELECT * FROM {{ ref('int_erp__produtos') }} ),

pedidos_detalhe AS ( SELECT * FROM {{ ref('stg_erp__vendas_por_pedido_detalhe') }} ),   -- join produtos em pedidos detalhe

pedido_detalhe_por_produto AS (
    SELECT
   
       ID_PEDIDO
        , pd.ID_PEDIDO_DETALHE
        , pd.QTDE
        , p.produto_id
        , p.nome_do_produto as produto
        , p.NOME_SUBCATEGORIA
        , pd.PRECO_UNITARIO
        , pd.PRECO_UNITARIO_DESCONTO
        , pd.VALOR_TOTAL

    FROM pedidos_detalhe pd
    left JOIN produtos p ON pd.id_produto = p.produto_id )
    

select *
from pedido_detalhe_por_produto