package cn.benma666.sjsj;

import cn.benma666.iframe.BasicObject;
import cn.benma666.iframe.Conf;
import cn.benma666.kettle.job.JobManager;
import cn.benma666.sjsj.myutils.ThreadPool;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

/**
 * 应用初始化-km启动
 */
@Component
@ConditionalOnProperty("benma666.km.appInitStart")
public class KmInit extends BasicObject implements ApplicationRunner {
    @Override
    public void run(ApplicationArguments args) {
        //进行系统属性设置
        for (String p:Conf.getVal("web.init.property").split(",")){
            System.setProperty(p,Conf.getVal(p));
        }
        //智能交换-应用初始化启动
        ThreadPool.use().run(JobManager::init);
    }
}
