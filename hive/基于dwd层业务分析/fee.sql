# 每个用户总共交了多少物业费
SELECT
dwd_fee_billing.kh_name AS `kn_name`,
ROUND(SUM(dwd_fee_billing.amount_real),2)  AS `total_fee`
FROM
dwd_fee_billing
WHERE dwd_fee_billing.kh_name IS NOT NULL AND dwd_fee_billing.kh_name!=''
GROUP BY dwd_fee_billing.kh_name
ORDER BY total_fee DESC
LIMIT 20;

# 每个用户总共交了多少物业费-分类明细
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


# 每栋楼总共交了多少物业费
SELECT
dwd_fee_billing.bid AS `building`,
ROUND(SUM(dwd_fee_billing.amount_real),2)  AS `total_fee`
FROM
dwd_fee_billing
WHERE dwd_fee_billing.amount_real IS NOT NULL AND dwd_fee_billing.bid IS NOT NULL AND dwd_fee_billing.bid!=''
GROUP BY dwd_fee_billing.bid
ORDER BY total_fee DESC
LIMIT 20;

# 每栋楼总共交了多少物业费-分类明细
SELECT
dwd_fee_billing.bid AS `building`,
dwd_fee_billing.subjects_name,
ROUND(SUM(dwd_fee_billing.amount_real),2)  AS `total_fee`
FROM
dwd_fee_billing
WHERE dwd_fee_billing.amount_real IS NOT NULL AND dwd_fee_billing.bid IS NOT NULL AND dwd_fee_billing.bid!=''
GROUP BY dwd_fee_billing.bid, dwd_fee_billing.subjects_name
ORDER BY dwd_fee_billing.bid DESC
LIMIT 20;

# 每小区总共交了多少物业费
SELECT
dwd_fee_billing.hid AS `block_name`,
ROUND(SUM(dwd_fee_billing.amount_real),2)  AS `total_fee`
FROM
dwd_fee_billing
WHERE dwd_fee_billing.amount_real IS NOT NULL AND dwd_fee_billing.hid IS NOT NULL AND dwd_fee_billing.hid!=''
GROUP BY dwd_fee_billing.hid
ORDER BY total_fee DESC;

# 每小区总共交了多少物业费-分类明细
SELECT
dwd_fee_billing.hid AS `block_name`,
dwd_fee_billing.subjects_name,
ROUND(SUM(dwd_fee_billing.amount_real),2)  AS `total_fee`
FROM
dwd_fee_billing
WHERE dwd_fee_billing.amount_real IS NOT NULL AND dwd_fee_billing.hid IS NOT NULL AND dwd_fee_billing.hid!='' AND dwd_fee_billing.subjects_name!='余额转存'
GROUP BY dwd_fee_billing.hid, dwd_fee_billing.subjects_name
ORDER BY dwd_fee_billing.hid;


# 每个用户每半年共交了多少物业费
SELECT
dwd_fee_billing.kh_name AS `kn_name`,
ROUND(SUM(dwd_fee_billing.amount_real),2)  AS `total_fee`
FROM
dwd_fee_billing
WHERE DATEDIFF(FROM_UNIXTIME(UNIX_TIMESTAMP(), 'yyyy-MM-dd'), end_date)<180
GROUP BY dwd_fee_billing.kh_name
ORDER BY total_fee DESC
LIMIT 20;

# 每个用户每季度共交了多少物业费
SELECT
dwd_fee_billing.kh_name AS `kn_name`,
ROUND(SUM(dwd_fee_billing.amount_real),2)  AS `total_fee`
FROM
dwd_fee_billing
WHERE DATEDIFF(FROM_UNIXTIME(UNIX_TIMESTAMP(), 'yyyy-MM-dd'), end_date)<90
GROUP BY dwd_fee_billing.kh_name
ORDER BY total_fee DESC
LIMIT 20;

# 每个用户每月共交了多少物业费
SELECT
dwd_fee_billing.kh_name AS `kn_name`,
ROUND(SUM(dwd_fee_billing.amount_real),2)  AS `total_fee`
FROM
dwd_fee_billing
WHERE DATEDIFF(FROM_UNIXTIME(UNIX_TIMESTAMP(), 'yyyy-MM-dd'), end_date)<30
GROUP BY dwd_fee_billing.kh_name
ORDER BY total_fee DESC
LIMIT 20;





