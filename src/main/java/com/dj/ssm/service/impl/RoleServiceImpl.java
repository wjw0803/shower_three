package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.mapper.RoleMapper;
import com.dj.ssm.pojo.Role;
import com.dj.ssm.pojo.RoleResource;
import com.dj.ssm.pojo.UserRole;
import com.dj.ssm.service.RoleResourceService;
import com.dj.ssm.service.RoleService;
import com.dj.ssm.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)//碰到异常做回滚
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {

    @Autowired
    private UserRoleService userRoleService;


    @Autowired
    private RoleResourceService roleResourceService;


    @Override
    public List<Role> findAllRole(String roleName) throws Exception {
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("is_del", SystemConstant.IS_DEL_YES_ONE);
        //模糊查
        if(StringUtils.hasText(roleName)){
            queryWrapper.like("role_name", roleName);
        }
        List<Role> roleList = this.list(queryWrapper);
        return roleList;
    }

    @Override
    public Role findByName(String roleName) throws Exception {
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("role_name", roleName);
        Role role = this.getOne(queryWrapper);
        return role;
    }

    @Override
    public void addRole(Role role) throws Exception {
        this.save(role);
    }

    @Override
    public void updateRole(Role role) throws Exception {
        this.updateById(role);
    }

    @Override
    public void delRoleAndUserRoleAndRoleResource(Role role) throws Exception {
        //删除角色
        this.updateById(role);
        //删除用户角色表
        UpdateWrapper<UserRole> updateWrapper2 = new UpdateWrapper<>();
        updateWrapper2.set("is_del", SystemConstant.IS_DEL_DEL_ZERO);
        updateWrapper2.eq("role_id", role.getId());
        userRoleService.update(updateWrapper2);
        //角色资源表删除
        UpdateWrapper<RoleResource> updateWrapper1 = new UpdateWrapper<>();
        updateWrapper1.set("is_del", SystemConstant.IS_DEL_DEL_ZERO);
        updateWrapper1.eq("role_id", role.getId());
        roleResourceService.update(updateWrapper1);
    }


    @Override
    public void getUserResAndSaveUserResAndUpdUserRes(Integer roleId, Integer[] resourceIds) throws Exception {
        //先删
        QueryWrapper<RoleResource> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("role_id", roleId);
        roleResourceService.remove(queryWrapper);
        //遍历数组 新增
        List<RoleResource> list = new ArrayList<>();
        for (Integer resourceId : resourceIds) {
            RoleResource roleResource = new RoleResource();
            roleResource.setRoleId(roleId);
            roleResource.setResourceId(resourceId);
            roleResource.setIsDel(SystemConstant.IS_DEL_YES_ONE);
            list.add(roleResource);
        }
        roleResourceService.saveBatch(list);
    }
}
