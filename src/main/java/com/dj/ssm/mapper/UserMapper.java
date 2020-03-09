package com.dj.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.ssm.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.zip.DataFormatException;

public interface UserMapper extends BaseMapper<User> {

    //展示
    List<User> allUser(User user) throws DataFormatException;

    //技师展示
    List<User> findByRoleAllUser(User user) throws DataFormatException;
}
