package com.ccut.ytzhuang.config.security;

import com.ccut.ytzhuang.model.User;
import com.ccut.ytzhuang.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Arrays;

public class CustomRealm extends AuthorizingRealm {

    private static Logger logger = LoggerFactory.getLogger(CustomRealm.class);

    @Autowired
    private UserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addStringPermissions(Arrays.asList("admin"));
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        User user = userService.getUserByid(((ShiroUser)token.getPrincipal()).id);
        if (user == null) {
            return null;
        }
        logger.info("doGetAuthenticationInfo");
        return new SimpleAuthenticationInfo(user, user.getPassword().toCharArray(), ByteSource.Util.bytes(user.getPassword()), getName());

    }

}
