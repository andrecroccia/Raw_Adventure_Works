with
fonte_pessoa_cliente as (
select *   
from {{ source('erp', 'customer') }}

)
, renomeado as (
    select
       cast(CUSTOMERID as int) as id_cliente
        , cast(PERSONID as int) as id_person
        , cast(STOREID as int) as id_loja
        , cast(TERRITORYID as int) as id_territorio
        

    from fonte_pessoa_cliente
)

select *
from renomeado