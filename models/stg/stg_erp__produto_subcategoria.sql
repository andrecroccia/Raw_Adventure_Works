with fonte_subcategoria_produto as (
select *   
from {{ source('erp', 'productsubcategory') }}

)
, renomeado as (
    select
        cast(productsubcategoryid as int) as subcategoria_id
        ,cast(productcategoryid as int) as categoria_id
        ,cast(name as string) as nome_subcategoria
   
    from fonte_subcategoria_produto
)

select *
from renomeado
