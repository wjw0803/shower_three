package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.UserRole;

import java.util.List;

public interface UserService extends IService<User> {

    //展示
    List<User> findAllUser(User user) throws Exception;

    //登录
    User findNameAndPwd(String userName, String password) throws Exception;

    //获取盐
    User findSalt(String userName) throws Exception;

    //姓名是否存在
    User findByName(User user) throws Exception;

    //注册
    void addUserAndUserRole(User user, UserRole userRole) throws Exception;

    //修改
    void updateUser(User user) throws Exception;

    //id删除
    void delUser(User user) throws Exception;

    //批量删除
    void delUsers(Integer[] ids) throws Exception;

    //授权
    void updateUserRole(UserRole userRole) throws Exception;

    //手机验证码
    User sendMessage(String phone) throws Exception;

    //找回密码
    void findPhoneAndVerify(User user) throws Exception;
}
