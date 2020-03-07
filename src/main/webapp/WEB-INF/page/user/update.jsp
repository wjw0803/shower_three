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
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/static/layer/layer.js"></script>
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
                    },
                    email:{
                        required:true,
                        email:true
                    },
                    phone:{
                        required:true,
                        isPhone:true
                    }
                },
                messages:{
                    userName:{
                        required:"请填写姓名",
                        minlength:"最少一个字",
                        maxlength:"最多四个字"
                    },
                    email:{
                        required:"请填写邮箱",
                        email:"请填写正确格式邮箱",

                    },
                    phone:{
                        required:"请填写手机号码",
                        isPhone:"手机号有误"
                    }
                }
            })

        })

        //修改
        $.validator.setDefaults({
            submitHandler: function() {
                var index = layer.load(1,{shade:0.3},{shadeClose:true}); //解决网络延迟的加载重复操作问题
                layer.msg('请稍等', {
                    icon: 1,
                    time: 2000, //2秒关闭（如果不配置，默认是3秒）
                    shade: [0.8, '#393D49']
                }, function(){
                    //do something

                    $.post("<%=request.getContextPath()%>/user/update ",
                        $("#fm").serialize(),
                        function(data){
                            layer.close(index);
                            if (data.code == -1){
                                layer.msg(data.msg, {icon: 5});
                                return;
                            }
                            parent.window.location.href="<%=request.getContextPath()%>/user/toShow";
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

    </script>
    <style>
        .error{
            color: red;
        }
    </style>
</head>
<body>
<form id="fm">
    姓名<input type="text" name="userName" value="${user.userName}"/><br>
    手机<input type="text" name="phone" id="userPhone" value="${user.phone}"/><br>
    邮箱<input type="text" name="email" id="email" value="${user.email}"/><br>
    性别:<input type="radio" name="sex" value="1" <c:if test="${user.sex == 1}">checked</c:if>> 男
    <input type="radio" name="sex" value="2" <c:if test="${user.sex == 2}">checked</c:if>> 女<br />
        <input type="hidden" name="id" value="${user.id}"><br>
    <input type="submit" value="修改" />
</form>
</body>
</html>
