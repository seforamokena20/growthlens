# INSIGHTS

## 1.DATA QUALITY 
- No missing values were found in the data set taken.
- total_ rows = 4295584 , missing_user_ids = 0 , missing_event_names = 0, missing_source = 0, missing_medium = 0

## Funnel Analysis

### Final Funnel

- Path 1: Cart Journey

View Item
↓
Add to Cart
↓
Begin Checkout
↓
Purchase

| Stage | Unique Users |
|---|---:|
| View Item |44732|
| Add to Cart |6883|
| Begin Checkout |5656|
| Purchase |2915|

### Path 2: Direct Checkout Journey

View Item
↓
Begin Checkout
↓
Purchase

| Stage | Unique Users |
|---|---:|
| View Item |44732|
| Begin Checkout |3981|
| Purchase |1478|

---

## Drop-off Analysis

## 2. FUNNEL DROP-OFF ANALYSIS 
### Cart Path
- Add to Cart -> Begin Checkout Drop-off: 17.82%
- Interpretation: Most users who add items to their cart continue toward checkout.
- Checkout -> Purchase Drop-off: 48.461%
- Interpretation: Nearly more than half of the users entering the checkout process tend to drop off before purchasing.

### No Cart
- Checkout -> Purchase Drop-off: 62.87%
- Interpretation: Users taking the path with no cart checkout has high abandonment rate.

### Initial Finding

- The main areas requiring further investigation are:

  1. Checkout → Purchase in the cart path.
  2. Checkout → Purchase in the direct checkout path.

---

## Device Segmentation

Device-level analysis showed highly consistent user behavior across mobile,
desktop, and tablet.

### Key Finding
Device type does not appear to be a major driver of funnel performance.
Conversion rates were similar across all three devices at each analyzed stage.

The most consistent drop-off occurred between `view_item` and `add_to_cart`:

- Mobile: 79.27% drop-off
- Desktop: 79.67% drop-off
- Tablet: 80.87% drop-off

This pattern suggests that the largest friction point may occur earlier in the
purchase journey and is not concentrated on a specific device type.

---
## Traffic Source Analysis

### Objective

Understand how different traffic sources contribute to the e-commerce
funnel and identify sources with potential conversion opportunities.

### Key Findings

#### 1. Google brings the highest product-view volume

Google generated 25,105 product viewers, the highest among the listed
traffic sources.

However, its View → Cart conversion was only 18.61%.

#### 2. High traffic does not necessarily mean high conversion

<Other> and Google generated substantial product-view traffic but had
relatively low View → Cart conversion.

This suggests that these sources have significant potential for improving
the transition from product interest to cart addition.

#### 3. The biggest opportunity is View → Cart

For Google:

25,105 → 4,672 → 3,438 → 1,377

The largest loss occurs between product view and add-to-cart.

Once users add products to their cart, the later funnel stages perform
considerably better.

### Interpretation

High-volume sources such as Google may be bringing users who are interested
in products but are less likely to commit to adding them to their cart.

However, this should be treated as a hypothesis rather than a confirmed
cause. Possible explanations include search-intent mismatch, product-page
friction, pricing/shipping concerns, or differences in user/device behavior.

### Business Opportunity

The primary opportunity is to improve the View → Cart stage for high-volume
traffic sources, particularly Google.

Improving this stage could have a substantial impact because even a small
increase in conversion would affect a large existing user base.

### Conclusion

Traffic-source analysis shows that acquisition volume and conversion
efficiency are not necessarily aligned. Google generates the largest
product-view volume but has relatively weak View → Cart conversion.

Therefore, the next stage of analysis should focus on identifying the
underlying reasons for the View → Cart drop-off rather than simply increasing
traffic.


