USE aili_prod_img;
DROP TABLE IF EXISTS dwd_tc_billing;
CREATE TABLE dwd_tc_billing (
                                 `house_id` STRING COMMENT '项目ID#1',
                                 `platform` TINYINT COMMENT '数据来源0:pws1:APP2:微信公众号3:微信小程序 4:岗亭端#2',
                                 `billing_state` TINYINT COMMENT '费用类型0新增1延期 2岗亭临停线下缴费,3 岗亭临停线上支付#3',
                                 `payment_method_id` STRING COMMENT '收款方式id#4',
                                 `payment_method_name` STRING COMMENT '收款方式名称#5',
                                 `start_date` date COMMENT '开始日期###_6',
                                 `end_date` date COMMENT '结束日期###_7',
                                 `price` double COMMENT '单价###_8',
                                 `number` double COMMENT '计费月数###_9',
                                 `year_month` int COMMENT '计费年月(yyyyMM)#10',
                                 `subjects_name` string COMMENT '科目名称###_11',
                                 `card_type_name` string COMMENT '月卡类型名称###_12',
                                 `property_id` STRING COMMENT '关联的资产名称#13',
                                 `parking_id` STRING COMMENT '办理月卡关联车位id###_14',
                                 `customer_id` STRING COMMENT '办理月卡关联业主/租户/成员人id###_15',
                                 `customer_name` STRING COMMENT '办理月卡关联业主/租户/成员人名字###_16',
                                 `amount_receivable` DOUBLE COMMENT '应收金额',
                                 `amount_real` DOUBLE COMMENT '实收金额',
                                 `yard_id` STRING COMMENT 'pws下车场ID',
                                 `user_name` STRING COMMENT '收款人',
                                 `collection_time` timestamp COMMENT '收款时间',
                                 `car_no_temp` STRING COMMENT '车牌临时',
                                 `update_time` TIMESTAMP COMMENT '更新时间',
                                 `handle_mobile` STRING COMMENT '手机号',
                                 `car_no_month_card` STRING COMMENT '月卡车牌'
) COMMENT 'DWD_tc'
PARTITIONED BY (`dt` STRING)
ROW FORMAT delimited FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
location '/warehouse/aili_prod_img/dwd/dwd_tc_billing/';
