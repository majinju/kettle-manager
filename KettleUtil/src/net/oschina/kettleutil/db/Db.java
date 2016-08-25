/**
* Project Name:KettleUtil
* Date:2016年6月21日下午2:55:40
* Copyright (c) 2016, jingma All Rights Reserved.
*/

package net.oschina.kettleutil.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import net.oschina.kettleutil.common.KuConst;
import net.oschina.mytuils.StringUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.pentaho.di.core.database.util.DatabaseUtil;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.job.entry.JobEntryBase;
import org.pentaho.di.trans.step.BaseStep;
import org.springframework.jdbc.core.JdbcTemplate;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 数据库操作类 <br/>
 * date: 2016年6月21日 <br/>
 * @author jingma
 * @version 
 */
public class Db {
    /**
    * 日志
    */
    private static Log log = LogFactory.getLog(Db.class);
    /**
    * 查询一般配置的sql语句
    */
    private static String FIND_GENERAL_CONFIG_SQL = 
            "select expand from metl_unify_dict d where d.ocode=? and d.dict_category=?";
    /**
    * spring数据库操作工具
    */
    private JdbcTemplate jdbcTemplate;
    /**
    * 获取数据库操作对象 <br/>
    * @author jingma
    * @param dbCode
    * @return
    */
    public static Db use(String dbCode) {
        try {
            DataSource dataSource = ( new DatabaseUtil() ).getNamedDataSource( dbCode );
            JdbcTemplate jt = new JdbcTemplate(dataSource);
            return new Db(jt);
        } catch (KettleException e) {
            log.error("获取数据库失败:"+dbCode, e);
        }
        return null;
    }
    /**
    * 获取数据库操作对象 <br/>
    * @author jingma
    * @param ku 
    * @param dbCode
    * @return
    */
    public static Db use(BaseStep ku, String dbCode) {
        try {
            DataSource dataSource = ( new DatabaseUtil() ).getNamedDataSource( dbCode );
            JdbcTemplate jt = new JdbcTemplate(dataSource);
            return new Db(jt);
        } catch (KettleException e) {
            if(ku!=null){
                ku.logError("获取数据库失败:"+dbCode, e);
            }else{
                log.error("获取数据库失败:"+dbCode, e);
            }
        }
        return null;
    }
    /**
    * 获取数据库操作对象 <br/>
    * @author jingma
    * @param jee 
    * @param dbCode
    * @return
    */
    public static Db use(JobEntryBase jee, String dbCode) {
        try {
            DataSource dataSource = ( new DatabaseUtil() ).getNamedDataSource( dbCode );
            JdbcTemplate jt = new JdbcTemplate(dataSource);
            return new Db(jt);
        } catch (KettleException e) {
            if(jee!=null){
                jee.logError("获取数据库失败:"+dbCode, e);
            }else{
                log.error("获取数据库失败:"+dbCode, e);
            }
        }
        return null;
    }
    
    public Db(JdbcTemplate jdbcTemplate) {
        super();
        this.jdbcTemplate = jdbcTemplate;
    }
    /**
    * 执行更新语句 <br/>
    * @author jingma
    * @param sql 要执行的预编译查询语句
    * @param prarms 参数
    * @return 影响行数
    */
    public int update(String sql,Object... params){
        return jdbcTemplate.update(sql, params);
    }
    /**
    * 获取对象列表  <br/>
    * @author jingma
    * @param sql 要执行的预编译查询语句
    * @param prarms 参数
    * @return
    */
    @SuppressWarnings("unchecked")
    public List<JSONObject> find(String sql,Object... prarms){
        return (List<JSONObject>) jdbcTemplate.query(sql, prarms, new ResultSetList());
    }
    /**
    * 获取第一个对象 <br/>
    * @author jingma
    * @param sql 要执行的预编译查询语句
    * @param prarms 参数
    * @return
    */
    @SuppressWarnings("unchecked")
    public JSONObject findFirst(String sql,Object... prarms){
        List<JSONObject> list = (List<JSONObject>) jdbcTemplate.query(sql, 
                prarms, new ResultSetList());
        if(list.size()>0){
            return list.get(0);
        }else{
            return new JSONObject();
        }
    }
    /**
    * 获取对象列表  <br/>
    * @author jingma
    * @param keyName key字段名称
    * @param sql 要执行的预编译查询语句
    * @param prarms 参数
    * @return
    */
    public Map<String,JSONObject> findMap(String keyName,String sql,Object... prarms){
        List<JSONObject> list = find(sql, prarms);
        Map<String,JSONObject> result = new HashMap<String, JSONObject>();
        for(JSONObject jo:list){
            result.put(jo.getString(keyName), jo);
        }
        return result;
    }
    /**
    * 查询一般配置 <br/>
    * @author jingma
    * @param sql 要执行的预编译查询语句
    * @param prarms 参数
    */
    public String queryStr(String sql,Object... prarms){
        JSONObject obj = findFirst(sql, prarms);
        if(obj.size()>0){
            return obj.values().toArray()[0].toString();
        }else{
            return null;
        }
    }
    /**
    * 查询一般配置 <br/>
    * @author jingma
    * @param configCode 配置代码
    * @return 具体配置的JSON对象
    */
    public JSONObject findGeneralConfig(String configCode){
        String expand = findFirst(FIND_GENERAL_CONFIG_SQL, configCode,
                KuConst.DICT_CATEGORY_GENERAL_CONFIG).
                getString(KuConst.FIELD_EXPAND);
        if(StringUtil.isNotBlank(expand)){
            return JSON.parseObject(expand);
        }else{
            return null;
        }
    }

    /**
    * 获取数据库当前时间-14位字符串 <br/>
    * @author jingma
    * @return
    */
    public String getCurrentDateStr14(){
        return findFirst("select to_char(sysdate,'yyyymmddhh24miss') as current_date from dual").
                getString("current_date");
    }
    /**
    * 执行修改语句 <br/>
    * @author jingma
    * @param sql
    */
    public void execute(String sql){
        jdbcTemplate.execute(sql);
    }
    /**
    * 获取数据库连接 <br/>
    * @author jingma
    * @return
    * @throws SQLException
    */
    public Connection getConn() throws SQLException{
        return jdbcTemplate.getDataSource().getConnection();
    }
    /**
    * 关闭数据库连接即相关预编译语句 <br/>
    * @author jingma
    * @param jee 
    * @param conn 数据库连接
    * @param preps 预编译语句
    */
    public static void closeConn(JobEntryBase jee,Connection conn,PreparedStatement... preps){
        for(PreparedStatement p:preps){
            if(p != null){
                try {
                    p.close();
                } catch (SQLException e) {
                    jee.logError("关闭预处理游标失败", e);
                }
            }
        }
        if(conn != null){
            try {
                conn.close();
            } catch (SQLException e) {
                if(jee!=null){
                    jee.logError("关闭数据库连接失败", e);
                }else{
                    log.error("关闭数据库连接失败", e);
                }
            }
        }
    }
    /**
     * @return jdbcTemplate 
     */
    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }
    /**
     * @param jdbcTemplate the jdbcTemplate to set
     */
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
