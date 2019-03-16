package edu.jxau.cjn.config.security;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.http.HttpStatus;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 自定义filter，实现Ajax请求可以跳转登陆
 */
public class ShiroAuthcFilter extends FormAuthenticationFilter {

    public ShiroAuthcFilter() {
        super();
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        if (isLoginRequest(request, response)) {
            return super.onAccessDenied(request, response);
        } else {
            if (isAjax((HttpServletRequest) request)) {
                HttpServletResponse httpServletResponse = WebUtils.toHttp(response);
                httpServletResponse.addHeader("REQUIRE_AUTH", "true");
                httpServletResponse.setStatus(HttpStatus.UNAUTHORIZED.value());
            } else {
                saveRequestAndRedirectToLogin(request, response);
            }
            return false;
        }
    }

    private boolean isAjax(HttpServletRequest request) {
        String requestedWithHeader = request.getHeader("X-Requested-With");
        return "XMLHttpRequest".equals(requestedWithHeader);
    }

}
