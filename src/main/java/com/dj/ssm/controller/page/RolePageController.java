package com.dj.ssm.controller.page;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.pojo.Resource;
import com.dj.ssm.pojo.Role;
import com.dj.ssm.pojo.RoleResource;
import com.dj.ssm.service.ResourceService;
import com.dj.ssm.service.RoleResourceService;
import com.dj.ssm.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/role/")
public class RolePageController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private RoleResourceService roleResourceService;

    @RequestMapping("toShow")
    public String toShow(){
        return "role/show";
    }

    @RequestMapping("toAdd")
    public String toAdd(){
        return "role/add";
    }


    /**
     * 去修改
     */
    @RequestMapping("toUpdate/{id}")
    public String toUpdate(@PathVariable Integer id, Model model) {
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("id", id);
        Role role = roleService.getOne(queryWrapper);
        model.addAttribute("role", role);
        return "role/update";
    }

    /**
     * 去授权
     */
    @RequestMapping("toConfer/{id}")
    public String toConfer(@PathVariable Integer id, Model model) {
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("id", id);
        Role role = roleService.getOne(queryWrapper);
        model.addAttribute("role", role);
        return "user/confer";
    }

    /**
     * 去关联资源数据
     */
    @RequestMapping("toRoleResList")
    public String toResource(Integer roleId, Model model) {
        List<Resource> resourceList = resourceService.list();
        QueryWrapper<RoleResource> queryWrapper = new QueryWrapper();
        queryWrapper.eq("role_id", roleId);
        queryWrapper.eq("is_del", SystemConstant.IS_DEL_ONE);
        List<RoleResource> roleResourceList = roleResourceService.list(queryWrapper);
        model.addAttribute("roleId", roleId);
        model.addAttribute("resourceList", resourceList);
        model.addAttribute("roleResourceList", roleResourceList);
        return "role/role_resource_list";
    }
}
