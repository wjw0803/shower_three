package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@TableName("djmall_auth_order")
public class Order {

    /**
     * 订单id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 商品id
     */
    private Integer productId;

    /**
     * 购买人id
     */
    private Integer userId;

    /**
     * 商品名
     */
    private String productName;

    /**
     * 商品价格
     */
    private Double price;

    /**
     * 是否删除 1：未删除 0：删除
     */
    private  Integer isDel;

    /**
     * 用于展示字段
     */
    private String userName;

    private String productNameShow;
}
