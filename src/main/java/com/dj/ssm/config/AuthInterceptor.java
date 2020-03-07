package com.dj.ssm.config;

import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.pojo.Resource;
import com.dj.ssm.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Component
public class AuthInterceptor implements HandlerInterceptor {

    @Autowired
    private ResourceService resourceService;

    /**
     * 方法前
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("pre");

        //获取登录用户的权限集合
        //当前请求的Url
        String url = request.getRequestURI();
        String ctx = request.getContextPath();
        //获取当前登录用户信息
        HttpSession session = request.getSession();
        List<Resource> resourceList = (List<Resource>) session.getAttribute(SystemConstant.SESSION_RESOURCE);
        //当前请求的url和用户的资源比对
        for (Resource resource : resourceList) {
            if (url.equals(ctx + resource.getUrl())) {
                //继续执行
                return true;
            }
        }
        //跳转403(没有权限)
        response.sendRedirect(ctx + "/403.jsp");
        return false;
    }
}
