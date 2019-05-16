/**
* Project Name:myservice
* Date:2019年5月15日
* Copyright (c) 2019, jingma All Rights Reserved.
*/

package cn.benma666.common.conf;

import io.swagger.annotations.Api;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
/**
 * Swagger配置 <br/>
 * date: 2019年5月15日 <br/>
 * @author jingma
 * @version 
 */
 @Configuration
 @EnableWebMvc
 @EnableSwagger2
// @ComponentScan(basePackages="cn.benma666.**.contorller")
public class SwaggerConfig {

    @Bean("myservice-api")
    public Docket myserviceApis() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .groupName("myservice-api")
                .select()
                // 选择那些路径和api会生成document
                .apis(RequestHandlerSelectors.withClassAnnotation(Api.class))
                // .apis(RequestHandlerSelectors.basePackage("cn.benma666.**.contorller"))
                // .apis(RequestHandlerSelectors.any()) // 对所有api进行监控
                .paths(PathSelectors.any())
                // 对所有路径进行监控
                // .paths(PathSelectors.regex("/myservice.*"))
                .build().enable(true);
    }


    private ApiInfo apiInfo() {
        return new ApiInfoBuilder().title("项目对外接口规范")
                .description("可以在此查看最新接口及进行接口调试")
                .termsOfServiceUrl("").license("License Version 2.0")
                .licenseUrl("").version("2.0").build();
    }

}
