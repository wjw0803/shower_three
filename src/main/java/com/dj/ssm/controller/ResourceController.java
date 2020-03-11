package com.dj.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.ssm.common.ResultModel;
import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.pojo.Resource;
import com.dj.ssm.pojo.User;
import com.dj.ssm.service.ResourceService;
import com.dj.ssm.service.UserRoleService;
import com.dj.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/resource/")
public class ResourceController {

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private UserService userService;

    /**
     * left展示
     */
    @RequestMapping("left")
    public ResultModel<Object> left(HttpSession session) {
        try {
            //当前登录用户的全部权限
            List<Resource> resourceList = (List<Resource>) session.getAttribute(SystemConstant.SESSION_RESOURCE);
            //菜单权限
            List<Resource> menuList = new ArrayList<>();
            for (Resource resource : resourceList) {
                if (resource.getResourceType().equals(SystemConstant.COMMONALITY_ONE)){
                    menuList.add(resource);
                }
            }
            return new ResultModel<>().success(menuList);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    /**
     * 验证是否有资源
     */
    @RequestMapping("findByName")
    public boolean findByName(String resourceName){
        try {
            Resource resource = resourceService.findByName(resourceName);
            return resource == null ? true : false;
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }
    }

    /**
     * 注册
     */
    @RequestMapping("add")
    public ResultModel<Object> add(Resource resource){
        try {
            if(StringUtils.isEmpty(resource.getResourceName())){
                return new ResultModel<>().error(SystemConstant.NOT_NULL);
            }
            resourceService.addResource(resource);
            return new ResultModel<>().success(SystemConstant.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    /**
     * 修改
     */
    @RequestMapping("update")
    public ResultModel<Object> update(Resource resource){
        try {
            resourceService.updateResource(resource);
            return new ResultModel<>().success(SystemConstant.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    @RequestMapping("show")
    public List<Resource> show() {
        try {
            List<Resource> resourceList = resourceService.findAllResource();
            return resourceList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 资源删除
     */
    @RequestMapping("delById")
    public ResultModel<Object> delById(Integer id) {
        try {
            resourceService.delResources(id);
            return new ResultModel<>().success(SystemConstant.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    @PutMapping("updateIsReport")
    public ResultModel<Object> updateIsReport(User user) {
        QueryWrapper<User> wrapper = new QueryWrapper<User>();
        wrapper.eq("id", user.getId());
        User user1 = userService.getOne(wrapper);
        user.setIsReport(user1.getIsReport()+1);
        userService.updateById(user);
        return new ResultModel<>().success();
    }

    @PutMapping("updatePrevoir")
    public ResultModel<Object> updatePrevoir(User user) {
        QueryWrapper<User> wrapper = new QueryWrapper<User>();
        userService.updateById(user);
        return new ResultModel<>().success();
    }
}
