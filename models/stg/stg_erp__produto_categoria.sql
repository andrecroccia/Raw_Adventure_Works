with fonte_categoria_produto as (
select *   
from {{ source('erp', 'productcategory') }}

)
, renomeado as (
    select
        cast(productcategoryid as int) as categoria_id
        ,cast(name as string) as nome_categoria
   
    from fonte_categoria_produto
)

select *
from renomeado
