@echo off
SetLocal EnableDelayedExpansion    
@SET WD=%~d0%~p0
@SET APP_HOME=%WD%
SET APP_CP=%APP_HOME%/lib/@project-name@.jar;%APP_HOME%/lib/*;@ext-lib@;%KETTLE_HOME%/lib/*;%APP_HOME%;%APP_HOME%/default
set JVM_OPTS= -Xms256m -Xmx1024m
java -cp %APP_CP% %JVM_OPTS% com.oss.OSSConfig webapp @port@