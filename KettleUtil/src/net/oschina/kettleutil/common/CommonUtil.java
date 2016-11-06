/**
* Project Name:KettleUtil
* Date:2016年6月21日
* Copyright (c) 2016, jingma All Rights Reserved.
*/

package net.oschina.kettleutil.common;

import net.oschina.kettleutil.db.Db;
import net.oschina.mytuils.KettleUtils;
import net.oschina.mytuils.constants.UtilConst;

import org.pentaho.di.core.database.DatabaseMeta;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.repository.ObjectId;
import org.pentaho.di.repository.Repository;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 一般工具类 <br/>
 * date: 2016年6月21日 <br/>
 * @author jingma
 * @version 
 */
public class CommonUtil {

    /**
    * metl中的数据库类型转换为kettle中的数据库类型 <br/>
    * @author jingma
    * @param metlDs
    * @return
    */
    public static String metlDsToKettleDs(String metlDs) {
        if(KuConst.DS_TYPE_ORACLE.equals(metlDs)){
            return "Oracle";
        }else if(KuConst.DS_TYPE_MYSQL.equals(metlDs)){
            return "mysql";
        }
        return null;
    }
    
    /**
    * 获取或创建指定代码的数据库 <br/>
    * 若不存在则自动根据metl系统配置在kettle中创建该数据库
    * @author jingma
    * @param dbCode 数据代码
    * @return 
    * @throws KettleException 
    */
    public static DatabaseMeta getOrCreateDB(String dbCode) throws KettleException {
        ObjectId dbId = null;
        Repository repository = KettleUtils.getInstanceRep();
        dbId = repository.getDatabaseID(dbCode);
        if(dbId!=null){
            return repository.loadDatabaseMeta(dbId, null);
        }else{
            JSONObject metlDb = Db.use(UtilConst.DATASOURCE_METL).
                    findFirst("select * from metl_database db where db.ocode=?", dbCode);
            DatabaseMeta dataMeta = new DatabaseMeta(dbCode, CommonUtil.metlDsToKettleDs(metlDb.getString("type")), 
                    "JNDI", null, dbCode, null, null, null);
            //保存转换时会进行该数据库的保存的
            //repository.saveDatabaseMetaStepAttribute(id_transformation, id_step, dbCode, dataMeta);
            return dataMeta;
        }
    }
    /**
    * 连接kettle资源库 <br/>
    * @author jingma
    * @param ds 数据源代码
    * @param dbStr 数据源对象
    * @throws Exception
    */
    public static void connectKettle(String ds, String dbStr) throws Exception {
        JSONObject db = JSON.parseObject(dbStr);
        KettleUtils.destroy();
        KettleUtils.createDBRepByJndi(ds, net.oschina.kettleutil.common.CommonUtil.metlDsToKettleDs(db.getString("type")), ds);
        JSONObject kettleUser = JSON.parseObject(db.getString(KuConst.FIELD_EXPAND )).getJSONObject("kettleUser");
        KettleUtils.connect(kettleUser.getString("username"),kettleUser.getString("password"));
    }
}
