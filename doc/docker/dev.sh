#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh 执行脚本.sh [delbase|deldata|copy|build]"
	exit 1
}

# 删除基础信息，升级一般需要全量替换的文件
delbase(){
	# 删除复制的文件。
  echo "begin delete sql "
  # 数据世界的脚本
  rm -rf ./mysql/db

  echo "begin delete html "
  rm -rf ./nginx/data/html/sjds/*

  echo "begin delete sjsj "
  rm -rf ./sjsj/data/sjsj
}

# 删除数据，容器之前的数据会被删除
deldata(){
	# 删除复制的文件。
  echo "begin delete mysql "
  # 数据世界的脚本
  rm -rf ./mysql/data

  echo "begin delete nginx "
  rm -rf ./nginx/data

  echo "begin delete redis "
  rm -rf ./redis/data

  echo "begin delete sjsj "
  rm -rf ./sjsj/data
}

# 拷贝文件，准备构建
copy(){
  echo "begin copy mysql "
  mkdir -p ./mysql/db
  # 数据世界的脚本
  cp ../../../myutils-spring-boot-starter/doc/db/mysql/sjsj2_dev.sql ./mysql/db
  cp ../db/mysql/kettle_default.sql ./mysql/db
  # kettle资源库添加建库信息，便于mysql自动建库
  sed -i '1i USE `kettle_default`;' ./mysql/db/kettle_default.sql
  sed -i '1i CREATE DATABASE  `kettle_default` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;' ./mysql/db/kettle_default.sql
  sed -i '1i DROP DATABASE IF EXISTS `kettle_default`;' ./mysql/db/kettle_default.sql
  # 删除oracle资源库信息
  sed -i "/VALUES ('kettle_oracle'/d" ./mysql/db/sjsj2_dev.sql
  sed -i "/VALUES ('sjds'/d" ./mysql/db/sjsj2_dev.sql
  sed -i "/'SJDS-SJSJ/d" ./mysql/db/sjsj2_dev.sql
  sed -i "/'SHRMYY/d" ./mysql/db/sjsj2_dev.sql
  sed  -i "s/sjsj-ht/sjds-ht/g"  ./mysql/db/sjsj2_dev.sql

  echo "begin copy nginx "
  mkdir -p ./nginx/data/html/sjds
  mkdir -p ./nginx/data/conf
  cp -r ../../../sjsj-vue3-ts/dist/** ./nginx/data/html/sjds
  cp ./nginx/conf/nginx.conf ./nginx/data/conf/nginx.conf
  sed  -i "s/"KFZFW"/"SJDS"/g"  ./nginx/data/html/sjds/index.html
  sed  -i "s/sjsj-ht/sjds-ht/g"  ./nginx/data/html/sjds/index.html
  sed  -i "s/"数据世界"/"数据大师"/g"  ./nginx/data/html/sjds/index.html

  echo "begin copy redis "
  mkdir -p ./redis/data
  cp -r ./redis/conf/redis.conf ./redis/data/redis.conf

  echo "begin copy sjsj "
  mkdir -p ./sjsj/data/sjsj
  cp -r ../dist/** ./sjsj/data/sjsj
  cp ../../target/*.jar ./sjsj/data/sjsj
  cp ../../src/main/resources/application.yaml ./sjsj/data/sjsj/application.yaml
  cp ./sjsj/conf/* ./sjsj/data/sjsj
  #cp ../../src/main/resources/application-mysql.yaml ./sjsj/dist
  #cp ../../src/main/resources/application-private.yaml ./sjsj/dist
  #sed  -i "s/192.168.1.22:3306\/sjsj2_dev/benma666-mysql:3306\/sjsj2_zs/g"  ./sjsj/dist/application-mysql.yaml
}

# 全部构建，存在的会重构
build(){
	docker-compose build benma666-mysql benma666-redis benma666-nginx benma666-sjsj
}

# 根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
"delbase")
	delbase
;;
"deldata")
	deldata
;;
"build")
	build
;;
"copy")
	copy
;;
*)
	usage
;;
esac
