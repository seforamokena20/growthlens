SELECT
  traffic_source.source AS source,
  device.category AS device,

  COUNT(DISTINCT CASE
    WHEN event_name = 'view_item'
    THEN user_pseudo_id
  END) AS viewers,

  COUNT(DISTINCT CASE
    WHEN event_name = 'add_to_cart'
    THEN user_pseudo_id
  END) AS cart_users,

  COUNT(DISTINCT CASE
    WHEN event_name = 'begin_checkout'
    THEN user_pseudo_id
  END) AS checkout_users,

  COUNT(DISTINCT CASE
    WHEN event_name = 'purchase'
    THEN user_pseudo_id
  END) AS purchasers,

  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_pseudo_id END),
      COUNT(DISTINCT CASE WHEN event_name = 'view_item' THEN user_pseudo_id END)
    ) * 100, 2
  ) AS view_to_cart_pct,

  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT CASE WHEN event_name = 'begin_checkout' THEN user_pseudo_id END),
      COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart' THEN user_pseudo_id END)
    ) * 100, 2
  ) AS cart_to_checkout_pct,

  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN user_pseudo_id END),
      COUNT(DISTINCT CASE WHEN event_name = 'begin_checkout' THEN user_pseudo_id END)
    ) * 100, 2
  ) AS checkout_to_purchase_pct,

  ROUND(
    SAFE_DIVIDE(
      COUNT(DISTINCT CASE WHEN event_name = 'purchase' THEN user_pseudo_id END),
      COUNT(DISTINCT CASE WHEN event_name = 'view_item' THEN user_pseudo_id END)
    ) * 100, 2
  ) AS view_to_purchase_pct

FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`

GROUP BY source, device

HAVING viewers > 0

ORDER BY viewers DESC;
