# 数据仓库搭建
**Version 1.0**：<br>
1. 完成了 mysql->hdfs->hive->spark->mysql->BI工具->快速查询 架构设计，搭建好了实验环境。
2. 以下列表为例，完成了架构验证。现在因为表比较少，所以没有很细致的分层，直接从ODS层到应用层，中间没有如宽表层等中间层。

|表名MySQL|表名Hive(ODS层，即元数据层)|备注|
|:-------|---|---|
| ali_fireequipment_connect      |ods_fireequipment_connect|消防、监控使用——监控室交接班记录表|
| ali_fireequipment_querymonitor |ods_fireequipment_querymonitor|消防、监控使用——调取监控通知单|
| ali_guard_basement             |ods_guard_basement|保安使用——地库巡查表|
| ali_guard_building             |ods_guard_building|保安使用——楼道巡查表|
| ali_hall_complaint             |ods_hall_complaint|大厅客服使用——投诉回访记录表|
| ali_hall_complaint_review      |ods_hall_complaint_review|大厅客服使用——投诉接待与处理登记表|
| ali_hall_maintain_mission      |ods_hall_maintain_mission|大厅客服使用——物业公司维修派工单|

以ali_hall_complaint为例，在业务数据库中
3. 完成更多自动化脚本
![离线_架构](https://user-images.githubusercontent.com/44830402/130888919-4587611c-30d7-4394-b7b3-e3e148bce541.jpg)


