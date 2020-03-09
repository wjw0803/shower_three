package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@Accessors(chain = true)
@TableName("expert_prevoir")
public class ExpertPrevoir {

    /**
     * 技师订单id
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 技师id
     */
    private Integer expertId;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 预约时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // ǰ̨�����ַ���ת��ʱ������
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") /* ֻ�а��������תΪJson����Ч���� */
    private Date prevoirDate;

    /**
     * 接单时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") // ǰ̨�����ַ���ת��ʱ������
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8") /* ֻ�а��������תΪJson����Ч���� */
    private Date  accepterDate;

    /**
     * 订单状态  0为预约  1为已接单   2为完成
     */
    private Integer ordreType;

    /**
     * 价格
     */
    private Double prix;
}
