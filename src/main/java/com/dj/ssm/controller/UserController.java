package com.dj.ssm.controller;


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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
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
    public ResultModel<Object> show(User user) {
        try {
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


}
