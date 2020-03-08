package com.dj.ssm.service.impl;


import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.mapper.MaintainMapper;

import com.dj.ssm.pojo.Maintain;

import com.dj.ssm.service.MaintainService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)//碰到异常做回滚
public class MaintainServiceImpl extends ServiceImpl<MaintainMapper, Maintain> implements MaintainService {

    @Autowired
    private MaintainMapper maintainMapper;


    @Override
    public List<Maintain> findAllMaintain(Integer status) throws Exception {
        return maintainMapper.findAllMaintain(status);
    }

    @Override
    public void updateMaintain(Maintain maintain) throws Exception {
        UpdateWrapper<Maintain> updateWrapper = new UpdateWrapper<>();
        updateWrapper.set("status", maintain.getStatus());
        updateWrapper.eq("id", maintain.getId());
        this.update(updateWrapper);
    }

    @Override
    public void addMaintain(Maintain maintain) throws Exception {
        maintain.setMaintainId(SystemConstant.NUM_DJ + new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date())
                + "♦");
        this.save(maintain);
    }

    @Override
    public void delMaintain(Integer id, Integer isDel) throws Exception {
        UpdateWrapper<Maintain> updateWrapper = new UpdateWrapper<>();
        updateWrapper.set("is_del", isDel);
        updateWrapper.eq("id", id);
        this.update(updateWrapper);
    }

}
