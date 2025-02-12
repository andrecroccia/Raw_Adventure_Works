with
fonte_pessoa as (
select *   
from {{ source('erp', 'person') }}

)
, renomeado as (
    select
        cast(BUSINESSENTITYID as int) as id_pessoa
        ,cast(PERSONTYPE as string) as pessoa_tipo
        ,FIRSTNAME || ' ' || LASTNAME as nome_cliente
        

    from fonte_pessoa
)

select *
from renomeado