#!/bin/bash 
  
for host in hadoop01 hadoop02 hadoop03
do
        echo [INFO]: Current hostname $host     
        ssh $host /opt/module/jdk1.8.0_212/bin/jps
done
