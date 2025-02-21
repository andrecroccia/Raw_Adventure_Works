WITH
pedidos AS ( SELECT * FROM {{ ref('stg_erp__vendas_por_pedido') }} ),

endereco AS ( SELECT * FROM {{ ref('dim_endereco') }} ),   

cliente AS ( SELECT * FROM {{ ref('dim_clientes') }} ),

-- motivo_venda AS ( SELECT * FROM {{ ref('dim_motivo_venda') }} ),

cartao_de_credito AS ( SELECT * FROM {{ ref('dim_cartao_de_credito') }} ),

vendedor AS ( SELECT * FROM {{ ref('dim_vendedor') }} ),


joined AS (
    SELECT

         p.ID_PEDIDO
        , p.DATA_DE_VENDA
       -- , p.DATA_DE_VENCIMENTO
       -- , p.DATA_DE_ENVIO
        , p.STATUS
       -- , p.NUMERO_DA_CONTA
        , p.ID_CLIENTE
        , c.NOME_CLIENTE
        , p.ID_VENDEDOR
        , v.NOME_FUNCIONARIO as VENDEDOR
       -- , p.ID_TERRITORIO
        , e.ENDERECO_ID
        , e.CIDADE
        , e.NOME_DO_ESTADO AS ESTADO
        , e.NOME_PAIS AS PAIS
       -- , p.ID_METODO_ENVIO
       -- , p.ID_CARTAO_TIPO
        , p.id_cartao_tipo
        , cc.tipo_cartao_de_credito as cartao_de_credito
        , p.SUBTOTAL
        , p.TAXAMT
        , p.FRETE
        , p.VALOR_TOTAL
       -- , m.MOTIVO_DE_VENDA

    FROM pedidos p
    left JOIN endereco e on p.id_endereco = e.endereco_id 
    left join cliente c on p.id_cliente = c.id_cliente
   -- left join motivo_venda m on p.id_pedido = m.id_pedido
    left join cartao_de_credito cc on p.id_cartao_tipo = cc.cartao_de_credito_id
    left join vendedor v on p.id_vendedor = v.id_vendedor

    )
    

select *
from joined