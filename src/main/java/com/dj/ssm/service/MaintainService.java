package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.Maintain;
import com.dj.ssm.pojo.Role;

import java.util.List;

public interface MaintainService extends IService<Maintain> {

    List<Maintain> findAllMaintain(Integer status) throws Exception;

    void updateMaintain(Maintain maintain) throws Exception;

    void addMaintain(Maintain maintain) throws Exception;

    void delMaintain(Integer id, Integer isDel) throws Exception;
}
