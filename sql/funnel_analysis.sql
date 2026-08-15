--1Q How many users began checking out without adding to cart?
WITH user_events AS (
  SELECT
    user_pseudo_id,
    COUNTIF(event_name = 'view_item') AS views,
    COUNTIF(event_name = 'begin_checkout') AS checkouts,
    COUNTIF(event_name = 'add_to_cart') AS cart_adds
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY user_pseudo_id
)
SELECT
  COUNT(DISTINCT user_pseudo_id) AS direct_checkout_users
FROM user_events
WHERE views > 0
  AND checkouts > 0
  AND cart_adds = 0;


--2Q How many users began checking out with adding to cart?
WITH user_events AS (
  SELECT
    user_pseudo_id,
    COUNTIF(event_name = 'view_item') AS views,
    COUNTIF(event_name = 'begin_checkout') AS checkouts,
    COUNTIF(event_name = 'add_to_cart') AS cart_adds
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY user_pseudo_id
)
SELECT
  COUNT(DISTINCT user_pseudo_id) AS indirect_checkout_users
FROM user_events
WHERE views > 0
  AND checkouts > 0
  AND cart_adds > 0;


--3Q How many users began checking out with adding to cart and didnot purchase?
WITH user_events AS (
  SELECT
    user_pseudo_id,
    COUNTIF(event_name = 'view_item') AS views,
    COUNTIF(event_name = 'begin_checkout') AS checkouts,
    COUNTIF(event_name = 'add_to_cart') AS cart_adds,
    COUNTIF(event_name = 'purchase') AS purchasal
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY user_pseudo_id
)
SELECT
  COUNT(DISTINCT user_pseudo_id) AS no_purchasal
FROM user_events
WHERE views > 0
  AND checkouts > 0
  AND cart_adds > 0
  AND purchasal = 0;


--4Q How many users began checking out without adding to cart and didnot purchase?
WITH user_events AS (
  SELECT
    user_pseudo_id,
    COUNTIF(event_name = 'view_item') AS views,
    COUNTIF(event_name = 'begin_checkout') AS checkouts,
    COUNTIF(event_name = 'add_to_cart') AS cart_adds,
    COUNTIF(event_name = 'purchase') AS purchasal
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY user_pseudo_id
)
SELECT
  COUNT(DISTINCT user_pseudo_id) AS no_purchasal 
FROM user_events
WHERE views > 0
  AND checkouts > 0
  AND cart_adds = 0
  AND purchasal = 0;

 
--5Q How many users purchased without adding it to cart?
WITH user_events AS (
  SELECT
    user_pseudo_id,
    COUNTIF(event_name = 'view_item') AS views,
    COUNTIF(event_name = 'begin_checkout') AS checkouts,
    COUNTIF(event_name = 'add_to_cart') AS cart_adds,
    COUNTIF(event_name = 'purchase') AS purchasal
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY user_pseudo_id
)
SELECT
  COUNT(DISTINCT user_pseudo_id) AS nocart_purchasal 
FROM user_events
WHERE views > 0
  AND checkouts > 0
  AND cart_adds = 0
  AND purchasal > 0;

--6Q How many users purchased with adding it to cart?
WITH user_events AS (
  SELECT
    user_pseudo_id,
    COUNTIF(event_name = 'view_item') AS views,
    COUNTIF(event_name = 'begin_checkout') AS checkouts,
    COUNTIF(event_name = 'add_to_cart') AS cart_adds,
    COUNTIF(event_name = 'purchase') AS purchasal
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  GROUP BY user_pseudo_id
)
SELECT
  COUNT(DISTINCT user_pseudo_id) AS nocart_purchasal 
FROM user_events
WHERE views > 0
  AND checkouts > 0
  AND cart_adds > 0
  AND purchasal > 0;
