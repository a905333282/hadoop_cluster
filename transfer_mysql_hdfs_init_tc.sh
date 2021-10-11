#! /bin/bash

if [ -n "$2" ] ;then
        do_date=$2
else
        do_date=`date -d '-1 day' +%F`
fi

import_data(){
/opt/module/sqoop/bin/sqoop import \
        --connect jdbc:mysql://hadoop01:3306/aili_prod_img \
        --username root \
        --password qkVChW:{8]_=L!7 \
        --target-dir /origin_data/origin_aili_prod_img/db/$1/$do_date \
        --delete-target-dir \
        --query "$2 and  \$CONDITIONS" \
        --num-mappers 1 \
        --fields-terminated-by '\t' \
        --null-string '\\N' \
        --null-non-string '\\N'
}



import_tc_billingreceivables(){
	import_data tc_billingreceivables "SELECT * FROM aili_prod_img.tc_billingreceivables WHERE DATEDIFF('$do_date',updateTime)>0"
}


import_tc_openbilling(){
        import_data tc_openbilling "SELECT * FROM aili_prod_img.tc_openbilling WHERE DATEDIFF('$do_date',updateTime)>0"
}

import_tc_monthcard(){
	import_data tc_monthcard "SELECT * FROM aili_prod_img.tc_monthcard WHERE DATEDIFF('$do_date',updateTime)>0"	
}

import_tc_monthcard_car(){
        import_data tc_monthcard_car "SELECT * FROM aili_prod_img.tc_monthcard_car WHERE 1=1"
}

import_tc_monthcardtype(){
        import_data tc_monthcardtype "SELECT * FROM aili_prod_img.tc_monthcardtype WHERE 1=1"
}

import_tc_openbilling_paymentmethod(){
        import_data tc_openbilling_paymentmethod "SELECT * FROM aili_prod_img.tc_openbilling_paymentmethod WHERE 1=1"
}

import_tc_operationrecord(){
        import_data tc_operationrecord "SELECT * FROM aili_prod_img.tc_operationrecord WHERE DATEDIFF('$do_date',operationTime)>0"
}



case $1 in
        "tc_billingreceivables")
                import_tc_billingreceivables
;;
	"tc_openbilling")
		import_tc_openbilling
;;
	"tc_monthcard")
                import_tc_monthcard
;;
        "tc_monthcard_car")
          	import_tc_monthcard_car
;;
       	"tc_monthcardtype")
                import_tc_monthcardtype
;;
	"tc_openbilling_paymentmethod")
                import_tc_openbilling_paymentmethod
;;
	"tc_operationrecord")
		import_tc_operationrecord
;;
	"all")
		import_tc_billingreceivables
		import_tc_openbilling
		import_tc_monthcard
		import_tc_monthcard_car
		import_tc_monthcardtype
		import_tc_openbilling_paymentmethod
		import_tc_operationrecord
esac
