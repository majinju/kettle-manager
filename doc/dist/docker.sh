#!/bin/sh

APP_HOME="."
java -cp $APP_HOME/sjsj-0.2.0.jar:$APP_HOME/lib/* cn.benma666.sjsj.SjsjApplication --spring.config.location=$APP_HOME/application.yaml
