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
<html>
<head>
    <title>登陆</title>
</head>
<body>

    <form id = "fm">
        <input type="hidden" name="salt"  id="salt"/>
        <input type="text" name="userName" placeholder="用户名" onblur="getSalt(this)"><br/>
        <input type = "password" name = "password" id="pwd" placeholder="密码"><br/>

        <a onclick="toAdd()" style="color: #00FFFF">还没有账号?点我注册!</a>&nbsp;&nbsp;&nbsp;&nbsp;
        <a onclick="toFind()" style="color: #00FFFF">忘记密码?</a><br/>

        <input type ="button" value="登陆" onclick="login()">
    </form>

</body>
<script>
    //登录

    function login() {
        var index = layer.load(1, {shade: 0.3}, {shadeClose: true}); //解决网络延迟的加载重复操作问题
        layer.msg('请稍等', {
            icon: 1,
            time: 2000, //2秒关闭（如果不配置，默认是3秒）
            shade: [0.8, '#393D49']
        }, function () {
            //密码加盐 md5(md5(pwd)+salt)
            var pwd = $("#pwd").val();
            //最终密码
            var MD5 = md5(md5(pwd) + $("#salt").val());
            $("#pwd").val(MD5);
            $.post("<%=request.getContextPath()%>/user/login ",
                $("#fm").serialize(),
                function (data) {
                    layer.close(index);
                    layer.msg(data.msg, {icon: 6});
                    if (data.code == -1) {
                        layer.msg(data.msg, {icon: 5});
                        return;
                    }
                    window.location.href = "<%=request.getContextPath()%>/index/toIndex";
                });
        });
    }

    //新增
    function toAdd(){
        layer.open({
            type: 2,
            title: [
                '新增',
                'background-color:#8DCE16; color:#fff;'
            ],
            shadeClose: true,
            shade: 0.3,
            area: ['380px', '80%'],
            content: '<%=request.getContextPath()%>/user/toAdd' //iframe的url
        });
    }

    //新增
    function toFind(){
        layer.open({
            type: 2,
            title: [
                '找回密码',
                'background-color:#8DCE16; color:#fff;'
            ],
            shadeClose: true,
            shade: 0.3,
            area: ['380px', '80%'],
            content: '<%=request.getContextPath()%>/user/toFind' //iframe的url
        });
    }

    //判断当前窗口路径与加载路径是否一致。
    if(window.top.document.URL != document.URL){
        //将窗口路径与加载路径同步
        window.top.location = document.URL;
    }
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
</script>
</html>
