package com.dj.ssm.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.dj.ssm.mapper.OrderMapper;
import com.dj.ssm.pojo.Order;
import com.dj.ssm.service.OrderService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl  implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> findAllByIsDel(@Param("productName") String productName, @Param("userId")Integer userId) throws Exception {
        return orderMapper.findAllByIsDel(productName,userId);
    }

    @Override
    public void addOrder(Order order) throws Exception {
        orderMapper.addOrder(order);
    }

    @Override
    public void updateIsDel(Integer id) throws Exception {
        orderMapper.updateIsDel(id);
    }
}
