-- models/marts/mart_rfm_analysis.sql

with rfm_raw as (
    -- Ambil perhitungan dasar yang sudah kita buat tadi
    select
        customer_unique_id,
        date_diff(
            'day', 
            max(purchase_at), 
            (select max(purchase_at) from {{ ref('int_customer_orders') }})
        ) as recency_days,
        count(distinct order_id) as frequency,
        sum(total_order_value) as monetary_value
    from {{ ref('int_customer_orders') }}
    group by 1
),

rfm_scores as (
    select
        *,
        -- Recency: Semakin kecil harinya, semakin bagus (skor 5)
        ntile(5) over (order by recency_days desc) as r_score,
        -- Frequency: Semakin banyak order, semakin bagus (skor 5)
        ntile(5) over (order by frequency asc) as f_score,
        -- Monetary: Semakin besar belanja, semakin bagus (skor 5)
        ntile(5) over (order by monetary_value asc) as m_score
    from rfm_raw
),

final_segmentation as (
    select
        *,
        (r_score + f_score + m_score) / 3.0 as avg_rfm_score,
        case
            when r_score >= 4 and f_score >= 4 and m_score >= 4 then 'Champions'
            when r_score >= 4 and f_score >= 2 then 'Loyal Customers'
            when r_score >= 3 and f_score >= 3 then 'Potential Loyalists'
            when r_score >= 4 and f_score <= 1 then 'New Customers'
            when r_score >= 3 and r_score <= 4 and f_score <= 1 then 'Promising'
            when r_score <= 2 and r_score >= 1 and f_score >= 3 then 'At Risk'
            when r_score <= 1 then 'Hibernating'
            else 'Others'
        end as customer_segment
    from rfm_scores
)

select * from final_segmentation