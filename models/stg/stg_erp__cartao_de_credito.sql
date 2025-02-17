with
fonte_cartao as (
select *   
from {{ source('erp', 'creditcard') }}

)
, renomeado as (
    select
        
        cast(CREDITCARDID as int) as cartao_de_credito_id
        ,cast(CARDTYPE as string) as tipo_cartao_de_credito
        ,cast(CARDNUMBER as int) as numero_do_cartao
   
    from fonte_cartao
)

select *
from renomeado