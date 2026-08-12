--1Q What devices are used and their unique users count?
SELECT device.category, COUNT(DISTINCT user_pseudo_id) AS unique_users FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY device.category
ORDER BY unique_users DESC;

