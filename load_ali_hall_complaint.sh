/opt/module/hive/bin/hive -e "load data inpath '/source_data/hall/ali_hall_complaint/2021-08-08' OVERWRITE into table ali_inc.ali_hall_complaint partition(dt='2021-08-08');"
