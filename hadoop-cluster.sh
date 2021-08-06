#!/bin/bash
# hadoop 集群启动，停止脚本
  
if [ $# -lt 1 ]
then
        echo "No Args Input..."     
        exit ;
fi

case $1 in
        "start")
                echo "[INFO]: Starting hadoop cluster " 
                ssh hadoop01 "/opt/module/hadoop-3.1.3/sbin/start-dfs.sh"
                ssh hadoop02 "/opt/module/hadoop-3.1.3/sbin/start-yarn.sh"
                ssh hadoop01 "/opt/module/hadoop-3.1.3/bin/mapred --daemon start historyserver"
        ;;

        "stop")
                echo "[INFO]: Stoping hadoop cluster" 
                ssh hadoop01 "/opt/module/hadoop-3.1.3/bin/mapred --daemon stop historyserver"
                ssh hadoop02 "/opt/module/hadoop-3.1.3/sbin/stop-yarn.sh"
                ssh hadoop01 "/opt/module/hadoop-3.1.3/sbin/stop-dfs.sh"
        ;;
*)
        echo "Input Args can only be 'start' or 'stop' " 
;;
esac
for host in hadoop01 hadoop02 hadoop03
do
        echo [INFO]: Current hostname $host
        ssh $host /opt/module/jdk1.8.0_212/bin/jps
done
