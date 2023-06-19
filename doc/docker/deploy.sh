#!/bin/sh

# 使用说明，用来提示输入参数
usage() {
	echo "Usage: sh 执行脚本.sh [copy|build|port|base|app|stop|rmc|del]"
	exit 1
}
# 拷贝文件
copy(){
  echo "begin copy nginx "
  mkdir -p ./data/nginx/html/sjsj
  mkdir -p ./data/nginx/conf
  cp -r ./nginx/qd/** ./data/nginx/html/sjsj
  cp ./nginx/conf/nginx.conf ./data/nginx/conf/nginx.conf

  echo "begin copy redis "
  mkdir -p ./data/redis
  cp ./redis/conf/redis.conf ./data/redis/redis.conf

  echo "begin copy sjsj "
  mkdir -p ./data/sjsj/sjsj
  cp -r ./sjsj/hd/* ./data/sjsj/sjsj
}

# 全部构建，存在的会重构
build(){
	docker-compose build benma666-mysql benma666-redis benma666-nginx benma666-sjsj
}

# 开启所需端口
port(){
	firewall-cmd --add-port=8091/tcp --permanent
	firewall-cmd --add-port=8090/tcp --permanent
	service firewalld restart
}

# 启动基础环境（必须）
base(){
	docker-compose up -d benma666-mysql benma666-redis
}

# 启动程序模块（必须）
app(){
	docker-compose up -d benma666-nginx benma666-sjsj
}

# 关闭所有环境/模块
stop(){
	docker-compose stop
}

# 删除所有环境/模块
rmc(){
	docker-compose rm
}

# 删除数据，容器之前的数据会被删除
del(){
	# 删除复制的文件。
  echo "begin delete data "
  # 数据世界的脚本
  rm -rf ./data
}

# 根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
"copy")
	copy
;;
"build")
	build
;;
"port")
	port
;;
"base")
	base
;;
"app")
	app
;;
"stop")
	stop
;;
"rmc")
	rmc
;;
"del")
	del
;;
*)
	usage
;;
esac
