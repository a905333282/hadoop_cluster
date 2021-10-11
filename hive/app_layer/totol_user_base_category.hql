USE aili_prod_img;
SELECT
dwd_fee_billing.kh_name AS `kn_name`,
dwd_fee_billing.subjects_name,
ROUND(SUM(dwd_fee_billing.amount_real),2)  AS `total_fee`
FROM
dwd_fee_billing
WHERE dwd_fee_billing.kh_name IS NOT NULL AND dwd_fee_billing.kh_name!=''
GROUP BY dwd_fee_billing.kh_name, dwd_fee_billing.subjects_name
ORDER BY dwd_fee_billing.kh_name DESC
LIMIT 20;
