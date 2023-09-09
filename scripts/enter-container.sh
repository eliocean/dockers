#!/bin/bash

# 检查是否提供了容器名称或ID作为参数
if [ $# -ne 1 ]; then
    echo "用法: $0 <容器ID或名称>"
    exit 1
fi

# 获取传递的容器名称或ID参数
container_name_or_id="$1"

# 尝试进入容器的 shell
docker exec -it "$container_name_or_id" /bin/bash

# 检查是否成功进入容器
if [ $? -ne 0 ]; then
    echo "无法进入容器 $container_name_or_id"
    exit 1
fi
