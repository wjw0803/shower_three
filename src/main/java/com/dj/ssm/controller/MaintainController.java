package com.dj.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.ssm.common.ResultModel;
import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.pojo.Maintain;
import com.dj.ssm.pojo.Resource;
import com.dj.ssm.pojo.Role;
import com.dj.ssm.pojo.RoleResource;
import com.dj.ssm.service.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("/maintain/")
public class MaintainController {

    @Autowired
    private MaintainService maintainService;

    /**
     * 展示
     * @param status
     * @param pageNo
     * @return
     */
    @RequestMapping("show")
    public ResultModel<Object> show(Integer status, Integer pageNo) {
        HashMap<String, Object> map = new HashMap<>();
        try {
            PageHelper.startPage(pageNo, SystemConstant.PAGING_THREE);
            List<Maintain> maintainList = maintainService.findAllMaintain(status);
            PageInfo<Maintain> pageInfo = new PageInfo<Maintain>(maintainList);
            map.put("totalNum", pageInfo.getPages());
            map.put("maintainList", maintainList);
            return new ResultModel<>().success(map);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }


    /**
     * 注册
     * @param maintain
     * @return
     */
    @RequestMapping("add")
    public ResultModel<Object> add(Maintain maintain) {
        try {
            if (maintain.getMaintainTime() == null || maintain.getMaintainProject() == null) {
                return new ResultModel<>().error(SystemConstant.NOT_NULL);
            }
            maintainService.addMaintain(maintain);
            return new ResultModel<>().success(SystemConstant.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    /**
     * 修改
     * @param maintain
     * @return
     */
    @RequestMapping("update")
    public ResultModel<Object> update(Maintain maintain) {
        try {
            maintainService.updateMaintain(maintain);
            return new ResultModel<>().success(SystemConstant.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    /**
     * 删除
     * @param id
     * @param isDel
     * @return
     */
    @RequestMapping("del")
    public ResultModel<Object> del(Integer id, Integer isDel) {
        try {
            maintainService.delMaintain(id, isDel);
            return new ResultModel<>().success(SystemConstant.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }


}