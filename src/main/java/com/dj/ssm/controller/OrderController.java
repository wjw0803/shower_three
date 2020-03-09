package com.dj.ssm.controller;

import com.dj.ssm.common.ResultModel;
import com.dj.ssm.common.SystemConstant;
import com.dj.ssm.pojo.Order;
import com.dj.ssm.pojo.User;
import com.dj.ssm.service.OrderService;
import com.dj.ssm.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/order/")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    /**
     * 订单展示
     * @return
     */
    @RequestMapping("show")
    public ResultModel<Object> show(HttpSession session, String productName, Integer pageNum){
        Map<String, Object> resultMap = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");
        try {
            PageHelper.startPage(pageNum, 2);
            List<Order> orderList = orderService.findAllByIsDel(productName,user.getId());
            PageInfo<Order> pageInfo = new PageInfo<>(orderList);
            resultMap.put("totalNum",pageInfo.getPages());
            resultMap.put("data",pageInfo.getList());
            return new ResultModel<>().success(resultMap);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常");
        }
    }

    /**
     * 退单操作
     */
    @RequestMapping("updatedel")
    public ResultModel<Object> updateIsDel(Integer id, HttpSession session, Double price){
        User user = (User) session.getAttribute("user");
        try {
            orderService.updateIsDel(id);
            BigDecimal productPrice = new BigDecimal(price);
            BigDecimal userPrice = new BigDecimal(user.getAccountMoney());
            user.setAccountMoney(Double.valueOf(String.valueOf(productPrice.add(userPrice))));
            userService.updateById(user);
            return new ResultModel<>().success("退单成功退款已成功退至您的账户");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultModel<>().error("服务器异常");
        }
    }
}
