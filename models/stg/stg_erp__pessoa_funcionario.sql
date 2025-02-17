with
fonte_pessoa_funcionario as (
select *   
from {{ source('erp', 'employee') }}

)
, renomeado as (
    select
     
         cast(BUSINESSENTITYID as int) as id_funcionario
        , cast(NATIONALIDNUMBER as int) as id_numero_nacional
        , cast(JOBTITLE as string) as cargo
        , cast(BIRTHDATE as date) as data_nascimento
       

    from fonte_pessoa_funcionario
)

select *
from renomeado