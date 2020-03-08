package com.dj.ssm.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.Update;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.dj.ssm.common.ResultModel;
import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.UserRole;
import com.dj.ssm.service.ResourceService;
import com.dj.ssm.service.UserRoleService;
import com.dj.ssm.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user/")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private ResourceService resourceService;

    /**
     * 登录
     */
    @RequestMapping("login")
    public ResultModel<Object> login(String userName, String password, HttpSession session) {
        try {
            //判断不为空
            if(StringUtils.isEmpty(userName) || StringUtils.isEmpty(password)){
                return new ResultModel<>().error(SystemConstant.NOT_NULL);
            }
//            User user1 = userService.findNameAndPwd(userName, password);
//            //用户是否存在
//            if (user1 == null) {
//                return new ResultModel<>().error(SystemConstant.INPUT_ERROR);
//            }
//            //用户是否激活
//            if (!user1.getStatus().equals(SystemConstant.ONE)) {
//                return new ResultModel<>().error(SystemConstant.ACTIVATE);
//            }
//            //用户是否删除
//            if (user1.getIsDel().equals(SystemConstant.IS_DEL_ZERO)) {
//                return new ResultModel<>().error(SystemConstant.DELETE);
//            }
//            // session存放用户信息
//            session.setAttribute(SystemConstant.SESSION_USER, user1);
//            //存放资源信息
//            List<Resource> resourceList = resourceService.findResource(user1.getId());
//            session.setAttribute(SystemConstant.SESSION_RESOURCE, resourceList);

            // shiro登录方式
            Subject subject = SecurityUtils.getSubject();//得到subject
            UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
            subject.login(token);//访问shiro认证器
            return new ResultModel<>().success(SystemConstant.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(e.getMessage());
        }
    }

    /**
     * 查询盐
     */
    @RequestMapping("findSalt")
    public ResultModel<Object> findSalt(String userName){
        try {
            User user = userService.findSalt(userName);
            if (user == null) {
                return new ResultModel<>().error(SystemConstant.INPUT_ERROR);
            }
            ResultModel resultModel = new ResultModel().success(true);
            resultModel.setData(user.getSalt());
            return resultModel;
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR);
        }
    }


    /**
     * 展示
     */
    @RequestMapping("show")
    public ResultModel<Object> show(User user, HttpSession session) {
        try {
            User user1 = (User) session.getAttribute(SystemConstant.SESSION_USER);
            //用户id查出角色id
            UserRole userRole = userRoleService.getOne(new QueryWrapper<UserRole>().eq("user_id", user1.getId()));
            //用户,vip用户,维修工,技师只能看到自己的信息
            if (userRole.getRoleId().equals(1) || userRole.getRoleId().equals(8) || userRole.getRoleId().equals(7) || userRole.getRoleId().equals(3)){
                user.setId(user1.getId());
            }
            List<User> userList = userService.findAllUser(user);
            return new ResultModel<>().success(userList);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    /**
     * 验证是否有用户
     */
    @RequestMapping("findByName")
    public boolean findByName(User user) {
        try {
            User user1 =userService.findByName(user);
            return user1 == null ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
    }


    /**
     * 注册
     */
    @RequestMapping("add")
    public ResultModel<Object> add(User user, UserRole userRole) {
        try {
            userService.addUserAndUserRole(user, userRole);
            return new ResultModel<>().success(SystemConstant.ADD_YES);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    /**
     * 修改
     */
    @RequestMapping("update")
    public ResultModel<Object> update(User user) {
        try {
            userService.updateUser(user);
            return new ResultModel<>().success(SystemConstant.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    /**
     * id删除
     */
    @RequestMapping("del")
    public ResultModel<Object> del(User user) {
        try {
            userService.delUser(user);
            return new ResultModel<>().success(SystemConstant.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    /**
     * 批量删除
     */
    @RequestMapping("delByIds")
    public ResultModel<Object> delByIds(Integer[] ids) {
        try {
            userService.delUsers(ids);
            return new ResultModel<>().success(SystemConstant.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    /**
     * 授权
     */
    @RequestMapping("updateUserRole")
    public ResultModel<Object> updateUserRole(UserRole userRole) {
        try {
            userService.updateUserRole(userRole);
            return new ResultModel<>().success(SystemConstant.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    /**
     * 手机验证码
     */
    @RequestMapping("sendMessage")
    public ResultModel<Object> sendMessage(User user1) {
        try {
            User user2 =userService.findByName(user1);
            if (user2 == null) {
                return new ResultModel<>().error(SystemConstant.REGISTER);
            }
            Map<String, Object> resultMap = new HashMap<String, Object>();
            User user = userService.sendMessage(user1.getPhone());
            if (user == null) {
                return new ResultModel<>().error(SystemConstant.REGISTER);
            }
            resultMap.put("ver", String.valueOf(user.getVerify()));
            resultMap.put("msg", SystemConstant.SUCCESS);
            return new ResultModel<>().success(resultMap);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    /**
     * 找回密码
     */
    @RequestMapping("find")
    public ResultModel<Object> find(User user) {
        try {
            userService.findPhoneAndVerify(user);
            return new ResultModel<>().success(SystemConstant.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    /**
     * 用户充值
     */
    @RequestMapping("accountMoney")
    public ResultModel<Object> accountMoney(BigDecimal userMoney, Double accountMoney, HttpSession session) {
        try {

            BigDecimal bigDecimal = new BigDecimal(accountMoney);
            User user = (User) session.getAttribute("user");
            UpdateWrapper<User> updateWrapper = new UpdateWrapper<>();
            updateWrapper.set("account_money", userMoney.add(bigDecimal));
            updateWrapper.eq("id", user.getId());
            userService.update(updateWrapper);
            return new ResultModel<>().success(SystemConstant.ACCOUNTMONEY);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    /**
     * 购买vip
     */
    //购买vip方法
    @PutMapping("buyVip")
    public ResultModel<Object> buyVip(User user/*,String tuCode*/, HttpSession session){
        try {
            //判断非空
            if(StringUtils.isEmpty(user.getVipType()) /*|| StringUtils.isEmpty(tuCode) */){
                return new ResultModel<>().error("vip类型或图形验证码不可为空");
            }
            User user1 = (User) session.getAttribute("user");
            //根据当前用户查询他此时的账户金额
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("id",user1.getId());
            User user2 = userService.getOne(queryWrapper);
            Calendar calendar = Calendar.getInstance();
            //如果选则的日vip则vip失效时间加1天
            if(user.getVipType() == 0){
                calendar.add(Calendar.DATE,1);
                if(user2.getAccountMoney() - 3 < 0){
                    return new ResultModel<>().error("账户余额不足请及时充值");
                }
                user.setAccountMoney(user2.getAccountMoney() - 3);
            }
            //如果选则的是月vip则vip失效时间加1月
            if(user.getVipType() == 1){
                calendar.add(Calendar.MONTH,1);
                if(user2.getAccountMoney() - 30 < 0){
                    return new ResultModel<>().error("账户余额不足请及时充值");
                }
                user.setAccountMoney(user2.getAccountMoney() - 30);
            }
            //如果选则的是年vip则vip失效时间加1年
            if(user.getVipType() == 2){
                calendar.add(Calendar.YEAR,1);
                if(user2.getAccountMoney() - 256 < 0){
                    return new ResultModel<>().error("账户余额不足请及时充值");
                }
                user.setAccountMoney(user2.getAccountMoney() - 256);
            }
            user.setVipValidateTime(calendar.getTime());
            user.setId(user2.getId());
            userService.updateById(user);
            //修改等级后对应的user_role(用户角色表)也要修改
            UserRole userRole = new UserRole();
            UpdateWrapper<UserRole> updateWrapper = new UpdateWrapper<>();
            updateWrapper.set("role_id",8);
            updateWrapper.eq("user_id",user2.getId());
            userRoleService.update(updateWrapper);
            return new ResultModel<>().success();
        }catch (Exception e){
            return new ResultModel<>().error(e.getMessage());
        }

    }

}
