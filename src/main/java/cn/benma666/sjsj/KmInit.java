package cn.benma666.sjsj;

import cn.benma666.iframe.BasicObject;
import cn.benma666.kettle.mytuils.KettleManager;
import cn.benma666.sjsj.myutils.ThreadPool;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.stereotype.Component;

/**
 * 应用初始化-km启动
 */
@Component
@ConditionalOnProperty("benma666.km.app-init-start")
public class KmInit extends BasicObject implements ApplicationRunner {
    @Override
    public void run(ApplicationArguments args) {
        //智能交换-应用初始化启动
        ThreadPool.use().run(KettleManager::init);
    }
}
