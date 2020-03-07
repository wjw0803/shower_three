package com.dj.ssm.controller.page;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.pojo.Role;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.UserRole;
import com.dj.ssm.service.RoleService;
import com.dj.ssm.service.UserRoleService;
import com.dj.ssm.service.UserService;
import com.dj.ssm.utils.PasswordSecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user/")
public class UserPageController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserRoleService userRoleService;

    /**
     * 去登录
     */
    @RequestMapping("toLogin")
    public String toLogin(){
        return "user/login";
    }

    /**
     * 去找回密码
     */
    @RequestMapping("toFind")
    public String toFind(){
        return "user/find";
    }

    /**
     *  去展示
     */
    @RequestMapping("toShow")
    public String toShow() {
        return "user/show";
    }

    /**
     *  去授权
     */
    @RequestMapping("toConfer/{id}")
    public String toConfer(@PathVariable Integer id, Model model) {
        //用户id查出角色id
        UserRole userRole = userRoleService.getOne(new QueryWrapper<UserRole>().eq("user_id", id));
        //查询角色做回显
        List<Role> roleList = roleService.list();
        model.addAttribute("id", id);
        model.addAttribute("userRole", userRole);
        model.addAttribute("roleList", roleList);
        return "user/confer";
    }

    /**
     *  去注册
     */
    @RequestMapping("toAdd")
    public String toAdd(Model model) throws Exception {
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("is_del", SystemConstant.IS_DEL_ONE);
        List<Role> roleList = roleService.list(queryWrapper);
        model.addAttribute("roleList", roleList);
        //获取盐到前台进行加密
        String salt = PasswordSecurityUtil.generateSalt();
        model.addAttribute("salt", salt);
        return "user/add";
    }

    /**
     * 去修改
     */
    @RequestMapping("toUpdate/{id}")
    public String toUpdate(@PathVariable Integer id, Model model) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("id", id);
        User user = userService.getOne(queryWrapper);
        model.addAttribute("user", user);
        return "user/update";
    }

    //邮箱激活
    @RequestMapping("updateStatus")
    public String updateStatus(Integer id) {
        try {
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("id", id);
            User user = userService.getOne(queryWrapper);
            user.setStatus(SystemConstant.YES_STATUS);
            user.setId(id);
            userService.updateById(user);
            return "user/login";
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
    }

    // 退出
    @RequestMapping("esc")
    public String esc(HttpSession session) {
        session.removeAttribute("user");
        return "user/login";
    }
}
