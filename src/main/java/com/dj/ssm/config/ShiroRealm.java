package com.dj.ssm.config;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.pojo.Resource;
import com.dj.ssm.pojo.User;
import com.dj.ssm.service.ResourceService;
import com.dj.ssm.service.UserService;
import lombok.SneakyThrows;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Component
public class ShiroRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    @Autowired
    private ResourceService resourceService;

    /**
     * 授权
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        // 创建简单授权信息
        SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
        //simpleAuthorInfo.addStringPermission("resource:add");
        //获取当前用户的登录信息
        Session session = SecurityUtils.getSubject().getSession();
        List<Resource> resourceList = (List<Resource>) session.getAttribute(SystemConstant.SESSION_RESOURCE);
        for (Resource resource : resourceList) {
            simpleAuthorInfo.addStringPermission(resource.getUrl());
        }
        return simpleAuthorInfo;
    }

    /**
     * 认证-登录
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @SneakyThrows
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        // 得到用户名
        String userName = (String) authenticationToken.getPrincipal();
        // 得到密码
        String password = new String((char[]) authenticationToken.getCredentials());
        try {
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            //用户名/手机号/邮箱+密码登陆
            queryWrapper.or(i -> i.eq("user_name", userName)
                    .or().eq("email", userName)
                    .or().eq("phone", userName));
            queryWrapper.eq("password", password);
            User user1 = userService.getOne(queryWrapper);
            //用户是否存在
            if (user1 == null) {
                throw new AccountException(SystemConstant.INPUT_ERROR);
            }
            //用户是否激活
            if (!user1.getStatus().equals(SystemConstant.COMMONALITY_ONE)) {
                throw new UnauthenticatedException(SystemConstant.ACTIVATE);
            }
            //技师被辞职不能登录
            if(!user1.getIsLeave().equals(SystemConstant.COMMONALITY_ONE)){
                throw new UnauthenticatedException(SystemConstant.RESIGN);
            }

            //技师被被举报三次不能登录
            if(user1.getIsReport() >= SystemConstant.PAGING_THREE){
                throw new UnauthenticatedException(SystemConstant.ISREPORT);
            }

            //用户是否删除
            if (user1.getIsDel().equals(SystemConstant.IS_DEL_DEL_ZERO)) {
                throw new UnauthenticatedException(SystemConstant.DELETE);
            }
            //增加登录时间
            user1.setLastloginTime(new Date());
            userService.updateById(user1);
            Session session = SecurityUtils.getSubject().getSession();
            // session存放用户信息
            session.setAttribute(SystemConstant.SESSION_USER, user1);
            //存放资源信息
            List<Resource> resourceList = resourceService.findResource(user1.getId());
            session.setAttribute(SystemConstant.SESSION_RESOURCE, resourceList);
        } catch (Exception e){
            throw new AccountException(e.getMessage());
        }
        return new SimpleAuthenticationInfo(userName, password, getName());
    }
}
