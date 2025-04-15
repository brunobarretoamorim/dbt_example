{{ 
    config(
        tags=['comercial']
    ) 
}}

WITH vendas AS 
(SELECT *
from {{ref('int_vendas')}}
)

select * from vendas