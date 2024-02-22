package cn.benma666.sjsj;

import cn.benma666.dict.LjqType;
import cn.benma666.iframe.BasicObject;
import cn.benma666.iframe.MyParams;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.web.LjqInterface;
import cn.benma666.sjsj.web.LjqManager;
import org.springframework.stereotype.Component;

/**
 * 定制-默认拦截器
 */
@Component("DzDefaultLjq")
public class DzDefaultLjq extends BasicObject implements LjqInterface {
    public Result getSql(MyParams myParams){
        log.debug("获取sql：{},{}",myParams.sjdx().getDxdm(),myParams.sys().getCllx());
        myParams.sys().setLjqType(LjqType.kjmrljq);
        return success("获取sql成功",LjqManager.getSql(myParams));
    }
}
