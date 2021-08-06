#! /bin/bash
 
#大厅客服使用-投诉接待与处理登记表 Mysql -> HDFS
echo [INFO]: Mysql -> HDFS: 大厅客服使用-投诉接待与处理登记表
/opt/module/sqoop/bin/sqoop import \
        --connect jdbc:mysql://hadoop01:3306/ali_inc \
        --username root \
        --password 000000 \
        --target-dir /source_data/hall/ali_hall_complaint/$1 \
        --delete-target-dir \
        --query "SELECT * FROM ali_inc.ali_hall_complaint WHERE date_format(complaint_time,'%Y-%m-%d')='$1' and \$CONDITIONS" \
        --num-mappers 1 \
        --fields-terminated-by "\t"
