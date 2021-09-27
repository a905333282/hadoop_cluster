#! /bin/bash

import_data(){
/opt/module/sqoop/bin/sqoop import \
        --connect jdbc:mysql://hadoop01:3306/aili_prod_img \
        --username root \
        --password 000000 \
        --target-dir /origin_data/origin_aili_prod_img/db/$1/ \
        --delete-target-dir \
        --query "$2  and  \$CONDITIONS" \
        --num-mappers 1 \
        --fields-terminated-by '\t' \
        --null-string '\\N' \
        --null-non-string '\\N'
}

import_fee_costsubject(){
	import_data fee_costsubject "SELECT * FROM aili_prod_img.fee_costsubject WHERE 1=1"
}

import_fee_documentstyle(){
	import_data fee_documentstyle "SELECT * FROM aili_prod_img.fee_documentstyle WHERE 1=1"
}

import_fee_financial_summary(){
	import_data fee_financial_summary "SELECT * FROM aili_prod_img.fee_financial_summary WHERE 1=1"
}

import_fee_payprintpattern(){
        import_data fee_payprintpattern "SELECT * FROM aili_prod_img.fee_payprintpattern WHERE 1=1"
}

import_fee_paysubjects(){
        import_data fee_openbilling "SELECT * FROM aili_prod_img.fee_paysubjects WHERE 1=1"
}

import_fee_preferential(){
        import_data fee_preferential "SELECT * FROM aili_prod_img.fee_preferential WHERE 1=1"
}

import_fee_printtemplates(){
        import_data fee_quadvance "SELECT * FROM aili_prod_img.fee_printtemplates WHERE 1=1"
}

import_fee_rmpreferential(){
	import_data fee_rmpreferential "SELECT * FROM aili_prod_img.fee_rmpreferential WHERE 1=1"
}

import_fee_rulesubject(){        
	import_data fee_rulesubject "SELECT * FROM aili_prod_img.fee_rulesubject WHERE 1=1"
}

import_fee_styledata(){                   
	import_data fee_styledata "SELECT * FROM aili_prod_img.fee_styledata WHERE 1=1"
}

import_fee_subjects(){
	import_data fee_subjects "SELECT * FROM aili_prod_img.fee_subjects WHERE 1=1"
}

import_fee_urgerecord(){        
	import_data fee_urgerecord "SELECT * FROM aili_prod_img.fee_urgerecord WHERE 1=1"
}

import_fee_urgerecord_child(){
	import_data fee_urgerecord_child "SELECT * FROM aili_prod_img.fee_urgerecord_child WHERE 1=1"
}

import_fee_yfpayable(){      
	import_data fee_yfpayable "SELECT * FROM aili_prod_img.fee_yfpayable WHERE 1=1"
}

import_fee_zkpreferential(){  
	import_data fee_zkpreferential "SELECT * FROM aili_prod_img.fee_zkpreferential WHERE 1=1"
}

import_fee_costsubject
import_fee_documentstyle
import_fee_financial_summary
import_fee_payprintpattern
import_fee_paysubjects
import_fee_preferential
import_fee_printtemplates
import_fee_rmpreferential
import_fee_rulesubject
import_fee_styledata
import_fee_subjects
import_fee_urgerecord
import_fee_urgerecord_child
import_fee_yfpayable
import_fee_zkpreferential


