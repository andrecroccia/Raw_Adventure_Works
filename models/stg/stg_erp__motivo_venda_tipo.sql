with
fonte_motivo_venda_tipo as (
select *   
from {{ source('erp', 'salesreason') }}

)
, renomeado as (
    select
    cast(SALESREASONID as int) as id_motivo
    ,cast(NAME as string) as motivo_de_venda
    ,cast(REASONTYPE as string) as motivo_tipo
    from fonte_motivo_venda_tipo
)

select *
from renomeado