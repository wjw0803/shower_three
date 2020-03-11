package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.mapper.UserMapper;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.UserRole;
import com.dj.ssm.service.UserRoleService;
import com.dj.ssm.service.UserService;
import com.dj.ssm.utils.JavaEmailUtils;
import com.dj.ssm.utils.MessageVerifyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)//碰到异常做回滚
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserRoleService userRoleService;

    @Override
    public List<User> findAllUser(User user) throws Exception {
        return userMapper.allUser(user);
    }

    @Override
    public User findNameAndPwd(String userName, String password) throws Exception {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        //用户名/手机号/邮箱+密码登陆
        queryWrapper.or(i -> i.eq("user_name", userName)
                .or().eq("email", userName)
                .or().eq("phone", userName));
        queryWrapper.eq("password", password);
        User user1 = this.getOne(queryWrapper);
        //增加登录时间
        user1.setLastloginTime(new Date());
        this.updateById(user1);
        return user1;
    }

    @Override
    public User findSalt(String userName) throws Exception {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.or(i -> i.eq("user_name", userName)
                .or().eq("email", userName)
                .or().eq("phone", userName));
        User user = this.getOne(queryWrapper);
        return user;
    }

    @Override
    public User findByName(User user) throws Exception {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.or(i -> i.eq("user_name", user.getUserName())
                .or().eq("email", user.getEmail())
                .or().eq("phone", user.getPhone()));
        User user1 = this.getOne(queryWrapper);
        return user1;
    }

    @Override
    public void addUserAndUserRole(User user, UserRole userRole) throws Exception {
        //注册用户
        user.setRegisterTime(new Date());
        this.save(user);
        //注册用户角色关联表
        userRole.setUserId(user.getId());
        userRoleService.save(userRole);
        //发送邮件
        JavaEmailUtils.sendEmail(user.getEmail(), "点击激活", "<a href='http://192.168.3.93:8080/pms/user/updateStatus?id=" + user.getId() + "'>激活</a>");
    }

    @Override
    public void updateUser(User user) throws Exception {
        this.updateById(user);
    }

    @Override
    public void delUser(User user) throws Exception {
        this.updateById(user);
        UpdateWrapper<UserRole> updateWrapper = new UpdateWrapper<>();
        updateWrapper.set("is_del", SystemConstant.IS_DEL_DEL_ZERO);
        updateWrapper.eq("user_id", user.getId());
        userRoleService.update(updateWrapper);
    }

    @Override
    public void delUsers(Integer[] ids) throws Exception {
        UpdateWrapper<User> updateWrapper = new UpdateWrapper<>();
        updateWrapper.set("is_del", SystemConstant.IS_DEL_DEL_ZERO);
        updateWrapper.in("id", ids);
        this.update(updateWrapper);
        UpdateWrapper<UserRole> updateWrapper1 = new UpdateWrapper<>();
        updateWrapper1.set("is_del", SystemConstant.IS_DEL_DEL_ZERO);
        updateWrapper1.in("user_id", ids);
        userRoleService.update(updateWrapper1);
    }

    @Override
    public void updateUserRole(UserRole userRole) throws Exception {
        UpdateWrapper<UserRole> updateWrapper = new UpdateWrapper<>();
        updateWrapper.set("role_id", userRole.getRoleId());
        updateWrapper.eq("user_id", userRole.getUserId());
        userRoleService.update(updateWrapper);
    }

    @Override
    public User sendMessage(String phone) throws Exception {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("phone", phone);
        User user = this.getOne(queryWrapper);
        //获取手机短信验证码
        int newcode = MessageVerifyUtils.getNewcode();
        user.setVerify(String.valueOf(newcode));
        MessageVerifyUtils.sendSms(String.valueOf(user.getPhone()), String.valueOf(newcode));
        //根据手机号修改验证码
        this.updateById(user);
        return user;
    }

    @Override
    public void findPhoneAndVerify(User user) throws Exception {
        UpdateWrapper<User> updateWrapper = new UpdateWrapper<>();
        updateWrapper.set("password", user.getPassword());
        updateWrapper.set("verify", SystemConstant.NULL);
        updateWrapper.eq("phone", user.getPhone());
        updateWrapper.eq("verify", user.getVerify());
        this.update(updateWrapper);
        //发送邮件
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("phone", user.getPhone());
        User user1 = this.getOne(queryWrapper);
        DateFormat df = DateFormat.getDateTimeInstance();//可以精确到时分秒
        JavaEmailUtils.sendEmail(user1.getEmail(), "修改密码", "您的账户"+user1.getNickname()+"，于"+df.format(new Date())+"时进行密码修改成功。");
    }

    @Override
    public List<User> findByRoleAllUser(User user) throws Exception {
        return userMapper.findByRoleAllUser(user);
    }
}
