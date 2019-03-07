package com.nousinfo.visitortracker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@SpringBootApplication
@ComponentScan({"com.nousinfo"})
@EnableJpaRepositories("com.nousinfo.dao")
@EntityScan("com.nousinfo.bean")
@EnableAutoConfiguration
public class VisitortrackerApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(VisitortrackerApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(VisitortrackerApplication.class, args);
		//AbstractApplicationContext  context = new AnnotationConfigApplicationContext(ScheduledBean.class);
	}
}
