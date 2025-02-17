with
fonte_produto as (
select *   
from {{ source('erp', 'product') }}

)
, renomeado as (
    select
        cast(PRODUCTID as int) as produto_id
        ,cast(NAME as string) as nome_do_produto
        ,cast(PRODUCTNUMBER as string) as numero_do_produto
        ,cast(PRODUCTSUBCATEGORYID as int) as subcategoria_id
   
    from fonte_produto
)

select *
from renomeado