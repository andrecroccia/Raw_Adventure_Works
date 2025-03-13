with fonte_produto as (
select *   
from {{ source('erp', 'product') }}
)
, renomeado as (
    select
        cast(productid as int) as produto_id
        ,cast(name as string) as nome_do_produto
        ,cast(productnumber as string) as numero_do_produto
        ,cast(productsubcategoryid as int) as subcategoria_id
   
    from fonte_produto
)

select *
from renomeado

