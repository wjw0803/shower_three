package com.dj.ssm.utils;


import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

import java.util.Random;

/**
 * 短信验证码测试
 * @author chengfan
 *2019年12月18日
 */
public class MessageVerifyUtils {
    // 产品名称:云通信短信API产品,开发者无需替换
    static final String product = "Dysmsapi";
    // 产品域名,开发者无需替换
    static final String domain = "dysmsapi.aliyuncs.com";
    
    // TODO 此处需要替换成开发者自己的AK(在阿里云访问控制台寻找)
    static final String accessKeyId = "LTAI4FjmHyfmmEu5v4MUULYH";           // TODO 改这里
    static final String accessKeySecret = "I6z6P25Z6nKP1Mg9npENcbTJbpOl8A"; // TODO 改这里
    
    public static SendSmsResponse sendSms(String userPhone, String userCode) throws ClientException {
        // 可自助调整超时时间
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");
        // 初始化acsClient,暂不支持region化 不能更改
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", accessKeyId, accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
        IAcsClient acsClient = new DefaultAcsClient(profile);
        // 组装请求对象-具体描述见控制台-文档部分内容
        SendSmsRequest request = new SendSmsRequest();
        // 必填:待发送手机号
        request.setPhoneNumbers(userPhone);
        // 必填:短信签名-可在短信控制台中找到
        request.setSignName("报销单"); // TODO 改这里
        // 必填:短信模板-可在短信控制台中找到
        request.setTemplateCode("SMS_180058261");  // TODO 改这里
        //验证码为：${code}，您正在登录，若非本人操作，请勿泄露。
        request.setTemplateParam("{\"code\":\"" + userCode + "\"}"); 
        // 选填-上行短信扩展码(无特殊需求用户请忽略此字段)
        // request.setSmsUpExtendCode("90997");
        // 可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
        request.setOutId("yourOutId");
        // hint 此处可能会抛出异常，注意catch
        SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);
        if(sendSmsResponse.getCode()!= null && sendSmsResponse.getCode().equals("OK")){
                System.out.println("短信发送成功！");
        }else {
                System.out.println("短信发送失败！");
        }
        return sendSmsResponse;
    }
    
    //随机生成验证码
    public static int getNewcode(){
    	Integer verifyCode = new Random().nextInt(899999) + 100000;  //每次调用生成一次四位数的随机数
		return verifyCode;
     }
    
     
/*    public static void main(String[] args) throws Exception {
         String code = Integer.toString(getNewcode());
         SendSmsResponse sendSms =sendSms("15559330182",code);//填写你需要测试的手机号码
         System.out.println("短信接口返回的数据----------------");
         System.out.println("Code=" + sendSms.getCode());
         System.out.println("Message=" + sendSms.getMessage());
         System.out.println("RequestId=" + sendSms.getRequestId());
         System.out.println("BizId=" + sendSms.getBizId());
    }*/
}