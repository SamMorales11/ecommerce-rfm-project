with source as (
    select * from {{ source('olist_raw', 'orders') }}
)
select
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp as purchase_at,
    order_approved_at,
    order_delivered_customer_date
from source