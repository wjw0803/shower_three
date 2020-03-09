package com.dj.ssm.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dj.ssm.common.ResultModel;
import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.pojo.ExpertPrevoir;
import com.dj.ssm.pojo.User;
import com.dj.ssm.pojo.UserRole;
import com.dj.ssm.service.ExpertPrevoirService;
import com.dj.ssm.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/expertPrevoir/")
public class ExpertPrevoirController {

    @Autowired
    private ExpertPrevoirService expertPrevoirService;

    @Autowired
    private UserRoleService userRoleService;

    @PutMapping("insert")
    public ResultModel<Object> insert(ExpertPrevoir expertPrevoir){
        try {
            expertPrevoir.setPrevoirDate(new Date());
            expertPrevoirService.insret(expertPrevoir);
            return new ResultModel<>().success();
        }catch (Exception e){
            e.printStackTrace();
            return new ResultModel<>().error(e.getMessage());
        }
    }


    /**
     * 展示
     */
    @RequestMapping("show")
    public ResultModel<Object> show(User user, HttpSession session) {
        try {
            User user1 = (User) session.getAttribute(SystemConstant.SESSION_USER);
            //用户id查出角色id
            UserRole userRole = userRoleService.getOne(new QueryWrapper<UserRole>().eq("user_id", user1.getId()));
            if (userRole.getRoleId().equals(7)){
                List<ExpertPrevoir> userList =  expertPrevoirService.list(new QueryWrapper<ExpertPrevoir>().eq("expert_id", user1.getId()));
                return new ResultModel<>().success(userList);
            }
            List<ExpertPrevoir> userList =  expertPrevoirService.list(new QueryWrapper<ExpertPrevoir>().eq("user_id", user1.getId()));
            return new ResultModel<>().success(userList);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error(SystemConstant.ERROR + e.getMessage());
        }
    }

    @PutMapping("updateOrdreType")
    public ResultModel<Object> updateOrdreType(ExpertPrevoir expertPrevoir) {
        expertPrevoir.setAccepterDate(new Date());
        expertPrevoirService.updateById(expertPrevoir);
        return new ResultModel<>().success();
    }

}
