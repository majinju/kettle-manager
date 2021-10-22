package cn.benma666.sjsj;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"cn.benma666"})
public class SjsjApplication {

	public static void main(String[] args) {
		SpringApplication.run(SjsjApplication.class, args);
	}

}
