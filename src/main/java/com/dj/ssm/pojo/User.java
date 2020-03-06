package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author dj这是和波涛的测试类
 */
@Data
@Accessors(chain = true)
@TableName("user")
public class User {

    @TableId(type = IdType.AUTO)
    private Integer id;

    private String userName;

    private String phone;

    private String email;

    //提交的呢
    private String ceshi = "6666";

    private boolean  a = false;


}
