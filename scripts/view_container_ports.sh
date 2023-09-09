#!/bin/bash

# 如果没有传递参数
if [ $# -eq 0 ]; then
    # 查看所有容器的端口映射
    container_ids=$(docker ps -aq)
    for container_id in $container_ids; do
        container_name=$(docker inspect -f '{{.Name}}' $container_id)
        container_name=${container_name:1}  # 去掉容器名前面的 /
        
        echo "容器名称: $container_name"
        echo "端口映射:"
        docker port $container_id
        echo "------------------------------------"
    done
else
    # 查看特定容器的端口映射
    container_id_or_name=$1
    container_id=$(docker ps -q -f "name=$container_id_or_name")
    
    if [ -z "$container_id" ]; then
        echo "未找到名称或ID为 $container_id_or_name 的容器。"
    else
        echo "容器名称: $container_id_or_name"
        echo "端口映射:"
        docker port $container_id
    fi
fi
