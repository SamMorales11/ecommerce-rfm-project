-- models/marts/mart_rfm_analysis.sql

with customer_orders as (
    select * from {{ ref('int_customer_orders') }}
),

-- Mencari tanggal paling baru di seluruh dataset sebagai titik acuan (Current Date)
reference_date as (
    select max(purchase_at) as max_date
    from customer_orders
),

rfm_calculation as (
    select
        c.customer_unique_id,
        
        -- Recency: Selisih hari dari transaksi terakhir pelanggan ke tanggal acuan
        date_diff(
            'day', 
            max(c.purchase_at), 
            (select max_date from reference_date)
        ) as recency_days,

        -- Frequency: Jumlah order_id unik
        count(distinct c.order_id) as frequency,

        -- Monetary: Total nilai belanja
        sum(c.total_order_value) as monetary_value

    from customer_orders c
    group by 1
)

select * from rfm_calculation