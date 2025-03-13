with fonte_vendas_por_pedido_detalhe as (
select *   
from {{ source('erp', 'salesorderdetail') }}
)
, renomeado as (
    select

         cast(salesorderid as int) as id_pedido
        , cast(salesorderdetailid as int) as id_pedido_detalhe
        , cast(orderqty as int) as qtde
        , cast(productid as int) as id_produto
        , cast(unitprice as numeric(18,4)) as preco_unitario
        , cast(unitpricediscount as numeric(18,4)) as preco_unitario_desconto
        , orderqty*unitprice* (1-unitpricediscount) as valor_total
   
    from fonte_vendas_por_pedido_detalhe
)

select *
from renomeado