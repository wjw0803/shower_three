package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.ExpertPrevoir;

public interface ExpertPrevoirService extends IService<ExpertPrevoir> {

    void insret(ExpertPrevoir expertPrevoir) throws Exception;
}
