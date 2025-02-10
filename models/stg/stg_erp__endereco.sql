with
fonte_endereco as (
select *   
from {{ source('erp', 'address') }}

)
, renomeado as (
    select
        cast(ADDRESSID as int) as endereco_id
        ,cast(ADDRESSLINE1 as string) as endereco
        ,cast(ADDRESSLINE2 as string) as endereco2
        ,cast(CITY as string) as cidade
        ,cast(STATEPROVINCEID as int) as ESTADO
   
    from fonte_endereco
)

select *
from renomeado