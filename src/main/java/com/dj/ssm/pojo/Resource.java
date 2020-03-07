package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@TableName("djmall_auth_resource")
public class Resource {

    /**
     * id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 资源名称
     */
    private String resourceName;

    /**
     * 资源PATH
     */
    private String url;

    /**
     * 父级id
     */
    private Integer pId;

    /**
     * 资源编码
     */
    private String resourceCode;

    /**
     * 资源类型  1菜单 2按钮
     */
    private Integer resourceType;

    /**
     * 是否是父级
     */
    @TableField(exist = false)//表示该属性不为数据库表字段，但又是必须使用的。
    private Boolean parent = false;

    /**
     * 复选框的回显
     */
    @TableField(exist = false)//表示该属性不为数据库表字段，但又是必须使用的。
    private Boolean checked = false;

    /**
     * 是否删除 1正常 0删除
     */
    private Integer isDel;
}
