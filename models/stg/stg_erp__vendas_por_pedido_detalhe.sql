with
fonte_vendas_por_pedido_detalhe as (
select *   
from {{ source('erp', 'salesorderdetail') }}

)
, renomeado as (
    select

         cast(SALESORDERID as int) as id_pedido
        , cast(SALESORDERDETAILID as int) as id_pedido_detalhe
        , cast(ORDERQTY as int) as qtde
        , cast(PRODUCTID as int) as id_produto
        , cast(UNITPRICE as numeric(18,4)) as preco_unitario
        , cast(UNITPRICEDISCOUNT as numeric(18,4)) as preco_unitario_desconto
        , ORDERQTY*UNITPRICE* (1-UNITPRICEDISCOUNT) as valor_total
   
    from fonte_vendas_por_pedido_detalhe
)

select *
from renomeado