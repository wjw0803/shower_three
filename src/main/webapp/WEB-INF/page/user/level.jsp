<%--
  Created by IntelliJ IDEA.
  User: qinbb
  Date: 2020/1/29
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Titl</title>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/layui-v2.5.5/layui/css/layui.css"  media="all">
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/layer/layer.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/md5/md5-min.js"></script>
    <script src="<%=request.getContextPath()%>/static/validate/jquery.validate.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <script>

        $(function(){
            $("#fm").validate({
                rules:{
                    userName:{
                        required:true,
                        minlength:1,
                        maxlength:4,
                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                            type: 'POST',
                            url: "<%=request.getContextPath()%>/user/findByName",
                            data:{
                                userName:function() {
                                    return $("#userName").val();
                                },
                                dataType:"json",
                                dataFilter:function(data,type){
                                    if (data == 'true'){
                                        return true;
                                    }else {
                                        return false	;
                                    }
                                }

                            }
                        }
                    },
                    nickname:{
                        required:true,
                        notEqu:true
                    },
                    password:{
                        required:true,
                        rangelength:[3,18],
                        digits:true
                    },
                    userPwd1:{
                        required:true,
                        rangelength:[3,18],
                        digits:true,
                        equalTo:"#pwd"
                    },
                    email:{
                        required:true,
                        email:true,
                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                            type: 'POST',
                            url: "<%=request.getContextPath()%>/user/findByName",
                            data:{
                                userName:function() {
                                    return $("#email").val();
                                },
                                dataType:"json",
                                dataFilter:function(data,type){
                                    if (data == 'true'){
                                        return true;
                                    }else {
                                        return false	;
                                    }
                                }

                            }
                        }
                    },
                    phone:{
                        required:true,
                        isPhone:true,
                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                            type: 'POST',
                            url: "<%=request.getContextPath()%>/user/findByName",
                            data:{
                                userName:function() {
                                    return $("#userPhone").val();
                                },
                                dataType:"json",
                                dataFilter:function(data,type){
                                    if (data == 'true'){
                                        return true;
                                    }else {
                                        return false	;
                                    }
                                }

                            }
                        }
                    },
                    roleId:{
                        required:true,
                    },
                    sex:{
                        required:true,
                    }
                },
                messages:{
                    userName:{
                        required:"请填写姓名",
                        minlength:"最少一个字",
                        maxlength:"最多四个字",
                        remote:"姓名已存在"
                    },
                    nickname:{
                        required:"请填写昵称"

                    },
                    password:{
                        required:"请填写密码",
                        rangelength:"长度不符合规则",
                        digits:"必须是整数"
                    },
                    userPwd1:{
                        required:"请填写密码",
                        rangelength:"长度不符合规则",
                        equalTo:"两次密码不统一",
                        digits:"必须是整数"
                    },
                    email:{
                        required:"请填写邮箱",
                        email:"请填写正确格式邮箱",
                        remote:"邮箱已存在"
                    },
                    phone:{
                        required:"请填写手机号码",
                        isPhone:"手机号有误",
                        remote:"手机号已存在"
                    },
                    roleId:{
                        required:"最少选择一项",
                    },
                    sex:{
                        required:"最少选择一项",
                    }
                },
                errorPlacement: function(error, element) {
                    if(element.is("[name='roleId']")){//如果需要验证的元素名为userSex
                        error.appendTo($("#roleId"));   //错误信息增加在id为‘radio-lang’中

                    }else if(element.is("[name='sex']")){//如果需要验证的元素名为userSex
                        error.appendTo($("#sex"));   //错误信息增加在id为‘radio-lang’中
                        
                    } else {
                        error.insertAfter(element);//其他的就显示在添加框后
                    }
                }
            })

        })

            //注册
            $.validator.setDefaults({
                submitHandler: function () {
                    var index = layer.load(1, {shade: 0.3}, {shadeClose: true}); //解决网络延迟的加载重复操作问题
                    layer.msg('请稍等', {
                        icon: 1,
                        time: 2000, //2秒关闭（如果不配置，默认是3秒）
                        shade: [0.8, '#393D49']
                    }, function () {
                        //密码加盐 md5(md5(pwd)+salt)
                        var pwd = $("#pwd").val();
                        //最终密码
                        var MD5 = md5(md5(pwd) + '${salt}');
                        $("#pwd").val(MD5);
                        $.post("<%=request.getContextPath()%>/user/add ",
                            $("#fm").serialize(),
                            function (data) {
                                layer.close(index);
                                if (data.code == -1) {
                                    layer.msg(data.msg, {icon: 5});
                                    return;
                                }
                                parent.window.location.href = "<%=request.getContextPath()%>/user/toShow";
                            });
                    });
                    layer.msg("成功", {icon: 6});
                }
            });

        // 手机验证
        jQuery.validator.addMethod("isPhone",
            function(value, element) {
                var userPhone = new RegExp(/^1[3578]\d{9}$/);
                return userPhone.test(value)
            }, "请正确填写您的手机号码");

        // 判断用户名昵称不同
        jQuery.validator.addMethod("notEqu",
            function(value, element) {
                return value != $("#userName").val();
            }, "用户名昵称需不同!");

    </script>
    <style>
        .error{
            color: red;
        }
    </style>
</head>
<body>
<form id="fm" class="layui-form">
    <input type="hidden" name="salt" value="${salt}" id="salt"/>
    <label class="layui-form-label">应聘姓名</label>
    <div class="layui-input-block">
        <input type="text" name="userName" lay-verify="title" autocomplete="off" placeholder="请输入您的姓名" class="layui-input" id="userName">
    </div><br>
    <label class="layui-form-label">昵称</label>
    <div class="layui-input-block">
        <input type="text" name="nickname" lay-verify="title" autocomplete="off" placeholder="昵称" class="layui-input" id="nickname">
    </div><br>
    <label class="layui-form-label">密码</label>
    <div class="layui-input-block">
        <input type="text" name="password" lay-verify="title" autocomplete="off" placeholder="请输入您的密码" class="layui-input" id="pwd">
    </div><br>
    <label class="layui-form-label">确认密码</label>
    <div class="layui-input-block">
        <input type="text" name="password" lay-verify="title" autocomplete="off" placeholder="确认密码" class="layui-input" id="userPwd1">
    </div><br>
    <label class="layui-form-label">手机号</label>
    <div class="layui-input-block">
        <input type="text" name="phone" lay-verify="title" autocomplete="off" placeholder="填写手机号" class="layui-input" id="userPhone">
    </div><br>
    <label class="layui-form-label">邮箱</label>
    <div class="layui-input-block">
        <input type="text" name="email" lay-verify="title" autocomplete="off" placeholder="邮箱" class="layui-input" id="email">
    </div><br>

        <label class="layui-form-label">应聘职位</label>
        <div class="layui-input-block">
            <input type="radio" name="roleId" value="3" title="维修工" >
            <input type="radio" name="roleId" value="7" title="技师">
        </div>
         <div id="roleId" class="error" ></div><br>

        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="1" title="男" >
            <input type="radio" name="sex" value="2" title="女">
        </div>
         <div id="sex" class="error" ></div>
        <input type="hidden" name="status" value="-1">
        <input type="hidden" name="isLeave" value="1">
        <input type="hidden" name="isReport" value="0">
        <input type="hidden" name="isDel" value="1"><br>
    <input type="submit" value="注册" />
</form>
<script>
    layui.use('form', function(){
        var form = layui.form;

        //各种基于事件的操作，下面会有进一步介绍
    });
</script>
</body>
</html>
