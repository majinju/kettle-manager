package com.oss.intercept;

import java.io.File;
import java.io.FileWriter;
import java.util.List;

import net.oschina.kettleutil.common.KuConst;
import cn.benma666.constants.UtilConst;
import cn.benma666.myutils.DruidCrypt;
import cn.benma666.myutils.FtpUtil;
import cn.benma666.myutils.StringUtil;

import com.alibaba.druid.util.JdbcUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.eova.aop.AopContext;
import com.eova.config.EovaConfig;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.CacheKit;
import com.oss.common.Dict;
import com.oss.model.MetlDatabase;

/**
* 数据库管理拦截器 <br/>
* date: 2016年11月16日 <br/>
* @author jingma
* @version 
*/
public class DatabaseIntercept extends MetlMOIntercept {
    /**
    * 日志
    */
    Log log = Log.getLog(getClass()); 
    /**
    * 配置
    */
    private EovaConfig eovaConfig = new EovaConfig();
	
	/**
	* 
	* @see com.eova.aop.MetaObjectIntercept#addBefore(com.eova.aop.AopContext)
	*/
	@Override
	public String addBefore(AopContext ac) throws Exception {
		Record db = ac.record;
        String isDisable = db.getStr("is_disable");
        if(UtilConst.WHETHER_FALSE.equals(isDisable)){
            //将新增数据源添加到系统中，实时生效
            String ds = db.getStr(KuConst.FIELD_OCODE);
            String url = db.getStr("url");
            String user = db.getStr("username");
            String pwd = db.getStr("password");
            try {
                DruidPlugin dp = eovaConfig.initDruidPlugin(url, user, pwd);
                ActiveRecordPlugin arp = eovaConfig.initActiveRecordPlugin(url, ds, dp);
                System.out.println("load "+ds+" source:" + url + "/" + user);
                dp.start();
                arp.start();
                //测试连接
                String validationQuery = db.getStr("validation_query");
                if(StringUtil.isBlank(validationQuery)){
                    String type = db.getStr("type");
                    String typeJson = Dict.dictObj(KuConst.DICT_CATEGORY_DATABASE_TYPE,
                            type).getString(KuConst.FIELD_EXPAND );
                    validationQuery = JSONObject.parseObject(typeJson).getString("validationQuery");
                    db.set("validation_query", validationQuery);
                }
                Db.use(ds).find(validationQuery);
                db.set("status", UtilConst.LINK_STATUS_SUCCESS);
                EovaConfig.dpMap.put(ds, dp);
                EovaConfig.arpMap.put(ds, arp);
                EovaConfig.plugins.add(dp).add(arp);
            } catch (Exception e) {
                EovaConfig.dataSources.remove(ds);
                DbKit.removeConfig(ds);
                db.set("status", UtilConst.LINK_STATUS_FAILED);
                log.error(db+"初始化失败", e);
                return "该数据源初始化失败："+e.getMessage();
            }
        }
		return super.addBefore(ac);
	}
	/**
	* 
	* @see com.eova.aop.MetaObjectIntercept#addSucceed(com.eova.aop.AopContext)
	*/
	@Override
	public String addSucceed(AopContext ac) throws Exception {
        updateKettleJndi();
	    return super.addSucceed(ac);
	}
    /**
	* 
	* @see com.eova.aop.MetaObjectIntercept#updateBefore(com.eova.aop.AopContext)
	*/
	@Override
	public String updateBefore(AopContext ac) throws Exception {
	    //需禁止在页面修改默认的三个数据源
	    Record db = ac.record;
        String ds = db.getStr(KuConst.FIELD_OCODE);
        String isDisable = db.getStr("is_disable");
        if(EovaConfig.props.get("config_db_codes").indexOf(ds)>-1){
            return ds+"数据源禁止修改";
        }
        //已经存在的数据源先删除
        removeDsConfig(ds);
        if(UtilConst.WHETHER_FALSE.equals(isDisable)){
            //将新增数据源添加到系统中，实时生效
            String url = db.getStr("url");
            String user = db.getStr("username");
            String pwd = db.getStr("password");
            try {
                DruidPlugin dp = eovaConfig.initDruidPlugin(url, user, pwd);
                ActiveRecordPlugin arp = eovaConfig.initActiveRecordPlugin(url, ds, dp);
                System.out.println("load "+ds+" source:" + url + "/" + user);
                dp.start();
                arp.start();
                //测试连接
                String validationQuery = db.getStr("validation_query");
                Db.use(ds).find(validationQuery);
                db.set("status", UtilConst.LINK_STATUS_SUCCESS);
                EovaConfig.dpMap.put(ds, dp);
                EovaConfig.arpMap.put(ds, arp);
                EovaConfig.plugins.add(dp).add(arp);
            } catch (Exception e) {
                EovaConfig.dataSources.remove(ds);
                DbKit.removeConfig(ds);
                db.set("status", UtilConst.LINK_STATUS_FAILED);
                log.error(db+"初始化失败", e);
            }
        }
		return super.updateBefore(ac);
	}
	/**
	* 
	* @see com.eova.aop.MetaObjectIntercept#updateSucceed(com.eova.aop.AopContext)
	*/
	@Override
	public String updateSucceed(AopContext ac) throws Exception {
        updateKettleJndi();
	    return super.updateSucceed(ac);
	}
	/**
	* 
	* @see com.eova.aop.MetaObjectIntercept#deleteBefore(com.eova.aop.AopContext)
	*/
	@Override
	public String deleteBefore(AopContext ac) throws Exception {
        //需禁止在页面修改默认的三个数据源
        Record db = ac.record;
        String ds = db.getStr(KuConst.FIELD_OCODE);
        if(EovaConfig.props.get("config_db_codes").indexOf(ds)>-1){
            return ds+"数据源禁止删除";
        }
	    return super.deleteBefore(ac);
	}
	/**
	* 
	* @see com.eova.aop.MetaObjectIntercept#deleteSucceed(com.eova.aop.AopContext)
	*/
	@Override
	public String deleteSucceed(AopContext ac) throws Exception {
        updateKettleJndi();
	    return super.deleteSucceed(ac);
	}
    /**
    * 已经存在的数据源先删除 <br/>
    * @author jingma
    * @param ds
    */
    public void removeDsConfig(String ds) {
        if(EovaConfig.dataSources.contains(ds)){
            EovaConfig.dpMap.get(ds).stop();
            EovaConfig.arpMap.get(ds).stop();
            EovaConfig.dataSources.remove(ds);
            DbKit.removeConfig(ds);
            EovaConfig.plugins.getPluginList().remove(EovaConfig.dpMap.get(ds));
            EovaConfig.plugins.getPluginList().remove(EovaConfig.arpMap.get(ds));
            EovaConfig.dpMap.remove(ds);
            EovaConfig.arpMap.remove(ds);
        }
    }
    /**
    * 更新kettle的jndi <br/>
    * 模板：<br/>
    * @author jingma
    * @throws Exception 
    */
    private void updateKettleJndi() throws Exception {
        //移除数据库字典缓存
        CacheKit.remove(UtilConst.CACHE_DICT, KuConst.DICT_CATEGORY_DATABASE+"_DOL");
        List<MetlDatabase> list = MetlDatabase.dao.queryNotDisable("status",
                UtilConst.LINK_STATUS_SUCCESS);
        JSONObject kettleDruid = Dict.dictObj(
                KuConst.DICT_CATEGORY_GENERAL_CONFIG, 
                "kettle_druid");
        JSONObject kd = JSON.parseObject(kettleDruid.getString(KuConst.FIELD_EXPAND ));
        //生成kettle的jndi文件内容
        String template = kd.getJSONObject("configTemplate").getString("value");
        StringBuffer content = new StringBuffer();
        for(MetlDatabase db:list){
            //自动修正为配置文件中的数据库信息
            if(EovaConfig.props.get("config_db_codes").indexOf(db.getStr("ocode"))>-1){
                db.set("url", EovaConfig.props.get(db.getStr("ocode")+"_url"));
                db.set("password", EovaConfig.props.get(db.getStr("ocode")+"_pwd"));
                db.set("username", EovaConfig.props.get(db.getStr("ocode")+"_user"));
            }
            String pwd = db.getStr("password");
            String[] encryptPwd = DruidCrypt.encrypt(pwd);
            String temp = template.replace("${name}", db.getStr(KuConst.FIELD_OCODE));
            temp = temp.replace("${url}", db.getStr("url"));
            temp = temp.replace("${user}", db.getStr("username"));
            temp = temp.replace("${pwd}", pwd);
            temp = temp.replace("${driver}", JdbcUtils.getDriverClassName(db.getStr("url")));
            temp = temp.replace("${decryptPwd}", encryptPwd[0]);
            temp = temp.replace("${decryptKey}", encryptPwd[1]);
            content.append(temp);
        }
        //分发到配置的路径
        JSONArray cpList = kd.getJSONArray("configPath");
        for(int i=0;i<cpList.size();i++){
            JSONObject cp = cpList.getJSONObject(i);
            String path = cp.getString("path");
            if(cp.containsKey("ftp")){
                String ftpCode = cp.getString("ftp");
                FtpUtil ftp = FtpUtil.use(ftpCode);
                int index = path.lastIndexOf(FtpUtil.FILE_SEPARATOR);
                ftp.uploadFile(path.substring(0, index), path.substring(index+1), 
                        content.toString());
            }else{
                File file = new File(path);
                if(!file.getParentFile().exists()){
                    file.getParentFile().mkdirs(); 
                }
                if(!file.exists()){
                    file.createNewFile();
                }
                FileWriter fr = new FileWriter(file);
                fr.write(content.toString());
                fr.close();
            }
        }
    }
	
}
