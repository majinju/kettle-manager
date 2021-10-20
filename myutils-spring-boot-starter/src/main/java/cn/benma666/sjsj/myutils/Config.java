package cn.benma666.sjsj.myutils;

import cn.benma666.iframe.Conf;
import cn.benma666.iframe.ConfAbstract;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.env.EnvironmentPostProcessor;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.Environment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.stereotype.Component;

@Component
public class Config extends ConfAbstract<Environment> implements EnvironmentPostProcessor {

    public Config() {
        super();
    }

    @Override
    public void postProcessEnvironment(ConfigurableEnvironment environment, SpringApplication application) {
        this.config=environment;
        Conf.setConfig(this);
//        MutablePropertySources propertySources = environment.getPropertySources();
//        propertySources.addLast(new MyPropertySource("sjsj", new Conf()));
    }

    /**
     * 获取变量
     *
     * @param key
     * @return
     */
    public String getVal(String key) {
        return config.getProperty(key);
    }
}
