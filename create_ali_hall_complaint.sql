CREATE DATABASE IF NOT EXISTS ali_inc;
  
USE ali_inc;

CREATE TABLE IF NOT EXISTS ali_hall_complaint (
        `id` int COMMENT '编号',
        `room_num` string COMMENT '房号',
        `complaint_time` string COMMENT '时间',
        `complaint_date` string COMMENT '日期',
        `phone_num` string COMMENT '电话号码',
        `type` string COMMENT '投诉类型',
        `receiver` string COMMENT '投诉接收人',
        `content` string COMMENT '投诉内容',
        `measure` string COMMENT '解决办法',
        `operator` string COMMENT '解决人',
        `delete` int COMMENT '逻辑删除',
        `operation_data` string COMMENT '最后操作时间'
        ) COMMENT '大厅客服使用-投诉接待与处理登记表'
PARTITIONED BY (`dt` string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE;
