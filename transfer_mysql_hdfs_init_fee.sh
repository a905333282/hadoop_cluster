#! /bin/bash
  
import_data(){
/opt/module/sqoop/bin/sqoop import \
        --connect jdbc:mysql://hadoop01:3306/aili_prod_img \
        --username root \
        --password qkVChW:{8]_=L!7 \
        --target-dir /origin_data/origin_aili_prod_img/db/$1/ \
        --delete-target-dir \
        --query "$2 and  \$CONDITIONS" \
        --num-mappers 1 \
        --fields-terminated-by '\t' \
        --null-string '\\N' \
        --null-non-string '\\N'
}

import_fee_advance(){
	import_data fee_advance "SELECT * FROM aili_prod_img.fee_advance WHERE 1=1"
}

import_fee_billchangerecord(){
	import_data fee_billchangerecord "SELECT * FROM aili_prod_img.fee_billchangerecord WHERE 1=1"
}

import_fee_billingreceivables(){
	import_data fee_billingreceivables "SELECT * FROM aili_prod_img.fee_billingreceivables WHERE 1=1"
}

import_fee_cunadvance(){
        import_data fee_cunadvance "SELECT * FROM aili_prod_img.fee_cunadvance WHERE 1=1"
}

import_fee_openbilling(){
        import_data fee_openbilling "SELECT * FROM aili_prod_img.fee_openbilling WHERE 1=1"
}

import_fee_propertysubjects(){
        import_data fee_propertysubjects "SELECT * FROM aili_prod_img.fee_propertysubjects WHERE 1=1"
}

import_fee_quadvance(){
        import_data fee_quadvance "SELECT * FROM aili_prod_img.fee_quadvance WHERE 1=1"
}

import_fee_skd(){
	import_data fee_skd "SELECT * FROM aili_prod_img.fee_skd WHERE 1=1"

}




case $1 in
        "fee_advance")
                import_fee_advance
;;
	"fee_billchangerecord")
		import_fee_billchangerecord
;;
	"fee_billingreceivables")
                import_fee_billingreceivables
;;
        "fee_cunadvance")
                import_fee_cunadvance
;;
        "fee_openbilling")
                import_fee_openbilling
;;
	"fee_propertysubjects")
                import_fee_propertysubjects
;;
	"fee_quadvance")
		import_fee_quadvance
;;
	"fee_skd")
		import_fee_skd
;;
	"all")
		import_fee_advance
		import_fee_billchangerecord
		import_fee_billingreceivables
		import_fee_cunadvance
		import_fee_openbilling
		import_fee_propertysubjects
		import_fee_quadvance
		import_fee_skd
esac