#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh 执行脚本.sh [copy|zip|del]"
	exit 1
}

# 拷贝文件
copy(){
  echo "begin copy db "
  mkdir -p ./mysql/db
  # 数据世界的脚本
  cp ../../../myutils-spring-boot-starter/doc/db/mysql/sjsj2_dev.sql ./mysql/db
  # 升级脚本
  cp ../../../myutils-spring-boot-starter/doc/db/mysql/upscript.sql ./mysql/db
  # 删除测试穿透调用，正式环境会出问题
  sed  -i "/INSERT INTO \`sys_znjh_ctdy\`/d"  ./mysql/db/sjsj2_dev.sql

  echo "begin copy qd "
  mkdir -p ./nginx/qd
  cp -r ../../../sjsj-vue3-ts/dist/** ./nginx/qd

  echo "begin copy hd "
  mkdir -p ./sjsj/hd
  cp -r ../dist/** ./sjsj/hd
  cp ../../target/*.jar ./sjsj/hd
  cp ../../src/main/resources/application.yaml ./sjsj/hd/application.yaml
  cp ./sjsj/conf/* ./sjsj/hd
}

# 打包部署文件
zip(){
  command zip -vr ../../target/sjsj.zip ./mysql ./nginx ./redis ./sjsj deploy.sh docker-compose.yml 部署手册.md
}

# 删除基础信息，升级一般需要全量替换的文件
del(){
	# 删除复制的文件。
  echo "begin delete db "
  # 数据世界的脚本
  rm -rf ./mysql/db

  echo "begin delete qd "
  rm -rf ./nginx/qd

  echo "begin delete hd "
  rm -rf ./sjsj/hd
}

# 根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
"copy")
	copy
;;
"zip")
	zip
;;
"del")
	del
;;
*)
	usage
;;
esac
