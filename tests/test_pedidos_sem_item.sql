select soh.salesorderid
from {{ source('erp', 'salesorderheader') }} soh
left join {{ source('erp', 'salesorderdetail') }} sod
on soh.salesorderid= sod.salesorderid
where sod.salesorderid is null

-- o teste verificar se há algum pedido que esta sem item
