#!/bin/bash
export APP_HOME=$(cd `dirname $0`; pwd)
export KETTLE_HOME=$(cd `dirname $0`;cd ..; pwd)/data-integration5.4
export KETTLE_JNDI_ROOT=$KETTLE_HOME/simple-jndi
echo APP_HOME:$APP_HOME
echo KETTLE_HOME:$KETTLE_HOME
echo KETTLE_JNDI_ROOT:$KETTLE_JNDI_ROOT
export APP_CP=$APP_HOME/lib/kettle-manager.jar:$APP_HOME/lib/*:$KETTLE_HOME/ext-lib/*:$KETTLE_HOME/lib/*:$APP_HOME:$APP_HOME/default
export JVM_OPTS="-Xms256m -Xmx1024m"
echo $APP_CP
java -cp $APP_CP $JVM_OPTS com.oss.OSSConfig webapp 86