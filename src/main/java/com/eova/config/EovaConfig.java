/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 * <p/>
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.config;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.oschina.kettleutil.common.KuConst;

import org.beetl.core.GroupTemplate;
import org.beetl.ext.jfinal.BeetlRenderFactory;
import org.beetl.sql.core.db.Db;

import cn.benma666.constants.UtilConst;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.util.JdbcUtils;
import com.alibaba.fastjson.JSONObject;
import com.eova.common.plugin.quartz.QuartzPlugin;
import com.eova.common.utils.xx;
import com.eova.core.IndexController;
import com.eova.core.auth.AuthController;
import com.eova.core.button.ButtonController;
import com.eova.core.menu.MenuController;
import com.eova.core.meta.MetaController;
import com.eova.core.task.TaskController;
import com.eova.interceptor.LoginInterceptor;
import com.eova.model.Button;
import com.eova.model.EovaLog;
import com.eova.model.Menu;
import com.eova.model.MenuObject;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;
import com.eova.model.Role;
import com.eova.model.RoleBtn;
import com.eova.model.Task;
import com.eova.model.User;
import com.eova.model.Widget;
import com.eova.service.ServiceManager;
import com.eova.template.common.config.TemplateConfig;
import com.eova.template.masterslave.MasterSlaveController;
import com.eova.template.single.SingleController;
import com.eova.template.singletree.SingleTreeController;
import com.eova.template.treetogrid.TreeToGridController;
import com.eova.widget.WidgetController;
import com.eova.widget.form.FormController;
import com.eova.widget.grid.GridController;
import com.eova.widget.tree.TreeController;
import com.eova.widget.treegrid.TreeGridController;
import com.eova.widget.upload.UploadController;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.log.Log;
import com.jfinal.plugin.IPlugin;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.activerecord.IDataSourceProvider;
import com.jfinal.plugin.activerecord.dialect.AnsiSqlDialect;
import com.jfinal.plugin.activerecord.dialect.Dialect;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;
import com.jfinal.plugin.activerecord.dialect.OracleDialect;
import com.jfinal.plugin.activerecord.dialect.PostgreSqlDialect;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.druid.DruidStatViewHandler;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.mysql.jdbc.Connection;
import com.oss.controller.CommonController;
import com.oss.controller.TimingController;
import com.oss.model.MetlDatabase;
import com.oss.model.MetlTaskTiming;
import com.oss.model.MetlUnifyDict;

public class EovaConfig extends JFinalConfig {

	/** Eova配置属性 **/
	public static Map<String, String> props = new HashMap<String, String>();
	/** EOVA所在数据库的类型 **/
	public static String EOVA_DBTYPE = "mysql";
	/** 数据源列表 **/
	public static List<String> dataSources = new ArrayList<String>();
	
	private long startTime = 0;
    /**
    * 日志
    */
    protected Log log = Log.getLog(getClass()); 
    /**
    * jfinal插件引用
    */
    public static Plugins plugins = null;
    /**
    * 可配置的数据源
    */
    public static Map<String,IPlugin> dpMap = new HashMap<String, IPlugin>();
    /**
    * 可配置的数据库操作插件
    */
    public static Map<String,ActiveRecordPlugin> arpMap = new HashMap<String, ActiveRecordPlugin>();

	/**
	 * 系统启动之后
	 */
	@Override
	public void afterJFinalStart() {
		System.err.println("JFinal Started\n");
		// Load Cost Time
		costTime(startTime);

		{
			Boolean isInit = xx.toBoolean(props.get("initPlugins"), true);
			if (isInit) {
				EovaInit.initPlugins();
			}
		}
		{
			Boolean isInit = xx.toBoolean(props.get("initSql"), false);
			if (isInit && EOVA_DBTYPE.equals(JdbcUtils.MYSQL)) {
				EovaInit.initCreateSql();
			}
		}
	}

	/**
	 * 系统停止之前
	 */
	@Override
	public void beforeJFinalStop() {
	}

	/**
	 * 配置常量
	 */
	@Override
	public void configConstant(Constants me) {
		startTime = System.currentTimeMillis();

		System.err.println("Config Constants Starting...");
		// 初始化配置
		EovaInit.initConfig();
		// 开发模式
		me.setDevMode(xx.toBoolean(props.get("devMode"), true));
		// 设置主视图为Beetl
		me.setMainRenderFactory(new BeetlRenderFactory());
		// POST内容最大500M(安装包上传)
		me.setMaxPostSize(1024 * 1024 * 500);
		me.setError500View("/eova/500.html");
		me.setError404View("/eova/404.html");
		
		// 设置静态根目录为上传根目录
		me.setBaseUploadPath(props.get("static_root"));

		@SuppressWarnings("unused")
		GroupTemplate group = BeetlRenderFactory.groupTemplate;

		// 设置全局变量
		final String STATIC = props.get("domain_static");
		final String CDN = props.get("domain_cdn");
		final String IMG = props.get("domain_img");
		final String FILE = props.get("domain_file");
		
		Map<String, Object> sharedVars = new HashMap<String, Object>();
		if (!xx.isEmpty(STATIC))
			sharedVars.put("STATIC", STATIC);
		else
			sharedVars.put("STATIC", "");
		if (!xx.isEmpty(CDN))
			sharedVars.put("CDN", CDN);
		if (!xx.isEmpty(IMG))
			sharedVars.put("IMG", IMG);
		if (!xx.isEmpty(FILE))
			sharedVars.put("FILE", FILE);
		
		// Load Template Const
		 PageConst.init(sharedVars);

		BeetlRenderFactory.groupTemplate.setSharedVars(sharedVars);
		//设置下载路径为上传路径
        me.setBaseDownloadPath(me.getBaseUploadPath());
	}

	/**
	 * 配置路由
	 */
	@Override
	public void configRoute(Routes me) {
		System.err.println("Config Routes Starting...");
		me.add("/", IndexController.class);
		// 业务模版
		me.add(TemplateConfig.SINGLE_GRID, SingleController.class);
		me.add(TemplateConfig.SINGLE_TREE, SingleTreeController.class);
		me.add(TemplateConfig.MASTER_SLAVE_GRID, MasterSlaveController.class);
		me.add(TemplateConfig.TREE_GRID, TreeToGridController.class);
		// 组件
		me.add("/widget", WidgetController.class);
		me.add("/upload", UploadController.class);
		me.add("/form", FormController.class);
		me.add("/grid", GridController.class);
		me.add("/tree", TreeController.class);
		me.add("/treegrid", TreeGridController.class);
		// Eova业务
		me.add("/meta", MetaController.class);
		me.add("/menu", MenuController.class);
		me.add("/button", ButtonController.class);
		me.add("/auth", AuthController.class);
		me.add("/task", TaskController.class);
		
        //jingma新增
        me.add("/common", CommonController.class);
        me.add("/timing", TimingController.class);
        
        // 不需要登录拦截的URL
        LoginInterceptor.excludes.add("/init");

		route(me);

	}

	/**
	 * 配置插件
	 */
	@Override
	public void configPlugin(Plugins plugins) {
        EovaConfig.plugins = plugins;
        String ds = null;
        String url = null;
        String user = null;
        String pwd = null;
        DruidPlugin dp = null;
        ActiveRecordPlugin arp = null;
        String dbCodes = (String)props.get("config_db_codes");
        for(String code:dbCodes.split(",")){
            startDs(code);
        }
        List<JSONObject> dbs = Db.use(UtilConst.DATASOURCE_METL).find("select * from metl_database t "
                + "where t.is_disable=? and t.status=?",
                UtilConst.WHETHER_FALSE,
                UtilConst.LINK_STATUS_SUCCESS);
        for(JSONObject db:dbs){
            ds = db.getString(KuConst.FIELD_OCODE);
            if(dataSources.contains(ds)){
                continue;
            }
            url = db.getString("url");
            user = db.getString("username");
            pwd = db.getString("password");
            dp = initDruidPlugin(url, user, pwd);
            arp = initActiveRecordPlugin(url, ds, dp);
            disposeDs(ds, url, arp, db);
            if(EovaConfig.props.get("config_db_codes").indexOf(ds)==-1){
                dpMap.put(ds, dp);
                arpMap.put(ds, arp);
            }
            log.info("load "+ds+" source:" + url + "/" + user);
            plugins.add(dp).add(arp);
        }
        
        //  自定义插件
        plugin(plugins);
        
        // 初始化ServiceManager
        ServiceManager.init();

        // 配置EhCachePlugin插件
        plugins.add(new EhCachePlugin());

        // 配置Quartz
        QuartzPlugin quartz = new QuartzPlugin();
        plugins.add(quartz);
	}
	
	/**
	* 读取配置信息，启动指定数据源 <br/>
	* @author jingma
	* @param ds 数据源代码
	*/
	private void startDs(String ds){
        String url = null;
        String user = null;
        String pwd = null;
        DruidPlugin dp = null;
        ActiveRecordPlugin arp = null;
        //metl数据源
        url = (String)props.get(ds+"_url");
        user = (String)props.get(ds+"_user");
        pwd = (String)props.get(ds+"_pwd");
        dp = initDruidPlugin(url, user, pwd);
        arp = initActiveRecordPlugin(url, ds, dp);
        disposeDs(ds, url, arp, null);
        log.info("load "+ds+" source:" + url + "/" + user);
        plugins.add(dp).add(arp);
        dp.start();
        arp.start();
        DruidDataSource dds = (DruidDataSource) dp.getDataSource();
        try {
            dds.init();
            new Db(ds,dds);
        } catch (SQLException e) {
            log.error(ds+"数据源初始化失败", e);
        }
	}

    /**
    * 处理每一个数据源 <br/>
    * @author jingma
    * @param ds 数据源代码
    * @param url 连接
    * @param arp 记录插件
    * @param db 数据源信息
    */
    public void disposeDs(String ds, String url, ActiveRecordPlugin arp,
            JSONObject db) {
        if(xx.DS_EOVA.equals(ds)){
            mappingEova(arp);
            try {
                // Eova的数据库类型
                EOVA_DBTYPE = JdbcUtils.getDbType(url, JdbcUtils.getDriverClassName(url));
            } catch (SQLException e) {
                log.error("获取Eova的数据库类型失败", e);
            }
        }else if(UtilConst.DATASOURCE_METL.equals(ds)){
            //metl相关Model
            mappingMetl(arp);
        }
    }

    /**
    * metl相关Model <br/>
    * @author jingma
    * @param arp
    */
    public void mappingMetl(ActiveRecordPlugin arp) {
        arp.addMapping("metl_unify_dict",KuConst.FIELD_OID, MetlUnifyDict.class);
        arp.addMapping("metl_database",KuConst.FIELD_OID, MetlDatabase.class);
        arp.addMapping("metl_task_timing",KuConst.FIELD_OID, MetlTaskTiming.class);
    }

	/**
	 * 配置全局拦截器
	 */
	@Override
	public void configInterceptor(Interceptors me) {
		System.err.println("Config Interceptors Starting...");
		// JFinal.me().getServletContext().setAttribute("KING", "我笑了");
		// 登录验证
		me.add(new LoginInterceptor());
		// 权限验证拦截(暂时屏蔽权限拦截，待后续完善)
		// me.add(new AuthInterceptor());
	}

	/**
	 * 配置处理器
	 */
	@Override
	public void configHandler(Handlers me) {
		System.err.println("Config Handlers Starting...");
		// 添加DruidHandler
		DruidStatViewHandler dvh = new DruidStatViewHandler("/druid");
		me.add(dvh);
	}

	/**
	 * Eova Data Source Model Mapping
	 * 
	 * @param arp
	 */
	protected void mappingEova(ActiveRecordPlugin arp) {
		arp.addMapping("eova_object", MetaObject.class);
		arp.addMapping("eova_field", MetaField.class);
		arp.addMapping("eova_button", Button.class);
		arp.addMapping("eova_menu", Menu.class);
		arp.addMapping("eova_menu_object", MenuObject.class);
		arp.addMapping("eova_user", User.class);
		arp.addMapping("eova_role", Role.class);
		arp.addMapping("eova_role_btn", RoleBtn.class);
		arp.addMapping("eova_log", EovaLog.class);
		arp.addMapping("eova_task", Task.class);
		arp.addMapping("eova_widget", Widget.class);
	}

	/**
	 * Custom Route
	 * 
	 * @param me
	 */
	protected void route(Routes me) {
	}
	
	/**
	 * Custom Plugin
	 * @param plugins
	 * @return
	 */
	protected void plugin(Plugins plugins) {
	}

	/**
	 * init Druid
	 * 
	 * @param url JDBC
	 * @param username 数据库用户
	 * @param password 数据库密码
	 * @return
	 */
	public DruidPlugin initDruidPlugin(String url, String username, String password) {
		// 设置方言
//		WallFilter wall = new WallFilter();
//		String dbType = null;
//		try {
//			dbType = JdbcUtils.getDbType(url, JdbcUtils.getDriverClassName(url));
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//		wall.setDbType(dbType);

		DruidPlugin dp = new DruidPlugin(url, username, password);
		dp.addFilter(new StatFilter());
//		dp.addFilter(wall);
		return dp;

	}

	/**
	 * init ActiveRecord
	 * 
	 * @param url JDBC
	 * @param ds DataSource
	 * @param dp Druid
	 * @return
	 */
	public ActiveRecordPlugin initActiveRecordPlugin(String url, String ds, IDataSourceProvider dp) {
		ActiveRecordPlugin arp = new ActiveRecordPlugin(ds, dp);
		// 提升事务级别保证事务回滚
		int lv = xx.toInt(props.get("transaction_level"), Connection.TRANSACTION_REPEATABLE_READ);
		arp.setTransactionLevel(lv);

		String dbType;
		try {
			dbType = JdbcUtils.getDbType(url, JdbcUtils.getDriverClassName(url));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		// 统一全部默认小写
		arp.setContainerFactory(new CaseInsensitiveContainerFactory(true));

		Dialect dialect;
		if (JdbcUtils.MYSQL.equalsIgnoreCase(dbType) || JdbcUtils.H2.equalsIgnoreCase(dbType)) {
			dialect = new MysqlDialect();
		} else if (JdbcUtils.ORACLE.equalsIgnoreCase(dbType)) {
			dialect = new OracleDialect();
			((DruidPlugin) dp).setValidationQuery("select 1 FROM DUAL");
		} else if (JdbcUtils.POSTGRESQL.equalsIgnoreCase(dbType)) {
			dialect = new PostgreSqlDialect();
		} else {
			// 默认使用标准SQL方言
			dialect = new AnsiSqlDialect();
		}
		arp.setDialect(dialect);

		// 是否显示SQL
		Boolean isShow = xx.toBoolean(props.get("showSql"), false);
		if (isShow != null) {
			arp.setShowSql(isShow);
		}

		// 记录数据源
		dataSources.add(ds);

		return arp;
	}

	private void costTime(long time) {
		System.err.println("Load Cost Time:" + (System.currentTimeMillis() - time) + "ms\n");
	}

}