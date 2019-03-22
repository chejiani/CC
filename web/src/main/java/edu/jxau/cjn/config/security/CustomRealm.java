package edu.jxau.cjn.config.security;

import edu.jxau.cjn.infrastructure.entity.User;
import edu.jxau.cjn.service.Log;
import edu.jxau.cjn.service.user.UserService;
import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.PostConstruct;
import java.util.Arrays;
import java.util.Collection;

public class CustomRealm extends AuthorizingRealm implements Log {

    private UserService userService;

    /**
     * 认证回调函数,登录时调用.
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        User user = userService.getUserByUserName(token.getUsername());
        if (user != null) {
            ShiroUser shiroUser = new ShiroUser(String.valueOf(user.getUserId()), user.getNickName(),
                    user.getNickName(), token.getHost());
            try {
                return new SimpleAuthenticationInfo(shiroUser, user.getPassword(),
                        ByteSource.Util.bytes(Hex.decodeHex(user.getSalt())), getName());
            } catch (DecoderException e) {
                error("解码密码错误", e);
                return null;
            }
        } else {
            return null;
        }
    }

    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
        User user = userService.getUserByUserName(shiroUser.loginName);
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addRoles(Arrays.asList(user.getRole().getName()));
        return info;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

}
