/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.sjsj.ljq.sjgl;

import cn.benma666.exception.MyException;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.web.DefaultLjq;
import com.alibaba.fastjson.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLException;

/**
 * 数据字段拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
@Component("SYS_SJGL_SJZD")
@Scope("prototype")
public class SjzdLjq extends DefaultLjq {
    @Override
    public Result insert(JSONObject myParams) throws MyException {
        Result r = super.insert(myParams);
        //保存结束清理缓存
        fieldsCache.clear();
        return r;
    }

    @Override
    public Result update(JSONObject myParams) throws MyException {
        Result r = super.update(myParams);
        //保存结束清理缓存
        fieldsCache.clear();
        return r;
    }

    @Override
    @Transactional
    public Result plbc(JSONObject myParams) throws SQLException {
        Result r = super.plbc(myParams);
        //保存结束清理缓存
        fieldsCache.clear();
        return r;
    }

}
