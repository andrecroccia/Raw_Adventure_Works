with fonte_vendas_por_pedido as (
select *   
from {{ source('erp', 'salesorderheader') }}

)
, renomeado as (
    select

          cast(salesorderid as int) as id_pedido
        , cast(orderdate as date) as data_de_venda
        , cast(duedate as date) as data_de_vencimento
        , cast(shipdate as date) as data_de_envio
        , cast(status as int) as status
        , cast(accountnumber as string) as numero_da_conta
        , cast(customerid as int) as id_cliente
        , cast(salespersonid as int) as id_vendedor
        , cast(territoryid as int) as id_territorio
        , cast(billtoaddressid as int) as id_endereco
        , cast(shiptoaddressid as int) as id_endereco_envio
        , cast(shipmethodid as int) as id_metodo_envio
        , cast(creditcardid as int) as id_cartao_tipo
        , cast(subtotal as numeric(18,2)) as subtotal
        , cast(taxamt as numeric(18,2)) as taxamt
        , cast(freight as numeric(18,2)) as frete
        , cast(totaldue as numeric(18,2)) as valor_total

   
    from fonte_vendas_por_pedido
)

select *
from renomeado
