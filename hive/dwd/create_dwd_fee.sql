USE aili_prod_img;
DROP TABLE IF EXISTS dwd_fee_billing;
CREATE TABLE dwd_fee_billing (
  `id` STRING COMMENT '主键',
  `hid` STRING COMMENT '项目ID',
  `bid` STRING COMMENT '楼栋ID',
  `property_id` STRING COMMENT '房间ID',
  `amount_real` DOUBLE COMMENT '账单实收金额',
  `amount_receivable` DOUBLE COMMENT '账单应收金额',
  `subjects_name` STRING COMMENT '账单收款类目',
  `year_month` INT COMMENT '账单产生时间',
  `pay_sort` TINYINT COMMENT '收款方式标识：0代表优惠金额,1代表冲抵金额,2代表余额转存收取,3(包含3)以后代表页面选择的收款方式...依次顺延',
  `pay_methodId` STRING COMMENT '支付方式',
  `start_date` DATE COMMENT '账单开始时间',
  `end_date` DATE COMMENT '账单结束时间',
  `active` TINYINT COMMENT '1:正常;0:锁定;-1:删除',
  `kh_name` STRING COMMENT '客户名称',
  `state` TINYINT COMMENT '0已开收款单 1未开收款单',
  `skd_name` STRING COMMENT '收款人',
  `skd_amount_real` DOUBLE COMMENT '收款单金额',
  `skd_create_time` TIMESTAMP COMMENT '收款单创建时间',
  `skd_update_time` TIMESTAMP COMMENT '收款单更新时间'
) COMMENT 'DWD_fee'
PARTITIONED BY (`dt` STRING)
ROW FORMAT delimited FIELDS TERMINATED BY '\t' 
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/dwd/dwd_fee_billing/';
