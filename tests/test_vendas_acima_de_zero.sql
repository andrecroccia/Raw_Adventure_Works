-- este teste verifica se há algum valor negativo na tabela detalhada de pedidos
select *
from {{ source('erp', 'salesorderdetail') }}
where 
    salesorderdetailid < 0 
    or salesorderid < 0
    or productid < 0
    or orderqty < 0
    or unitprice < 0
    or unitpricediscount < 0



