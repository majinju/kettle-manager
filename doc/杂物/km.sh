#!/bin/bash
APP_HOME=$(cd `dirname $0`; pwd)
#export KETTLE_HOME=$(cd `dirname $0`;cd ..; pwd)/data-integration5.4
#export KETTLE_JNDI_ROOT=$KETTLE_HOME/simple-jndi
echo APP_HOME:$APP_HOME
echo KETTLE_HOME:$KETTLE_HOME
echo KETTLE_JNDI_ROOT:$KETTLE_JNDI_ROOT
APP_CP=$APP_HOME/lib/@project-name@.jar:$APP_HOME/ext-lib/myutils.jar:$APP_HOME/ext-lib/*:$APP_HOME:$APP_HOME/default:$APP_HOME/lib/*:$KETTLE_HOME/lib/*
JVM_OPTS="-Xms256m -Xmx1024m"
echo $APP_CP
java -cp $APP_CP $JVM_OPTS com.oss.Main $*