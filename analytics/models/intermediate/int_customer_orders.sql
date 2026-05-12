-- models/intermediate/int_customer_orders.sql

with customers as (
    select * from {{ ref('stg_olist_customers') }}
),
orders as (
    select * from {{ ref('stg_olist_orders') }}
),
order_items as (
    select * from {{ ref('stg_olist_order_items') }}
),

-- Kita hitung total belanja per transaksi (order_id)
order_totals as (
    select 
        order_id,
        sum(price) as total_price,
        sum(freight_value) as total_freight,
        sum(price + freight_value) as total_order_value
    from order_items
    group by 1
),

-- Kita gabungkan semuanya
final as (
    select
        c.customer_unique_id,
        o.order_id,
        o.purchase_at,
        o.order_status,
        ot.total_order_value
    from orders o
    join customers c on o.customer_id = c.customer_id
    left join order_totals ot on o.order_id = ot.order_id
    -- Hanya ambil transaksi yang selesai/terkirim
    where o.order_status = 'delivered'
)

select * from final