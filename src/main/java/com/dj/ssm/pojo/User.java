package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@Accessors(chain = true)
@TableName("djmall_auth_user")
public class User {

    /**
     * 用户id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 密码
     */
    private String password;

    /**
     * 状态 -1未激活,1激活
     */
    private Integer status;

    /**
     * 是否删除 1正常 0删除
     */
    private Integer isDel;

    /**
     * 手机
     */
    private String phone;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 验证码
     */
    private String verify;

    /**
     * 性别  1男 2女
     */
    private Integer sex;

    /**
     * 注册时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // ǰ̨�����ַ���ת��ʱ������
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") /* ֻ�а��������תΪJson����Ч���� */
    private Date registerTime;

    /**
     * 最后登录时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // ǰ̨�����ַ���ת��ʱ������
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") /* ֻ�а��������תΪJson����Ч���� */
    private Date lastloginTime;

    /**
     * 角色  1,用户 2,管理员
     */
    @TableField(exist = false)//表示该属性不为数据库表字段，但又是必须使用的。
    private Integer roleId;
    /**
     * 角色
     */
    @TableField(exist = false)//表示该属性不为数据库表字段，但又是必须使用的。
    private String roleNameShow;

    /**
     * 密码 "盐"
     */
    private String salt;
}
