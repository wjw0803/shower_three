package com.dj.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.ssm.pojo.Resource;

import java.util.List;

public interface ResourceMapper extends BaseMapper<Resource> {

    List<Resource> findResource(Integer id) throws Exception;
}
