# 数据仓库搭建
### 演示
# 1. 集群概况：一切从零开始
![集群概况](https://user-images.githubusercontent.com/44830402/137356609-801c18e3-0e91-482d-af0c-bb539efa2ba8.png)<br>
**集群中有的文件夹分别是**：<br>
<br>
1.1 **Hbase:** Hbase根目录<br>
1.2 **Kylin:** Kylin即席查询框架目录<br>
1.3 **spark-history:** Spark计算框架历史任务<br>
1.4 **spark-jars:** spark计算框架程序包<br>
1.5 **tmp:** 临时文件夹<br>
1.6 **user:** ...<br>
<br>
![白纸一样的集群](https://user-images.githubusercontent.com/44830402/137356626-ebca87d7-d3dd-4517-a587-b45030dd98f1.png)<br>
# 2. 运行初始化脚本 mysql-> hdfs
初次运行集群需要把当天之前全部的业务数据从单机mysql上传到hdfs。所以需要一个初始化脚本<br>
脚本：<br>
transfer_mysql_hdfs_init_fee.sh<br>
transfer_mysql_hdfs_init_tc.sh<br>
规则是 transfer_mysql_hdfs_init_fee.sh all 2021-10-14, 该脚本会将指定日期之前的数据全部导入，之后每天使用<br>
transfer_mysql_hdfs_fee.sh<br>
transfer_mysql_hdfs_tc.sh<br>
处理每天的数据<br>
![数据初始化fee](https://user-images.githubusercontent.com/44830402/137359192-f0f5b5c0-d073-4feb-b57e-76eaf92901ac.png)<br><br>
初始化后（现在有两个业务物业收费和停车收费），集群中数据如图<br>
多了一个数据暂存文件夹**origin_data**,里面存了刚刚转移过来的数据<br>
![初次转移](https://user-images.githubusercontent.com/44830402/137359557-c7443cd1-09fd-44cb-ae90-cb18f91942c5.png)<br>
数据图所示，每个表在一个文件夹中, fee开头的是物业收费，tc开头的是停车收费<br>
![初次转移1](https://user-images.githubusercontent.com/44830402/137359558-bc018238-98cc-4d47-a4fc-1e174238b810.png)<br>
数据依据天划分，因为每天都会有新数据进来，以2021-10-14为例，内部结构如图三、四所示,part-m-00000就是数据<br>
![初次转移2](https://user-images.githubusercontent.com/44830402/137360080-38833ebd-b536-404f-95f2-4b2d44c9af3d.png)<br>
![初次转移3](https://user-images.githubusercontent.com/44830402/137360087-ec6ee8be-83ab-4281-96f4-64c0aeb22704.png)<br>
# 3. hdfs到hive
数据虽然已经到了分布式系统，但是很难管理。hive实际上就是一个管理工具，在hdfs的上层管理hdfs上的数据。<br>
### 3.1 建表
首先，运行建表脚本，将ods（原始数据层）dwd（款表层）app（应用层，应为暂时业务过于简单，所以没有严格划分）三层的业务表格建起来, 脚本位置：<br>
hive/ods/create_ods_fee.sql<br>
hive/ods/create_ods_tc.sql<br>
hive/dwd/create_dwd_fee.sql<br>
hive/dwd/create_dwd_tc.sql<br>
hive/app_layer/create_app_layer.sql<br>
脚本是HiveSQL语言，用 hive -f 脚本名 调用。完成后，观察分布式文件系统，发现多了一个文件夹warehouse，是我们刚刚见的表的根目录<br>
![建表完成](https://user-images.githubusercontent.com/44830402/137361495-225b2560-121b-4d22-9129-50c73da7b7a4.png)<br>
这个文件夹里有三个小文件夹，对应三个层，每个文件夹里面又有对应的表<br>
![建表完成1](https://user-images.githubusercontent.com/44830402/137361619-fbb76aff-3147-4df3-854a-f9926e1a6f9a.png)<br>
以ods为例，里面有对应所有表的文件夹，但现在还是空的<br>
![建表完成2](https://user-images.githubusercontent.com/44830402/137362201-896ca3de-5a2f-4cd1-ac07-e6011f7d7845.png)<br>
在hive客户端中查看建的表<br>
![hive建表](https://user-images.githubusercontent.com/44830402/137363653-8b6b6d38-56f9-4caa-9e11-67adacfed7de.png)<br>
### 3.2 加载数据
hive相当于一个hdfs上数据管理的一个框架，所以需要把hdfs的业务元数据加载到表里，脚本包括：<br>
hive/ods/load_ods_fee.sh<br>
hive/ods/load_ods_tc.sh<br>
调用方法 ./load_ods_fee.sh all 2021-10-14<br>
此时在hdfs可视化文件系统中发现，数据已经存在了hive的路径中<br>
![数据装载](https://user-images.githubusercontent.com/44830402/137363416-e588bd50-2f7d-4ad4-a9c6-c12b891052cd.png)<br>
在hive客户端中使用sql语句已经可以看到数据。<br>
![hive建表1](https://user-images.githubusercontent.com/44830402/137363917-782204ff-9299-4ced-b014-65c581654794.png)<br>
# 4. 从hive ods(原始数据层)到dwd(宽表层)加载数据
脚本:<br>
hive/dwd/load_dwd_fee.sh<br>
hive/dwd/load_dwd_tc.sh<br>
调用方法 ./load_dwd_fee.sh 2021-10-14<br>这个涉及到聚合运算，集群会自动调用spark计算<br>
计算完成后，查看数据情况，发现dwd层的表已经有了数据，<br>
![d2](https://user-images.githubusercontent.com/44830402/137364576-68d893cb-1a91-4a68-81cb-664b2922e231.png)<br>
在hive客户端中查看数据<br>
![q2](https://user-images.githubusercontent.com/44830402/137364681-33b5fbcc-8ec1-4802-bc57-b93b930b540e.png)<br>
# 5. dwd 到 应用层
数据聚合完成，已经开始分析数据了
这次主要关注了：<br>
每栋楼总计物业费<br>
每栋楼总计物业费分类<br>
每个人总计物业费<br>
每个人总计物业费分类<br>
每个小区总计物业费<br>
每个小区总计物业费分类<br>
脚本：hive/app_layer/dwd_to_app.sh<br>
脚本调用hive -f dwd_to_app.sh 2021-10-14<br>
数据已经在hive中可查：<br>
以楼栋分类午夜分总结为例：<br>
![hive建表11](https://user-images.githubusercontent.com/44830402/137376826-44160a11-8719-4074-b4c5-77231678f8a6.png)<br>


**Version 2.0**：<br>
<br>
现集群环境：hdfs,hive,spark,hbase,kylin(即席查询)
1. 完成了 真实业务数据下fee（物业收费）的DWD层维度建模（每一次物业缴费的所有需要的信息都成现在一行）
2. 基本完成了 真实业务数据下tc（停车收费）的DWD层维度建模（每一次停车缴费的所有需要的信息都成现在一行）
3. 基于以上建模数据 完成物业收费基于用户维度的分析，基于 月，半年，年的分析。
4. 基于以上建模数据 完成物业收费基于用户维度的分析，基于 七天，半月，月，半年的分析。


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
