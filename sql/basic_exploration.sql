--1Q: total how many events are recorded?
SELECT COUNT(*) AS total_events FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20201101`;

--2Q: What types of events are recorded and their count?
SELECT
  event_name,
  COUNT(*) AS event_count
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20210126`
GROUP BY event_name
ORDER BY event_count DESC;

--3Q: How many unique users are there?
SELECT COUNT(DISTINCT user_pseudo_id) AS unique_users FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20210126`;

--4Q: How many unique users were in the event 'view_item' ?
SELECT COUNT(DISTINCT user_pseudo_id) AS unique_users FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20210126` WHERE event_name = 'view_item';

--5Q: How many unique users were in the event 'add_to_cart' ?
SELECT COUNT(DISTINCT user_pseudo_id) AS unique_users FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20210126` WHERE event_name = 'add_to_cart';

--6Q: How many unique users were in the event 'begin_checkout' ?
SELECT COUNT(DISTINCT user_pseudo_id) AS unique_users FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20210126` WHERE event_name = 'begin_checkout';

--7Q: How many unique users were in the event 'purchase' ?
SELECT COUNT(DISTINCT user_pseudo_id) AS unique_users FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_20210126` WHERE event_name = 'purchase';

