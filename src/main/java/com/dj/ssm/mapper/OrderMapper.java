package com.dj.ssm.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.dj.ssm.pojo.Order;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import java.util.List;

public interface OrderMapper  {

    /**
     * 订单的展示
     */
    List<Order> findAllByIsDel(@Param("productName") String productName,@Param("userId")Integer userId) throws DataAccessException;

    /**
     * 订单添加
     */
    void  addOrder(Order order) throws DataAccessException;

    /**
     *退单操作
     */
    void updateIsDel(Integer id) throws DataAccessException;

}
