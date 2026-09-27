# Cohort Retention Analysis And Insights

## 1. Objective

The purpose of this analysis is to understand how effectively the e-commerce platform retains users after their first month of activity.

Cohort analysis groups users based on the month in which they first became active and tracks their activity in the following months. This helps identify whether users return over time and whether retention differs between acquisition cohorts.

### Key Business Question

> **Do users who first interact with the e-commerce platform return in subsequent months, and how does retention change across cohorts?**

---

## 2. Cohort Definition

For this analysis, a **monthly cohort** is defined based on the month in which a user was first observed in the dataset.

* **Cohort month:** The month of a user's first recorded activity.
* **Month 0:** The user's cohort month.
* **Month 1:** The following month.
* **Month 2:** Two months after the cohort month.
* And so on.

For example, if a user first appeared in **November 2020**, they belong to the November 2020 cohort.

If that user was active again in December 2020, they are counted as retained in Month 1.

---

## 3. Data Source

The analysis uses the **Google Analytics 4 obfuscated sample e-commerce dataset** available through BigQuery.

Relevant fields include:

* `user_pseudo_id` — anonymous identifier used to distinguish users
* `event_date` — date on which the event occurred
* `event_name` — type of event performed by the user

The analysis uses `user_pseudo_id` and `event_date` to construct monthly user activity and determine each user's first observed month.

---

## 4. Methodology

The analysis is performed in four main steps.

### Step 1 — Create Monthly User Activity

Users are converted from daily event-level records into a monthly activity table.

Each unique combination of:

```text
user_pseudo_id + activity_month
```

represents a user being active during that month.

Duplicate events within the same month are removed so that a user is counted only once per month.

---

### Step 2 — Assign Users to Cohorts

For every user, the earliest observed activity month is identified.

```sql
MIN(activity_month)
```

This becomes the user's `cohort_month`.

Each user therefore belongs to exactly one cohort.

---

### Step 3 — Calculate Months Since Cohort

For every user's subsequent activity, the number of months between their cohort month and activity month is calculated.

```sql
DATE_DIFF(
    activity_month,
    cohort_month,
    MONTH
)
```

This produces the `month_number`.

For example:

| Cohort Month | Activity Month | Month Number |
| ------------ | -------------- | -----------: |
| Nov 2020     | Nov 2020       |            0 |
| Nov 2020     | Dec 2020       |            1 |
| Nov 2020     | Jan 2021       |            2 |
| Nov 2020     | Feb 2021       |            3 |

---

### Step 4 — Calculate Retention Rate

The number of active users in each cohort and month is divided by the original cohort size.

```text
Retention Rate =
Active Users in Month N
/
Users in Cohort
× 100
```

For example, if a cohort contains 500 users and 200 of them are active again in Month 1:

```text
Retention = 200 / 500 × 100
          = 40%
```

---

## 5. SQL Analysis

The SQL queries used for this analysis are stored separately in the project's SQL directory.

The main workflow is:

1. Create monthly user activity
2. Identify each user's cohort month
3. Calculate months since cohort
4. Calculate cohort size
5. Calculate monthly active users
6. Calculate retention percentage

---

## 6. Output

The final dataset contains:

| Column           | Description                                    |
| ---------------- | ---------------------------------------------- |
| `cohort_month`   | Month in which the user was first observed     |
| `month_number`   | Number of months since the cohort month        |
| `cohort_size`    | Number of users in the original cohort         |
| `active_users`   | Number of cohort users active in that month    |
| `retention_rate` | Percentage of the original cohort still active |

The resulting dataset can be visualized as a **cohort retention matrix/heatmap**, where:

* Rows represent cohorts
* Columns represent months since acquisition
* Values represent retention rates

---

## 7. How to Interpret the Analysis

The analysis can be used to identify:

* How quickly users drop off after their first month
* Whether retention improves or declines across different cohorts
* Whether newer cohorts retain users better than older cohorts
* Which cohorts show unusually strong or weak retention
* Whether there is a significant drop between Month 0 and Month 1
* Whether users continue returning over longer periods

A consistently declining retention rate across months indicates that fewer users remain active as time passes.

Differences between cohorts may indicate changes in acquisition quality, user experience, product offerings, seasonality, or other business factors. These factors should be investigated separately rather than assumed to be caused by retention itself.

---

## 8. Important Limitation

This analysis measures **observed activity**, not necessarily customer loyalty or purchasing behavior.

A user is considered retained if they have activity recorded during a subsequent month. This does not necessarily mean that they made a purchase.

Therefore, this analysis should be interpreted as **user activity retention**.

A separate purchase-retention analysis can be performed using:

```text
event_name = 'purchase'
```

to determine whether users return specifically to make purchases.

---

## 9. Next Analysis

The next stage of the cohort analysis can compare retention across user characteristics such as:

* Traffic source
* Device category
* Geographic region
* Acquisition channel

A purchase-based cohort analysis can also be performed to answer a more commercially focused question:

> **Which cohorts continue generating purchasing users over time?**

These analyses can help connect retention patterns to the broader conversion and acquisition findings in GrowthLens.

##INSIGHTS
Retention is a significant growth challenge. Month-1 retention ranges from 2.53% to 5.86% across the observed cohorts, with the November cohort falling to 1.52% by Month 2. This indicates that most users do not return to the platform after their initial activity. However, cohort analysis alone cannot identify the causes of low retention, so these results should be interpreted alongside acquisition, funnel, and behavioral analyses to identify potential retention opportunities.
