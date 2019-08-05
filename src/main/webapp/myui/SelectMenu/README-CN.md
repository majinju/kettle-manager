# SelectMenu

> 简洁、易用、多样的菜单解决方案

## 入门指南、DEMO、文档

*插件官方首页（入门指南、DEMO、文档）：*

[中文官网](https://terryz.gitee.io/selectmenu/index.html)

[英文官网](https://terryz.github.io/selectmenu/index.html)

*项目GitHub地址：*

[https://github.com/TerryZ/SelectMenu](https://github.com/TerryZ/SelectMenu)



## 插件运行效果预览

*常规菜单模式*

![SelectMenu1](https://terryz.github.io/image/SelectMenuBase.png "SelectMenu")

*高级菜单模式*

![SelectMenu2](https://terryz.github.io/image/SelectMenu.png "SelectMenu")

*高级菜单多分组数据模式*

![SelectMenu3](https://terryz.github.io/image/SelectMenuGroup.png "SelectMenu")



### 如果您觉得项目还不错，还请给项目（ [Github](https://github.com/TerryZ/SelectMenu) / [码云](https://gitee.com/TerryZ/SelectMenu) ）加个Star，同时欢迎Follow [Github个人主页](https://github.com/TerryZ)

<br><br><br><br>




### 功能特点


* 基于 jQuery1.x 开发, jQuery2和3的版本未经测试

* 简洁清爽的界面，可适应大多数UI环境

* Autocomplete输入自动查找功能

* 结果列表多分组（Tabs）展示

* 允许使用静态数据或动态获取数据的数据源

* 使用键盘快速导航、选择等操作

* 高级模式下支持多项目被选中

* 支持鼠标右键呼出菜单模式

* 丰富的参数设置及功能API调用

浏览器兼容：IE8+、Chrome、Firefox等

插件基于jQuery开发，可即插即用于多数UI环境


## 怎么使用SelectMenu

在 [Github](https://github.com/TerryZ/SelectMenu) 或 [码云](https://gitee.com/TerryZ/SelectMenu) 上下载最新版本，解压后并放入需要使用的项目中

### 引用文件

```html
<!-- 基础环境引用说明 -->
<!-- jQuery功能库引用 -->
<script type="text/javascript" src="jquery.min.js" >< /script>
 
<!-- SelectMenu插件样式引用 -->
<link rel="stylesheet" href="selectmenu.css" type="text/css">
 
<!-- SelectMenu插件核心脚本 -->
<script type="text/javascript" src="selectmenu.js" >< /script>
```

### HTML代码

```html
<!-- 设置触发菜单打开对象，在此仅为最常用的按钮为例 -->
<button type="button" id="btnDemo">Select Menu</button>
```

### 脚本初始化插件

```js
//定义数据源
//数据格式：Array[{Object},{...}]
var data = [
    {id:1 ,name:'Chicago Bulls',desc:'芝加哥公牛'},
    {id:2 ,name:'Cleveland Cavaliers',desc:'克里夫兰骑士'},
    {id:3 ,name:'Detroit Pistons',desc:'底特律活塞'},
    {id:4 ,name:'Indiana Pacers',desc:'印第安纳步行者'}
];
//初始化插件
$('#btnDemo').selectMenu({
    showField : 'desc',
    keyField : 'id',
    data : data
});
```

