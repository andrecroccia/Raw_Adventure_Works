with
fonte_motivo_venda_por_pedido as (
select *   
from {{ source('erp', 'salesorderheadersalesreason') }}

)
, renomeado as (
    select

    cast(SALESORDERID as int) as id_pedido
    ,cast(SALESREASONID as int) as id_motivo

from fonte_motivo_venda_por_pedido
)

select *
from renomeado