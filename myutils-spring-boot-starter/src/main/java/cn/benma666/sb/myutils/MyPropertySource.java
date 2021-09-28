package cn.benma666.sb.myutils;

import cn.benma666.iframe.Conf;
import com.alibaba.fastjson.JSONObject;
import org.springframework.core.env.PropertySource;

/**
 * 我的配置源
 */
public class MyPropertySource extends PropertySource<Conf> {
    public MyPropertySource(String name, Conf source) {
        super(name, source);
    }

    public MyPropertySource(String name) {
        super(name);
    }

    @Override
    public Object getProperty(String name) {
        return Conf.getValByDict(name);
    }
}
