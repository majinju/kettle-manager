#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh 执行脚本.sh [copy|zip|del|bbqh]"
	exit 1
}

# 拷贝文件
copy(){
  del
  echo "begin copy db "
  mkdir -p ./mysql/db/oracle
  # 数据世界的脚本
  cp ../db/mysql/sjsj2_dev.sql ./mysql/db
  # 升级脚本
  cp ../db/mysql/upscript.sql ./mysql/db
  # 删除测试穿透调用，正式环境会出问题
  sed  -i "/INSERT INTO \`sys_znjh_ctdy\`/d"  ./mysql/db/sjsj2_dev.sql

  cp ../db/mysql/kettle_default.sql ./mysql/db
  cp ../db/mysql/init.sql ./mysql/db/kettle_init.sql
  cp ../db/oracle/init.sql ./mysql/db/oracle/kettle_init.sql
  # kettle资源库添加建库信息，便于mysql自动建库
  sed -i '1i USE `kettle_default`;' ./mysql/db/kettle_default.sql
  sed -i '1i CREATE DATABASE  `kettle_default` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;' ./mysql/db/kettle_default.sql
  sed -i '1i DROP DATABASE IF EXISTS `kettle_default`;' ./mysql/db/kettle_default.sql
  # 删除oracle资源库信息
  sed -i "/VALUES ('kettle_oracle'/d" ./mysql/db/sjsj2_dev.sql
  sed -i "/VALUES ('sjds'/d" ./mysql/db/sjsj2_dev.sql
  sed -i "/'SJDS-SJSJ/d" ./mysql/db/sjsj2_dev.sql
  sed -i "/'SHRMYY/d" ./mysql/db/sjsj2_dev.sql
  sed -i "s/sjsj-ht/sjds-ht/g"  ./mysql/db/sjsj2_dev.sql

  echo "begin copy qd "
  mkdir -p ./nginx/qd
  cp -r ../../../sjsj-vue3-ts/dist/** ./nginx/qd
  sed  -i "s/"KFZFW"/"SJDS"/g"  ./nginx/qd/index.html
  sed  -i "s/sjsj-ht/sjds-ht/g"  ./nginx/qd/index.html
  sed  -i "s/"数据世界"/"数据大师"/g"  ./nginx/qd/index.html

  echo "begin copy hd "
  mkdir -p ./sjsj/hd
  cp -r ../dist/** ./sjsj/hd
  cp ../../target/sjds-0.2.4.jar ./sjsj/hd/sjds.jar
  cp ../../src/main/resources/application.yaml ./sjsj/hd/application.yaml
  cp ./sjsj/conf/* ./sjsj/hd
  mkdir -p ./sjsj/upload/common
  cp -r ../../../../benma666/upload/common/** ./sjsj/upload/common
}

# 打包部署文件
zip(){
  command zip -vr ../../target/sjds.zip ./mysql ./nginx ./redis ./sjsj deploy.sh docker-compose.yml 部署手册.md
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
  rm -rf ./sjsj/upload
}
# 版本切换
bbqh(){
  oldV=$1
  newV=$2
  wkDir=`pwd`/../../..
  echo "${oldV}切换为${newV}，根目录：${wkDir}"
  sed -i "s/${oldV}/${newV}/g" dev.sh ${wkDir}/my-parent/pom.xml ${wkDir}/myutils/pom.xml \
    ${wkDir}/myutils-kettle/pom.xml ${wkDir}/myutils-spring-boot-starter/pom.xml ${wkDir}/sjsj/pom.xml #\
    #${wkDir}/pentaho-kettle/core/pom.xml ${wkDir}/pentaho-kettle/engine/pom.xml ${wkDir}/pentaho-kettle/ui/pom.xml
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
"bbqh")
	bbqh $2 $3
;;
*)
	usage
;;
esac
