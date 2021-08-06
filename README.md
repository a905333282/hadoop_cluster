# 数据仓库搭建
**Version 1.0**：<br>
1. 完成了 mysql->hdfs->hive->spark 架构设计，搭建好了实验环境。
2. 以 *艾黎物业项目部范式表格2021.4.1\艾黎物业项目部表格\大厅客服使用\投诉接待与处理登记表* 为例，完成了架构验证。
3. 完成部分自动化脚本

**Version 1.1目标** <br>
1. 搭建数据模拟器，模拟所有表的数据。
2. 基于业务讨论数据的分层，分表问题。
3. 完成更多的自动化脚本。

## 1. 框架版本选择

|框架名称|版本|备注|下载地址|  
|:-------|---|-------|--|
|jdk|1.8.0_212|java版本差异会造成scala和spark无法启动|[下载]()|
|scala|2.12.4|scala应该2.12.x都行|下载|
|hadoop|3.1.3|需配置hdfs集群，做存储用|[下载](https://drive.google.com/file/d/1WAcF_Vy26GgC1Fdw1R1nLquYFMReszsz/view?usp=sharing)|
|hive|3.1.2|在hdfs上做分析用，在一个节点配置即可|[下载](https://drive.google.com/file/d/1jNhC-qrCwT39enyDqvgDnmXhOt7rRO_F/view?usp=sharing)|
|spark|3.0.0|配置hive on spark, 在hdfs上配置build without hadoop版，在单节点上配置build with hadoop版，主要提供jar包的库|[下载(build with hadoop)](https://drive.google.com/file/d/1Q3W4NG332qyvmZQeIQ_oyZdrlnHx8nLn/view?usp=sharing)<br> [下载(build without hadoop)](https://drive.google.com/file/d/1rvdVzuSaQvJVinAgokc-RX2uMpEYWZvR/view?usp=sharing)|
|kafka|2.4.1|暂未涉及|[下载](https://drive.google.com/file/d/1isVqJ0j3OtAs2MeZsk6g0lQBElteBZr4/view?usp=sharing)|
|zookeeper|3.5.7|暂未涉及 kafka依赖zookeeper，每次一定要先于kafka启动，晚于kafka关闭|[下载](https://drive.google.com/file/d/1wFcXjod5o_-lXXfYWXEwVylVYEIRWolf/view?usp=sharing)|

## 2. 服务器环境搭建
### 2.1 网络配置
1. 改变host名字，即ip对应的主机名如：192.168.12.12 -> hadoop01
2. 配置所有主机间ssh免密登录

完成网络配置后，效果应是: ssh username@hostname 可以由任何主机直接免密登录任何主机

### 2.2 Hadoop集群配置
#### 2.2.1 集群服务概况

|ip地址|hostname|username|password|root|password|集群中角色|
|:-------|---|-------|--|----|--|--|
|172.31.0.241| hadoop01|hadoop|000000|root|Hadoop.|NameNode<br>DataNode<br>JobHistoryServer|
|172.31.0.39|  hadoop02|hadoop|000000|root|Hadoop.|ResourceManager<br>DataNode|
|172.31.0.54|  hadoop03|hadoop|000000|root|Hadoop.|secondartNameNode<br>DataNode|

#### 2.2.2 集群架构（暂定，只包括了mysql->hdfs->Hive->Spark部分）
![image](https://user-images.githubusercontent.com/44830402/128547756-b8529df6-68b3-48f1-b01c-99e40dc8eff7.png)

#### 2.2.2 集群架构验证实验
在 hadoop01 控制台
```
mysql -u root -p000000
```
```
use ali_inc;
```
```
select * from ali_hall_complaint;
```
得到下列模拟数据<br>
![image](https://user-images.githubusercontent.com/44830402/128549167-275c5956-2751-4fd5-8e5d-215ea19c03d7.png)
退出MySQL<br>
```
exit;
```
进入脚本文件夹<br>
```
cd ~/bin
```
运行迁移脚本，封装了sqoop，但不够智能化，在**Version 1.1** 中将改进. 脚本后面的日期是要迁移的数据的日期。
```
transfer_mysql_hdfs.sh 2021-08-08
```
完成后, 查看HDFS上的文件，选择了投诉日期在2021-08-08的字段<br>
```
hadoop fs -cat /source_data/hall/ali_hall_complaint/2021-08-08/part-m-00000
```
![image](https://user-images.githubusercontent.com/44830402/128550639-94eefa5b-0cc3-46ec-bc70-51aeec3e189e.png)
下面在hive建表，建表的脚本在 ~/bin/hivesql中
```
hive -f ~/bin/hivesql/create_ali_hall_complaint.sql
```
运行完成后，查看表结构
```
hive -e "desc ali_inc.ali_hall_complaint;"
```
运行加载HDFS数据到Hive脚本
```
~/bin/hivesql/load_ali_hall_complaint.sh
```
查看hive中的数据
```
hive -e "select * from ali_inc.ali_hall_complaint;"
```
![image](https://user-images.githubusercontent.com/44830402/128551829-8fe213f7-caa6-416f-a374-653d9d5ee42f.png)
至此，数据从单机的mysql分别转移到了
1. 以textfile的形式存储在HDFS
2. 以Hive表的形式存储在基于HDFS的Hive

计算框架测试，本项目已将Hive的计算引擎由MapReduce更换为Spark, 在命令行输入Hive, 启动Hive客户端
```
SELECT count(*) FROM ali_inc.ali_hall_complaint GROUP BY room_num;
```
计算每户人家的投诉数量<br>
在控制台输出:
![image](https://user-images.githubusercontent.com/44830402/128552828-2d3a1616-4ede-42d8-8610-82aef1032313.png)
则证明Spark已经完成计算。
