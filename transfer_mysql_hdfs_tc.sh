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
        --target-dir /origin_data/origin_aili_prod_img/db/$1/$do_data \
        --delete-target-dir \
        --query "$2 and  \$CONDITIONS" \
        --num-mappers 1 \
        --fields-terminated-by '\t' \
        --null-string '\\N' \
        --null-non-string '\\N'
}

import_tc_billingreceivables(){
        import_data tc_billingreceivables "SELECT * FROM aili_prod_img.tc_billingreceivables WHERE date_format(updateTime,'%Y-%m-%d')='$do_date'"
}


import_tc_openbilling(){
        import_data tc_openbilling "SELECT * FROM aili_prod_img.tc_openbilling WHERE date_format(updateTime,'%Y-%m-%d')='$do_date'"
}

import_tc_monthcard(){
        import_data tc_monthcard "SELECT * FROM aili_prod_img.tc_monthcard WHERE date_format(updateTime,'%Y-%m-%d')='$do_date'"
}

import_tc_monthcard_car(){
        import_data tc_monthcard_car "SELECT * FROM aili_prod_img.tc_monthcard_car WHERE date_format(updateTime,'%Y-%m-%d')='$do_date'"
}

import_tc_monthcardtype(){
        import_data tc_monthcardtype "SELECT * FROM aili_prod_img.tc_monthcardtype WHERE date_format(updateTime,'%Y-%m-%d')='$do_date'"
}

import_tc_openbilling_paymentmethod(){
        import_data tc_openbilling_paymentmethod "SELECT * FROM aili_prod_img.tc_openbilling_paymentmethod WHERE date_format(updateTime,'%Y-%m-%d')='$do_date'"
}

import_tc_operationrecord(){
        import_data tc_operationrecord "SELECT * FROM aili_prod_img.tc_operationrecord WHERE date_format(updateTime,'%Y-%m-%d')='$do_date'"
}



case $1 in
        "all")
                import_tc_billingreceivables
                import_tc_openbilling
                import_tc_monthcard
                import_tc_monthcard_car
                import_tc_monthcardtype
                import_tc_openbilling_paymentmethod
                import_tc_openbilling_paymentmethod
esac
