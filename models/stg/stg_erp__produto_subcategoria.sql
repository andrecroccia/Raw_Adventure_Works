with
fonte_subcategoria_produto as (
select *   
from {{ source('erp', 'productsubcategory') }}

)
, renomeado as (
    select
        cast(PRODUCTSUBCATEGORYID as int) as subcategoria_id
        ,cast(PRODUCTCATEGORYID as int) as categoria_id
        ,cast(NAME as string) as nome_subcategoria
   
    from fonte_subcategoria_produto
)

select *
from renomeado