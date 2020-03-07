package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.Role;

import java.util.List;

public interface RoleService extends IService<Role> {
    //展示
    List<Role> findAllRole(String roleName) throws Exception;

    //查询是否有角色
    Role findByName(String roleName) throws Exception;

    //注册
    void addRole(Role role) throws Exception;

    //修改
    void updateRole(Role role) throws Exception;

    //删除
    void delRoleAndUserRoleAndRoleResource(Role role) throws Exception;

    //删除角色原关联的资源保存新关联的资源
    void getUserResAndSaveUserResAndUpdUserRes(Integer roleId, Integer[] resourceIds) throws Exception;
}
