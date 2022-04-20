package cn.benma666.sjsj.myutils;

import cn.benma666.constants.UtilConst;
import cn.benma666.exception.MyException;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjsj.web.IndexController;
import cn.benma666.sjsj.web.UserManager;
import cn.benma666.sjzt.Db;
import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.fastjson.support.spring.GenericFastJsonRedisSerializer;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.web.servlet.WebMvcAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import javax.sql.DataSource;

/**
 * Springboot自动配置
 */
@Configuration
@AutoConfigureAfter({DataSourceAutoConfiguration.class, WebMvcAutoConfiguration.class})
@Import({Msg.class,ApplicationInit.class, IndexController.class})
public class MyutilsAutoConfig {

    /**
     * 默认数据库类型
     */
    @Value("${spring.datasource.dbtype}")
    String dbType;
    /**
     * 数据源
     */
    DataSource dataSource;

    public MyutilsAutoConfig(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Bean
    public Db db() {
        if (dataSource == null) {
            throw new MyException("必须配置默认数据源");
        } else if (dataSource instanceof DruidDataSource) {
            return new Db(UtilConst.DEFAULT, (DruidDataSource) dataSource);
        } else if (StringUtil.isNotBlank(dbType)) {
            return new Db(UtilConst.DEFAULT, dataSource, dbType);
        } else {
            throw new MyException("非druid连接池时必须配置数据库类型：spring.datasource.dbtype");
        }
    }

    @Bean("redisTemplate")
    @SuppressWarnings("all")
    @ConditionalOnProperty("spring.redis.enabled")
    public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String, Object> redisTemplate = new RedisTemplate<String, Object>();
        StringRedisSerializer redisKeySerializer = new StringRedisSerializer();
        GenericFastJsonRedisSerializer redisValueSerializer = new GenericFastJsonRedisSerializer();
        redisTemplate.setConnectionFactory(factory);
        // 序列化 key 和 value
        redisTemplate.setKeySerializer(redisKeySerializer);
        redisTemplate.setValueSerializer(redisValueSerializer);
        redisTemplate.setHashKeySerializer(redisKeySerializer);
        redisTemplate.setHashValueSerializer(redisValueSerializer);
        new UserManager(redisTemplate);
        return redisTemplate;
    }
}
