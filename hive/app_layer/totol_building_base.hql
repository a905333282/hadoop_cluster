USE aili_prod_img;
SELECT
dwd_fee_billing.bid AS `building`,
ROUND(SUM(dwd_fee_billing.amount_real),2)  AS `total_fee`
FROM
dwd_fee_billing
WHERE dwd_fee_billing.amount_real IS NOT NULL AND dwd_fee_billing.bid IS NOT NULL AND dwd_fee_billing.bid!=''
GROUP BY dwd_fee_billing.bid
ORDER BY total_fee DESC
LIMIT 20;
