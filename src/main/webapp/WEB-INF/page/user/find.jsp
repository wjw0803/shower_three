<%--
  Created by IntelliJ IDEA.
  User: dj
  Date: 2020/1/16
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/layer/layer.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/md5/md5-min.js"></script>
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="<%=request.getContextPath()%>/static/slideVerify/js/jq-slideVerify.js" type="text/javascript" charset="utf-8"></script>

<script src="<%=request.getContextPath()%>/static/validate/jquery.validate.js"></script>
<script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<html>
<head>
    <title>登陆</title>
</head>
<style>
    .error{
        color: red;
    }
</style>
<body>

    <form id = "fm">
        手机号<input type="text" name="phone" id="userPhone" onblur="getSalt(this)"><br/>
        图形验证码<br>

        <div class="verify-wrap" id="verify-wrap" style="float:left"></div>
        <br><br><br>



        手机验证码<br>
        <input type = "text" name = "verify" id = "verify"/>
        <input type="button"  value="获取验证码" onclick="getNum(this)" /><br/><br/>
        <input type="hidden" name="salt"  id="salt"/>
        密码<input type="password" name="password" id="pwd"/><br>
        确认密码<input type="password" name="userPwd1" id="pwd1"/><br><br>
        <input type ="submit" value="找回" >
    </form>

</body>
<script>
    //验证码时间
    var countdown = 5;
    //图形状态
    var slideFinishState = "";

    //图形
    $(function(){
        console.log(parseFloat('1px'))

        var SlideVerifyPlug = window.slideVerifyPlug;
        var slideVerify = new SlideVerifyPlug('#verify-wrap',{
            wrapWidth:'250',//设置 容器的宽度 ,不设置的话，会设置成100%，需要自己在外层包层div,设置宽度，这是为了适应方便点；
            initText:'请按住滑块，123',  //设置  初始的 显示文字
            sucessText:'验证通过最右边',//设置 验证通过 显示的文字
            getSuccessState:function(res){
                //当验证完成的时候 会 返回 res 值 true，只留了这个应该够用了
                console.log(res);
                slideFinishState = slideVerify.slideFinishState;
            }
        });
        $("#resetBtn").on('click',function(){
            slideVerify.resetVerify();//可以重置 插件 回到初始状态
        })
    })

    //获取盐
    function getSalt(obj) {
        $.post("<%=request.getContextPath()%>/user/findSalt",
            {userName: obj.value},
            function (data) {
                if (data.code == 200) {
                    $("#salt").val(data.data);
                } else {
                    layer.msg(data.msg, {icon: 5});
                }
            })
    }

//验证码
    function settime(val) {
        if (countdown == 0) {
            val.removeAttribute("disabled");
            val.value="免费获取验证码";
            countdown = 5;
            return;
        } else {
            val.setAttribute("disabled", true);
            val.value="重新发送(" + countdown + ")";
            countdown--;
        }
        setTimeout(function() {
            settime(val)
        },1000)
    }

//手机验证码
        function getNum(val){
        if(slideFinishState == false){
            layer.msg("请先完成图形验证码!", {icon: 5});
            return;
        }
            settime(val);
            $.post(
                "<%=request.getContextPath()%>/user/sendMessage",
                $("#fm").serialize(),
                function(data) {
                    if (data.code == -1) {
                        layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    layer.msg(data.data.msg);
                    $("#verify").val(data.data.ver);
                }
            )
        }
    //验证
    $(function(){
        $("#fm").validate({
            rules:{
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
                phone:{
                    required:true,
                    isPhone:true
                },
                verify:{
                    required:true
                }
            },
            messages:{
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
                phone:{
                    required:"请填写手机号码",
                    isPhone:"手机号有误"
                },
                verify:{
                    required:"请填写验证码"
                }
            }
        })

    })

    // 手机验证
    jQuery.validator.addMethod("isPhone",
        function(value, element) {
            var userPhone = new RegExp(/^1[3578]\d{9}$/);
            return userPhone.test(value)
        }, "请正确填写您的手机号码");

    //找回
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
                var MD5 = md5(md5(pwd) +$("#salt").val());
                $("#pwd").val(MD5);
                $("#pwd1").val(MD5);
                $.post("<%=request.getContextPath()%>/user/find ",
                    $("#fm").serialize(),
                    function (data) {
                        layer.close(index);
                        if (data.code == -1) {
                            layer.msg(data.msg, {icon: 5});
                            return;
                        }
                        parent.window.location.href = "<%=request.getContextPath()%>/user/toLogin";
                    });
            });
        }
    });
</script>
</html>
