package com.dj.ssm.utils;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import java.util.Date;
import java.util.Properties;

public class JavaEmailUtils {

	// 发件人的中文昵称
	private static final String nickname = "dj";
	// 发件人邮箱
	private static final String username = "qza815270602@163.com";
	// 发件人在邮箱服务器中的授权码
	private static final String password = "qza815270602";
	// 邮件的发送协议
	private static final String protocol = "smtp";
	// 发件人邮箱的 SMTP 服务器地址, 必须准确, 不同邮件服务器地址不同, 一般格式为: smtp.xxx.com
	private static final String host = "smtp.163.com";
	// 邮件的监听端口号
	private static final String port = "25";

	/*
	 * main方法实现邮件发送
	 */
	public static void main(String[] args) {
		// 收件人邮箱地址
		String to = "815270602@qq.com";
		// 邮件的主题
		String subject = "HelloWorld";
		// 邮件正文的文本内容
		String body = "<h1>你好啊!</h1>";
		// 封装邮件实体
		// 发送邮件
		if (sendEmail(to, subject, body)) {
			System.out.println("邮件发送成功!");
		} else {
			System.out.println("邮件发送失败!请及时解决！");
		}
	}

	/**
	 * 发送邮件
	 *
	 * @param email 邮件信息实体
	 * @return 是否发送成功 TRUE 发送成功 FALSE 发送失败
	 */
	public static boolean sendEmail(String to, String subject, String content) {
		try {
			// 创建Session实例对象
			/*
			 * Session类用于定义整个JavaMail应用程序所需要的环境信息， 以及收集客户端与邮件服务器建立网络连接会话信息，如邮件
			 * 服务器的主机号、端口号、采用的邮件发送和接收的协议等。
			 */
			Session session = createSession();
			session.setDebug(false);
			// 创建MimeMessage实例对象

			MimeMessage message = createMessage(session, to, subject, content);

			// 发送邮件
			/*
			 * send方法执行邮件发送任务时，它首先从参数Message对象中获得Session对象，
			 * 然后调用Session.getTransport方法获得用于发送邮件邮件的Transport实例对象，
			 * 接着使用保存在Session对象中的与网络链接相关的JavaMail属性，调用Transport
			 * 对象的connect方法连接邮件服务器，然后调用Transport对象的sendMessage方法
			 * 发送邮件，最后调用close方法断开与邮件服务器的连接。
			 */
			Transport.send(message);
			return true;
		} catch (Exception e) {
			System.out.println("发送邮件异常==》");
			e.printStackTrace();
			return false;
		} finally {
			System.out.println("邮件发送结束...");
		}
	}

	/**
	 * 创建与邮件服务器的会话对象
	 *
	 * @return 服务器的会话对象
	 */
	public static Session createSession() {
		// 封装属性参数
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", protocol); // 邮件传输的协议
		props.setProperty("mail.smtp.host", host); // 邮件的服务器
		props.setProperty("mail.smtp.port", port); // 邮件的监听端口
		props.setProperty("mail.smtp.auth", "true"); // 是否需要验证设置为TRUE，使用授权码发送邮件需要验证
		// 获取与服务器的会话Session对象
		/*
		 * getInstance和getDefaultInstance是Session的静态方法，都可以用来获取Session类的实例对象。 两个方法的区别在于：
		 * getDefaultInstance方法返回一个Session对象后，将把这个Session对象设置为默认的Session对象，
		 * 以后每一次调用getDefaultInstance方法都会返回这个默认Session对象；
		 * 而getInstance方法则是每次调用都会返回一个新的Session对象。
		 */
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// 登陆账号及密码，密码需要是第三方授权码
				/*
				 * 调用Session对象中注册的Authenticator对象，从中获取的用户认证信息后传递给邮件服务器
				 * PasswordAuthentication根据指定的用户名和密码创建实例对象
				 */
				return new PasswordAuthentication(username, password);
			}
		});

		return session;
	}

	/**
	 * 创建邮件的核心内容
	 *
	 * @param session 与服务器交互的会话对象
	 * @param email   邮件实体
	 * @return 生成的MimeMessage实例对象
	 * @throws Exception
	 */
	public static MimeMessage createMessage(Session session, String to,
											String subject, String content) throws Exception {
		// 创建MimeMessage实例对象：表示整封邮件
		MimeMessage message = new MimeMessage(session);

		// 设置发件人
		if (!nickname.isEmpty()) {
			// 自定义发件人昵称
			message.setFrom(new InternetAddress(MimeUtility.encodeText(nickname) + " <" + username + ">"));
		} else {
			message.setFrom(new InternetAddress(username));
		}

		// 设置收件人
		// InternetAddress类表示电子邮件的地址
		// Message.RecipientType表示收件人的类型，它是Message类中的一个静态内部类
		// TO 收件人 CC 抄送人 BCC 密送人
		message.setRecipients(Message.RecipientType.TO, to);
		// 设置密送人
		/*
		 * String[] bccEmails = email.getBccEmails(); if (bccEmails != null &&
		 * bccEmails.length != 0) { InternetAddress[] internetAddressBCC = new
		 * InternetAddress[bccEmails.length]; for (int i = 0; i < bccEmails.length; i++)
		 * { internetAddressBCC[i] = new InternetAddress(bccEmails[i]); }
		 * message.setRecipients(Message.RecipientType.BCC, internetAddressBCC); }
		 */
		// 设置发生日期
		message.setSentDate(new Date());

		// 设置邮件主题
		message.setSubject(subject);

		// 设置纯文本的邮件内容
		message.setContent(content, "text/html; charset=UTF-8");
		//message.setText(email.getContent());

		// 保存并生成最终的邮件内容
		message.saveChanges();

		return message;
	}
}
