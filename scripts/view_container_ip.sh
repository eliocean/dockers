#!/bin/bash

# 如果没有传递参数
if [ $# -eq 0 ]; then
    # 查看所有容器的IP
    docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
else
    # 查看特定容器的IP
    container_id_or_name=$1
    docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $container_id_or_name
fi
