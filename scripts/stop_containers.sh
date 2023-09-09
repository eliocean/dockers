#!/bin/bash

# 如果没有传递参数
if [ $# -eq 0 ]; then
    # 停止所有容器
    docker stop $(docker ps -q)
    echo "已停止所有容器。"
else
    # 停止特定容器
    container_id_or_name=$1
    docker stop $container_id_or_name
    echo "已停止容器: $container_id_or_name"
fi
