#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh copy.sh"
	exit 1
}
echo "begin copy sql "
# 数据世界的脚本
cp ../../../myutils-spring-boot-starter/doc/db/mysql/sjsj2_dev.sql ./mysql/db

echo "begin copy html "
cp -r ../../../sjsj-vue3-ts/dist/** ./nginx/html/dist

echo "begin copy sjsj "
mkdir -p ./sjsj/data/sjsj
cp -r ../dist/** ./sjsj/data/sjsj
cp ../../target/*.jar ./sjsj/data/sjsj
cp ../../src/main/resources/application.yaml ./sjsj/data/sjsj
cp ./sjsj/conf/* ./sjsj/data/sjsj
#cp ../../src/main/resources/application-mysql.yaml ./sjsj/dist
#cp ../../src/main/resources/application-private.yaml ./sjsj/dist
#sed  -i "s/192.168.1.22:3306\/sjsj2_dev/benma666-mysql:3306\/sjsj2_zs/g"  ./sjsj/dist/application-mysql.yaml
