load data inpath '/origin_data/origin_aili_prod_img/db/fee_advance' OVERWRITE into table aili_prod_img.ods_fee_advance partition(dt='2021-09-17');
load data inpath '/origin_data/origin_aili_prod_img/db/fee_billchangerecord' OVERWRITE into table aili_prod_img.ods_fee_billchangerecord partition(dt='2021-09-17');
load data inpath '/origin_data/origin_aili_prod_img/db/fee_billingreceivables' OVERWRITE into table aili_prod_img.ods_fee_billingreceivables partition(dt='2021-09-17');
load data inpath '/origin_data/origin_aili_prod_img/db/fee_cunadvance' OVERWRITE into table aili_prod_img.ods_fee_cunadvance partition(dt='2021-09-17');
load data inpath '/origin_data/origin_aili_prod_img/db/fee_openbilling' OVERWRITE into table aili_prod_img.ods_fee_openbilling partition(dt='2021-09-17');
load data inpath '/origin_data/origin_aili_prod_img/db/fee_propertysubjects' OVERWRITE into table aili_prod_img.ods_fee_propertysubjects partition(dt='2021-09-17');
load data inpath '/origin_data/origin_aili_prod_img/db/fee_quadvance' OVERWRITE into table aili_prod_img.ods_fee_quadvance partition(dt='2021-09-17');
load data inpath '/origin_data/origin_aili_prod_img/db/fee_skd' OVERWRITE into table aili_prod_img.ods_fee_skd partition(dt='2021-09-17');
