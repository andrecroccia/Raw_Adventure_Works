 WITH fonte_pessoa AS (
     SELECT *   
     FROM {{ source('erp', 'person') }}
 ),
 renomeado AS (
     SELECT
         CAST(BUSINESSENTITYID AS INT) AS id_pessoa
         , CAST(PERSONTYPE AS STRING) AS pessoa_tipo
         , COALESCE(FIRSTNAME, '') || ' ' || 
          COALESCE(MIDDLENAME, '') || ' ' || 
          COALESCE(LASTNAME, '') AS nome_cliente
     FROM fonte_pessoa
 )
 
 SELECT *
 FROM renomeado

-- WITH fonte_pessoa AS ( -- VERIFICAR QUAIS NOMES ESTÃO DUPLICADOS
--     SELECT *   
--     FROM {{ source('erp', 'person') }}
-- ),
-- renomeado AS (
--     SELECT
--         CAST(BUSINESSENTITYID AS INT) AS id_pessoa,
--         CAST(PERSONTYPE AS STRING) AS pessoa_tipo,
--         COALESCE(FIRSTNAME, '') || ' ' || 
--         COALESCE(MIDDLENAME, '') || ' ' || 
--         COALESCE(LASTNAME, '') AS nome_cliente
--     FROM fonte_pessoa
-- )
-- , duplicados AS (
--     SELECT 
--         nome_cliente, 
--         COUNT(*) AS qtd_ocorrencias
--     FROM renomeado
--     GROUP BY nome_cliente
--     HAVING COUNT(*) > 1
-- )
-- 
-- SELECT * 
-- FROM duplicados
-- ORDER BY qtd_ocorrencias DESC


