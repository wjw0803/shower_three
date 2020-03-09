package com.dj.ssm.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.dj.ssm.pojo.Order;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface OrderService  {

    /**
     * 订单的展示
     */
    List<Order> findAllByIsDel(@Param("productName") String productName,@Param("userId")Integer userId) throws Exception;


    /**
     * 订单添加
     */
    void  addOrder(Order order) throws Exception;

    /**
     *退单操作
     */
    void updateIsDel(Integer id) throws Exception;


}
