{{ 
    config(
        tags=['comercial']
    ) 
}}

with orders AS
(
    SELECT
        extract(month from order_date) as mes,
        extract(year from order_date) as ano,
        sum(freight) as total_frete
    FROM {{ ref('stg_orders') }}
    GROUP BY 1,2
),

vendas
as
(
    SELECT
        mes,
        ano,
        sum(total_frete) as total_frete
    FROM orders
    GROUP BY 1,2
)
select
    *
    from vendas