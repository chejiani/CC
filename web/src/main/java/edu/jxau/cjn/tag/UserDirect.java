package edu.jxau.cjn.tag;

import edu.jxau.cjn.config.security.ShiroUser;
import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import org.apache.shiro.SecurityUtils;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Map;

public class UserDirect implements TemplateDirectiveModel {

    @Override
    public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
        ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        StringWriter stringWriter = new StringWriter();
        if (shiroUser == null){
            env.getOut().write("<a class=\"btn btn-link text-justify text-info\" href=\"\\user\\login\">登陆</a>");
        } else {
            env.getOut().write("<a class=\"text-justify text-info\" href=\"#\">欢迎你: "+shiroUser.loginName+"</a>");
        }
    }

}
