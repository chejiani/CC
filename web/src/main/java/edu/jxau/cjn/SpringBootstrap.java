package edu.jxau.cjn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class SpringBootstrap {

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(SpringBootstrap.class);
        app.run(args);
    }


}