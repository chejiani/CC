package com.ccut.ytzhuang;

import freemarker.template.Configuration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.freemarker.FreeMarkerViewResolver;

@SpringBootApplication
@EnableTransactionManagement
public class SpringBootstrap {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootstrap.class);
    }

}