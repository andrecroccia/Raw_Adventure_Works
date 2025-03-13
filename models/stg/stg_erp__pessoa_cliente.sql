with fonte_pessoa_cliente as (
select *   
from {{ source('erp', 'customer') }}

)
, renomeado as (
    select
       cast(customerid as int) as id_cliente
        , cast(personid as int) as id_person
        , cast(storeid as int) as id_loja
        , cast(territoryid as int) as id_territorio
        

    from fonte_pessoa_cliente
)

select *
from renomeado
