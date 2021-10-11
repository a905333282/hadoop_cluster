hive=/opt/module/hive/bin/hive

if [ -n "$2" ] ;then
        do_date=$2
else
        do_date=`date -d '-1 day' +%F`
fi

load_fee_advance="
load data inpath '/origin_data/origin_aili_prod_img/db/fee_advance/$do_date' OVERWRITE into table aili_prod_img.ods_fee_advance partition(dt='$do_date'); 
"
load_fee_billchangerecord="
load data inpath '/origin_data/origin_aili_prod_img/db/fee_billchangerecord/$do_date' OVERWRITE into table aili_prod_img.ods_fee_billchangerecord partition(dt='$do_date');
"
load_fee_billingreceivables="
load data inpath '/origin_data/origin_aili_prod_img/db/fee_billingreceivables/$do_date' OVERWRITE into table aili_prod_img.ods_fee_billingreceivables partition(dt='$do_date');
"
load_fee_cunadvance="
load data inpath '/origin_data/origin_aili_prod_img/db/fee_cunadvance/$do_date' OVERWRITE into table aili_prod_img.ods_fee_cunadvance partition(dt='$do_date');
"
load_fee_openbilling="
load data inpath '/origin_data/origin_aili_prod_img/db/fee_openbilling/$do_date' OVERWRITE into table aili_prod_img.ods_fee_openbilling partition(dt='$do_date');
"
load_fee_propertysubjects="
load data inpath '/origin_data/origin_aili_prod_img/db/fee_propertysubjects/$do_date' OVERWRITE into table aili_prod_img.ods_fee_propertysubjects partition(dt='$do_date');
"
load_fee_quadvance="
load data inpath '/origin_data/origin_aili_prod_img/db/fee_quadvance/$do_date' OVERWRITE into table aili_prod_img.ods_fee_quadvance partition(dt='$do_date');
"
load_fee_skd="
load data inpath '/origin_data/origin_aili_prod_img/db/fee_skd/$do_date' OVERWRITE into table aili_prod_img.ods_fee_skd partition(dt='$do_date');
"

case $1 in
"all"){
 $hive -e "$load_fee_advance
$load_fee_billchangerecord
$load_fee_billingreceivables
$load_fee_cunadvance
$load_fee_openbilling
$load_fee_propertysubjects
$load_fee_quadvance
$load_fee_skd"
};;
esac
