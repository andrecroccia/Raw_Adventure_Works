with
fonte_pessoa_funcionario_vendas as (
select *   
from {{ source('erp', 'salesperson') }}

)
, renomeado as (
    select
     
         cast(BUSINESSENTITYID as int) as id_vendedor
        , cast(TERRITORYID as int) as id_territorio
       -- , cast(SALESQUOTA as int) 
      --  , cast(BONUS as int) 
       -- , cast(COMMISSIONPCT as int) 
        --, cast(SALESYTD as int) 
       -- , cast(SALESLASTYEAR as int) 
       
    from fonte_pessoa_funcionario_vendas
)

select *
from renomeado