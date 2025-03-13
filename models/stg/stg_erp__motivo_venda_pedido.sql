with fonte_motivo_venda_por_pedido as (
select *   
from {{ source('erp', 'salesorderheadersalesreason') }}

)
, renomeado as (
    select

    cast(salesorderid as int) as id_pedido
    ,cast(salesreasonid as int) as id_motivo

from fonte_motivo_venda_por_pedido
)

select *
from renomeado
