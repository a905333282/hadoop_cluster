load data inpath '/origin_data/origin_aili_prod_img/db/tc_billingreceivables' OVERWRITE into table aili_prod_img.ods_tc_billingreceivables partition(dt='2021-09-17');
load data inpath '/origin_data/origin_aili_prod_img/db/tc_openbilling' OVERWRITE into table aili_prod_img.ods_tc_openbilling partition(dt='2021-09-17');
load data inpath '/origin_data/origin_aili_prod_img/db/tc_monthcard' OVERWRITE into table aili_prod_img.ods_tc_monthcard partition(dt='2021-09-17');
load data inpath '/origin_data/origin_aili_prod_img/db/tc_monthcard_car' OVERWRITE into table aili_prod_img.ods_tc_monthcard_car partition(dt='2021-09-17');
load data inpath '/origin_data/origin_aili_prod_img/db/tc_monthcardtype' OVERWRITE into table aili_prod_img.ods_tc_monthcardtype partition(dt='2021-09-17');
load data inpath '/origin_data/origin_aili_prod_img/db/tc_openbilling_paymentmethod' OVERWRITE into table aili_prod_img.ods_tc_openbilling_paymentmethod partition(dt='2021-09-17');
load data inpath '/origin_data/origin_aili_prod_img/db/tc_operationrecord' OVERWRITE into table aili_prod_img.ods_tc_operationrecord partition(dt='2021-09-17');

