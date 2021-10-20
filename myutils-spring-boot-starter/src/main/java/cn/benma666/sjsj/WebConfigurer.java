package cn.benma666.sjsj;

import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.boot.autoconfigure.web.servlet.WebMvcAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import java.util.List;
import java.util.Locale;

/**
 * 系统web配置
 */
@Configuration
@AutoConfigureBefore(WebMvcAutoConfiguration.class)
public class WebConfigurer implements WebMvcConfigurer {

    /**
     * 添加参数处理器
     */
    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
        resolvers.add(new MyParamsHandlerMethodArgumentResolver());
        resolvers.add(new MySjdxHandlerMethodArgumentResolver());
    }

    /**
     * 添加拦截器
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new MyHandlerInterceptor()).addPathPatterns("/**");
    }

    /**
     * 缺省本地化
     */
    @Bean(name = "localeResolver")
    public LocaleResolver getResolver() {
        SessionLocaleResolver slr = new SessionLocaleResolver();
        slr.setDefaultLocale(Locale.CHINA);
        return slr;
    }
}
