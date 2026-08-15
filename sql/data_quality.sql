--1Q How many missing user_ids are present?
SELECT
  COUNT(*) AS total_rows,
  COUNTIF(user_pseudo_id IS NULL) AS missing_user_ids
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`;

--2Q How many missing event names?
SELECT
  COUNT(*) AS total_rows,
  COUNTIF(event_name IS NULL) AS missing_event_name
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`;

--3Q How many missing traffic sources or medium is present?
SELECT
  COUNT(*) AS total_rows,
  COUNTIF(traffic_source.source IS NULL) AS missing_source,
  COUNTIF(traffic_source.medium IS NULL) AS missing_medium
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`;
