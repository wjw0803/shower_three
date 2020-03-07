package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.mapper.ResourceMapper;
import com.dj.ssm.pojo.Resource;
import com.dj.ssm.pojo.RoleResource;
import com.dj.ssm.service.ResourceService;
import com.dj.ssm.service.RoleResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)//碰到异常做回滚
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements ResourceService {

    @Autowired
    private ResourceMapper resourceMapper;

    @Autowired
    private RoleResourceService roleResourceService;

    @Override
    public List<Resource> findResource(Integer id) throws Exception {
        return resourceMapper.findResource(id);
    }

    @Override
    public Resource findByName(String resourceName) throws Exception {
        QueryWrapper<Resource> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("resource_name", resourceName);
        Resource resource = this.getOne(queryWrapper);
        return resource;
    }

    @Override
    public void addResource(Resource resource) throws Exception {
        this.save(resource);
    }

    @Override
    public void updateResource(Resource resource) throws Exception {
        this.updateById(resource);
    }

    @Override
    public List<Resource> findAllResource() throws Exception {
        QueryWrapper<Resource> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("is_del", SystemConstant.IS_DEL_ONE);
        List<Resource> resourceList = this.list(queryWrapper);
        return resourceList;
    }

    @Override
    public void delResources(Integer id) throws Exception {
        List<Integer> list = new ArrayList<>();
        getIds(id, list);
        //资源删除
        UpdateWrapper<Resource> updateWrapper = new UpdateWrapper<>();
        updateWrapper.set("is_del", SystemConstant.IS_DEL_ZERO);
        updateWrapper.in("id", list);
        this.update(updateWrapper);
        //角色资源表删除
        UpdateWrapper<RoleResource> updateWrapper1 = new UpdateWrapper<>();
        updateWrapper1.set("is_del", SystemConstant.IS_DEL_ZERO);
        updateWrapper1.in("resource_id", list);
        roleResourceService.update(updateWrapper1);
    }
    public void getIds(Integer id, List<Integer> list) throws Exception {
        QueryWrapper<Resource> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("is_del", SystemConstant.IS_DEL_ONE)
                .eq("p_id", id);
        List<Resource> resourceList = this.list(queryWrapper);
        list.add(id);
        if (null != resourceList && resourceList.size() > 0) {
            for (Resource resource : resourceList) {
                getIds(resource.getId(), list);
            }
        }
    }



}
