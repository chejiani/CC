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
        if (shiroUser == null){
            env.getOut().write("<a class=\"btn btn-link text-justify text-info\" href=\"\\user\\login\">登陆</a>");
        } else {
            env.getOut().write("<div class=\"dropdown\">\n" +
                    "  <button class=\"btn btn-link dropdown-toggle\" type=\"button\" id=\"dropdownMenuButton\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">\n" +
                    "    欢迎你: "+shiroUser.loginName+"\n" +
                    "  </button>\n" +
                    "  <div class=\"dropdown-menu\" aria-labelledby=\"dropdownMenuButton\">\n" +
                    "    <a class=\"dropdown-item\" href=\"\\user\\logout\">注销</a>\n" +
                    "  </div>\n" +
                    "</div>");
        }
    }

}
