package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.Resource;

import java.util.List;

public interface ResourceService extends IService<Resource> {

    //查询所有展示
    List<Resource> findResource(Integer id) throws Exception;

    //查询资源名
    Resource findByName(String resourceName) throws Exception;

    //注册
    void addResource(Resource resource) throws Exception;

    //修改
    void updateResource(Resource resource) throws Exception;

    //查询所有
    List<Resource> findAllResource() throws Exception;

    //删除资源
    void delResources(Integer id) throws Exception;
}
