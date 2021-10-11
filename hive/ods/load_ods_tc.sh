hive=/opt/module/hive/bin/hive

if [ -n "$2" ] ;then
        do_date=$2
else
        do_date=`date -d '-1 day' +%F`
fi




load_tc_billingreceivables="
load data inpath '/origin_data/origin_aili_prod_img/db/tc_billingreceivables/$do_date' OVERWRITE into table aili_prod_img.ods_tc_billingreceivables partition(dt='$do_date');
"
load_tc_openbilling="
load data inpath '/origin_data/origin_aili_prod_img/db/tc_openbilling/$do_date' OVERWRITE into table aili_prod_img.ods_tc_openbilling partition(dt='$do_date');
"
load_tc_monthcard="
load data inpath '/origin_data/origin_aili_prod_img/db/tc_monthcard/$do_date' OVERWRITE into table aili_prod_img.ods_tc_monthcard partition(dt='$do_date');
"
load_tc_monthcard_car="
load data inpath '/origin_data/origin_aili_prod_img/db/tc_monthcard_car/$do_date' OVERWRITE into table aili_prod_img.ods_tc_monthcard_car partition(dt='$do_date');
"
load_tc_monthcardtype="
load data inpath '/origin_data/origin_aili_prod_img/db/tc_monthcardtype/$do_date' OVERWRITE into table aili_prod_img.ods_tc_monthcardtype partition(dt='$do_date');
"
load_tc_openbilling_paymentmethod="
load data inpath '/origin_data/origin_aili_prod_img/db/tc_openbilling_paymentmethod/$do_date' OVERWRITE into table aili_prod_img.ods_tc_openbilling_paymentmethod partition(dt='$do_date');
"
load_tc_operationrecord="
load data inpath '/origin_data/origin_aili_prod_img/db/tc_operationrecord/$do_date' OVERWRITE into table aili_prod_img.ods_tc_operationrecord partition(dt='$do_date');
"

case $1 in
"all"){
 $hive -e "$load_tc_billingreceivables
$load_tc_openbilling
$load_tc_monthcard
$load_tc_monthcard_car
$load_tc_monthcardtype
$load_tc_openbilling_paymentmethod
$load_tc_operationrecord"
};;
esac
