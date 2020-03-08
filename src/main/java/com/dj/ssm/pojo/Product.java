package com.dj.ssm.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.experimental.Accessors;

import java.text.SimpleDateFormat;
import java.util.Date;

@Data
@Accessors(chain = true)
@TableName("djmall_auth_product")//数据库表名
public class Product {

	/**
	 * id
	 */
	@TableId(type = IdType.AUTO)//id主键自增
	private Integer id;
	/**
	 * 商品名称
	 */
	private String pName;
	/**
	 * 商品说明
	 */
	private String message;
	/**
	 * 商品价格
	 */
	private Double price;
	/**
	 * 商品状态：0为下架，1为上架
	 */
	private Integer status;
	/**
	 * 创建人id
	 */
	private Integer userId;
	/**
	 * 创建时间
	 */
	//DATE解决日期显示格式错误，只有前提有@ResponseBody(解析成JSON)的时候才可以用
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMR+8")
	private Date creatTime;
	/**
	 * 更新时间
	 */
	//DATE解决日期显示格式错误，只有前提有@ResponseBody(解析成JSON)的时候才可以用
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMR+8")
	private Date updateTime;
	/**
	 * 删除状态
	 */
	private Integer isDel;

	//修改回显日期所用方法
	private String creatTimeShow;
	
	public String getCreatTimeShow() {
		if(creatTime == null) {
			return "";
		}
		SimpleDateFormat ct = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return ct.format(creatTime);
	}

	public void setCreatTimeShow(String creatTimeShow) {
		this.creatTimeShow = creatTimeShow;
	}

	//修改回显日期所用方法
	private String updateTimeShow;

	public String getUpdateTimeShow() {
		if(updateTime == null) {
			return "";
		}
		SimpleDateFormat ut = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return ut.format(updateTime);
	}

	public void setUpdateTimeShow(String updateTimeShow) {
		this.updateTimeShow = updateTimeShow;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

}
