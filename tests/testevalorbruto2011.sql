 with pd as ( 
     select * 
     from {{ ref('stg_erp__vendas_por_pedido_detalhe') }}
 ),
 p as (
     select * 
     from {{ ref('stg_erp__vendas_por_pedido') }}
 ),
 pdt as (
     select
         pd.id_pedido_detalhe
         , p.id_pedido
         , p.data_de_venda 
         , pd.qtde
         , pd.preco_unitario
     from pd
     left join p 
         on pd.id_pedido = p.id_pedido
 )
 
 select sum(qtde * preco_unitario) as valor2011
 from pdt
 where extract(year from data_de_venda) = 2011
