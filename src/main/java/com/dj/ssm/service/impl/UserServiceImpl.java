package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.UserMapper;
import com.dj.ssm.pojo.User;
import com.dj.ssm.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor =  Exception.class)
public class UserServiceImpl  extends ServiceImpl<UserMapper, User> implements UserService {


}
