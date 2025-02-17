with
fonte_vendas_por_pedido as (
select *   
from {{ source('erp', 'salesorderheader') }}

)
, renomeado as (
    select

          cast(SALESORDERID as int) as id_pedido
        , cast(ORDERDATE as date) as data_de_venda
        , cast(DUEDATE as date) as data_de_vencimento
        , cast(SHIPDATE as date) as data_de_envio
        , cast(STATUS as int) as status
        , cast(ACCOUNTNUMBER as string) as numero_da_conta
        , cast(CUSTOMERID as int) as id_cliente
        , cast(SALESPERSONID as int) as id_vendedor
        , cast(TERRITORYID as int) as id_territorio
        , cast(BILLTOADDRESSID as int) as id_endereco
        , cast(SHIPTOADDRESSID as int) as id_endereco_envio
        , cast(SHIPMETHODID as int) as id_metodo_envio
        , cast(CREDITCARDID as int) as id_cartao_tipo
        , cast(SUBTOTAL as numeric(18,2)) as subtotal
        , cast(TAXAMT as numeric(18,2)) as taxamt
        , cast(FREIGHT as numeric(18,2)) as frete
        , cast(TOTALDUE as numeric(18,2)) as valor_total


   
    from fonte_vendas_por_pedido
)

select *
from renomeado