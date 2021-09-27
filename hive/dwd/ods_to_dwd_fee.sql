insert overwrite table dwd_fee_billing partition(dt='2021-09-17')
SELECT
ods_fee_openbilling.id AS `id`,
ods_fee_openbilling.hid  AS `hid`,
ods_fee_openbilling.bid  AS `bid`,
ods_fee_openbilling.propertyId AS `property_id`,
ods_fee_openbilling.amountReal AS `amount_real`,
ods_fee_openbilling.amountReceivable AS `amount_receivable`,
ods_fee_openbilling.subjectsName AS `subjects_name`,
ods_fee_openbilling.yearMonth AS `year_month`,
ods_fee_openbilling.paySort AS `pay_sort`,
ods_fee_openbilling.payMethodId AS `pay_methodId`,
ods_fee_openbilling.startDate AS `start_date`,
ods_fee_openbilling.endDate AS `end_date`,
ods_fee_openbilling.active AS `active`,
ods_fee_billingreceivables.khName AS `kh_ame`,
ods_fee_billingreceivables.state AS `state`,
ods_fee_skd.userName AS `skd_name`,
ods_fee_skd.amountReal AS `skd_amount_real`,
ods_fee_skd.createTime AS `skd_create_time`,
ods_fee_skd.updateTime AS `skd_update_time`
FROM
ods_fee_openbilling
LEFT JOIN ods_fee_skd ON ods_fee_openbilling.skdId=ods_fee_skd.id
LEFT JOIN ods_fee_billingreceivables ON ods_fee_openbilling.billingReceivablesId=ods_fee_billingreceivables.id;
