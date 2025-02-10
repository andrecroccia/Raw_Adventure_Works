with
fonte_estado as (
select *   
from {{ source('erp', 'stateprovince') }}

)
, renomeado as (
    select

        cast(STATEPROVINCEID as int) as estado_id
        ,cast(STATEPROVINCECODE as string) as estado_sigla
        ,cast(COUNTRYREGIONCODE as string) as pais_do_estado
        ,cast(NAME as string) as nome_do_estado
        ,cast(TERRITORYID as int) as territorio_id

    from fonte_estado
)

select *
from renomeado