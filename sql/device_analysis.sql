--1Q What devices are used and their unique users count?
SELECT device.category, COUNT(DISTINCT user_pseudo_id) AS unique_users FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY device.category
ORDER BY unique_users DESC;
--2Q Which device-country combinations have the most users?
SELECT
  device.category AS device,
  geo.country AS country,
  COUNT(DISTINCT user_pseudo_id) AS unique_users
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY device, country
ORDER BY unique_users DESC;
--3Q Drop-off rate for each device ( checkout to purchase)
WITH device_data AS (
  SELECT
    device.category AS device,

    COUNT(DISTINCT CASE
      WHEN event_name = 'begin_checkout'
      THEN user_pseudo_id
    END) AS checkout_users,

    COUNT(DISTINCT CASE
      WHEN event_name = 'purchase'
      THEN user_pseudo_id
    END) AS purchase_users

  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY device
)

SELECT
  device,
  checkout_users,
  purchase_users,
  SAFE_DIVIDE(purchase_users, checkout_users) * 100 AS conversion_rate,
  (1 - SAFE_DIVIDE(purchase_users, checkout_users)) * 100 AS dropoff_rate
FROM device_data
ORDER BY dropoff_rate DESC;
