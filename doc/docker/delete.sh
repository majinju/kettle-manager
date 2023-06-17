#!/bin/sh

# 删除复制的文件。
echo "begin delete sql "
# 数据世界的脚本
rm -rf ./mysql/db/*

echo "begin delete html "
rm -rf ./nginx/html/dist/*

echo "begin delete sjsj "
rm -rf ./sjsj/dist/*
