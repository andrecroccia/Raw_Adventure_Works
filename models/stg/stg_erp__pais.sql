with
fonte_pais as (
select *   
from {{ source('erp', 'countryregion') }}

)
, renomeado as (
    select
    cast (COUNTRYREGIONCODE as string) as pais_id
    , cast (NAME as string) as nome_pais

    from fonte_pais
)

select *
from renomeado

