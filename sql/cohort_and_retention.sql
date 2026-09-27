--1Q which activity-months are the users active along with their user_psuedo id?
-- the basis of cohort table ( raw)
WITH user_monthly_activity AS (
  SELECT DISTINCT
    user_pseudo_id,
    DATE_TRUNC(PARSE_DATE('%Y%m%d', event_date), MONTH) AS activity_month
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE user_pseudo_id IS NOT NULL
)

SELECT *
FROM user_monthly_activity
ORDER BY user_pseudo_id, activity_month;

--2Q assign user to their cohort month
WITH user_monthly_activity AS (
  SELECT DISTINCT
    user_pseudo_id,
    DATE_TRUNC(PARSE_DATE('%Y%m%d', event_date), MONTH) AS activity_month
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE user_pseudo_id IS NOT NULL
),

user_cohorts AS (
  SELECT
    user_pseudo_id,
    MIN(activity_month) AS cohort_month
  FROM user_monthly_activity
  GROUP BY user_pseudo_id
)

SELECT *
FROM user_cohorts
ORDER BY cohort_month, user_pseudo_id;

--3Q Calculate the retention by cohort ( how many users were again active after a 1 month , 2 month etc )?
WITH user_monthly_activity AS (
  SELECT DISTINCT
    user_pseudo_id,
    DATE_TRUNC(PARSE_DATE('%Y%m%d', event_date), MONTH) AS activity_month
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE user_pseudo_id IS NOT NULL
),

user_cohorts AS (
  SELECT
    user_pseudo_id,
    MIN(activity_month) AS cohort_month
  FROM user_monthly_activity
  GROUP BY user_pseudo_id
),

cohort_activity AS (
  SELECT
    c.cohort_month,
    a.activity_month,
    DATE_DIFF(a.activity_month, c.cohort_month, MONTH) AS month_number,
    a.user_pseudo_id
  FROM user_cohorts c
  JOIN user_monthly_activity a
    ON c.user_pseudo_id = a.user_pseudo_id
)

SELECT
  cohort_month,
  month_number,
  COUNT(DISTINCT user_pseudo_id) AS active_users
FROM cohort_activity
GROUP BY cohort_month, month_number
ORDER BY cohort_month, month_number;

--4Q Retention percentage calculation according to the above sql which first calculates rention ( number of users retained)?
WITH user_monthly_activity AS (
  SELECT DISTINCT
    user_pseudo_id,
    DATE_TRUNC(PARSE_DATE('%Y%m%d', event_date), MONTH) AS activity_month
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE user_pseudo_id IS NOT NULL
),

user_cohorts AS (
  SELECT
    user_pseudo_id,
    MIN(activity_month) AS cohort_month
  FROM user_monthly_activity
  GROUP BY user_pseudo_id
),

cohort_activity AS (
  SELECT
    c.cohort_month,
    a.activity_month,
    DATE_DIFF(a.activity_month, c.cohort_month, MONTH) AS month_number,
    a.user_pseudo_id
  FROM user_cohorts c
  JOIN user_monthly_activity a
    ON c.user_pseudo_id = a.user_pseudo_id
),

cohort_sizes AS (
  SELECT
    cohort_month,
    COUNT(DISTINCT user_pseudo_id) AS cohort_size
  FROM user_cohorts
  GROUP BY cohort_month
),

retention AS (
  SELECT
    ca.cohort_month,
    ca.month_number,
    COUNT(DISTINCT ca.user_pseudo_id) AS active_users,
    cs.cohort_size
  FROM cohort_activity ca
  JOIN cohort_sizes cs
    ON ca.cohort_month = cs.cohort_month
  GROUP BY
    ca.cohort_month,
    ca.month_number,
    cs.cohort_size
)

SELECT
  cohort_month,
  month_number,
  cohort_size,
  active_users,
  ROUND(
    100 * SAFE_DIVIDE(active_users, cohort_size),
    2
  ) AS retention_rate
FROM retention
ORDER BY cohort_month, month_number;
