@echo off
SetLocal EnableDelayedExpansion    
@SET WD=%~d0%~p0
@SET APP_HOME=%WD%
SET APP_CP=%APP_HOME%;%APP_HOME%/lib/kettle-manager.jar;%APP_HOME%/lib/*
set JVM_OPTS= -Xms256m -Xmx1024m
java -cp %APP_CP% %JVM_OPTS% com.oss.OSSConfig webapp 85