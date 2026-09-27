# Methodology

## 1. Business Problem Definition

The analysis aims to understand why users visit the e-commerce platform but fail to convert into purchasers, identify major funnel drop-offs, analyse acquisition and retention patterns, and identify potential growth opportunities.

The key business question is:

> **Why are users not converting, and where are the biggest opportunities to improve acquisition, conversion, and retention?**

---

## 2. Data Collection

The analysis uses the public Google Analytics 4 (GA4) ecommerce sample dataset available through BigQuery.

The dataset contains event-level user behaviour, including:

- User activity
- Product views
- Add-to-cart events
- Checkout events
- Purchase events
- Device information
- Traffic sources
- Geographic information
- Product-level information

---

## 3. Data Preparation

The raw event-level data was queried and transformed using SQL.

The preparation process included:

- Filtering relevant events
- Extracting required fields from nested GA4 structures
- Identifying users across funnel stages
- Aggregating events into user-level and funnel-level metrics
- Preparing datasets for acquisition, conversion, and retention analysis
- Checking the resulting data for consistency before analysis

---

## 4. Funnel Analysis

A conversion funnel was constructed to track users through the key stages:

**Product View → Add to Cart → Begin Checkout → Purchase**

Conversion rates and drop-offs were calculated between each stage to identify where the largest proportion of users were lost.

The funnel was also segmented where relevant to understand differences across:

- Traffic sources
- Devices
- Other meaningful user segments

---

## 5. Acquisition Analysis

Traffic sources were analysed to understand:

- Which sources generate the most users
- Which sources generate stronger engagement
- How users from different sources progress through the funnel
- Differences in conversion performance across traffic sources
- Whether high-volume sources also generate strong downstream conversion

The objective was to distinguish **traffic volume from traffic quality**.

---

## 6. Device Analysis

User behaviour was segmented by device category, including:

- Desktop
- Mobile
- Tablet

The analysis compared funnel performance across devices to determine whether device type was associated with meaningful differences in:

- Product views
- Add-to-cart behaviour
- Checkout progression
- Purchase conversion

---

## 7. Geographic Analysis

User behaviour was analysed across geographic segments to identify potential differences in:

- User volume
- Engagement
- Funnel progression
- Conversion behaviour

Geographic findings were evaluated based on whether the differences were meaningful enough to support a business recommendation.

---

## 8. Cohort & Retention Analysis

Users were grouped into monthly cohorts based on their first observed activity.

Retention was then measured by tracking how many users from each cohort remained active in subsequent months.

The cohort analysis was used to identify:

- Month-over-month retention patterns
- Early user drop-off
- Longer-term engagement trends
- Differences in retention across cohorts

A retention table was created to compare cohort size, active users, and retention rates over time.

---

## 9. Business KPI Analysis

The analysis was organized around five major growth areas:

### Acquisition
Measures how users are brought to the platform.

### Activation / Engagement
Measures whether users meaningfully interact with the platform.

### Conversion
Measures how users progress from product interaction to purchase.

### Revenue
Measures the business value generated from purchasing users, where the required data is available.

### Retention
Measures whether users continue returning and engaging with the platform over time.

This framework ensures that the analysis focuses on business outcomes rather than only descriptive statistics.

---

## 10. Insight Development

Findings from different analyses were compared to identify the strongest and most relevant business insights.

Insights were classified into two categories:

### Proven Findings

Findings directly supported by the available data and calculated metrics.

### Hypotheses

Possible explanations or causes suggested by the observed patterns but not directly proven by the dataset.

Hypotheses are clearly separated from proven findings to avoid presenting correlation or assumptions as causation.

---

## 11. Recommendation Development

Business recommendations were developed based on the strongest findings from the funnel, acquisition, conversion, and retention analyses.

Recommendations focus on areas such as:

- Improving product-view → cart conversion
- Investigating acquisition quality
- Reducing potential funnel friction
- Improving repeat engagement
- Strengthening retention

Recommendations are connected to measurable business metrics wherever possible.
---

## 12. Visualization

The analysis results are converted into visualizations to make patterns easier to understand and communicate.

Visualizations are used for:

- Funnel drop-offs
- Acquisition-source performance
- Device comparisons
- Geographic patterns
- Cohort retention
- Key business KPIs

The visualizations focus on communicating actionable insights rather than simply displaying every available metric.

---

## 13. Dashboard Creation

A final interactive dashboard will be created to consolidate the key findings from the analysis into a decision-oriented view.

The dashboard will bring together:

- Acquisition metrics
- Activation / engagement metrics
- Conversion metrics
- Revenue metrics
- Retention metrics
- Final business KPIs

The dashboard will include relevant filters and visualizations to allow users to explore performance across:

- Traffic sources
- Devices
- Geographic segments
- Other meaningful dimensions

The goal of the dashboard is to make the analysis easier to interpret and translate the findings into actionable business decisions.

> **Status:** Dashboard creation is currently in progress.

---

## 14. Final Business Strategy

The final stage connects the analytical findings to business actions.

The strategy distinguishes between:

1. **What the data proves**
2. **What the analysis suggests**
3. **What requires further validation**

The final recommendations are prioritized around the major opportunities identified in:

- Acquisition
- Activation / Engagement
- Conversion
- Revenue
- Retention

Potential improvements are then translated into measurable experiments and success metrics.

---

## 15. Limitations

The analysis has several limitations:

- The analysis is based on the available GA4 sample dataset and may not represent the behaviour of a real production e-commerce business.
- The dataset is observational, so correlations should not automatically be interpreted as causal relationships.
- Traffic-source analysis identifies differences between sources but does not prove why those differences occur.
- Device-level differences alone are not sufficient to explain user behaviour.
- Geographic differences may require additional context before being used for business decisions.
- Revenue-related conclusions are limited by the available revenue data and analysis performed.
- Retention analysis shows user behaviour over time but does not establish why users return or become inactive.
- A/B testing is required to establish whether proposed changes actually cause improvements.
- Some recommendations remain hypotheses and require additional segmentation, qualitative research, or experimentation.

---

## 16. Overall Analytical Approach

The overall GrowthLens methodology follows this process:

**Business Problem**
↓
**Data Collection**
↓
**Data Preparation**
↓
**Funnel Analysis**
↓
**Acquisition & Segmentation Analysis**
↓
**Conversion Analysis**
↓
**Cohort & Retention Analysis**
↓
**KPI Analysis**
↓
**Insight Development**
↓
**Recommendations**
↓
**A/B Test Design**
↓
**Dashboard Creation**
↓
**Final Business Strategy**

This approach connects raw user behaviour to measurable business insights and actionable growth opportunities.
