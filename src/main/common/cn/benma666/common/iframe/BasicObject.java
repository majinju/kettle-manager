/**
* Project Name:hl_2018
* Date:2018年5月29日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.iframe;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.beetl.sql.core.SQLManager;

import cn.benma666.db.Db;

/**
 * 基础对象 <br/>
 * date: 2018年5月29日 <br/>
 * @author jingma
 * @version 
 */
public class BasicObject {
    
    /**
    * 日志
    */
    public Log log = LogFactory.getLog(this.getClass());
    
    /**
    * 默认数据库db操作类
    */
    public static Db db;
    
    /**
    * 默认数据的sqlManager
    */
    public static SQLManager sqlManager;
}
