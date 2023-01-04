package cn.benma666.sjsj;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
//多个包则采用逗号分割，第一个必须保留，eg："cn.benma666", "com.xxxx.xxx"
@ComponentScan({"cn.benma666"})
public class SjsjApplication {

	public static void main(String[] args) {
		SpringApplication.run(SjsjApplication.class, args);
	}

}
