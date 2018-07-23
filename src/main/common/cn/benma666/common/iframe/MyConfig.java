/**
* Project Name:hl_2018
* Date:2018年5月25日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.iframe;

import java.util.Map;
import java.util.Map.Entry;

import javax.sql.DataSource;

import cn.benma666.db.Db;

import com.alibaba.druid.util.JdbcConstants;

/**
 * 配置 <br/>
 * date: 2018年5月25日 <br/>
 * @author jingma
 * @version 
 */
public class MyConfig {

    /**
     * Creates a new instance of MyConfig.
     */
    public MyConfig(Map<String,DataSource> dbMap) {
        for(Entry<String, DataSource> e:dbMap.entrySet()){
            DataSource d = e.getValue();
            new Db(e.getKey(), d ,JdbcConstants.ORACLE);
        }
        
        BasicObject.db = Db.use();
        BasicObject.sqlManager = Db.use().getSqlManager();
    }

    public void init(){
        
    }
}
