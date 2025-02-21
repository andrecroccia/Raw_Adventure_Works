WITH
pessoa AS ( SELECT * FROM {{ ref('stg_erp__pessoa') }} ),

pessoa_cliente AS ( SELECT * FROM {{ ref('stg_erp__pessoa_cliente') }} ),

clientes AS (
    SELECT
   
         pc.ID_CLIENTE
        , pc.ID_PERSON
        , pc.ID_LOJA
        , pc.ID_TERRITORIO
        , p.pessoa_tipo
        , P.nome_cliente

    FROM pessoa_cliente pc
    inner JOIN pessoa p ON pc.id_person = p.id_pessoa )
    

select * 
from clientes

-- select count(*) as total
-- from clientes