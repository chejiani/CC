package edu.jxau.cjn.config;


import edu.jxau.cjn.tag.UserDirect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

/**
 * app全局配置
 * @author jiani che
 * @version 1.0.0
 */
@Configuration
public class AppConfig {

    @Autowired
    freemarker.template.Configuration configuration;

    @PostConstruct
    public void setSharedVariable(){
        configuration.setSharedVariable("login", new UserDirect());
    }

}
