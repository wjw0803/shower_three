package com.dj.ssm.config;

import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@Component
public class MyInterceptor implements HandlerInterceptor {


    /**
     * 方法前
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("pre");
        // 校验用户是否登录 session用戶名
        User user = (User) request.getSession().getAttribute(SystemConstant.SESSION_USER);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/user/toLogin");
            return false;
        }
        return true;
    }
}
