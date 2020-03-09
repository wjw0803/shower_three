package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.ExpertPrevoirMapper;
import com.dj.ssm.pojo.ExpertPrevoir;
import com.dj.ssm.service.ExpertPrevoirService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)//碰到异常做回滚
public class ExpertPrevoirServiceImpl extends ServiceImpl<ExpertPrevoirMapper, ExpertPrevoir> implements ExpertPrevoirService {

    @Autowired
    private ExpertPrevoirMapper expertPrevoirMapper;

    @Override
    public void insret(ExpertPrevoir expertPrevoir) throws Exception {
        expertPrevoirMapper.insert(expertPrevoir);
    }
}
