package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.mapper.BasicDataMapper;
import com.dj.ssm.mapper.RoleMapper;
import com.dj.ssm.pojo.BasicData;
import com.dj.ssm.pojo.Role;
import com.dj.ssm.pojo.RoleResource;
import com.dj.ssm.pojo.UserRole;
import com.dj.ssm.service.BasicDataService;
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
public class BasicDataServiceImpl extends ServiceImpl<BasicDataMapper, BasicData> implements BasicDataService {


}
