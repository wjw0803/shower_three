package com.dj.ssm.controller.page;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.pojo.*;
import com.dj.ssm.service.*;
import com.dj.ssm.utils.PasswordSecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/maintain/")
public class MaintainPageController {

    @Autowired
    private MaintainService maintainService;

    @Autowired
    private BasicDataService basicDataService;

    @Autowired
    private UserRoleService userRoleService;

    /**
     *  去展示
     */
    @RequestMapping("toShow")
    public String toShow(Model model) {
        return "maintain/show";
    }

    /**
     *  去注册
     */
    @RequestMapping("toAdd")
    public String toAdd(Model model){
        QueryWrapper<BasicData> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("is_del", SystemConstant.IS_DEL_YES_ONE);
        queryWrapper.eq("p_id", SystemConstant.STATE_PROCESS_STATE);
        List<BasicData> basicDataList = basicDataService.list(queryWrapper);
        model.addAttribute("basicDataList", basicDataList);
        return "maintain/add";
    }

    /**
     * 去修改
     */
    @RequestMapping("toUpdate/{id}")
    public String toUpdate(@PathVariable Integer id, Model model, HttpSession session) {
        QueryWrapper<Maintain> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("id", id);
        Maintain maintain = maintainService.getOne(queryWrapper);
        User user = (User) session.getAttribute(SystemConstant.SESSION_USER);
        QueryWrapper<UserRole> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.eq("user_id", user.getId());
        UserRole roleId = userRoleService.getOne(queryWrapper1);
        List<BasicData> basicDataList = basicDataService.list();
        model.addAttribute("maintain", maintain);
        model.addAttribute("basicData", basicDataList);
        model.addAttribute("roleId", roleId.getRoleId());
        return "maintain/update";
    }


}
