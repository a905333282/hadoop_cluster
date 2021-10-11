hive=/opt/module/hive/bin/hive

if [ -n "$1" ] ;then
        do_date=$1
else
        do_date=`date -d '-1 day' +%F`
fi

selectdb="USE aili_prod_img;"

sqlquery="insert overwrite table dwd_fee_billing partition(dt='$do_date')
SELECT ods_fee_openbilling.id,
ods_fee_openbilling.hid,
ods_fee_openbilling.bid,
ods_fee_openbilling.propertyId,
ods_fee_openbilling.amountReal,
ods_fee_openbilling.amountReceivable,
ods_fee_openbilling.subjectsName,
ods_fee_openbilling.yearMonth,
ods_fee_openbilling.paySort,
ods_fee_openbilling.payMethodId,
ods_fee_openbilling.startDate,
ods_fee_openbilling.endDate,
ods_fee_openbilling.active,
ods_fee_billingreceivables.khName,
ods_fee_billingreceivables.state,
ods_fee_skd.userName,
ods_fee_skd.amountReal,
ods_fee_skd.createTime,
ods_fee_skd.updateTime
FROM
ods_fee_openbilling
LEFT JOIN ods_fee_skd ON ods_fee_openbilling.skdId=ods_fee_skd.id
LEFT JOIN ods_fee_billingreceivables ON ods_fee_openbilling.billingReceivablesId=ods_fee_billingreceivables.id;"

$hive -e "$selectdb
$sqlquery"
