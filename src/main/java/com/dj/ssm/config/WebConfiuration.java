package com.dj.ssm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
//@DependsOn("myInterceptor")
public class WebConfiuration implements WebMvcConfigurer {


//    @Autowired
//    private MyInterceptor myInterceptor;

    @Autowired
    private AuthInterceptor authInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

//        //登录
//        //向容器注册拦截器
//        InterceptorRegistration interceptorRegistration = registry.addInterceptor(myInterceptor);
//        //拦截请求
//        interceptorRegistration.addPathPatterns("/**");
//        //放过请求
//        interceptorRegistration.excludePathPatterns("/user/toLogin");
//        interceptorRegistration.excludePathPatterns("/user/login");
//        interceptorRegistration.excludePathPatterns("/user/findByName");
//        interceptorRegistration.excludePathPatterns("/user/updateStatus");
//        interceptorRegistration.excludePathPatterns("/user/toAdd");
//        interceptorRegistration.excludePathPatterns("/user/add");
//        interceptorRegistration.excludePathPatterns("/user/find");
//        interceptorRegistration.excludePathPatterns("/user/sendMessage");
//        interceptorRegistration.excludePathPatterns("/user/toFind");
//        interceptorRegistration.excludePathPatterns("/user/findSalt");
//        interceptorRegistration.excludePathPatterns("/static/**");

        //权限路径拦截
        InterceptorRegistration authRegistration = registry.addInterceptor(authInterceptor);
        //拦截请求
        authRegistration.addPathPatterns("/user/toShow");
        authRegistration.addPathPatterns("/role/toShow");
        authRegistration.addPathPatterns("/resource/toShow");


    }



}
