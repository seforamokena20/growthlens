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

--4Q Conversion-rate for each device(view-tem to add-to-cart)
WITH device_data AS (
  SELECT
    device.category AS device,

    COUNT(DISTINCT CASE
      WHEN event_name = 'view_item'
      THEN user_pseudo_id
    END) AS view_users,

    COUNT(DISTINCT CASE
      WHEN event_name = 'add_to_cart'
      THEN user_pseudo_id
    END) AS cart_users

  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY device
)

SELECT
  device,
  view_users,
  cart_users,
  SAFE_DIVIDE(cart_users, view_users) * 100 AS conversion_rate,
  (1 - SAFE_DIVIDE(cart_users, view_users)) * 100 AS dropoff_rate
FROM device_data
ORDER BY dropoff_rate DESC;

--5Q Conversion-rate for each device(add_to_cart to begin_checkout)
WITH device_data AS (
  SELECT
    device.category AS device,

    COUNT(DISTINCT CASE
      WHEN event_name = 'add_to_cart'
      THEN user_pseudo_id
    END) AS cart_users,

    COUNT(DISTINCT CASE
      WHEN event_name = 'begin_checkout'
      THEN user_pseudo_id
    END) AS checkout_users

  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY device
)

SELECT
  device,
  cart_users,
  checkout_users,
  SAFE_DIVIDE(checkout_users, cart_users) * 100 AS conversion_rate,
  (1 - SAFE_DIVIDE(checkout_users, cart_users)) * 100 AS dropoff_rate
FROM device_data
ORDER BY dropoff_rate DESC;

--6Q Conversion-rate for each device(view-item to begin_checkout without add-to-cart )
WITH device_data AS (
  SELECT
    device.category AS device,
    user_pseudo_id,

    COUNTIF(event_name = 'view_item') AS views,
    COUNTIF(event_name = 'begin_checkout') AS checkouts,
    COUNTIF(event_name = 'add_to_cart') AS cart_adds

  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY device, user_pseudo_id
),

device_summary AS (
  SELECT
    device,

    COUNTIF(views > 0) AS view_users,

    COUNTIF(
      views > 0
      AND checkouts > 0
      AND cart_adds = 0
    ) AS direct_checkout_users

  FROM device_data
  GROUP BY device
)

SELECT
  device,
  view_users,
  direct_checkout_users,
  SAFE_DIVIDE(direct_checkout_users, view_users) * 100 AS conversion_rate,
  (1 - SAFE_DIVIDE(direct_checkout_users, view_users)) * 100 AS dropoff_rate
FROM device_summary
ORDER BY conversion_rate DESC;
