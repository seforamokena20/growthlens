--1 General traffic source 
SELECT traffic_source.medium, COUNT(DISTINCT user_pseudo_id) AS unique_users FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY traffic_source.medium
ORDER BY unique_users DESC;
