# GrowthLens — Growth Metrics

This document summarizes the key growth metrics identified from the GrowthLens SQL analysis. The metrics are grouped into acquisition, engagement, conversion, and retention to understand how users move through the e-commerce journey.

---

## 1. Acquisition Metrics

Acquisition metrics describe the volume of users entering the e-commerce journey and the sources responsible for bringing them in.

### Traffic Source Performance

Google was one of the major traffic sources analyzed in the project.

| Metric          | Google |
| --------------- | -----: |
| Product Viewers | 25,105 |
| Add to Cart     |  4,672 |
| Begin Checkout  |  3,438 |
| Purchasers      |  1,377 |
| View → Cart     | 18.61% |

### Key Observation

Google contributes substantial traffic volume, but the progression from product viewing to purchase is considerably lower than the initial traffic volume might suggest.

This indicates a potential **acquisition-to-conversion mismatch**: a source can generate substantial traffic without necessarily producing proportionally high purchasing activity.

This does not establish why the mismatch occurs. Possible explanations could include differences in user intent, product relevance, landing-page experience, pricing expectations, or other forms of friction.

---

## 2. Activation & Engagement Metrics

The main engagement journey analyzed was:

```text
Product View
     ↓
Add to Cart
     ↓
Begin Checkout
     ↓
Purchase
```

The key activation metric is the transition from **product viewing to adding a product to the cart**.

### Funnel Example

One of the analyzed user funnels showed:

| Funnel Stage   | Users |
| -------------- | ----: |
| Product View   | 3,012 |
| Add to Cart    |   139 |
| Begin Checkout |    89 |
| Purchase       |    51 |

### Key Observation

The largest loss of users occurs early in the funnel, between **product viewing and adding to cart**.

This makes the view-to-cart stage an important area for further investigation.

However, the analysis does not establish the exact cause of this drop-off.

---

## 3. Conversion Metrics

Conversion was analyzed across the major stages of the purchase funnel.

### Core Conversion Metrics

* View → Cart conversion
* Cart → Checkout conversion
* Checkout → Purchase conversion
* View → Purchase conversion

Conversion was further compared across:

* Traffic sources
* Devices
* Traffic source × device

### Device-Level Conversion

| Device  | View → Checkout |
| ------- | --------------: |
| Mobile  |           6.59% |
| Desktop |           6.47% |
| Tablet  |           6.38% |

### Cart → Checkout

| Device  | Cart → Checkout |
| ------- | --------------: |
| Mobile  |          77.17% |
| Desktop |          76.72% |
| Tablet  |          79.35% |

### Additional Device Findings

View → Cart conversion was approximately:

* Desktop: **20.33%**
* Tablet: **19.13%**

The differences between devices were relatively small across the major funnel stages.

### Key Observation

Device type does not appear to explain a major portion of the conversion differences observed in the analysis.

Therefore, the project does not treat device as the primary explanation for the conversion bottleneck.

---

## 4. Retention Metrics

Retention was analyzed using cohort analysis.

Users were grouped into cohorts based on their initial activity period, and subsequent activity was measured across later periods.

### Example Cohort Results

| Cohort   | Cohort Size | Month 0 | Month 1 | Month 2 |
| -------- | ----------: | ------: | ------: | ------: |
| Nov 2020 |      79,421 |    100% |   5.86% |   1.52% |
| Dec 2020 |      99,664 |    100% |   2.53% |       — |

### Key Observation

Retention decreases substantially after the initial cohort period.

For example, the November 2020 cohort declined from:

**100% → 5.86% → 1.52%**

across the observed periods.

This suggests that a relatively small proportion of users remain active in subsequent periods.

The analysis identifies the retention pattern but does not establish the underlying reason for the decline.

---

## 5. Revenue Metrics

Revenue was not used as a primary GrowthLens metric.

The current project focuses primarily on:

* Acquisition
* Funnel conversion
* User behavior
* Traffic-source performance
* Device segmentation
* Retention

Revenue-related metrics such as Average Order Value or Revenue per User are therefore outside the current analytical scope.

---

# 6. Overall Growth Metric Summary

The GrowthLens analysis shows three major areas of interest:

### Acquisition

Large traffic volumes do not necessarily translate into proportional purchasing activity, creating a potential acquisition-to-conversion mismatch.

### Conversion

The largest funnel loss occurs earlier in the customer journey, particularly around the transition from product viewing to cart creation.

### Retention

User activity declines sharply across subsequent cohort periods, indicating weak observed retention over time.

### Segmentation

Device differences are relatively small and do not appear to explain the major conversion differences observed in the analysis.

---

## Important Interpretation Note

These metrics describe observed patterns in the dataset. They do **not** prove causation.

For example:

> A low view-to-cart conversion rate does not by itself prove that the product page is causing users to abandon their purchase.

Potential causes should therefore be treated as **hypotheses for further investigation or experimentation**, rather than established facts.

The purpose of these metrics is to identify where potential growth opportunities exist and provide measurable KPIs for evaluating future actions.
