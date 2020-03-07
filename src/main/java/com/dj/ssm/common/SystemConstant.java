package com.dj.ssm.common;

public class SystemConstant {

	/**
	 * 验证码时间20秒
	 */
	public static final Integer TIME_300000 = 300000;
	
	/**
	 * uuid下标0
	 */
	public static final Integer UU_ID_0 = 0;

	/**
	 * 0
	 */
	public static final Integer ZERO = 0;

	/**
	 * 1
	 */
	public static final Integer ONE = 1;

	/**
	 * 4
	 */
	public static final Integer FOUR = 4;
	
	/**
	 * uuid_6位结束
	 */
	public static final Integer UU_ID_6 = 6;
	
	/**
	 * 分页页数3
	 */
	public static final Integer PAGING_THREE = 3;

	/**
	 * 激活状态 1激活
	 */
	public static final Integer YES_STATUS = 1;
	/**
	 * 激活状态 -1未激活
	 */
	public static final Integer NOW_STATUS = -1;

	/**
	 * 删除状态 1未删除
	 */
	public static final Integer IS_DEL_ONE = 1;

	/**
	 * 删除状态 0已删除
	 */
	public static final Integer IS_DEL_ZERO= 0;

	/**
	 * 职位2普通员工
	 */
	public static final Integer LEVEL_EMPLOYEE = 2;

	/**
	 * 职位3经理
	 */
	public static final Integer LEVEL_MANAGER = 3;

	/**
	 * 职位4管理员
	 */
	public static final Integer LEVEL_ADMINISTRATOR = 4;

	/**
	 * 展示报销单号dj
	 */
	public static final String NUM_DJ = "DJ";

	/**
	 * 查询pid 为12的收支项目
	 */
	public static final Integer PARENTID_PROJECT = 12;

	/**
	 * 查询pid 为24的支付方式
	 */
	public static final Integer PARENTID_EXPEND = 24;

	/**
	 * 处理状态pid为5
	 */
	public static final Integer STATE_PROCESS_STATE = 5;

	/**
	 * 收支项目pid为12
	 */
	public static final Integer STATE_BALANCE_OF_PROJECT = 12;

	/**
	 * 处理状态6待审批
	 */
	public static final Integer STATE_APPROVE = 6;

	/**
	 * 处理状态7待支付、
	 */
	public static final Integer STATE_UNPAID = 7;

	/**
	 * 处理状态8已支付
	 */
	public static final Integer STATE_PAID = 8;

	/**
	 * 报销单轨迹状态 19 提交报销单
	 */
	public static final Integer STATUS_SUBMIT = 19;

	/**
	 * 报销单轨迹状态 20 审批通过
	 */
	public static final Integer STATUS_PASS = 20;

	/**
	 * 报销单轨迹状态 21 审批不通过
	 */
	public static final Integer STATUS_NO_PASS = 21;

	/**
	 * 报销单轨迹状态 22 经理代提交
	 */
	public static final Integer STATUS_MANAGER = 22;

	/**
	 * 报销单轨迹状态 23 默认通过
	 */
	public static final Integer STATUS_TACITLY_APPROVE = 23;

	/**
	 * 报销单轨迹状态 24 支付成功
	 */
	public static final Integer STATUS_PAYMENT_SUCCESS = 24;
	
	/**
	 * 系统处理异常,请稍后重试
	 */
	public static final String ERROR = "系统处理异常,请稍后重试";
	
	/**
	 * 操作成功
	 */
	public static final String SUCCESS = "操作成功";
	
	/**
	 * 信息不能为空
	 */
	public static final String NOT_NULL = "信息不能为空";
	
	/**
	 * 输入有误
	 */
	public static final String INPUT_ERROR  = "密码输入有误,用户不存在";

	/**
	 * 未激活
	 */
	public static final String ACTIVATE  = "未激活!请到邮箱激活.";

	/**
	 * 用户已被删除
	 */
	public static final String DELETE  = "用户已经删除";

	/**
	 * 用户session
	 */
	public static final String SESSION_USER  = "user";

	/**
	 * 资源session
	 */
	public static final String SESSION_RESOURCE  = "resource";
	
	/**
	 * 登录成功
	 */
	public static final String LOGIN_SUCCESS  = "登录成功";
	
	/**
	 * 已经存在信息
	 */
	public static final String CAN_NOT_REPEAT   = "已经存在信息";

	/**
	 * 注册成功!请去邮箱激活
	 */
	public static final String ADD_YES  = "注册成功!请去邮箱激活";
	
	/**
	 * 请先注册
	 */
	public static final String REGISTER  = "请先注册";

	/**
	 * -
	 */
	public static final String SYMBOL  = "-";

	/**
	 * null
	 */
	public static final String NULL  = null;
	
	/**
	 * 验证码已过期,请重新获取
	 */
	public static final String PAST_DUE  = "验证码已过期,请重新获取";

}
