package com.ccut.ytzhuang;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class SpringBootstrap {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootstrap.class);
    }

}