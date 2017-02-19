/**
* Project Name:metl
* Date:2016年6月12日
* Copyright (c) 2016, jingma All Rights Reserved.
*/

package net.oschina.mytuils;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import net.oschina.mytuils.constants.UtilConst;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.util.JdbcUtils;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 字典管理 <br/>
 * date: 2016年6月12日 <br/>
 * @author jingma
 * @version 
 */
public class Dict {

    /**
    * 根据字典类别得到该类别字典的查询SQL <br/>
    * @author jingma
    * @param dictCategory 字典类别
    * @return 该类别字典的查询SQL
    */
    public static String dictCategoryToSql(String dictCategory) {
        String result = CacheKit.get(UtilConst.CACHE_DICT, dictCategory+"_SQL");
        if(result != null){
            return result;
        }
        String defaultVal = "select ocode ID,oname CN from metl_unify_dict where dict_category='"
                +dictCategory+"' and is_disable='"+UtilConst.WHETHER_FALSE
                +"' order by oorder,ocode asc;ds=metl";
        result = dictCategory;
        //如果不是select开头的，则判断为使用同一字典方式。
        if(StringUtil.isNotBlank(dictCategory)&&!dictCategory.toLowerCase().startsWith("select")){
            String expand = Db.use(UtilConst.DATASOURCE_METL).queryStr(
                    "select expand from metl_unify_dict t "
                    + "where t.dict_category='DICT_CATEGORY' and is_disable=? and t.ocode=?", 
                    UtilConst.WHETHER_FALSE, dictCategory);
                try {
                    result = JSONObject.parseObject(expand).getString("sql");
                    if(StringUtil.isBlank(result)){
                        result = defaultVal;
                    }
                } catch (Exception e) {
                    //解析中报错时，采用默认查询语句
                    result = defaultVal;
                }
        }
        CacheKit.put(UtilConst.CACHE_DICT, dictCategory+"_SQL",result);
        return result;
    }

    /**
    * 获取字典列表 <br/>
    * @author jingma
    * @param dictCategory 字典类别
    * @return 字典列表
    */
    public static List<Record> dictList(String dictCategory){
        List<Record> result = CacheKit.get(UtilConst.CACHE_DICT, dictCategory+"_DL");
        if(result != null){
            return result;
        }
        String expStr = dictCategoryToSql(dictCategory);
        String[] exps = parseDictExp(expStr);
        result = Db.use(exps[1]).find(exps[0]);
        CacheKit.put(UtilConst.CACHE_DICT, dictCategory+"_DL",result);
        return result;
    }
    /**
    * 获取字典值 <br/>
    * @author jingma
    * @param dictCategory 字典类别
    * @param key 键
    * @return 值
    */
    public static String dictValue(String dictCategory,String key){
        String result = CacheKit.get(UtilConst.CACHE_DICT, dictCategory+"_VALUE_"+key);
        if(result != null){
            return result;
        }
        String expStr = dictCategoryToSql(dictCategory);
        String[] exps = parseDictExp(expStr);
        String sql = "select cn from ("+exps[0]+") t where t.id=?";
        result = Db.use(exps[1]).queryStr(sql, key);
        if(StringUtil.isBlank(result)){
            result = key;
        }
        CacheKit.put(UtilConst.CACHE_DICT, dictCategory+"_VALUE_"+key,result);
        return result;
    }
    /**
    * 获取字典对象列表 <br/>
    * @author jingma
    * @param dictCategory 字典类别
    * @return 对象列表
    */
    public static List<Record> dictObjList(String dictCategory){
        List<Record> result = CacheKit.get(UtilConst.CACHE_DICT, dictCategory+"_DOL");
        if(result != null){
            return result;
        }
        result = Db.use(UtilConst.DATASOURCE_METL).find(
                "select * from metl_unify_dict where dict_category=? and is_disable=? order by oorder asc",
                dictCategory,UtilConst.WHETHER_FALSE);
        CacheKit.put(UtilConst.CACHE_DICT, dictCategory+"_DOL",result);
        return result;
    }
    /**
    * 获取字典对象 <br/>
    * @author jingma
    * @param dictCategory 字典类别
    * @param key 键
    * @return 对象
    */
    public static Record dictObj(String dictCategory,String key){
        Record result = CacheKit.get(UtilConst.CACHE_DICT, dictCategory+"_OBJ_"+key);
        if(result != null){
            return result;
        }
        result = Db.use(UtilConst.DATASOURCE_METL).findFirst(
                "select * from metl_unify_dict where dict_category=? and is_disable=? and ocode=?",
                dictCategory,UtilConst.WHETHER_FALSE,key);
        CacheKit.put(UtilConst.CACHE_DICT, dictCategory+"_OBJ_"+key,result);
        return result;
    }
    /**
    * 解析字典sql字符串 <br/>
    * 若没有指定数据库则默认使用metl库
    * @author jingma
    * @param exp
    * @return 0:sql,1:ds
    */
    public static String[] parseDictExp(String exp){
        if(StringUtil.isBlank(exp)){
            return null;
        }
        String[] result = new String[2];
        String[] strs = exp.split(";");
        result[0] = strs[0];
        if(strs.length>1){
            result[1] = strs[1].substring(3);
        }else{
            result[1] = UtilConst.DATASOURCE_METL;
        }
        return result;
    }

    /**
    * 获取字符串简拼 <br/>
    * @author jingma
    * @param source 来源字符串
    * @return 来源字符串的简拼
    */
    public static String getSimpleSpell(String source){
        if(StringUtil.isBlank(source)){
            return null;
        }
        String dbType = getDbtypeByDatasource(
                DbKit.getConfig(UtilConst.DATASOURCE_METL).getDataSource());
        String result = "";
        for(int i=0;i<source.length();i++){
            String zi= source.substring(i, i+1);
            Record r = null;
            if(JdbcUtils.ORACLE.equals(dbType)){
                r = Db.use(UtilConst.DATASOURCE_METL).findFirst("SELECT t.simple_spell FROM metl_chinese_spell t WHERE t.oname = ? and t.is_disable='0' and rownum<2",zi);
            }else {
                r = Db.use(UtilConst.DATASOURCE_METL).findFirst("SELECT t.simple_spell FROM metl_chinese_spell t WHERE t.oname = ? and t.is_disable='0' limit 1",zi);
            }
            result += r==null?zi:r.getStr("simple_spell");
        }
        return result;
    }
    /**
    * 根据数据源获取数据库类型 <br/>
    * @author jingma
    * @param dataSource
    * @return
    */
    public static String getDbtypeByDatasource(DataSource dataSource) {
        String dbType = null;
        if(dataSource instanceof DruidDataSource){
            dbType = ((DruidDataSource)dataSource).getDbType();
        }
        return dbType;
    }

    /**
    * 获取字符串全拼 <br/>
    * @author jingma
    * @param source 来源字符串
    * @return 来源字符串的全拼
    */
    public static String getFullSpell(String source){
        if(StringUtil.isBlank(source)){
            return null;
        }
        String dbType = getDbtypeByDatasource(
                DbKit.getConfig(UtilConst.DATASOURCE_METL).getDataSource());
        String result = "";
        for(int i=0;i<source.length();i++){
            String zi= source.substring(i, i+1);
            Record r = null;
            if(JdbcUtils.ORACLE.equals(dbType)){
                r = Db.use(UtilConst.DATASOURCE_METL).findFirst("SELECT t.full_spell FROM metl_chinese_spell t WHERE t.oname = ? and t.is_disable='0' and rownum<2",zi);
            }else {
                r = Db.use(UtilConst.DATASOURCE_METL).findFirst("SELECT t.full_spell FROM metl_chinese_spell t WHERE t.oname = ? and t.is_disable='0' limit 1",zi);
            }
            result += r==null?zi:r.getStr("full_spell");
        }
        return result;
    }

    /**
    * 获取数据库当前时间： yyyymmddhh24miss<br/>
    * @author jingma
    * @return
    */
    public static String getDbCurrentDateLL(){
        Record r = null;
        String dbType = getDbtypeByDatasource(
                DbKit.getConfig(UtilConst.DATASOURCE_METL).getDataSource());
        if(JdbcUtils.ORACLE.equals(dbType)){
            r = Db.use(UtilConst.DATASOURCE_METL).findFirst("select to_char(sysdate,'yyyymmddhh24miss') as curr_date from dual");
        }else if(JdbcUtils.MYSQL.equals(dbType)){
            r = Db.use(UtilConst.DATASOURCE_METL).findFirst("SELECT DATE_FORMAT(NOW(),'%Y%m%d%H%i%S') as curr_date");
        }else{
            DateUtil.getDateTimeStr(DateUtil.DATE_FORMATTER14);
        }
        return r.getStr("curr_date");
    }

    /**
    * 将记录列表转换为以指定字段做key的Map <br/>
    * @author jingma
    * @param list 记录列表
    * @param field 要作为key字段名称
    */
    public static <T extends Model<?>> Map<String,T> ListToMap(List<T> list, String field) {
        Map<String,T> map = new java.util.HashMap<String, T>();
        for(T record:list){
            map.put(record.getStr(field), record);
        }
        return map;
    }
}
