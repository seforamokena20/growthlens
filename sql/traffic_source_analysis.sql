--1 General traffic source 
SELECT
  traffic_source.source AS traffic_source,
  COUNT(DISTINCT user_pseudo_id) AS unique_users
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY traffic_source
ORDER BY unique_users DESC;

--2 number of usera purchased through each traffic source
SELECT
  traffic_source.source AS traffic_source,
  COUNT(DISTINCT user_pseudo_id) AS purchase_users
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'purchase'
GROUP BY traffic_source
ORDER BY purchase_users DESC;

--3 traffic source segmentation with conversion rate of each stage
 WITH source_data AS (
  SELECT
    traffic_source.source AS traffic_source,

    COUNT(DISTINCT CASE
      WHEN event_name = 'view_item'
      THEN user_pseudo_id
    END) AS view_users,

    COUNT(DISTINCT CASE
      WHEN event_name = 'add_to_cart'
      THEN user_pseudo_id
    END) AS cart_users,

    COUNT(DISTINCT CASE
      WHEN event_name = 'begin_checkout'
      THEN user_pseudo_id
    END) AS checkout_users,

    COUNT(DISTINCT CASE
   WHEN event_name = 'purchase'
      THEN user_pseudo_id
    END) AS purchase_users

  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY traffic_source
)

SELECT
  traffic_source,
  view_users,
  cart_users,
  checkout_users,
  purchase_users,

  SAFE_DIVIDE(cart_users, view_users) * 100 
    AS view_to_cart_conversion,

  SAFE_DIVIDE(checkout_users, cart_users) * 100 
    AS cart_to_checkout_conversion,

  SAFE_DIVIDE(purchase_users, checkout_users) * 100 
    AS checkout_to_purchase_conversion

FROM source_data
ORDER BY checkout_to_purchase_conversion DESC;
