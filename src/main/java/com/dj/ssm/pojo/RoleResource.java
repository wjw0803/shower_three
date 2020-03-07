package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@TableName("djmall_auth_role_resource")
public class RoleResource {

    /**
     * 角色id
     */
    private Integer roleId;

     /**
     * 资源id
     */
    private Integer resourceId;

    /**
     * 是否删除 1正常 0删除
     */
    private Integer isDel;

}
