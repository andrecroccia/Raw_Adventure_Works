with
fonte_categoria_produto as (
select *   
from {{ source('erp', 'productcategory') }}

)
, renomeado as (
    select
        cast(PRODUCTCATEGORYID as int) as categoria_id
        ,cast(NAME as string) as nome_categoria
   
    from fonte_categoria_produto
)

select *
from renomeado