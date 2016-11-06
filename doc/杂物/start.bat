@echo off
SetLocal EnableDelayedExpansion    
@SET WD=%~d0%~p0
@SET APP_HOME=%WD%
@echo 应用主目录：%APP_HOME%
@echo KETTLE主目录：%KETTLE_HOME%
if not exist %KETTLE_HOME%/ext-lib (
	@echo 开始扩展你的kettle
	mkdir %KETTLE_HOME%\ext-lib
	xcopy /SY %APP_HOME%ext-lib %KETTLE_HOME%\ext-lib
	xcopy /SY %APP_HOME%plugins %KETTLE_HOME%\plugins
	copy /Y %APP_HOME%doc\杂物\launcher.properties %KETTLE_HOME%\launcher
rem	copy /Y %APP_HOME%default\log4j.xml %KETTLE_HOME%\classes
)
SET APP_CP=%APP_HOME%/lib/@project-name@.jar;%APP_HOME%/lib/*;@ext-lib@;%KETTLE_HOME%/lib/*;%APP_HOME%;%APP_HOME%/default
set JVM_OPTS= -Xms256m -Xmx1024m
java -cp %APP_CP% %JVM_OPTS% com.oss.OSSConfig webapp @port@
@pause