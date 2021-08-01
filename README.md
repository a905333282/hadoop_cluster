# 数据中台搭建

## 1. 框架版本选择

|框架名称|版本|备注|下载地址|  
|:-------|---|-------|--|
|jdk|1.8.0_212|java版本差异会造成scala和spark无法启动|[下载]()|
|scala|2.12.4|scala应该2.12.x都行|下载|
|hadoop|3.1.3|需配置hdfs集群，做存储用|[下载](https://drive.google.com/file/d/1WAcF_Vy26GgC1Fdw1R1nLquYFMReszsz/view?usp=sharing)|
|hive|3.1.2|在hdfs上做分析用，在一个节点配置即可|[下载](https://drive.google.com/file/d/1jNhC-qrCwT39enyDqvgDnmXhOt7rRO_F/view?usp=sharing)|
|spark|3.0.0|配置hive on spark, 在hdfs上配置build without hadoop版，在单节点上配置build with hadoop版，主要提供jar包的库|[下载(build with hadoop)](https://drive.google.com/file/d/1Q3W4NG332qyvmZQeIQ_oyZdrlnHx8nLn/view?usp=sharing)<br> [下载(build without hadoop)](https://drive.google.com/file/d/1rvdVzuSaQvJVinAgokc-RX2uMpEYWZvR/view?usp=sharing)|
|kafka|2.4.1||[下载](https://drive.google.com/file/d/1isVqJ0j3OtAs2MeZsk6g0lQBElteBZr4/view?usp=sharing)|
|zookeeper|3.5.7|kafka依赖zookeeper，每次一定要先于kafka启动，晚于kafka关闭|[下载](https://drive.google.com/file/d/1wFcXjod5o_-lXXfYWXEwVylVYEIRWolf/view?usp=sharing)|
