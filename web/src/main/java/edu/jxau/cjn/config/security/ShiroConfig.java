package edu.jxau.cjn.config.security;

import edu.jxau.cjn.service.user.UserService;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.authc.AnonymousFilter;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.servlet.Filter;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * shiro配置，配置了shiro的主要过滤信息和安全策略
 * @author jiani che
 * @version 1.0.0
 */
@Configuration
public class ShiroConfig {

    /**
     * 设置过滤器
     * @param securityManager
     * @return
     */
    @Bean
    @ConditionalOnClass(ShiroFilterFactoryBean.class)
    public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager){
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        shiroFilterFactoryBean.setLoginUrl("/user/login");
        shiroFilterFactoryBean.setSuccessUrl("/index");
        shiroFilterFactoryBean.setUnauthorizedUrl("/403");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinition());
        return shiroFilterFactoryBean;
    }

    /**
     * 设置安全策略，基于url
     * @return
     */
    private Map<String, String> filterChainDefinition(){
        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
        filterChainDefinitionMap.put("/static/**", "anon");
        filterChainDefinitionMap.put("/user/login", "authc");
        filterChainDefinitionMap.put("/favicon.ico", "anon");
        filterChainDefinitionMap.put("/manager/**", "roles[admin]");
        filterChainDefinitionMap.put("*/manager/**", "roles[admin]");
        filterChainDefinitionMap.put("/bid/**", "roles[user]");
        filterChainDefinitionMap.put("/order/**", "roles[user]");
        filterChainDefinitionMap.put("user/logout", "logout");
        return filterChainDefinitionMap;
    }

    /**
     *
     * 设置认证器
     * @param credentialsMatcher
     * @param userService
     * @return
     */
    @Bean
    @Primary
    public Realm realm(CredentialsMatcher credentialsMatcher, UserService userService){
        CustomRealm realm = new CustomRealm();
        realm.setUserService(userService);
        realm.setCredentialsMatcher(credentialsMatcher);
        return realm;
    }

    /**
     * 设置认证匹配
     * @return
     */
    @Bean
    public HashedCredentialsMatcher hashedCredentialsMatcher() {
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        hashedCredentialsMatcher.setHashAlgorithmName("SHA-1");
        hashedCredentialsMatcher.setHashIterations(0);
        return hashedCredentialsMatcher;
    }

    @Bean
    public DefaultWebSecurityManager securityManager(Realm realm) {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(realm);
        return securityManager;
    }

}
