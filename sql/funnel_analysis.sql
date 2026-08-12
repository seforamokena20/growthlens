--1 BASIC CONVERSION FROM ADD-TO-CART TO PURCHASE ( UNCLEANED VERSION TO FIND WHAT EXACTLY IS HAPPENING)

WITH daily_data AS (
    SELECT
        event_date,

        COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart'THEN user_pseudo_id END) AS add_to_cart,

        COUNT(DISTINCT CASE WHEN event_name = 'purchase'THEN user_pseudo_id END) AS purchase

    FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`

    GROUP BY event_date
)
SELECT
    event_date,
    SAFE_DIVIDE(purchase, add_to_cart) * 100 AS conversion_rate
FROM daily_data
ORDER BY conversion_rate DESC;
