# 平台简介
## 出发点
专门为kettle这款优秀的ETL工具开发的web端管理工具。

kettle作为非常优秀的开源ETL工具得到了非常广泛的使用，一般的使用的都是使用客户端操作管理，但问题是当投入生产环境使用时，动辄上百或几百个job需要管理，这时在使用客户端管理已经很难完成了。我所知道的解决方案有用命令行的调用的，操作麻烦，总之还是很难用啦，还有就是开发web端管理工具，kettle自带了一个web端管理工具，界面极其简陋不说，还很难用，基本无法投入生产环境使用，其他没留意到还有没有较好对众多job进行管理的工具。

基于以上情况，和我近两年的kettle定制开发与使用经验。我设计并开发了这款kettle web端管理工具。

## 一些说明
1.	本平台初版已经投入使用一年多了，我们公司已经在多地部署使用，去年开源以来，外部也有大量用户，所以基础的作业调度功能已经稳定，新添加的功能基本属于锦上添花，有些小bug也难免，欢迎反馈，让我们一起让他变得更好。
2.	本系统是基于数据库资源库设计的，暂时不考虑支持文件资源库，当前支持oracle和mysql。
3.	关于kettle版本的问题，我开发使用的是5.4版，用这个当然更好，其他版本也是可以的，我测试了5.1、5.4、7.0都是可以使用的，本系统只调用了kettle一些基础api，版本相差不是太大应该都是可以的。

## 关键信息
1.	[项目博客地址](http://blog.benma666.cn/)
2.	[项目源码地址](https://github.com/majinju/kettle-manager)
3.	问题反馈邮箱：jinjuma@yeah.net。
4.	项目交流qq群：320302530(已满勿加)，交流2群：142104962。
5.	qq群说明：群主也要上班，请自己多思考，大家相互帮助。本群主要支持如何更好的使用，github上就是完整的源码，加上部署包中的jar肯定是可以运行起来的，这里不回答源码部署问题，都不看部署教程，直接上源码的可以退了，这不适合你。
6.	[项目网盘地址](http://pan.baidu.com/s/1o7MIup0)

## 已经在使用的公司
1. 现在开始收集，各位用起来了的，麻烦给我发个邮件，告知下公司名称，用于此处展示用。让我们一起促进本项目的发展，进一步升级改造，成为我们的etl好帮手。

# 平台部署

## 平台部署包简介
部署相关文件都会上传到网盘中。
![image](http://blog.benma666.cn/kettle-manager/images/平台部署包.png)

以下就是解压后的包结构，我们需要关注的主要有default目录下配置文件和两个km启动脚本，脚本可以点开看一下，有助于你发现部署中的问题。
![image](http://blog.benma666.cn/kettle-manager/images/km包结构.png)

部署包中不包含kettle的jar，会通过环境变量KETTLE_HOME关联到你的kettle的jar，从而支持你下载的kettle版本，这一点从启动脚本可以看出来，所以部署时你需要创建这个环境变量。

以下是default目录下的配置文件的介绍，其中我们重点关注jdbc.config文件，这是数据库配置文件，其他文件大部分默认既可以，出问题再去看。
![image](http://blog.benma666.cn/kettle-manager/images/km配置文件.png)

## 基础环境
本平台需要jdk1.7及以上，请自行安装好，不会的请网上搜索。
# 数据库
本系统支持oracle和mysql数据库，所有你需要有一个oracle或mysql数据库。之前的集成安装包是集成了mysql数据库的，转念一想既然这是一个ETL管理系统，大家应该都是会搞数据库的，应该比我厉害得多，所以数据库还是你们自己搞吧。
### Oracle
1.	在oracle中创建本系统的数据库用户km。也可自定义使用其他已有用户，在修改数据配置时对应的将km用户改为你的用户。
2.	先看以下脚本说明，脚本在部署包中的目录：doc\sql\oracle。
![image](http://blog.benma666.cn/kettle-manager/images/km数据库脚本.png)
3.	KM的结构和数据用plsql导出，可以使用plsql的工具->导入表->sql插入将KM.sql导入即可。
4.	原始kettle资源库的数据库中执行myNote.sql中的对应的sql脚本（若使用我提供的资源库建表语句kettle.sql则不用执行，已经包含了）。
5.	配置文件修改，配置文件在部署包中的位置：default/jdbc.config，以下是oracle配置参考：
![image](http://blog.benma666.cn/kettle-manager/images/oracle数据库配置.png)
### Mysql
1.	在mysql中创建本系统的数据库km。也可自定义使用其他已有数据库，在修改数据配置时对应的将km数据库改为你的数据库。
2.	先看以下脚本说明，与oracle一样，脚本在部署包中的目录：doc\sql\mysql。
![image](http://blog.benma666.cn/kettle-manager/images/km数据库脚本.png)
3.	KM的结构和数据直接在km数据库中运行KM.sql既可以。
4.	原始kettle资源库的数据库中执行myNote.sql中的对应的sql脚本（若使用我提供的资源库建表语句kettle.sql则不用执行，已经包含了）。
5.	配置文件修改，配置文件在部署包中的位置：default/jdbc.config，以下是mysql配置参考：
![image](http://blog.benma666.cn/kettle-manager/images/mysql数据库配置.png)
## 环境变量配置
设置环境变量：KETTLE_HOME=D:\NIS\data-integration5.4,具体的目录根据自己的实际情况设置，该变量用于在项目启动脚本中引用kettle的jar和关联你的kettle中的插件等。
win和linux都是需要配置。你也可以不配置，直接修改对应的启动脚本，去掉其中的KETTLE_HOME设置注释，在启动脚本中配置该变量。
这里的kettle推荐使用5.4，我开发时使用的5.4，遇到问题的概率要低些，其他版本遇到问题请反馈，我会在后续的版本中考虑。
我使用的kettle在网盘中也是有的。
## Windows运行
Windows请运行km.bat脚本。
以下是默认展示的帮助信息。
![image](http://blog.benma666.cn/kettle-manager/images/windows运行.png)
## Linux运行
Linux下运行km.sh脚本。
以下是默认展示的帮助信息。
![image](http://blog.benma666.cn/kettle-manager/images/linux运行.png)
## 平台访问
运行正常后就可以访问了，默认地址是：http://127.0.0.1:82 ，若运行时修改了端口，这里对应修改即可。默认kettle账号：kettle/kettle。

# 功能介绍
## 主界面

![image](http://blog.benma666.cn/kettle-manager/images/主界面.png)
 
## 参数设置
job运行参数设置，可以在页面上设置作业运行参数，每次运行作业时会用设置的参数覆盖默认值，这个很多人用不上。

![image](http://blog.benma666.cn/kettle-manager/images/参数设置1.png)
![image](http://blog.benma666.cn/kettle-manager/images/参数设置2.png)

## 定时设置
操作界面与kettle中的开始控件界面一致，这个可能是最优用的功能之一。

![image](http://blog.benma666.cn/kettle-manager/images/定时设置1.png)
![image](http://blog.benma666.cn/kettle-manager/images/定时设置2.png)

## 运行与停止
核心功能就不说了。

![image](http://blog.benma666.cn/kettle-manager/images/运行与停止.png)
 
## 强制结束
强制结束等待的作业，针对正常停止无效的情况。

![image](http://blog.benma666.cn/kettle-manager/images/强制结束.png)
 
## 实时日志
实时查看作业运行日志，这个功能看起来不起眼，实际应该是很有用的。

![image](http://blog.benma666.cn/kettle-manager/images/实时日志.png)
 
## 作业目录
获取作业目录。

![image](http://blog.benma666.cn/kettle-manager/images/作业目录.png)
 
## 新建作业
支持页面新建特定类的作业，当前是四类。这些作业都支持页面修改。其中的KM作业是基于我的插件开发。这里的作业继承com.oss.job.AbsJob，这样的作业支持这里的KM作业，也支持下面的定时调度使用。

![image](http://blog.benma666.cn/kettle-manager/images/新建作业1.png)
![image](http://blog.benma666.cn/kettle-manager/images/新建作业2.png)
 
 
## 删除作业
支持批量删除作业，这个很危险哦，小心使用，不会删除子转换和作业。

![image](http://blog.benma666.cn/kettle-manager/images/删除作业.png)
 
## 失败重启
支持配置失败自动重启、将job_version字段作为作业类别使用，便于分类管理。

![image](http://blog.benma666.cn/kettle-manager/images/失败重启.png)
 
## 定时调度
支持cron定时的调度，所有类必须继承：com.oss.job.AbsJob，作业支持参数配置，同一个类可以重复使用，传入不同的参数。这样开发的作业页支持用于上面的KM作业配置。

![image](http://blog.benma666.cn/kettle-manager/images/定时调度1.png)
![image](http://blog.benma666.cn/kettle-manager/images/定时调度2.png)
 
## con设计
引入一个cron辅助设计模块

![image](http://blog.benma666.cn/kettle-manager/images/cron设计.png)
 
## 按顺序运行
我已经开发好了一个上面的KM作业：com.oss.job.KettleJobRunner，这样的作业可以作为KM作业使用，也可以用于定时调度使用。
这个作业已经包含在项目中了，可以直接使用。
请参考KM作业示例和定时调度示例。
## 运行状态
作业的运行状态会定时反映到管理界面，我们可以通过多种条件筛选我们需要的作业进行批量运行或停止。
完成作业状态更新，日志文件记录的类：com.oss.job.JobManager，使用方式与按顺序运行的作业类似，请参考使用。
为了使部署简单，项目默认不依赖我开发的插件，你不使用KM作业功能，就不需要我开发的插件，项目默认已经在定时调度配置了该作业，并默认运行。

![image](http://blog.benma666.cn/kettle-manager/images/运行状态.png)
 
## 平台级日志
一般好的作业设计都会记录自己的日志表，详细记录作业运行状况，本平台提供了平台级日志功能，不涉及业务，记录了作业的开始停止时间，最终运行结果。

![image](http://blog.benma666.cn/kettle-manager/images/平台级日志1.png)
 
日志文件按天分文件夹存放，日志文件大小可以配置，若觉得占用空间，可以设计一个作业进行定时清理以前的日志文件，后续会提供该作业。也可以配置为不写日志文件。
该功能也是由com.oss.job.JobManager作业实现。与运行状态更新是同一个作业。

![image](http://blog.benma666.cn/kettle-manager/images/平台级日志2.png)
 
## 业务日志
Km数据库中有一张我设计的专门用于记录业务日志的表：METL_KETTLE_LOG，这个表是根据我们平常设计作业的经验设计的，需要作业设计人员在设计作业时填充此表数据，本平台已经默认提供了此表的查询。
此日志与平台级日志是互补关系，此日志更详细，涉及业务，平台级日志是后盾，主要用于问题排查等。

![image](http://blog.benma666.cn/kettle-manager/images/业务日志1.png)
![image](http://blog.benma666.cn/kettle-manager/images/业务日志2.png)
 
## KM作业示例

![image](http://blog.benma666.cn/kettle-manager/images/km作业示例.png)
 
## JS作业示例
该作业前部分操作基本与KM类似，区别在于具体的js基本配置

![image](http://blog.benma666.cn/kettle-manager/images/js作业示例.png)
 
## SQL作业示例
该作业前部分操作基本与KM类似，区别在于需要选择数据库，然后就是数据库脚本了

![image](http://blog.benma666.cn/kettle-manager/images/sql作业示例.png)
 
## Shell作业示例

该作业前部分操作基本与KM类似，额外的需要配置脚本运行路径，默认：/tmp。
作业在linux上运行就写shell脚本，在windows上运行就写bat脚本。
都比较直观，就不多说了。

![image](http://blog.benma666.cn/kettle-manager/images/shell作业示例.png)
 
## 定时调度示例

![image](http://blog.benma666.cn/kettle-manager/images/定时调度示例1.png)
![image](http://blog.benma666.cn/kettle-manager/images/定时调度示例2.png)

# 源码构建
1.	一般都不需要自己开发，直接使用就行，若有bug或新功能需求，可以发邮件给我。
2.	本项目基于开源项目EOVA开发：http://git.oschina.net/eova/eova。
3.	若想进一步扩展功能，建议先搭建kettle开发环境，可以参考我的博文：http://www.cnblogs.com/majinju/p/4455107.html
4.	我的博客中还有多篇文章介绍kettle的源码等，可以作为参考。
5.	github上就是完整的源码，加上部署包中的jar肯定是可以运行起来的，都不看部署教程，先将部署包运行起来，直接上源码的可以撤了，这个不适合你。

# 常见问题
## Kettle7.0注意事项
Kettle7会报如下错误信息：

![image](http://blog.benma666.cn/kettle-manager/images/kettle7日志插件问题1.png)
 
这个错误不影响使用，但不好看不是。所以我还是说一下怎么消除这个错误。
网盘中有如下文件，解压到本应用的根目录就可以了。这个问题是因为kettle的一个日志插件没有找到日志配置文件。

![image](http://blog.benma666.cn/kettle-manager/images/kettle7日志插件问题2.png)
 
## 怎么将作业添加到本平台
本平台是直接读取你数据库资源的v_job视图，这个视图包装了一下r_job表，你可以通过修改视图达到隐藏一些作业的目的。
R_job是kettle资源库的系统表，只要你连接这个资源库设计的作业，都会记录在这个表中，所以你只需按照平常的习惯，连接与本平台配置的相同的资源库设计作业即可，因为读取的是同一张表，所以不需要额外的操作，直接就可以在本平台中看到你的作业并进行调度。
有外部作业需要添加到本平台，你只需直接使用kettle的Spoon工具，连接同一个资源库进行导入操作，这个数据人员都很熟悉。
我觉得没必要在页面支持作业导入功能，不知是否有这样的需求，这个暂时不开发。

# 注意事项
1.	不要使用系统自带的记事本编辑配置文件，否则会导致系统无法正常读取你修改的配置文件，可以使用editpuls或notepad++。当出现奇葩问题时要想起这个提示。

# 后续计划
1.	支持简单的表对表作业新增。
2.	考虑新增转换管理，开发通用km作业支持转换运行。
3.	一个job同时在多个km中运行还需要考虑，日志，状态等
4.	任务管理在设置定时时可能需要人为分散定时，考虑生成时间-运行任务数的分析图辅助进行分散定时。
5.	作业管理显示上一次和下一次运行时间。
6.	作业管理支持配置文件资源库运行。
7.	改为支持文件资源库和更多数据库作为资源库。
8.	权限管理，不同用户看到自己的作业，管理员看所有作业。
9.	分布式、集群支持。
